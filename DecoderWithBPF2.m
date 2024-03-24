function [decodedstring] = DecoderWithBPF(filename);

%reaing the signal
[x1, fs] = audioread(filename);

%FINDING HOW MANY FRAGMENTS 
a=floor(length(x1)/320);
tempo=zeros(1,a);
start = 1;
End = 320;
decodedstring='';

%LOOPING THROUGH THE NUMBER OF FRAGMENTS OF THE INPUT SIGNAL
for i = 1:a
    L1=100;
    M1=1100;
    H1=2500;
    
    %TAKING THE FIRST FRAGMENT
    x =x1(start:End);
    
    %DEFINING THE TABLE FREQUENCIES OF THE CHARACHTERS
    C=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z';' '];
    L=[100;100;100;100;100;100;100;100;100;300;300;300;300;300;300;300;300;300;500;500;500;500;500;500;500;500;500];
    M=[1100;1100;1100;1300;1300;1300;1500;1500;1500;1100;1100;1100;1300;1300;1300;1500;1500;1500;1100;1100;1100;1300;1300;1300;1500;1500;1500];
    H=[2500;3000;3500;2500;3000;3500;2500;3000;3500;2500;3000;3500;2500;3000;3500;2500;3000;3500;2500;3000;3500;2500;3000;3500;2500;3000;3500];
    MyTable=table(C,L,M,H);
    k=27;
    
    %NOW WE HAVE TO APPLY THIS FRAGMENT INTO 3 BPFs EACH ONE ILLUSTRATED AS
    %SHOWN BELOW
    
        %THE FIRST FILTER WILL HAVE FC1=50, FS=100, AND FC2=150 (LOW FREQUENCY)
        ratio = BPF(x, 50, 8000, 150);

        %NOW WE HAVE TO LOOK ON THE RATION OF THE LOW FREQUENCY BPF OUTPUT 
        if ratio >= 0.04 
            L1=100;
        elseif (ratio == 0.000413) || (ratio == 0.000169) || (ratio == 0.000218) || (ratio == 0.000158)
            L1=500;
        elseif (ratio <= 0.000509) && (ratio >= 0.000112)
            L1=300;
        elseif (ratio <= 0.003) && (ratio >= 0)
            L1=500;
        else
            continue
        end
        
        %THE SECOND FILTER WILL HAVE FC1=1050, FS=1100, AND FC2=1150 (MID FREQUENCY)
        ratio = BPF(x, 1050, 8000, 1150);

        %NOW WE HAVE TO LOOK ON THE RATION OF THE LOW FREQUENCY BPF OUTPUT 
        if ratio >= 0.03
            M1=1100;
        elseif (ratio >= 0.000060) && (ratio <= 0.000088)
            M1=1300;
        elseif (ratio <= 0.000050) && (ratio >= 0)
            M1=1500;
        elseif ((ratio >= 0.000200) && (ratio <= 0.000290)) || (ratio == 0.000390) || (ratio == 0.002790)
            M1=1500;
        else
            M1=1300;
        end
        
        %THE THIRD FILTER WILL HAVE FC1=2450, FS=2500, AND FC2=2550 (HIGH FREQUENCY)
        ratio = BPF(x, 2450, 8000, 2550);

        %NOW WE HAVE TO LOOK ON THE RATION OF THE LOW FREQUENCY BPF OUTPUT 
        if (ratio == 0.046464) || (ratio == 0.000184) || (ratio == 0.000387) || ((ratio <= 0.004461) && (ratio >= 0.004000))
            H1=3500;
        elseif (ratio == 0.000642)
            H1=3000;
        elseif ratio >= 0.04
            H1=2500;
        elseif (ratio >= 0.000601) && (ratio <= 0.000684)
            H1=3500;
        else
            H1=3000;
        end
        
    %NOW WE DECODE THE SIGNAL ACCORDING TO ITS L,M, AND H FREQUENCIES'
        %LOOPING THROUGH THE TABLE AND COMPARING
        for j = 1:k
            if   isequal(L1, MyTable.L(j)) &&  isequal(M1, MyTable.M(j)) &&  isequal(H1, MyTable.H(j)) 
                %disp( MyTable.C(j));
                str=MyTable.C(j);
                decodedstring = [decodedstring str];
            end 
        end
    start =start+320;
    End = End+320;
end
fprintf(' string = %s\n', decodedstring);
end
