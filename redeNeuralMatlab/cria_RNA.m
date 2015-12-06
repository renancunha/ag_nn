function [net] = cria_RNA(camadas,n_neuronios_camada,funcoes,net_bias,net_IW,net_LW)
%    cromo_inp(find(cromo_inp)==0)=[];
%    cromo_inp = [cromo_inp 3];


    net = newff([0 1; 0 1],[n_neuronios_camada,3],funcoes);
    
    
    net.trainFcn = 'traingd';
    
    
    net.trainParam.lr = 0.7; % Learning rate used in some gradient schemes
    net.trainParam.epochs =10000; % Max number of iterations
    
    net.IW{1,1} = net_IW;
    net.b=net_bias';
    for i = 2:camadas+1
       net.LW{i,i-1}= net_LW{i-1};
    end
    
    
%    input = inputs';
%    output = saida';
%    net = train(net,input,output);
%    outputs = net(input);
%    errors = sum(sum(abs(gsubtract(outputs,output))))/(size(inputs,1)*2);
%    performance = perform(net,output,outputs);
end
 