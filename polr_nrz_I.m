bits = input('prompt');%[1 0 1 1 1 0 0 1];
b_rt = 1;
smp_n = 1000;
to_time = length(bits)/b_rt;
to_smp = n*length(bits);
dt = to_time/to_smp;
t = 0:dt:to_time;
y = zeros(1,length(t));
%lastbit = 1;
voltage = input('prompt');
for i=1:length(bits)
  if bits(i)==1
    y((i-1)*smp_n+1:i*smp_n) = -voltage;
    voltage = -voltage;
  else
    y((i-1)*smp_n+1:i*smp_n) = voltage;
  endif
endfor
plot(t,y,'Linewidth',3);
%decoding
count = 0;
voltage = input('prompt');
for i=1:length(t)
  if t(i)>count
    count=count+1;
    if y(i)!=voltage
      result(count)=1;
     voltage=-voltage;
    else
      result(count)=0;
    endif
  endif
endfor
disp('decoding of nrzi');
disp(result);
