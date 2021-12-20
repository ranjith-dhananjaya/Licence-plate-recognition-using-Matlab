function letter=readLetter(snap)
%READLETTER reads the character fromthe character's binary image.
%   LETTER=READLETTER(SNAP) outputs the character in class 'char' from the
%   input binary image SNAP.

load NewTemplates % Loads the templates of characters in the memory.
snap=imresize(snap,[42 24]); % Resize the input image so it can be compared with the template's images.
comp=[ ];
for n=1:length(NewTemplates)
    sem=corr2(NewTemplates{1,n},snap); % Correlation the input image with every image in the template for best matching.
    comp=[comp sem]; % Record the value of correlation for each template's character.
    %display(sem);
    
end
vd=find(comp==max(comp)); % Find the index which correspond to the highest matched character.
%display(max(comp));
%*-*-*-*-*-*-*-*-*-*-*-*-*-
% Accodrding to the index assign to 'letter'.
% Alphabets listings.
if vd==1 || vd==2
    letter='11 ';
elseif vd==3 || vd==4
    letter='12 ';
elseif vd==5
    letter='13 ';
elseif vd==6 || vd==7
    letter='14 ';
elseif vd==8
    letter='15 ';
elseif vd==9
    letter='16 ';
elseif vd==10
    letter='17 ';
elseif vd==11
    letter='18 ';
elseif vd==12
    letter='19 ';
elseif vd==13
    letter='20 ';
elseif vd==14
    letter='21 ';
elseif vd==15 
    letter='22 ';
elseif vd==16
    letter='23 ';
elseif vd==17
    letter='24 ';
elseif vd==18 || vd==19
    letter='25 ';
elseif vd==20 || vd==21
    letter='26 ';
elseif vd==22 || vd==23
    letter='27 ';
elseif vd==24 || vd==25
    letter='28 ';
elseif vd==26
    letter='29 ';
elseif vd==27
    letter='30 ';
elseif vd==28
    letter='31 ';
elseif vd==29
    letter='32 ';
elseif vd==30
    letter='33 ';
elseif vd==31
    letter='34 ';
elseif vd==32
    letter='35 ';
elseif vd==33
    letter='36 ';
    %*-*-*-*-*
% Numerals listings.
elseif vd==34
    letter='1 ';
elseif vd==35
    letter='2 ';
elseif vd==36
    letter='3 ';
elseif vd==37 || vd==38
    letter='4 ';
elseif vd==39
    letter='5 ';
elseif vd==40 || vd==41 || vd==42
    letter='6 ';
elseif vd==43
    letter='7 ';
elseif vd==44 || vd==45
    letter='8 ';
elseif vd==46 || vd==47 || vd==48
    letter='9 ';
else
    letter='0 ';
end
end