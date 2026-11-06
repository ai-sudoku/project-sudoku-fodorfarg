%Name: Youstina Fark, Email: farg@uni-potsdam.de 
%Name: Alexandra Fodor, Email: fodor@uni-potsdam.de 

subgrid_size(3).

%Alle erlaubten Zahlen definieren 
numer(1..9). 

%Alle 81 Zellen des Sudokus definieren 
cell(1..9,1..9).

%Jede Zelle bekommt genau eine Zahl 
1 { sudoku(X, Y, N) : number(N) } 1 :- cell(X, Y). 

%Vorgegebene Zahlen dürfen nicht verändert werden 
:- initial(X, Y, N), not sudoku(X, Y, N). 

%Keine Zahl darf zweimal in derselben Zeile vorkommen 
:- sudoku(X, Y, N), sudoku(X, Y2, N), Y != Y2. 

%Keine Zahl darf zweimal in derselben Spalte vorkommen 
:- sudoku(X, Y, N), sudoku (X2, Y, N), X != X2. 

% Berechnung des 3x3-Untergitters für jedes Feld
block(X,Y,B) :- cell(X,Y), subgrid_size(S),B = ((X-1)/S)*S + ((Y-1)/S).

% Keine Zahl darf zweimal im selben Untergitter vorkommen
:- sudoku(X1,Y1,N), block(X1,Y1,B), sudoku(X2,Y2,N), block(X2,Y2,B), X1*10+Y1 < X2*10+Y2.

#show sudku/3.
