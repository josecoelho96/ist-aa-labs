clear

close all

quad2ini
a=20;

%alfa = 0.7;
%etas = 0.56666:0.00001:0.56667; %0.56666->0.56667

%alfa = 0.9;
%etas = 1.899:0.001:1.901; %1.9

alfa = 0.95;
etas = 3:0.1:4; %1.9

maxiter=1000;
anim=1;

for i=1:length(etas)
   eta = etas(i);
   fprintf('eta = %f\n', eta)
   quad2_3d
end

