function [n,x] = Newton(f,fd,x_0,toll,n_max)
% Input: 
%        f      macro contenente la funzione in x.
%        fd     derivata della funzione f
%        x_0    punto iniziale che innesca la successione
%        toll   tolleranza sull'intervallo.
%        n_max  massimo numero di iterazioni.
% Output: 
%        x      approssimazione dello zero. 
%        n      numero di iterazioni effetuate per ottenere la soluzione
% Cerca lo zero di una funzione continua f nell'intervallo [a,b] partendo
% da un punto iniziale x_0 usando il metodo di Newton o Tangenti.
% Il metodo consiste nel costruire una successione di punti.
% Assegnato un punto iniziale da qui iniziare la successione, il successivo
% punto x è l'intersezione della tangente della funzione in quel punto con
% l'asse delle x.
% Il coefficente angolare della retta è:
% q = derivata prima della funzione f . 
% Il punto successivo x viene calcolato come segue:
% x(n+1) = x_n - ((f(x_n)/q))
% Deve valere la condizione che la derivata prima della funzione sia
% diversa da zero perchè altrimenti avremmo una pendenza nulla (retta) e
% non avremmo lo zero della funzione.
% Come dichiarare la funzione e la sua derivata nell'intervallo [2,3]
% f = @(x) (x^3) - 3*x -3;
% fd = @(x) 3* (x^2) -3;
% Radice nel punto x = 2.1038

% Inizializzo numero iterazioni
  n = 0;
 
% Calcolo valore funzione nei 2 punti iniziali dati
    f_xn = f(x_0);    % Valore funzione nel punto iniziale x0
    x_n = x_0;        % Il primo punto da qui innesco la successione

% Arrestiamo il metodo con la differenza tra 2 iterate successive , valore
% della funzione sull'ultima x calcolata
while( n < n_max && (abs(f(x_n))) > toll )

    if(fd(x_n) == 0)
        warning('Derivata nulla, non è possibile applicare il metodo');
    end
 % Coefficente angolare equivale alla derivata prima della funzione
    q = fd(x_n);
    
 % Calcolo punto successivo x_n+1
    x = x_n - (f_xn / q);
    
 % Aggiorno valori per la nuova iterazione
    x_n = x;
    f_xn = f(x_n);
    
 % Aggiorno i numero di iterate
    n = n+1;
    
   
end
return