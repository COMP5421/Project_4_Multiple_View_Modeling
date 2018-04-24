function W = getAdj(sizeData)

numSites = prod(sizeData);

W=sparse(numSites,numSites);
for i=1:sizeData(1)
    for j=1:sizeData(2)
        if j+1<=sizeData(2)
            W((i-1)*sizeData(2)+j,(i-1)*sizeData(2)+j+1)=1;
        end

        if i+1<=sizeData(1)
            W((i-1)*sizeData(2)+j,i*sizeData(2)+j)=1;
        end
    end
end

end