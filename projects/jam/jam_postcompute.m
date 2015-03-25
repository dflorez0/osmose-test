disp('Run in Matlab');

u = getUnit('CipUnit');
s = getStream('fresh_water');
t = getTag('return_temp');
v = setTag('return_temp', 150);

disp(['Unit Name: ', u.name]);
disp(['Stream Name: ', s.name]);
disp(['Tag Value: ', (t)]);
disp(['New Tag Value: ', (v(1,1))]);
disp(['Check Tag Value: ', (getTag('return_temp'))]);

clear all;