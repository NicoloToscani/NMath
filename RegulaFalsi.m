function [n,x] = RegulaFalsi(f,x_0,x_m1,toll,n_max)
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
% da un punto iniziale x_0 e x_m-1 usando il metodo della Regula Falsi.
% Il metodo consiste nel costruire una successione di punti.
% Per prima cosa devo verificare che la funzione nei 2 punti di partenza
% abbiamo segno opposto, in modo da affermare che la funzione ha uno zero
% all'interno di questo intervallo di partenza.
% Il punto successivo viene calcolato come zero della retta che passa per
% quei 2 punti con coefficente angolare q.
% Il punto cade all'interno degli estremi.
% Come punto successivo, andiamo a scegliere l'ultimo punto calcolato
% insieme al massimo dei punti calcolati tale che valga la propietà di
% convergenza ovvero:
% f(xn) * f(xi) < 0 (teorema degli zeri) 
% Il coefficente angolare della retta è:
% q_n = (f(x_n) - f(x_i)) / x_n - x_i . Viene calcolato ad ogni
% iterazione.

% Inizializzo numero iterazioni
 n = 0;

 
 
% Calcolo valore funzione nei 2 punti iniziali dati
    f_xm1 = f(x_m1);  % Valore nel punto x_m-1;
    f_x0 = f(x_0);    % Valore nel punto x_0;
    
% Verifico la condizione di convergenza sui punti iniziali
if (f_xm1 * f_x0) < 0
   warning('Non è possibile applicare il metodo')
   return
end
 

% Criterio di arresto :
% - numero di iterazioni massime
% - abs(f(x_n)) < toll se il valore si avvicina ababstanza allo zero

% Inizio l'incremento della successione
xk = x_0;
f_xk = f_x0;

while( n < n_max && abs(f_xk) > toll )

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