% according to the reliability to delete the sources and reselct the new
% sources
function st_num = Hfun_reb(cost,prc,k,n)
    st_num=[];
   if sum(prc(1:k)) <= cost
      st_num = 1:k;
   else if sum(prc(1:k-1))<=cost
           for j = k+1: n
               Sum = sum(prc(1:k-1))+prc(j);
               if Sum <=cost
                  st_num =[1:k-1,j];
               else
                   if j<n
                       Sum = sum(prc(1:k-2))+prc(j)+prc(j+1);
                       if  Sum <=cost
                           st_num =[1:k-2,j,j+1];
                       else
                           st_num=1:k-3;
                       end
                   end
               end
           end
       end
   end
end