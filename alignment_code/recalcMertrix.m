function newMertrix=recalcMertrix(mertrix,idx)
    N=length(mertrix);
    
    newMertrix=mertrix;
    newMertrix(:,idx)=[];
    newMertrix(idx,:)=[];
    mertrix=mertrix(:,idx)
    
    
    %newVect=Nick'sMaths
    
    newMertrix=[-1 newVect ;-1*ones(1,N-1) newMertrix];
end