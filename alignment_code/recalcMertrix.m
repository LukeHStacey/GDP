function newMertrix=recalcMertrix(mertrix,idx)
    
    N=length(mertrix);
    
    newMertrix=mertrix;
    %Remove the columns and rows referring to the sequences to be clustered
    newMertrix(:,idx)=[];
    newMertrix(idx,:)=[];
    
    %Don't think you can do this, the matrix is triangular - Nick
    %mertrix=mertrix(:,idx)
    
    %Retreives the kmer count for every sequence when compared 
    %with the sidx-th sequence
    function subs = getSubs(sidx)
        if sidx == 1
            subs = mertrix(1, :);
        elseif sidx == N
            subs = mertrix(:, N);
        else    
            s1SubsRow = mertrix(sidx,sidx:end);
            s1SubsCol = mertrix(1:sidx, sidx).';
            subs = [s1SubsCol, s1SubsRow(2:end)];
        end
    end

    % Get the list of kmer counts for the sequences we plan to cluster
    idx1Subs = getSubs(idx(1));
    idx2Subs = getSubs(idx(2));
    
    % Remove kmer comparisons that compares the sequences to be clustered
    % with themselves
    idx1Subs(idx(1)) = [];
    idx2Subs(idx(2)) = [];
    
    % Remove the kmer count between the sequences which are to be clustered
    % Need to check how removing the self kmer count affects the index of
    % the other sequence to be clustered
    if (idx(1) > idx(2))
        idx1Subs(idx(2)) = [];
        idx2Subs(idx(1)-1) = [];
    else
        idx1Subs(idx(2)-1) = [];
        idx2Subs(idx(1)) = [];
    end
    
    %Build new intermediate kmer count scores
    newSubs = (idx1Subs + idx2Subs) / 2.0;
    %Build new kmer matrix for next part of UPGMA algorithm
    newMertrix=[-1 newSubs ;-1*ones(N-2,1) newMertrix];
    
end