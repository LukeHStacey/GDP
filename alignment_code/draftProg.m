function aligned=draftProg(strings)
%strings is a stringarray of different length strings we want to align

    N=length(strings);
    currentKmerMatrix=ones(N,N)*-1;
    for i=1:N-1
        s1=strings(i);        
        for j=i+1:N
            s2=strings(j);
            currentKmerMatrix(i,j)=countKs(s1,s2);
        end
    end
    %*1*
    [~,big]=max(currentKmerMatrix(:))
    s1Idx=floor(big/N);
    s2Idx=big-s1Index*N;
    
    align(strings(s1Idx),strings(s2Idx));
    
    
    %N times
    %recalculate new smaller kmer table
    %choose best 2 to merge (see *1*)
    %merge best things to merge
end