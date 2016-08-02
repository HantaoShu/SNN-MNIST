% config SNN model
% yyq 2016-08-01
config = {};
% net hyper-params
config.inputSize = 784;
config.hiddenSize = 200;
config.numClass = 10;
config.t_simulation = 200; % ms
config.t_step = 1; % ms
% neuron hyper-params
config.V_l = -70; % mV
config.V_th = -50;
config.V_reset = -55;
config.V_e = 0;
config.V_i = -70;
config.g_l = 20; % nSimon
config.t_e = 2; % ms
config.t_i = 5; % ms
config.t_m = 10;% this is important but UNKNOWN.
% STDP params (bi-phrase)
config.stdp_t_pos = 100;
config.stdp_t_neg = 1000;
config.stdp_A_pos = 0.01;
config.stdp_A_neg = 0.01;


