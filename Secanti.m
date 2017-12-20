function [n,x] = Secanti(f,x_0,x_m1,toll,n_max)
% Input: 
%        f      macro contenente la funzione in x.
%        x_0    punto iniziale di partenza
%        x_m1    punto iniziale - 1
%        toll   tolleranza sull'intervallo.
%        n_max  massimo numero di iterazioni.
% Output: 
%        x      approssimazione dello zero. 
%        n      numero di iterazioni effetuate per ottenere la soluzione
% Cerca lo zero di una funzione continua f nell'intervallo [a,b] partendo
% da un punto iniziale x_0 e x_m usando il metodo delle secanti.
% Il metodo consiste nel costruire una successione di punti.
% Assegnando due punti iniziali x0 , x1 il punto successivo x_n+1 è lo zero
% della retta che passa per questi 2 punti di coefficente angolare q.
% Il coefficente angolare della retta è:
% q_n = (f(x_n) - f(x_n-1)) / x_n - x_n-1 . Viene calcolato ad ogni
% iterazione.

% Inizializzo numero iterazioni
 n = 0;

 
 
% Calcolo valore funzione nei 2 punti iniziali dati
    f_xm1 = f(x_m1);  % Valore nel punto x_m-1;
    f_x0 = f(x_0);    % Valore nel punto x_0;


while( n < n_max && (abs(x_0 - x_m1)/2^n) > toll )

 % Calcolo coefficente angolare retta passante per i punti [x_n, x_n1]
    q = ((f_x0 - f_xm1) / (x_0 - x_m1));
    
 % Calcolo punto successivo
    x = x_0 - (f(x_0)/ q);

 % Calcolo funzione nel nuovo punto per poi andare a calcolare la retta tra
 % il nuovo punto x e il precendente x_0.
 
 f_xs = f(x);
 
 % Aggiorno i valori delle x e delle f(x) .
 % x_m1 deve prendere x_0 perchè x_0 diventa il punto precedente
 
 x_m1 = x_0;
 f_xm1 = f_x0; 
 x_0 = x;      % x_0 che è il punto n+1 prende x
 f_x0 = f_xs;  % valore della funzione nel nuovo punto 
    
 n = n+1;
    
   
end
return