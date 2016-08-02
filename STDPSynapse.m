% Synapse Model
% yyq 2016-08-01
classdef STDPSynapse < handle
    properties
        weight;
        lastPreSpikeTime;
    end
    methods
        function obj = STDPSynapse()
            obj.weight = 0.1 * rand(); % uniform from 0 to 0.01. can be modified.
            obj.lastPreSpikeTime = -1;
        end
        
        function updateWeight(obj, delta_t, config)
            if delta_t >= 0
                delta_w = config.stdp_A_pos * exp(delta_t / stdp_t_pos);
            else
                delta_w = - config.stdp_A_neg * exp(delta_t / stdp_t_neg);
            end
            obj.weight = obj.weight + delta_w;
        end
        function updateSpikeTime(obj, timeValue)
            obj.lastPreSpikeTime = timeValue;
        end
    end
end