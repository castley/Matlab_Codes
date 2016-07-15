function er= crowdbudget(prc,cost,Ra, Rb)
    u1=mean(Ra);
    u2=mean(Rb);
    dm1=abs(u1-0.5);
    dm2=abs(0.5-u2);
    mc=mean(prc);
    N=round(cost/mc+1);
    er=0.5*exp(-2*N*dm2^2)+0.5*exp(-2*N*dm2^2);
end

