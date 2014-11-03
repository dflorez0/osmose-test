disp('Run in Matlab');

u = getUnit('CipUnit');
s = getStream('fresh_water');
t = getTag('return_temp');
v = setTag('return_temp', 100);

disp(['Unit Name: ', u.name]);
disp(['Stream Name: ', s.name]);
disp(['Tag Value: ', num2str(t)]);
disp(['New Tag Value: ', num2str(v)]);
disp(['Check Tag Value: ', num2str(getTag('return_temp'))]);

clear all;