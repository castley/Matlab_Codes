function Err = fun_window(Ra,Rb)
    % classify the sources
    C1=[];
    C2=[];
    C3=[];
    C4=[];
    B1=[];
    B2=[];
    B3=[];
    B4=[];
    Sum=0;
    for ni=1:length(Ra)
        if Ra(ni)>=0.8
            C1=[C1;Ra(ni)];
            B1=[B1;Rb(ni)];
        else if Ra(ni)<0.8 && Ra(ni)>=0.7
                C2=[C2;Ra(ni)];
                B2=[B2;Rb(ni)];
            else if Ra(ni)<0.7 && Ra(ni)>=0.6
                    C3=[C3;Ra(ni)];
                    B3=[B3;Rb(ni)];
                else
                    C4=[C4;Ra(ni)];
                    B4=[B4;Rb(ni)];
                end
            end
        end
    end
    mc1=mean(C1);  % P(SC=1|C=1); average of the reliability of sources
    L1=length(C1); % get the length of the souces
    mb1=mean(B1);  % P(SC=1|C=0)
    mc2=mean(C2);
    L2=length(C2);
    mb2=mean(B2);
    mc3=mean(C3);
    L3=length(C3);
    mb3=mean(B3);
    mc4=mean(C4);
    L4=length(C4);
    mb4=mean(B4);
    if L1>=1
        for d=1:L1+1
            ST1(d)=nchoosek(L1,d-1)*mc1^(d-1)*(1-mc1)^(L1+1-d);    % when C=1;
            SF1(d)=nchoosek(L1,d-1)*mb1^(d-1)*(1-mb1)^(L1+1-d);    % when C=0;
        end
    else
        ST1=1;
        SF1=1;
    end
    if L2>=1
        for d=1:L2+1
            ST2(d)=nchoosek(L2,d-1)*mc2^(d-1)*(1-mc2)^(L2+1-d);    % when C=1;
            SF2(d)=nchoosek(L2,d-1)*mb2^(d-1)*(1-mb2)^(L2+1-d);    % when C=0;
        end
    else
        ST2=1;
        SF2=1;
    end
    if L3>=1
        for d=1:L3+1
            ST3(d)=nchoosek(L3,d-1)*mc3^(d-1)*(1-mc3)^(L3+1-d);    % when C=1;
            SF3(d)=nchoosek(L3,d-1)*mb3^(d-1)*(1-mb3)^(L3+1-d);    % when C=0;
        end
    else
        ST3=1;
        SF3=1;
    end
    if L4>=1
        for d=1:L4+1
            ST4(d)=nchoosek(L4,d-1)*mc4^(d-1)*(1-mc4)^(L4+1-d);    % when C=1;
            SF4(d)=nchoosek(L4,d-1)*mb4^(d-1)*(1-mb4)^(L4+1-d);    % when C=0;
        end
    else
        ST4=1;
        SF4=1;
    end
    %%calculate the error
    for n1=1:L1+1
        for n2=1:L2+1
            for n3=1:L3+1
                for n4=1:L4+1
                    PCt=ST1(n1)*ST2(n2)*ST3(n3)*ST4(n4);
                    PCf=SF1(n1)*SF2(n2)*SF3(n3)*SF4(n4);
                    Er=min(PCt,PCf);
                    Sum=Sum+Er;
                end
            end
        end
    end
    Err=Sum*0.5;
end

