% Make a knowledge base representing musicians and instruments.
% Also represent musicians and their genre of music.

% Find all musicians who play the guitar.
gra(mDavis, trabka).
gra(bKris, beatbox).
gra(mMangini, perkusja).
gra(bMarley, gitara).
gra(eClapton, gitara).

rodzaj(mDavis, jazz).
rodzaj(bKris, hiphop).
rodzaj(mMangini, rock).
rodzaj(bMarley, reggae).
rodzaj(eClapton, rock).


i_r(INS, ROD) :- rodzaj(Z, ROD), gra(Z, INS).
/*
| ?- gra(Muzyk, gitara).
Muzyk = bMarley ? ;
Muzyk = eClapton
*/

