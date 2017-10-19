function matches=countKs(s1, s2)

    kMers1=getKmers(s1,3);
    kMers2=getKmers(s2,3);
    pairs=ismember(kMers1,kMers2,'rows');
    matches=sum(pairs);
end