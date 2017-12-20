function [B] = FattorizzazioneCholesky(A)
% Input: 
%        A      matrice quadrata simmettrica e definita positiva.
% Output: 
%        B      matrice quadrata triangolare inferiore.
% A = LL'
% La fattorizzazione di Cholesky permette la fattorizzazione della matrice
% A utilizzando solo una sola matrice triangolare inferiore L, al contrario
% della fattorizzazione LU che calcolava una matrice L e U.
% Per poter utilizzare questo tipo di fattorizzazione, la matrice di
% partenza A deve essere simmettrica e definita positiva.
% Matrice simmettrica = A = A' ovvera A è uguale alla sua trasposta.
% Matrice definita positiva = xAx' > 0.
% Per verificare che una matrice è definita positiva, i suoi autovalori ,
% ossia le radici del polinomio caratteristico devono essere positivi.
% Se A è una matrice simmetrica e definita positiva allora esiste una
% matrice B non singolare che fattorizza A. A = BB'.


% Ottengo la dimensione n della matrice.
n = max(size(A));

% Inizializzo matrice L
B = zeros(n,n);

% Idea dell'algoritmo: ad ogni passo calcolo l'elemento diagonale e poi i
% restanti sulla colonna.


for i = 1 : n
    % Calcolo gli elementi diagonali di B
    temp_diagonale = 0;
    for k = 1 : i-1
        temp_diagonale = temp_diagonale + B(i,k)^2;
    end
    B(i,i) = sqrt(A(i,i) - temp_diagonale);
    
    % Costruisco elementi sulla colonna.
    for j = i+1 : n
        temp_colonna = 0;
        for k = 1 : i-1
            temp_colonna = temp_colonna + B(i,k) * B(j,k);
        end
        B(j,i) = (A(i,j) - temp_colonna)/ B(i,i);
    end
end

return
