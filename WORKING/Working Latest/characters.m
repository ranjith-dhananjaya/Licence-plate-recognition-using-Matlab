function np=characters(pred)
%READLETTER reads the character fromthe character's binary image.
%   LETTER=READLETTER(SNAP) outputs the character in class 'char' from the
%   input binary image SNAP.
% Find the index which correspond to the highest matched character.
%display(max(comp));
%*-*-*-*-*-*-*-*-*-*-*-*-*-
% Accodrding to the index assign to 'letter'.
% Alphabets listings.
np = [];
for i = 1:length(pred)
vd = pred(i);    
if vd==1 
    letter='0 ';
elseif vd==2 
    letter='1 ';
elseif vd==3
    letter='2 ';
elseif vd==4 
    letter='3 ';
elseif vd==5
    letter='4 ';
elseif vd==6
    letter='5 ';
elseif vd==7
    letter='6 ';
elseif vd==8
    letter='7 ';
elseif vd==9
    letter='8 ';
elseif vd==10
    letter='9 ';
elseif vd==11
    letter='A ';
elseif vd==12
    letter='B ';
elseif vd==13
    letter='C ';
elseif vd==14
    letter='D ';
elseif vd==15 
    letter='E ';
elseif vd==16 
    letter='F ';
elseif vd==17 
    letter='G ';
elseif vd==18 
    letter='H ';
elseif vd==19
    letter='I ';
elseif vd==20
    letter='J ';
elseif vd==21
    letter='K ';
elseif vd==22
    letter='L ';
elseif vd==23
    letter='M ';
elseif vd==24
    letter='N ';
elseif vd==25
    letter='O ';
elseif vd==26
    letter='P ';
    %*-*-*-*-*
% Numerals listings.
elseif vd==27
    letter='Q ';
elseif vd==28
    letter='R ';
elseif vd==29
    letter='S ';
elseif vd==30 
    letter='T ';
elseif vd==31
    letter='U ';
elseif vd==32 
    letter='V ';
elseif vd==33
    letter='W ';
elseif vd==34 
    letter='X ';
elseif vd==35 
    letter='Y ';
else
    letter='Z ';
end
np = [np,letter];
end
end