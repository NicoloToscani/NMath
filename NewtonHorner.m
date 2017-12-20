function [ni , x] = NewtonHorner(a,n,x_0,toll,n_max)
% Input: 
%        a      vettore dei coefficenti del polinomio. 
%        n      grado del polinomio.
%        x_0    punto iniziale che innesca la successione.
%        toll   tolleranza sull'intervallo.
%        n_max  massimo numero di iterazioni.        
% Output: 
%        x      approssimazione dello zero. 
%        ni      numero di iterazioni effetuate per ottenere la soluzione
% Cerca lo zero di una funzione continua f nell'intervallo [a,b] partendo
% da un punto iniziale x_0 usando il metodo di Newton (o Tangenti).
% Utilizzato quando la funzione f(x) è il polinomio. 
% Il calcolo del valore della funzione e della derivata prima nel punto x
% viene svolto utilizzando l'algoritmo di Horner, velocizzando la
% computazione.
% Il metodo consiste nel costruire una successione di punti.
% Assegnato un punto iniziale da qui iniziare la successione, il successivo
% punto x è l'intersezione della tangente della funzione in quel punto con
% l'asse delle x.

% Inizializzo numero iterazioni
  ni = 0;
 
% Calcolo valore funzione nel punto iniziale x_0 dato
  
[f_xn , ~, ~, d ] = Horner(a,n,x_0);  % Valore funzione nel punto iniziale x0
 x_n = x_0;   % Il primo punto da qui innesco la successione
 
 
% Arrestiamo il metodo con la differenza tra 2 iterate successive , valore
% della funzione sull'ultima x calcolata
while( ni < n_max && (abs(f_xn)) > toll )

    if(d == 0)
        warning('Derivata nulla, non è possibile applicare il metodo');
    end
 % Coefficente angolare equivale alla derivata prima della funzione
    q = d;
    
 % Calcolo punto successivo x_n+1
    x = x_n - (f_xn / q);
    
 % Aggiorno valori per la nuova iterazione
    x_n = x;
    [f_xn , ~, ~, d ] = Horner(a,n,x_n);
    
 % Aggiorno i numero di iterate
    ni = n+1;
    
   
end












