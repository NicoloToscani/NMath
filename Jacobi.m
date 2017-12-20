function [x,e,i,flag] = Jacobi(A,b,x0,toll,n_max)
% Input: 
%        A      matrice quadrata.
%        b      termini noti (vettore colonna).
%        x0     vettore iniziale.
%        toll   tollerenza su test arresto (su iterate).
%        n_max  massimo numero di iterazione.
% Output: 
%        x      vettore soluzione.
%        e      vettori errori relativi.
%        i      numero di iterazioni effettuate.
%        flag   flag = 1 converge, altrimenti flag = 0.
% Nei metodi iterativi vogliamo scomporre la matrice A nella differenza di
% due matrice A = M-N con M non singolare.
% Decomponiamo la matrice A , che ha elementi non nulli sulla diagonale.
% A = D+E+F dove:
%     D : matrice diagonale i cui elementi coincidono con gli elementi
%         della diagonale di A
%     E : matrice triangolare inferiore a diagonale nulla i cui elementi
%         coincidono con gli elementi della parte triangolare inferiore della
%         matrice A a partire dalla codiagonale inferiore.
%     F : matrice triangolare superiore a diagonale nulla i cui elementi
%         coincidono con gli elementi della parte triangolare superiore della
%         matrice A a partire dalla codiagonale superiore.
% Nel metodo di Jacobi abbiamo M = D e N = -(E+F).
% Svolgo il procedimento con il metodo matriciale.
% x_k+1 = Px_k + q.
% P = D^-1 * (E+F) e q = D^-1 * b.

% Costruisco la matrice D
D = diag(diag(A));

% Costruisco matrice E
E = tril(A,-1);

% Costruisco matrice F
F = triu(A,1);

% Inversa di D. Mi serve per calcolare la matrice di iterazione.
inv_D = inv(D);

% Matrice di iterazione e q
P = - inv_D *(E+F);
q = inv_D*b;

% Analizzo il raggio spettrale della matrice di iterazione per valutare la
% convergenza del procedimento.
% Se il raggio spettrale è molto vicino a 1 la convergenza è molto lenta e
% tra due iterate successive , sarà soddisfatta la condizione di tolleranza
% ma nessuno mi garantisce che la soluzione trovata sia quella giusta,
% siamo abbastanza vicino.
% Se il raggio spettrale è piccolo la convergenza è molto rapida e quindi
% la condizione di tolleranza è un buon metodo di arresto che mi garantisce
% che la soluzione trovata sia quella giusta.
% ||autovalori(p)||inf < 1 raggio spettrale, il massimo degli autovalori
% della matrice di iterazione.
rg = norm(eig(P),inf);

% Se tutto converge non viene modificato il valore di flag.
flag = 1;

% Valuto la convergenza, per avere una prima idea dell'applicazione.
if ( rg < 1 )
        disp('Convergente');
    else
        disp('Non convergente');
        flag = 0;
end

% Inizializzo numero di iterazioni
i = 1;

% Inizializzo vettore errore e = 0 0 0 0 0 0 .... 0
e = zeros(1, n_max);

% Variabile per fare il test tra iterate successive
test = 1;

% Setto il vettore al passo precedente con il vettore di partenza dato
x_hold = x0;

while i < n_max && test > toll

    % Vettore soluzione all'iterazione i
    x = P * x_hold + q;
    
    % Errore all'iterazione i.
    e(i) = norm(x - x_hold); 
    
    % Utilizzo l'errore a quel passo per valutare la tolleranza al passo
    % i+1.
    test = e(i);
    
    % rendo il vettore soluzione appena calcola come valore precedente.
    x_hold = x;
    
    % Incremento numero di iterate.
    i = i+1;

end

% Vettore di tutti gli errori commessi.
e = e(1:i-1);

if ( i > n_max)
 disp('Il metodo non converge al numero di iterazioni fissato')
 flag = 0;
end


return