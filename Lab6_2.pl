/*estado([X,X,X,X,X,X,X])*/

inicial(estado(n,n,n,h,b,b,b)).


/*Aunque se que esta no es la unica solucion si no la que esta debajo si descomentas esta linea puedes ver que si que realiza pasos y con ella comentada no realiza ni uno solo, ni cuando las soluciones estan a un paso.*/
/*objetivo(estado([b,b,b,h,n,n,n])).*/


objetivo(estado(A,B,C,_,D,E,F)):- A\=n, B\=n, C\=n, D\=b, E\=b, F\=b.

estado([A,B,C,D,E,F,G]):-estado(A,B,C,D,E,F,G).

salta0Dcha([h,X|R], [X,h|R]).
salta0Dcha([X,Y|R1], [X|R2]):- salta0Dcha([Y|R1], [R2]).
salta1Dcha([h,X,Y|R], [Y,X,h|R]).
salta1Dcha([X,Y,Z|R1], [X|R2]):- salta1Dcha([Y,Z|R1], [R2]).
salta2Dcha([h,X,Y,Z|R], [Z,X,Y,h|R]).
salta2Dcha([X,Y,Z,U|R1], [X|R2]):- salta2Dcha([Y,Z,U|R1], [R2]).

salta0Izq([X,h|R], [h,X|R]).
salta0Izq([X,Y|R1], [X|R2]):- salta0Izq([Y|R1], [R2]).
salta1Izq([X,Y,h|R], [h,Y,X|R]).
salta1Izq([X,Y,Z|R1], [X|R2]):- salta1Izq([Y,Z|R1], [R2]).
salta2Izq([X,Y,Z,h|R], [h,Y,Z,X|R]).
salta2Izq([X,Y,Z,U|R1], [X|R2]):- salta2Izq([Y,Z,U|R1], [R2]).

movimiento(estado(A,B,C,D,E,F,G), estado(A2,B2,C2,D2,E2,F2,G2), salta0Dcha):- salta0Dcha([A,B,C,D,E,F,G], [A2,B2,C2,D2,E2,F2,G2]).
movimiento(estado(A,B,C,D,E,F,G), estado(A2,B2,C2,D2,E2,F2,G2), salta1Dcha):- salta1Dcha([A,B,C,D,E,F,G], [A2,B2,C2,D2,E2,F2,G2]).
movimiento(estado(A,B,C,D,E,F,G), estado(A2,B2,C2,D2,E2,F2,G2), salta2Dcha):- salta2Dcha([A,B,C,D,E,F,G], [A2,B2,C2,D2,E2,F2,G2]).
movimiento(estado(A,B,C,D,E,F,G), estado(A2,B2,C2,D2,E2,F2,G2), salta0Izq):- salta0Izq([A,B,C,D,E,F,G], [A2,B2,C2,D2,E2,F2,G2]).
movimiento(estado(A,B,C,D,E,F,G), estado(A2,B2,C2,D2,E2,F2,G2), salta1Izq):- salta1Izq([A,B,C,D,E,F,G], [A2,B2,C2,D2,E2,F2,G2]).
movimiento(estado(A,B,C,D,E,F,G), estado(A2,B2,C2,D2,E2,F2,G2), salta2Izq):- salta2Izq([A,B,C,D,E,F,G], [A2,B2,C2,D2,E2,F2,G2]).

puede(Estado,_,[]) :-objetivo(Estado).
puede(Estado, Visitados, [Operador | Operadores]) :-movimiento(Estado, EstadoSig, Operador),\+ member(EstadoSig, Visitados), puede(EstadoSig, [EstadoSig| Visitados], Operadores).
puede(Estado, Camino):- puede(Estado,[Estado], Camino).
