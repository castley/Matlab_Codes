function rand_err = rand_fun(N,RA,RB,cost,prc)
    sum=0;
    G=0;
    j=1;
    thred=cost; % the total cost
    while sum<=thred;
       k=unidrnd(N);  % random integer
       sum=sum+prc(k);
       KK(j)=k;
       j=j+1;
    end
    for im=1:j-1
        id=KK(im);
        Ran(im)=RA(id);
        Rbn(im)=RB(id);
    end
    rand_err= fun_window6(Ran,Rbn);
end

