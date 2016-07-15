%% this is the improved version on 5/12/2016
% function: w cost change
clear
clc
n=80;
nk=2;  %the number of links
w=0.8;
cost=60;
%% ----the above is ai and bi
M=50;
for mt=1:M
    ite=mt
    ai=unifrnd(0.4,0.9,1,n);
    bi=unifrnd(0.1,0.3,1,n);
    ai=round(ai*100)/100;
    bi=round(bi*100)/100;
    [sai,na]=sort(ai,'descend'); % new
    [sbi,nb]=sort(bi); %new for the problem
    s_ai=ai;
    for i=1:n
        s_bi(na(i))=bi(nb(i));  %Ra and Rb should be symmetric
    end
    s_pr=round(unifrnd(1,5,1,n)*100)/100;
    kw=1;
    % random graph
    Amtx=zeros(n,n);
    flag=1;
    Sji=[];
    %i_num=0;
    while flag==1  %graph-----here I should change
        if sum(sum(Amtx(1:3,:)))<=ceil(n*nk*3/4)
            i=unidrnd(3);
            j=i+1+round((n-i-1)*rand(1));
        else
            i=1+round((n-1)*rand(1));
            j=i+1+round((n-i-1)*rand(1));
        end
        ele=1;
        if j==i||j>n
           ele=0;
        end
        if ele==1
           Amtx(i,j)=ele;
           Sji=[Sji;j,i];
        end
        if sum(sum(Amtx))<ceil(n*nk)
           flag=1;
        else
           flag=0;
        end
    end
    S_ji=unique(Sji,'rows');
    Sj=[];
    Ant=[];
    Sj=S_ji(:,1);
    Ant=S_ji(:,2);
    % get the probability for influence graph
    for w=0.3:0.1:0.9  % cost=50:10:100  %   %
        ai=[];
        bi=[];
        ai=s_ai;%keep them 
        bi=s_bi;
        pr=s_pr;
        Pa=ai;
        Pb=bi;
        for s=1:n
            pos=find(s==Sj);
            len=length(pos);
            if len>0
                a_nm = Ant(pos);
                Pa(s)=(1-w)/len*(sum(ai(a_nm)))+w*ai(s);
                Pb(s)=(1-w)/len*(sum(bi(a_nm)))+w*bi(s);
            end
            ai=Pa;
            bi=Pb;  %next time for loop
        end
        Ra=[];
        Rb=[];%new add
        [ct,lp]=sort(pr);%rank price
        for j=1:n
            Ra(j)=ai(lp(j));
            Rb(j)=bi(lp(j));
        end
        % according to the reliability to find sources
        rab=[];
        rab=Ra+1-Rb;
        Rab=[];
        kk=[];
        [Rab,kk] = sort(rab,'descend');
        prc=[];
        RA=[];
        RB=[];
        for i = 1: length(kk)
            prc(i) = ct(kk(i));
            RA(i)=Ra(kk(i));
            RB(i)=Rb(kk(i));
        end
        psum=0;
        nm=0;
        while psum<=cost
            nm=nm+1;
            psum=psum+ct(nm);%% the minimum need here is the problem
        end
        nm=nm-1;
        min_err3=1;
        for k=2:nm
            st_num  = Hfun_reb(cost,prc,k,n);
            Ran=[];
            Rbn=[];
            ppr=[];
            if isempty(st_num)==0
               for j=1:length(st_num(:,1))
                   for im=1:length(st_num(j,:))
                       id=st_num(im);
                       Ran(im)=RA(id);
                       Rbn(im)=RB(id);
                       ppr(im)=prc(id);
                   end
                    err3 = fun_window6(Ran,Rbn);
                    if err3<min_err3
                       min_err3=err3;
                       price=ppr;
                       SRA=Ran;
                       SRB=Rbn;
                    end   
               end
            end
        end
        err1 =  rand_fun(n,RA,RB,cost,prc);
        err2=cost_only(Ra,Rb,ct,cost);
        err5=reb_only(RA,RB,prc,cost);
        err4 =crowdbudget(price,cost,SRA, SRB);  % baseline crowdbudget
        Serr1(mt,kw)=err1;%%nk change the storage
        Serr2(mt,kw)=err2;%%nk change the storage
        Serr4(mt,kw)=err4;
        Serr5(mt,kw)=err5;
        Serr3(mt,kw)=min_err3;%%nk change the storage
        kw=kw+1;
    end
end
rst1=mean(Serr1);
rst2=mean(Serr2);
rst3=mean(Serr3);
rst4=mean(Serr4);
rst5=mean(Serr5);
% p=50:10:100;
p=0.3:0.1:0.9
semilogy(p,rst1,'ks--','LineWidth',1.4);
hold on
semilogy(p,rst2,'bd--','LineWidth',1.4);
hold on
semilogy(p,rst3,'r+--','LineWidth',1.4);
hold on
semilogy(p,rst4,'g--','LineWidth',1.4);
hold on
% semilogy(p,rst5,'co--','LineWidth',1.4); %
% hold on
set(gca,'fontsize',13)
axis([0.3 0.9 0.0 0.1]);
h1=legend('Random sources','Cost-only ','New method','Crowdbudget ');
set(h1,'Fontsize',11);
xlabel('Parameter w changes from 0.3 to 0.9','Fontsize',13);
% xlabel('Cost Budget','Fontsize',13);
ylabel('Expected Error (log)','Fontsize',13);

    

    
    