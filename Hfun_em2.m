% according to the reliability to delete the sources and reselct the new
% sources
function st_num = Hfun_em2(cost,prc,k,n)
    st_num=[];
   if sum(prc(1:k)) <= cost
      st_num = 1:k;
   else if sum(prc(1:k-1))<=cost
           st_num = 1:k-1;
       else
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
                           if j+2<=n
                               Sum = sum(prc(1:k-3))+sum(prc(j:j+2));
                               if Sum<=cost
                                   st_num=[1:k-3,j:j+2];
                               else
                                   st_num=n-k+1:n;
                               end
                           end
                       end
                   end
               end
           end
       end
   end
end