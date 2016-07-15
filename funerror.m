function sum = funerror(ai,bi,dat)    
    na=1-ai;
    nb=bi;
    bi=1-nb;
    sum=0;
    %dat=[1 2 3];
    %% calculte the errors
    dat=unique(dat);
    k=length(dat);
    for q=1:k
        A(q,:)=[na(dat(q)),ai(dat(q))];
        B(q,:)=[bi(dat(q)),nb(dat(q))];
    end
    if k==1
        sum=min(A(1))+min(A(2));
    end
    if k==2
        for r=1:2
            for c=1:2
                S1=A(1,:);
                S2=A(2,:);
                SC1=B(1,:);
                SC2=B(2,:);
                PCt=S1(r)*S2(c);
                PCf=SC1(r)*SC2(c);
                er=min([PCf,PCt]);
                sum=sum+er;
            end
        end
    end
     if k==3
        for r=1:2
            for c=1:2
                for b=1:2
                    S1=A(1,:);
                    S2=A(2,:);
                    S3=A(3,:);
                    SC1=B(1,:);
                    SC2=B(2,:);
                    SC3=B(3,:);
                    PCt=S1(r)*S2(c)*S3(b);
                    PCf=SC1(r)*SC2(c)*SC2(b);
                    er=min([PCf,PCt]);
                    sum=sum+er;
                end
            end
        end
     end
    %%when k==4;
      if k==4
        for r=1:2
            for c=1:2
                for b=1:2
                    for d=1:2
                        S1=A(1,:);
                        S2=A(2,:);
                        S3=A(3,:);
                        S4=A(4,:);
                        SC1=B(1,:);
                        SC2=B(2,:);
                        SC3=B(3,:);
                        SC4=B(4,:);
                        PCt=S1(r)*S2(c)*S3(b)*S4(d);
                        PCf=SC1(r)*SC2(c)*SC3(b)*SC4(d);
                        er=min([PCf,PCt]);
                        sum=sum+er;
                    end
                end
            end
        end
      end
      if k==5
        for r=1:2
            for c=1:2
                for b=1:2
                    for d=1:2
                        for z=1:2
                            S1=A(1,:);
                            S2=A(2,:);
                            S3=A(3,:);
                            S4=A(4,:);
                            S5=A(5,:);
                            SC1=B(1,:);
                            SC2=B(2,:);
                            SC3=B(3,:);
                            SC4=B(4,:);
                            SC5=B(5,:); %k=5
                            PCt=S1(r)*S2(c)*S3(b)*S4(d)*S5(z);
                            PCf=SC1(r)*SC2(c)*SC3(b)*SC4(d)*SC5(z);
                            er=min([PCf,PCt]);
                            sum=sum+er;
                        end
                    end
                end
            end
        end
      end
      %--k=6
       if k==6
        for r=1:2
            for c=1:2
                for b=1:2
                    for d=1:2
                        for z=1:2
                            for t=1:2
                                S1=A(1,:);
                                S2=A(2,:);
                                S3=A(3,:);
                                S4=A(4,:);
                                S5=A(5,:);
                                S6=A(6,:);
                                SC1=B(1,:);
                                SC2=B(2,:);
                                SC3=B(3,:);
                                SC4=B(4,:);
                                SC5=B(5,:);
                                SC6=B(6,:);
                                PCt=S1(r)*S2(c)*S3(b)*S4(d)*S5(z)*S6(t);
                                PCf=SC1(r)*SC2(c)*SC3(b)*SC4(d)*SC5(z)*SC6(t);
                                er=min([PCf,PCt]);
                                sum=sum+er;
                            end
                        end
                    end
                end
            end
        end
       end
      %--k=7
       if k==7
        for r=1:2
            for c=1:2
                for b=1:2
                    for d=1:2
                        for z=1:2
                            for t=1:2
                                for g=1:2
                                    S1=A(1,:);
                                    S2=A(2,:);
                                    S3=A(3,:);
                                    S4=A(4,:);
                                    S5=A(5,:);
                                    S6=A(6,:);
                                    S7=A(7,:);
                                    SC1=B(1,:);
                                    SC2=B(2,:);
                                    SC3=B(3,:);
                                    SC4=B(4,:);
                                    SC5=B(5,:);
                                    SC6=B(6,:);  %k=7
                                    SC7=B(7,:);
                                    PCt=S1(r)*S2(c)*S3(b)*S4(d)*S5(z)*S6(t)*S7(g);
                                    PCf=SC1(r)*SC2(c)*SC3(b)*SC4(d)*SC5(z)*SC6(t)*SC7(g);
                                    er=min([PCf,PCt]);
                                    sum=sum+er;
                                end
                            end
                        end
                    end
                end
            end
         end
       end
   %----k=8---
       if k==8
        for r=1:2
            for c=1:2
                for b=1:2
                    for d=1:2
                        for z=1:2
                            for t=1:2
                                for g=1:2
                                    for m=1:2
                                        S1=A(1,:);
                                        S2=A(2,:);
                                        S3=A(3,:);
                                        S4=A(4,:);
                                        S5=A(5,:);
                                        S6=A(6,:);
                                        S7=A(7,:);
                                        S8=A(8,:);
                                        SC1=B(1,:);
                                        SC2=B(2,:);
                                        SC3=B(3,:);
                                        SC4=B(4,:);
                                        SC5=B(5,:);
                                        SC6=B(6,:);  %k=8
                                        SC7=B(7,:);
                                        SC8=B(8,:);
                                        PCt=S1(r)*S2(c)*S3(b)*S4(d)*S5(z)*S6(t)*S7(g)*S8(m);
                                        PCf=SC1(r)*SC2(c)*SC3(b)*SC4(d)*SC5(z)*SC6(t)*SC7(g)*SC8(m);
                                        er=min([PCf,PCt]);
                                        sum=sum+er;
                                    end
                                end
                            end
                        end
                    end
                end
            end
         end
       end
       if k>=9
           sum=1;
       end
   sum=sum*0.5;                    
end

