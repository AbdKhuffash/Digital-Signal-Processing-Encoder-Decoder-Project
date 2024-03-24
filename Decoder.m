function [decodedstring]=Decoder(filename);

%filename='record.wav';
[x1,fs]=audioread(filename);

a=floor(length(x1)/320);
tempo=zeros(1,a);
start = 1;
End = 320;
decodedstring='';
for i = 1:a 
x =x1(start:End);

C=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z';' '];
L=[100;100;100;100;100;100;100;100;100;300;300;300;300;300;300;300;300;300;500;500;500;500;500;500;500;500;500];
M=[1100;1100;1100;1300;1300;1300;1500;1500;1500;1100;1100;1100;1300;1300;1300;1500;1500;1500;1100;1100;1100;1300;1300;1300;1500;1500;1500];
H=[2500;3000;3500;2500;3000;3500;2500;3000;3500;2500;3000;3500;2500;3000;3500;2500;3000;3500;2500;3000;3500;2500;3000;3500;2500;3000;3500];
MyTable=table(C,L,M,H);
k=27;

 tempo=Frequency(x);

 start =start+320;
 End = End+320;

     if (tempo(1) >= 0) && (tempo(1)< 200)
       tempo(1)=100;
        
    elseif (tempo(1) >= 200) && (tempo(1)< 400)
     tempo(1)=300;
     elseif (tempo(1) >= 400) && (tempo(1)< 600)
    tempo(1)=500;
     else 
     continue;
     end



     if (tempo(2) >= 1000) && (tempo(2)< 1200)
      tempo(2)=1100;  
    elseif (tempo(2) >= 1200) && (tempo(2)< 1400)
      tempo(2)=1300;
     elseif (tempo(2) >= 1400) && (tempo(2)< 1600)
      tempo(2)=1500;
      else 
     continue;
        
     end


 
     if (tempo(3) >= 2250) && (tempo(3)< 2750)
       tempo(3)=2500;  
    elseif (tempo(3)>= 2750) && (tempo(3)< 3250)
     tempo(3)= 3000;
     elseif (tempo(3)>= 3250) && (tempo(3)< 3750)
      tempo(3)= 3500;
      else 
     continue;
        
     end

     for j = 1:k
       if   isequal(tempo(1), MyTable.L(j)) &&  isequal(tempo(2), MyTable.M(j)) &&  isequal(tempo(3), MyTable.H(j)) 
         %disp( MyTable.C(j));
           str=MyTable.C(j);
           decodedstring = [decodedstring str];
       end 
     end 
end
  
fprintf(' string = %s\n', decodedstring);
end     
