clear

close all

quad2ini

etas = 0.59:0.001:0.72;

for i=1:length(etas)
   eta = etas(i)
   quad2
end