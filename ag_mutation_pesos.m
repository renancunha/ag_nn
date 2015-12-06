function [ ind ] = ag_mutation_pesos( ind )
%AG_MUTATION_TF Summary of this function goes here
%   Detailed explanation goes here

    n_camadas = size(ind, 2);
    
    %Muta camada de entrada
    n_entrada = size(ind{1}, 1);
    for j = 1 : n_entrada
        ind{1}(n_entrada, 1) = rand();
    end
    
    %Muta camadas intermediarias
    for i = 2 : n_camadas-1
        info = ind{i};

        [j, k] = size(info{1});
        info{1} = rand(j, k);
                
    end
       
end
