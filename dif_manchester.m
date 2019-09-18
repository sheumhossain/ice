bits = input('prompt');
b_rt = 1;
smp_n = 1000;
tot_t = length(bits)/b_rt;
tot_s = smp_n*length(bits);
dt = tot_t/tot_s;
t = 0:dt:tot_t;
y = zeros(1,length(t));
v = input('prompt');
for i=1:length(bits)
  if bits(i)==0
    y((i-1)*smp_n+1:(i-1)*smp_n+smp_n/2) = -v;
    y((i-1)*smp_n+smp_n/2:i*smp_n) = v;
  else
    y((i-1)*smp_n+1:(i-1)*smp_n+smp_n/2) = v;
    y((i-1)*smp_n+smp_n/2:i*smp_n) = -v;
    v=-v;
  endif
endfor
plot(t,y,'Linewidth',3);
%decoding
v = input('prompt');
count = 0;
for i=1:length(t)
  if t(i)>count
    count=count+1;
    if y(i)==v 
      result(count) = 1;
      v = -v;
    else
      result(count) = 0;
    endif
  endif
  
endfor

disp('Differential Manchester Decoding:');
disp(result);





