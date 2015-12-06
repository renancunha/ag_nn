function [ ind ] = ag_mutation_bias( ind )
%AG_MUTATION_TF Summary of this function goes here
%   Detailed explanation goes here

    n_camadas = size(ind, 2);
    
    %Muta camada de entrada
    n_entrada = size(ind{1}, 1);
    for j = 1 : n_entrada
        ind{1}(n_entrada, 2) = rand();
    end
    
    %Muta camadas intermediarias
    for i = 2 : n_camadas-1
        info = ind{i};
        
        z = size(info{2}, 1);
        info{2} = rand(z);
        
    end
    
    %Muta camada de saida
    y = size(ind{n_camadas}{1}, 1);
    ind{n_camadas}{1} = rand(y);
    
end
