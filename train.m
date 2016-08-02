% execute SNN training process
% yyq, 2016-08-01
clear;
clc;
ConfigSNN;
BuildSNNStructure;
readMNIST;
% train
for id = 1:size(trainLabels, 1)
    hiddenSpikes = zeros(config.hiddenSize, 1);
    for t = 0:config.t_step:config.t_simulation
        % input to hidden
        psNoise = uint8(random('Poisson', 1, size(trainData, 2)));
        spikeIn = trainData(id,:) + psNoise;
        spikeIn = spikeIn > 128;
        for i = 1:config.hiddenSize
            inputInductor = 0;
            for j = 1:config.inputSize
                inputInductor = inputInductor + spikeIn(j) * layerOneConnections{i, j}.weight;
                if spikeIn(j) == 1
                    layerOneConnections{i,j}.updateSpikeTime(t);
                end
            end
            % compute spike or not
            hiddenSpikes(i) = hiddenLayerNeurons{i}.ComputeStep(inputInductor, config);
            % compute stdp
            if hiddenSpikes(i) == 1
                layerOneConnections{i,j}.updateWeight(t - layerOneConnections{i,j}.lastPreSpikeTime, config);
            end
        end
        % hidden to output
        for i = 1:config.numClass
            inputInductor = 0;
            for j = 1:config.hiddenSize
                inputInductor = inputInductor + spikeIn(j) * layerTwoConnections{i, j}.weight;
                if spikeIn(j) == 1
                    layerOneConnections{i,j}.updateSpikeTime(t);
                end
            end
            % compute spike or not
            hiddenSpikes(i) = hiddenLayerNeurons{i}.ComputeStep(inputInductor, config);
            % compute stdp
            if hiddenSpikes(i) == 1 || i == trainLabels(id)
                layerTwoConnections{i,j}.updateWeight(t - layerTwoConnections{i,j}.lastPreSpikeTime, config);
            end
        end
    end
end
                
    
