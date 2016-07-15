function reb_err = reb_only(RA, RB, prc, cost)
    sum_cost=0;
    num=0;
    for j=1:length(prc)
        if sum_cost<=cost
            sum_cost=sum_cost+prc(j);
            num=num+1;
        else
            num=num-1;
            break
        end
    end
    Ran1=RA(1:num);
    Rbn2=RB(1:num);
    reb_err=fun_window6(Ran1,Rbn2);

end

