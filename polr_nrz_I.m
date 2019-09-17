bits = [ 0 1 1 1 0 0 1 0];
b_rt = 1;
smp_n = 1000;
to_time = length(bits)/b_rt;
to_smp = n*length(bits);
dt = to_time/to_smp;
t = 0:dt:to_time;
y = zeros(1,length(t));
lastbit = 1;
for i=1:length(bits)
  if bits(i)==1
    y((i-1)*smp_n+1:i*smp_n) = -lastbit;
    lastbit = -lastbit;
  else
    y((i-1)*smp_n+1:i*smp_n) = lastbit;
  endif
endfor
plot(t,y,'Linewidth',3);
%decoding
count = 0;
for i=1:length(t)
  if t(i)>count
    count=count+1;
    if y(i)!=lastbit
      result(count)=1;
      lastbit=-lastbit;
    else
      result(count)=0;
    endif
  endif
endfor
disp('decoding of nrzL');
disp(result);



