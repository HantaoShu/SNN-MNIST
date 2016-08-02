% LIF Neuron model
% yyq 2016-08-01
classdef LIFNeuronE < handle % excitatory units
    properties
        V; % potential
        g_e; % inductor_excitatory
        I_in; % input current
    end
    methods
        function obj = LIFNeuronE(config)
            obj.V = config.V_l; % set start V value to static voltage.
            obj.g_e = 0;
            obj.I_in = 0;
        end
        function output = ComputeStep(obj, InputInductor, config)
            % compute g_e
            obj.g_e = obj.g_e - obj.g_e / config.t_e * config.t_step + InputInductor;
            % compute I_in
            obj.I_in = -obj.g_e * (obj.V - config.V_e);
            % compute difference delta_V
            delta_V = (-(obj.V - config.V_l) + obj.I_in / config.g_l) / config.t_m * config.t_step;
            % update V
            obj.V = obj.V + delta_V;
            % spike
            if obj.V > config.V_th
                spike = 1;
                obj.V = config.V_reset;
            else
                spike = 0;
            end
            output = spike;
        end
    end
end
            
            