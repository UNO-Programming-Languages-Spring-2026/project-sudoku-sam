% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

%subgrid is sqrt of full range
#const subgridsize = 2.
#const domain = subgridsize ** 2.

val(1..domain).

%for every cell, get 1 value
{ sudoku(R,C,V) : V = 1..domain } = 1 :- R = 1..domain, C = 1..domain.

%initials
sudoku(R,C,V) :- initial(R,C,V).

%no repeat rows or columns
:- sudoku(R, C1, V), sudoku(R, C2, V), C1 != C2.
:- sudoku(R1, C, V), sudoku(R2, C, V), R1 != R2.

#show sudoku/3.
