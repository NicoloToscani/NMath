function [C,d] = Gauss(A,b)
% Input: 
%        A      matrice quadrata non singolare(det != 0). 
%        b      vettore dei termini noti.
% Output: 
%        C      matrice quadrata triangolare superiore. 
%        d      vettore dei termini noti elaborati.

% Utilizzo l'algortimo di Gauss per la risoluzione del sistema lineare
% associato.
% Una matrice quadrata A non singolare viene processata per essere ridotta
% in forma triangolare superiore, in modo da facilitare la soluzione del
% sistema.
% I termini noti vengono processati in base alle moltiplicazioni da
% effettuare.
% Questo procedimento utilizza il metodo scalare, al contrario del metodo
% matriciale che utilizza le matrici elementari, permettendo di svolgere la
% risoluzione del sistema utilizzando solamente moltiplicazioni tra
% matrici.

% Ottengo la dimensione n della matrice.
n = max(size(A));

% Algoritmo di Gauss.
for k = 1 : n-1                   % k = indice del passo. 
    for i = k+1 : n               % i = indice riga.
        m = - A(i,k)/A(k,k);      % es: -(a21)/a(11). 
        for j = k : n             % j = indice colonna.
            A(i,j) = A(k,j)*m +A(i,j);
        end
        b(i) = b(k)*m + b(i);     % Stessa operazione per i termini noti
     end
end

% La matrice A è diventata triangolare superiore.
C = A;
d = b;

return
