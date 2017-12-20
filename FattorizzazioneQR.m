function A = FattorizzazioneQR(A)
% Input: 
%        A      matrice quadrata.
% Output: 
%        Q      matrice ortogonale (Q'Q = QQ' = I).
%        R      matrice triangolare superiore.
% A = QR.
% A = QR. Ogni matrice quadrata ammette una fattorizzazione QR ma questa
% non è unica.
% Q' = Q^-1. Quindi Q*Q' = I.
% Per calcolare la fattorizzazione QR di una matrice A si utilizzano le
% matrici di Householder che permettono di annulare degli elementi in un
% vettore.

% Ottengo la dimensione n della matrice.
n = max(size(A));

% I = matrice identita n*n.
I = diag(ones(1,n));

% k è un valore che mi server per definire ad ogni iterazione il vettore,
% che ad ogni passo è più piccolo di uno.
k = n;

% Iterazione dalla prima riga fino alla n-1.

for i = 1 : n-1
    % Calcolo il vettore e dell'iterazione in corso, ponendo poi il
    % corrispettivo elemento dell'iterazione a 1.
    % e = base elementare , n righe 1 colonna.
    e = zeros(k,1);
    e(1) = 1;
    
    % Per ogni iterazione devo assegnare il vettore x corrispondente alla
    % colonna della matrice in base all'iterazione corrispondente.
    % Ciclo 1 x = colonna 1.
    % Ciclo 2 x = colonna 2.
    % Ciclo 3 x = colonna 3.
    x = A(i:n,i);
    
    % Calcolo s . s = +-||x||2.
    % E' consigliabile prendere s in modo che la somma x + s sia di segno
    % concorde in modo da evitare che la somma sia 0 (cancellazione
    % numerica).
    % Nel caso del primo ciclo , s va preso dello stesso segno di a11.
    % In questo caso , non teniamo conto del segno e lo scegliamo positivo
    % ad ogni iretazione.
    s = norm(x,2);
    
    % Calcolo il vettore u . u è un vettore colonna.
    u = x + s *e;
    
    % Se sono ad un passo diverso dal primo aggiuno ad u tanti zeri
    % sopra quanti gliene servono per arrivare ad n.
    while max(size(u)) ~= n
            u = [0; u];
    end
    
    % Costruisco il riflettore elementare di Householder.
    U = I - (2*u*u')/(norm(u,2)^2);
    
    % Applico il riflettore ad A per eliminare a ogni iterazione gli
    % elementi della colonna in esame.
    A = U*A;
    
    % Diminuisco k per ricalcolare e al passo successivo decrementato di 1.
    k = k-1;
    
end


return
