% build SNN Network
% yyq 2016-08-01

% connections
layerOneConnections = {};
for i = 1:config.hiddenSize
    for j = 1:config.inputSize
        layerOneConnections{i, j} = STDPSynapse();
    end
end
layerTwoConnections = {};
for i = 1:config.numClass
    for j = 1:config.hiddenSize
        layerTwoConnections{i, j} = STDPSynapse();
    end
end

% neurons
hiddenLayerNeurons = {};
for i = 1:config.hiddenSize
    hiddenLayerNeurons{i} = LIFNeuronE(config);
end
outputLayerNeurons = {};
for i = 1:config.numClass
    outputLayerNeurons{i} = LIFNeuronE(config);
end

    
