function ag_show_pop( individuos )
%AG_SHOW_POP Summary of this function goes here
%   Detailed explanation goes here

    n = size(individuos, 2);
    
    for i = 1 : 1 : n
       display(individuos(i).fitness);
    end
    
    individuos(1).fitness = 445;

end

