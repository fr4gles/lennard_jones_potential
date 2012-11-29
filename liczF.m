function Ff = liczF(r)
    
    switch r
        case 0
            Ff = 0;
        otherwise
            Ff = ((12/(((r))^13)) - (6/(((r))^7)));
    end
    
end