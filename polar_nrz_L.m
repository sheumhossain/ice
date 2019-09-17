bits = input('prompt');%[1 0 1 1 1 0 0 1];
b_rt=1;
n=1000;
T=length(bits)/b_rt;
to_smp=n*length(bits);
dt=T/to_smp;
t=0:dt:T;
y=zeros(1,length(t));
v = input('prompt');
for i=1:length(bits)
  if bits(i)==1
    y((i-1)*n+1:i*n) = v;
  else 
    y((i-1)*n+1:i*n) = -v;
  end
end
plot(t, y, 'Linewidth', 3);
%decoding
count=0;
for i=1:length(t)
  if t(i)>count
    count=count+1;
    if y(i)>0
      result(count)=y(i)/v;
    else
      result(count)=0;
    endif
  endif
endfor
disp('nrz-l decoding');
disp(result);