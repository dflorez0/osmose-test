close all
clear all
clc

restoredefaultpath;
addpath(genpath('/Users/renaudkern/Desktop/Moo'))
clear p;
p=struct;
p.objective						= 'deb';
p.initialise					= 'deb';

p.monitor =...
{
  10000	'moo_restart_monitor'
%   100	'moo_stats'
  100	'moo_count_monitor'
  100	'moo_speed_monitor'
  100	'moo_queue_monitor'
  100	'moo_objective_monitor'
  100	'moo_draw'
%   100	'moo_write_stats'
  100	'moo_stop_monitor'
};

p.max_evaluations				= 30;
p = moo_start(p, [], 20);
