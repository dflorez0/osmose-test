function [y, p] = deb(d, x, init)
% function from Deb, described in David's paper.
% Bibtex ref (cvs bib/references) deb:1999

if (nargin == 3)
  y = d;
  p = x;
  
  p.nobjectives			    = 2;
  p.nvars						    = 2;

  p.nclusters					  = 1;
  p.nclusters_min				= 1;
  p.nclusters_max				= 5;

  p.group(1).limits			= [0 1];
  p.group(1).is_integer	= 0;
  p.group(1).indexes		= [1:p.nvars];
 
  return;
end

%% START LUA_MOO EXAMPLE. In following lines we will:
% 1) open csv file in model folder and update values, according to current
% variable value - add absolute value of bounds is mandatory
% 2) run lua osmose
% 3) open objective function txt file in order to update objective
% function/s value

%% SECTION 1)
variables.tag_name = {'sc_price','co2tax'}; %%{'var_price','var_price'}
variables.length = [1,1]; %% [timesteps for each variable ]

p.bounds(1).value =[0.03, 0.1];
p.bounds(2).value =[0.005, 0.01];



% Update variable value, open csv, find variable and write new value
n_tags = size(variables.tag_name,2);
%X=[3500, 100, 300, 1]
% normalization for one decision variables
%X=x(:, 1)*(p.bounds(1).value(2)-p.bounds(1).value(1)) + p.bounds(1).value(1);
% normalization for two decision variables
X=[x(:, 1)*(p.bounds(1).value(2)-p.bounds(1).value(1)) + p.bounds(1).value(1), x(:,2)*(p.bounds(2).value(2)-p.bounds(2).value(1)) + p.bounds(2).value(1)];
% normalization for three decision variables
%X=[x(:, 1)*(p.bounds(1).value(2)-p.bounds(1).value(1)) + p.bounds(1).value(1), x(:,2)*(p.bounds(2).value(2)-p.bounds(2).value(1)) + p.bounds(2).value(1), x(:,3)*(p.bounds(2).value(2)-p.bounds(2).value(1)) + p.bounds(2).value(1)];
disp(variables.tag_name{1})
disp(X(1))
disp(variables.tag_name{2})
disp(X(2))
foo()
    cont=0;
for k=1:1:n_tags

%[NUM,TXT,RAW]=xlsread('C:\Program Files (x86)\Osmose\Lua\5.1\projects\biomoo\biomoo.csv');
[NUM,TXT,RAW]=xlsread('/Users/renaudkern/Development/ipese/osmose-test/projects/biomoo/biomoo.csv');
% I = length(TXT);
% for i=1:1:I
%     line = TXT{i};
%     strcmpi(line(1:length(variables.tag_name{k})),variables.tag_name{k});
%    if strcmpi(line(1:length(variables.tag_name{k})),variables.tag_name{k})
%        TXT{i} = [variables.tag_name{k}];
%        % point the first element in X corresponding to the current tag
%           cont_ub = cont + variables.length(k);
%         for j=(cont+1):1:cont_ub
%        TXT{i} = [TXT{i},',',num2str(X(j))];
%         end
%        cont=cont_ub;
%    else
%    end
% end
% write new value
% xlswrite('C:\Program Files (x86)\Osmose\Lua\5.1\projects\biomoo\biomoo.csv',TXT);
xlswrite('/Users/renaudkern/Development/ipese/osmose-test/projects/biomoo/biomoo.csv',TXT);
end


%% SECTION 2: call lua and do EI, HLD, HENS, POSTCOMP, etc

% tic;
%[status,result] = system('cd "C:\Program Files (x86)\Osmose\Lua\5.1" && lua projects/biomoo/biomoo.lua');
[status,result] = system('lua-5.1 /Users/renaudkern/Development/ipese/osmose-test/projects/biomoo/biomoo.lua');
% status
% result
% toc;

%% SECTION 3: open txt file where objective function value has been updated (at each run)

%fileID = fopen('C:\Program Files (x86)\Osmose\Lua\5.1\results\biomoo\objective_function_lua.txt','r');
fileID = fopen('/Users/renaudkern/Development/ipese/osmose-test/projects/biomoo/objective_function_lua.txt','r');

%Define the format of the data to read. Use the string, '%f', to specify floating-point numbers.
formatSpec = '%f';

%
% Assign the value (in objective function lua txt)
 y = fscanf(fileID,formatSpec);
 y1=y; y2=(1/y);
 y = [y1,y2];
 display(y)
 fclose(fileID);

%y = fscanf(fileID,formatSpec);
 
% y1=y; y2=1/y;
% %y3= 5*1/y;
% y = [y1,y2];
%display(y)
%fclose(fileID);

% x1 = x(:, 1) * 0.9 + 0.1;
% x2 = x(:, 2);
% 
% y1 = x1;
% 
% 
% g = 2 - exp(-((x2-0.2)./0.004).^2) - 0.8 * exp(-((x2-0.6)./0.4).^2);
% y2 = g ./ x1;
% 
% y = [y1 y2];
