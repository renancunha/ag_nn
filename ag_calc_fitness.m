function [ fitness ] = ag_calc_fitness( individuos)
    inputs = [0,0;
        0.3888,0;
        0.4555,0;
        0.5,0;
        0.5444,0;
        0.6111,0;
        1,0;
    
        0,0.4444;
        0.3888,0.4444;
        0.4555,0.4444;
        0.5,0.4444;
        0.5444,0.4444;
        0.6111,0.4444;
        1,0.4444;
    
    
        0,0.4777;
        0.3888,0.4777;
        0.4555,0.4777;
        0.5,0.4777;
        0.5444,0.4777;
        0.6111,0.4777;
        1,0.4777;
    
        0,0.5;
        0.3888,0.5;
        0.4555,0.5;
        0.5,0.5;
        0.5444,0.5;
        0.6111,0.5;
        1,0.5;
    
        0,0.527;
        0.3888,0.527;
        0.4555,0.527;
        0.5,0.527;
        0.5444,0.527;
        0.6111,0.527;
        1,0.527;
    
        0,0.5555;
        0.3888,0.5555;
        0.4555,0.5555;
        0.5,0.5555;
        0.5444,0.5555;
        0.6111,0.5555;
        1,0.5555;
    
        0,1;
        0.3888,1;
        0.4555,1;
        0.5,1;
        0.5444,1;
        0.6111,1;
        1,1];


    saida = [0,1,1;
        0.3888,1,1;
        0.4555,1,1;
        0.5,1,1;
        0.5444,1,1;
        0.6111,1,1;
        1,1,1;
        
        0,0.883,1;
        0.3888,0.883,0.666;
        0.4555,0.883,0.666;
        0.5,0.883,0.666;
        0.5444,0.883,0.666;
        0.6111,0.883,0.666;
        1,0.883,1;
        
        0,0.6667,1;
        0.3888,0.6667,0.666;
        0.4555,0.6667,0.0;
        0.5,0.6667,0.0;
        0.5444,0.6667,0.0;
        0.6111,0.6667,0.666;
        1,0.6667,1;
        
        0,0.5,0.666;
        0.3888,0.5,0;
        0.4555,0.5,0.0;
        0.5,0.5,0.0;
        0.5444,0.5,0.0;
        0.6111,0.5,0.0;
        1,0.5,0.666;
        
        0,0.333,0.666;
        0.3888,0.333,0.666;
        0.4555,0.333,0.0;
        0.5,0.333,0.0;
        0.5444,0.333,0.0;
        0.6111,0.333,0.666;
        1,0.333,0.666;
        
        0,0.167,0.666;
        0.3888,0.167,0.666;
        0.4555,0.167,0.0;
        0.5,0.167,0.0;
        0.5444,0.167,0.0;
        0.6111,0.167,0.666;
        1,0.167,0.666;
        
        0,0,0.666;
        0.3888,0,0.666;
        0.4555,0,0.0;
        0.5,0,0.0;
        0.5444,0,0.0;
        0.6111,0,0.666;
        1,0,0.666];
    
    n = size(individuos,2);
    fitness = [];
    for i = 1 : n
        temp = individuos{i};
        net_LW = {};
        net_bias = {};
        n_neuronios_camada = [];
        funcoes_net = {};
        net_IW = temp{1};
        for j=2:size(temp,2)-1
            
           b = temp{j};
           net_LW{j-1}= b{1};
           net_bias{j-1} = b{2};
           funcoes_net{j-1} = b{3};
           n_neuronios_camada = [n_neuronios_camada, size(b{1},2)];
           
        end
        b = temp{j+1};
        net_bias{j} = b{1};
        funcoes_net{j} = b{2};
        
        
        net = cria_RNA(size(temp,2)-2,n_neuronios_camada,funcoes_net,net_bias,net_IW,net_LW);
        net.trainParam.showWindow=0; %default is 1)
        input = inputs';
	    output = saida';
	    net = train(net,input,output);
	    outputs = net(input);
        performance = perform(net,output,outputs);
        fitness = [fitness;performance];
    end

end


