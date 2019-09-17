bits = input('prompt');
b_rt = 1;
sm_n = 1000;
total_t = length(bits)/b_rt;
total_smp = sm_n*length(bits);
dt = total_t/total_smp;
t = 0:dt:total_t;
y = zeros(1,length(t));
v = input('prompt');
for i=1:length(bits)
  if bits(i)==1
    y((i-1)*sm_n+1:(i-1)*sm_n+sm_n/2) = v;
    else y((i-1)*sm_n+1:(i-1)*sm_n+sm_n/2) = -v;
  endif
endfor
plot(t, y, 'Linewidth', 3);
%decoding of polar_rz
count = 0;
for i=1:length(t)
  if t(i)>count
    count=count+1;
    if y(i)>0
      result(count) = y(i)/v;
    else
      result(count) = 0;
    endif
  endif
endfor
disp('RZ Decoding:');
disp(result);