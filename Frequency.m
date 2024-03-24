function output = Frequency(x)
Fs=8000;
n=1:320;
% x=cos(2*pi*100*n/Fs) + cos(2*pi*1100*n/Fs) + cos(2*pi*2500*n/Fs);
%[x,Fs]=audioread('record.wav');
y=fft(x);
%plot(abs(y));

%plot(abs(y(1:Fs/2)));

%plot(abs(y));

[Y,I] = max(abs(y));
freq = 0:Fs/length(y):Fs/2;

 p1=freq(I);
% disp(p1);

 x=abs(y);
 [Y,I] = max(x(x<max(x)));
 freq = 0:Fs/length(y):Fs/2;
 
 p2=freq(I);
 %disp(p2);
 
 
 a=abs(y);
 x1=a(a<max(a));
 [Y,I] = max(x1(x1<max(x1)));
 freq = 0:Fs/length(y):Fs/2;

 
 p3=freq(I);
 array=[p1 p2 p3];
 temp=sort(array) ;


output = temp;

end 
 
 