function  strings= getKmers(string,k)

    strings=zeros(length(string)-k+1,k);
    i=1;
    while length(string)>=k
       
        strings(i,:)=string(1:k);
        i=i+1;
        string=string(2:end);
    end
    

end