function [ individuos, n ] = ag_crossover( individuos, TX_MUTACAO)
%AG_MUTATION Summary of this function goes here
%   Detailed explanation goes here

    %Qtde total de individuos
    n_pop = size(individuos,2);
    
    %Qtde de mutacoes
    n = 0;
    
    for i = 1 : n_pop
    
        if (rand(1) <= TX_MUTACAO)
            
            %Individuo foi escolhido para mutação
            ind = individuos{i};

            %Muta TF
            %ind = ag_mutation_tf(ind);
            
            %Muta Pesos
            ind = ag_mutation_pesos(ind);
            
            %Muta Bias
            %ind = ag_mutation_bias(ind);
            
            individuos{i} = ind;
            
            n = n + 1;
        end
            
    end
      
end

