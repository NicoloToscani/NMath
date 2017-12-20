function q = PuntoMedio(f,a,b)
% Input: 
%        f      funzione da appossimare.  
%        a      estremo inferiore intervallo.
%        b      estremo superiore intervallo.      
% Output: 
%        q      valore approssimato dell'integrale della funzione f.
% Appartiene alla amiglia delle formule di quadratura di Newton-Cotes
% aperte.
% Calcola un'approssimazione dell'integrale della funzione f
% sull'intervallo [a,b] utilizzando la formula del Punto Medio
% (o formula del Rettangolo).
% Viene sostituita f con la funzione costante pari al valore assunto dalla
% funzione nel punto medio dell'intervallo.
% Su questo intervallo viene integrato al posto di f.(Rettangolo)
% Costante di integrazione (alpha(0) = b-a)
alpha = b-a;

% Ampiezza intervallo punti utilizzati
h = (b-a)/2;

% x contiene 1 punto, punto medio dell'intervallo [a,b];
x = a + h;

% Valuto la funzione nel punto medio.
% y contiene f(h).
y = f(x);

% Calcolo integrale sul polinomio interpolatore.
% Questo sarà un approssimazione dell'integrale della funzione f data.
q = alpha * y;