function kMertrix=buildKMertrix(strings)

    N=length(strings);
    kMertrix=ones(N,N)*-1;
    for i=1:N-1
        s1=strings(i);        
        for j=i+1:N
            s2=strings(j);
            kMertrix(i,j)=countKs(s1,s2);
        end
    end

end