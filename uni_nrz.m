bits = [1 0 1 1 1 0 0 1];
bt_rt=1;
smp_n=1000;
tot_tim=length(bits)/bt_rt;
tot_smp=smp_n*length(bits);
dt=tot_tim/tot_smp ;
t=0:dt:tot_tim;
y=zeros(1,length(t));
for i=1:length(bits)
  if bits(i)==1
    y((i-1)*smp_n+1:i*smp_n)=1;
  endif
endfor
plot(t, y, 'Linewidth', 3);
%decoding%
count=0;
for i=1:length(t)
  if t(i)>count
    count=count+1;
    result(count)=y(i);
  endif
endfor
disp('NRZ Unipoler Decoding:');
disp(result);