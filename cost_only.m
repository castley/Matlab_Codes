function cost_err = cost_only(Ra,Rb,Fee,cost)  %% it is sorted above
    Sum=0;
    t1=1;
    G_num=[];
    N=length(Fee);
    for j = 1:1:N
        if Sum <= cost
            Sum = Sum + Fee(j);
            G_num(t1) = j;
            t1=t1+1;
        else
            break
        end
    end
    for im=1:length(G_num)
        id=G_num(im);
        Ran(im)=Ra(id);
        Rbn(im)=Rb(id);
    end
    cost_err=fun_window6(Ran,Rbn);
end

