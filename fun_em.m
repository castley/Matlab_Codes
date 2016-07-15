function [st_num2,st_num3,st_num4,st_num5,st_num6,st_num7,st_num8,st_num9] = fun_em(k,cost,ct,n)
    st_num2=[];
    st_num3=[];
    st_num4=[];
    st_num5=[];
    st_num6=[];
    st_num7=[];
    st_num8=[];
    st_num9=[];
    for i=k+1:n
        if ct(i)+ct(k)<=cost
            st_num2=[st_num2;k,i];
        end
        for t=i+1:n
            if ct(i)+ct(k)+ct(t)<=cost
               st_num3=[st_num3;k,i,t];
            end
            for j2=t+1:n
                if ct(i)+ct(k)+ct(t)+ct(j2)<=cost
                     st_num4=[st_num4;k,i,t,j2];
                end
                for j3=j2+1:n
                    if ct(i)+ct(k)+ct(t)+ct(j2)+ct(j3)<=cost
                       st_num5=[st_num5;k,i,t,j2,j3];
                    else
                        break;
                    end
                    for j4=j3+1:n
                        if ct(i)+ct(k)+ct(t)+ct(j2)+ct(j3)+ct(j4)<=cost
                            st_num6=[st_num6;k,i,t,j2,j3,j4];
                        end
                        for j5=j4+1:n
                             if ct(i)+ct(k)+ct(t)+ct(j2)+ct(j3)+ct(j4)+ct(j5)<=cost
                                st_num7=[st_num7;k,i,t,j2,j3,j4,j5];
                             end
                             for j6=j5+1:n
                                 if ct(i)+ct(k)+ct(t)+ct(j2)+ct(j3)+ct(j4)+ct(j5)+ct(j6)<=cost
                                    st_num8=[st_num8;k,i,t,j2,j3,j4,j5,j6];
                                 end
                                 for j7=j6+1:n
                                     if ct(i)+ct(k)+ct(t)+ct(j2)+ct(j3)+ct(j4)+ct(j5)+ct(j6)+ct(j7)<=cost
                                        st_num9=[st_num9;k,i,t,j2,j3,j4,j5,j6,j7];
                                     end
                                 end
                             end
                        end
                    end
                end
            end
        end
    end
    
end

