bits = input('prompt');
b_rt = 1;
sm_n = 1000;
total_t = length(bits)/b_rt;
total_smp = sm_n*length(bits);
dt = total_t/total_smp;
t = 0:dt:total_t;
y = zeros(1,length(t));
for i=1:length(bits)
  if bits(i)==1
    y((i-1)*sm_n+1:(i-1)*sm_n+sm_n/2) = 1;
    else y((i-1)*sm_n+1:(i-1)*sm_n+sm_n/2) = -1;
  endif
endfor
plot(t, y, 'Linewidth', 3);