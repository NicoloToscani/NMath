function q = CavalieriSimpsonComp(f,fd4,a,b,n)
% Input: 
%        f      funzione da appossimare.
%        fd4    derivata quarta della funzione da approssimare.
%        a      estremo inferiore intervallo.
%        b      estremo superiore intervallo.
%        n      numero di suddivisoni intervallo [a,b].
% Output: 
%        q      valore approssimato dell'integrale della funzione f.
%        e      errore di quadratura.
% Appartiene alla amiglia delle formule di quadratura di Newton-Cotes
% chiuse composte.
% L'idea è quella di dividere l'intervallo di integrazione [a,b] in n
% sottointervalli, chiamare la formula di quadratura su ogni
% sottointervallo e andare a sommare i risulati ottenuti.
% Calcola un'approssimazione dell'integrale della funzione f
% sull'intervallo [a,b] utilizzando la formula di Cavalieri-Simpson.
% Viene sostituita f con il suo polinomio interpolatore di grado 2 
% costruito sui nodi x0 ,x1 e x2 (n+1 nodi).
% Su questo intervallo viene integrato al posto di f il suo polinomio
% interpolatore.

% Creo n+1 punti equispazioati all'interno dell'intervallo di integrazione,
% ottengo cosi n sottointervalli.
x = linspace(a,b,n+1);

% Inizializzo valore integrale intervallo [a,b]
q = 0;  

% Calcolo integrale sul polinomio interpolatore.
% Questo sarà un approssimazione dell'integrale della funzione f data.
% Ad ogni iterazione chiamo il calcolo dell'approssimazione dell'integrale
% su ogni sottointervallo.
for i=1:n
    q = q + CavalieriSimpson(f,x(i),x(i+1));
    e = e + abs(CavalieriSimpsonErrore(fd4,x(i),x(i+1)));
end
