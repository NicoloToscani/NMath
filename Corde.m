function [n,x] = Corde(f,a,b,x_0,toll,n_max)
% Input: 
%        f      macro contenente la funzione in x. 
%        a      estremo sinistro dell'intervallo.
%        b      estremo destro dell'intervallo.
%        x_0    punto iniziale di partenza
%        toll   tolleranza sull'intervallo.
%        n_max  massimo numero di iterazioni.
% Output: 
%        x      approssimazione dello zero. 
%        n      numero di iterazioni effetuate per ottenere la soluzione
% Cerca lo zero di una funzione continua f nell'intervallo [a,b] partendo
% da un punto iniziale x_0 usando il metodo delle corde.
% Innesco la successione, andando a costruire una retta che passa per gli
% estremi dell'intervallo in cui cerchiamo le radici, dal coefficente
% angolare 'q'.
% x_n+1 = x_n - f(x_n) * ((f(b) - f(a))/(b - a)).
% Raccogliendo e semplificando:
% x_n+1 = x_n - (f(x_n)/q).

 % Inizializzo numero iterazioni
 n = 0;

% Calcolo valore funzione agli estremi dell'intervallo [a,b]
    f_a = f(a);
    f_b = f(b);
% Calcolo coefficente angolare retta passante per i punti [a,b]
% Le corde sono tutte parallele, quindi il coefficente angolare è sempre lo
% stesso.
    q = ((f_b - f_a) / (b - a));

while( n < n_max && ((b - a)/2^n) > toll )

    x = x_0 - (f(x_0)/ q);

    x_0 = x;
    
    n = n+1;
    
    
end

