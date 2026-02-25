% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

%available values
% AKA domain

%no sqrt so working upwards
#const subgridsize = 2.

%if subgrid is 2x2, whole thing is 4x4
%if subgrid is 3x3, whole thing is 9x9
#const domain = subgridsize ** 2.

row(1..domain).
col(1..domain).
val(1..domain).


%for every cell, 1 value
{ sudoku(R,C,V) : V = 1..domain} = 1 :- R = 1..domain, C = 1..domain.

%no repeated value in a row
:- sudoku(R, C1, V), sudoku(R, C2, V), C1 != C2.

%no repeated value in column
:- sudoku(R1, C, V), sudoku(R2, C, V), R1 != R2.

%subgrid divided by subgrid size
subgrid(R, C, SR, SC) :-  row(R), col(C), SR = (R-1) / subgridsize, SC = (C-1) / subgridsize.

%no repeated values in subgrid
% for any given instance of value, if (x,y) not match, cannot both exist
:- sudoku(R1, C1, V), sudoku(R2, C2, V), subgrid(R1, C1, SR, SC), subgrid(R2, C2, SR, SC), R1 != R2, C1 != C2.

#show sudoku/3.
