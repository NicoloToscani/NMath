function [L,U] = FattorizzazioneLU(A)
% Input: 
%        A      matrice quadrata con tutti i suoi minori principali non
%               singolari.
% Output: 
%        L      matrice quadrata triangolare inferiore.
%        U      matrice quadrata triangolare superiore.
% A = LU.
% Viene utilizzato l'algoritmo di Doolitle.
% Viene determinata la prima riga di U moltiplicando la prima riga di L per
% tutte le colenne di U.
% Viene determinata la prima colonna di L moltiplocando tutte le righe di L
% (dalla seconda) per la prima colonna di U.
% Al passo successivo , viene determinata la seconda riga di U
% moltiplicando la seconda riga di L per tutte le colonne di U (dalla
% seconda).
% Viene determinata la seconda colonna di L , moltiplicando tutte le riga
% di L (dalla seconda ) per la seconda colonna di U.
% Una matrice quadrata A, con tutti i suoi minori principali non singolari,
% non singolari, viene trasformata in 2 matrici , L triangolare inferiore,
% U triangolare superiore.
% I termini noti non vengono elaborati, in quanto le matrici L e U non
% dipendono dai termini noti ma solo dalla matrice A.
% Questo porta ad un notevole vantaggio, ovvero quello di utilizzare la
% stessa fattorizzazione della matrice A per la risoluzione del sistema
% lineare, variando i termini noti.
% In questa verisone non viene applicata nessuna permutazione di A , ovvero
% nessuna riga o colonna viene scambiata, in quanto si pressuppone che
% tutti i minori principlai della matrice A siano non singolari.
% PA = LU dove nel nostro caso P = I.

% Ottengo la dimensione n della matrice.
n = max(size(A));

% Inizializzo matrice L sapendo che sulla diagonale principale ha sempr e i
% termini a 1.
L = diag(ones(1,n));

% Inizializzo matrice U
U = zeros(n,n);


for k = 1 : n              % k = indice del passo k-esimo
    for j = k : n          % j = costruisco le righe di U
        temp_righe = 0;
        for p = 1 : k-1
            temp_righe = temp_righe + L(k,p) * U(p,j);  % Righe U
        end
        U(k,j) = A(k,j) - temp_righe;
    end
    
    for i = k : n           % i = costruisco le colonne di U
        temp_colonne = 0;
        for p = 1 : k-1
            temp_colonne = temp_colonne + L(i,p) * U(p,k); % Righe L
        end
        L(i,k) = (A(i,k) - temp_colonne) / U(k,k);
    end
    
end
return
