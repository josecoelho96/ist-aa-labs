clear

close all

quad2ini
a=20;
anim=0;
etas = 0.094:0.0001:0.096;

for i=1:length(etas)
   eta = etas(i)
   quad2
end

