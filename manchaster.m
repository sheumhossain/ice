bits = input('prompt');
bt_rt = 1;
tot_t = length(bits)/bt_rt;
smp_no = 1000;
tot_smp = smp_no*length(bits);
dt = tot_t/tot_smp;
t = 0:dt:tot_t;
y = zeros(1,length(t));
v = input('prompt');
for i=1:length(bits)
  if bits(i)==1
    y((i-1)*smp_no+1:(i-1)*smp_no+smp_no/2) = v;
    y((i-1)*smp_no+smp_no/2:i*smp_no) = -v;
  else
    y((i-1)*smp_no+1:(i-1)*smp_no+smp_no/2) = -v;
    y((i-1)*smp_no+smp_no/2:i*smp_no) = v;
  endif
endfor
plot(t, y, 'Linewidth', 3);
%decoding
count = 0;
for i=1:length(t)
  if t(i)>count
    count++;
    if y(i)>0
      result(count) = y(i)/v;
    else
      result(count) = 0;
    endif
  endif
endfor
disp('decoding of manchester')
disp(result);