function index = findBin(value, binEnds)
    numBins = length(binEnds) - 1;
    
    if (value >= binEnds(1)) && (value < binEnds(2))
        index = 1; 
    elseif (value >= binEnds(2)) && (value < binEnds(3))
        index = 2; 
    else
        index = 3; 
    end
    
    
    % return the index of the bin where value belongs {1, ..., numBins}. 
end