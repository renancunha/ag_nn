clear all
clc
finalizado = 0;
%Definicoes
POP_SIZE        = 20;
CROMO_SIZE      = 10;
N_GERACOES      = 100;
TX_MUTACAO      = 0.2;


%Gera a popula��o inicial
individuos = ag_gera_pop(POP_SIZE);

min_v = [];
med_v = [];
size_vec = [];
influ = [];
influ_act = 0;
%Executa as gera��es
for i = 1 : N_GERACOES
    i
    %Calcula fitness
    fitness = ag_calc_fitness(individuos);
    
    %
    min_v = [min_v; min(fitness)];
    med_v = [med_v;  sum(fitness)/size(fitness,1)];
    size_vec = [size_vec; length(individuos)];
    
    %Ordena��o
    [ individuos,s_fitness ] = ag_sort( individuos,fitness);
    
    vec = s_fitness(find(s_fitness(1:11)));
    if(i>1)
        for j=1:length(vec)
            temp = find(vec(j)==fitness(12:20));
            if(~isempty(temp))
                influ_act = influ_act + 1;
            end
        end
    end
    influ = [influ; influ_act];
    
    if (i<N_GERACOES)
        %Crossover-
        individuos = ag_crossover(individuos);
        
        %Muta��o
        [individuos, qtde_mutada] = ag_mutation(individuos, TX_MUTACAO);
    end
end

finalizado = 1;
