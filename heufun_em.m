function st_num = heufun_em(cost,prc,k,n)
    st_num=[];
   if sum(prc(1:k)) <= cost
      st_num = 1:k;
   else
       for j = k+1: n
           [val, pos]=max(prc(1:k));
           Sum = sum(prc(1:k))-val+prc(j);
           if Sum <=cost
              st_num =[1:pos-1,pos+1:k,j];
           else
               pri = prc(1:k);
               pri(pos)=[];
               [v2,p2]=max(pri);
               if j<n
                   Sum = sum(prc(1:k))-val-v2+prc(j)+prc(j+1);
                   if  Sum <=cost
                       st_num =[1:k,j,j+1];
                       if p2>=pos
                          st_num(pos)=[]; 
                          st_num(p2+1)=[];
                       else
                          st_num(pos)=[]; 
                          st_num(p2)=[]; 
                       end
                   else 
                       st_num = n-k+1:n;
                   end
               end
           end
       end
   end
    
end

