function [q,e] = TrapeziComp(f,fd2,a,b,n)
% Input: 
%        f      funzione da appossimare.
%        fd2    derivata seconda funzione da appossimare.
%        a      estremo inferiore intervallo.
%        b      estremo superiore intervallo.
%        n      numero di suddivisoni intervallo [a,b].
% Output: 
%        q      valore approssimato dell'integrale della funzione f.
%        e      errore di quadratura.
% Appartiene alla famiglia delle formule di quadratura di Newton-Cotes
% chiuse composte.
% L'idea è quella di dividere l'intervallo di integrazione [a,b] in n
% sottointervalli, chiamare la formula di quadratura su ogni
% sottointervallo e andare a sommare i risulati ottenuti.
% Calcola un'approssimazione dell'integrale della funzione f
% sull'intervallo [a,b] utilizzando la formula del trapezio.
% Viene sostituita f con il suo polinomio interpolatore di grado 1 
% costruito sui nodi x0 e x1 (n+1 nodi).
% Su questo intervallo viene integrato al posto di f il suo polinomio
% interpolatore.

% Creo n+1 punti equispazioati all'interno dell'intervallo di integrazione,
% ottengo cosi n sottointervalli.
x = linspace(a,b,n+1);

% Inizializzo valore integrale intervallo [a,b]
q = 0;
e = 0;

% Calcolo integrale sul polinomio interpolatore.
% Questo sarà un approssimazione dell'integrale della funzione f data.
% Ad ogni iterazione chiamo il calcolo dell'approssimazione dell'integrale
% su ogni sottointervallo.
for i=1:n
    q  = q + Trapezi(f,x(i),x(i+1));
    e = e + abs(TrapeziErrore(fd2,x(i),x(i+1)));
end
