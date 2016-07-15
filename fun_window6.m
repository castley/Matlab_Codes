function Err = fun_window6(Ra,Rb)
    % classify the sources
    C1=[];
    C2=[];
    C3=[];
    C4=[];
    C5=[];
    C6=[];
    B6=[];
    B1=[];
    B2=[];
    B3=[];
    B4=[];
    B5=[];
    Sum=0;
    md=median(Ra); %get the median
    mxu=max(Ra)-md;
    mx=md-min(Ra);
    for ni=1:length(Ra)
        if Ra(ni)>=md+2*mxu/3
            C1=[C1;Ra(ni)];
            B1=[B1;Rb(ni)];
        else if Ra(ni)<md+2*mxu/3 && Ra(ni)>=md+mxu/3
                C2=[C2;Ra(ni)];
                B2=[B2;Rb(ni)];
            else if Ra(ni)<md+mxu/3 && Ra(ni)>=md
                    C3=[C3;Ra(ni)];
                    B3=[B3;Rb(ni)];
                else if Ra(ni)<md && Ra(ni)>=md-mx/3
                    C4=[C4;Ra(ni)];
                    B4=[B4;Rb(ni)];
                    else if Ra(ni)<md-mx/3 && Ra(ni)>=md-2*mx/3
                            C5=[C5;Ra(ni)];
                            B5=[B5;Rb(ni)];
                        else
                            C6=[C6;Ra(ni)];
                            B6=[B6;Rb(ni)];
                        end
                    end
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
    mc5=mean(C5);
    L5=length(C5);
    mb5=mean(B5);
    mc6=mean(C6);
    L6=length(C6);
    mb6=mean(B6);
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
    if L5>=1
        for d=1:L5+1
            ST5(d)=nchoosek(L5,d-1)*mc5^(d-1)*(1-mc5)^(L5+1-d);    % when C=1;
            SF5(d)=nchoosek(L5,d-1)*mb5^(d-1)*(1-mb5)^(L5+1-d);    % when C=0;
        end
    else
        ST5=1;
        SF5=1;
    end
    if L6>=1
        for d=1:L6+1
            ST6(d)=nchoosek(L6,d-1)*mc6^(d-1)*(1-mc6)^(L6+1-d);    % when C=1;
            SF6(d)=nchoosek(L6,d-1)*mb6^(d-1)*(1-mb6)^(L6+1-d);    % when C=0;
        end
    else
        ST6=1;
        SF6=1;
    end
    %%calculate the error
    for n1=1:L1+1
        for n2=1:L2+1
            for n3=1:L3+1
                for n4=1:L4+1
                    for n5=1:L5+1
                        for n6=1:L6+1
                            PCt=ST1(n1)*ST2(n2)*ST3(n3)*ST4(n4)*ST5(n5)*ST6(n6);
                            PCf=SF1(n1)*SF2(n2)*SF3(n3)*SF4(n4)*SF5(n5)*SF6(n6);
                            Er=min(PCt,PCf);
                            Sum=Sum+Er;
                        end
                    end
                end
            end
        end
    end
    Err=Sum*0.5;
end

