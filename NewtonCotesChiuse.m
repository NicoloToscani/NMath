function q = NewtonCotesChiuse(f,a,b,n)
% Input: 
%        f      funzione da appossimare.  
%        a      estremo inferiore intervallo.
%        b      estremo superiore intervallo. 
%        n      grado di precisione.       
% Output: 
%        q      valore approssimato dell'integrale della funzione f.
% Calcola l'approssimazione dell'integrale definito della funzione f
% integrabile sull'intervallo [a,b].
% Viene utilizzata la formula di quadratura adatta , al variare del grado
% di precisione impostato.
% n = 1 Formula dei trapezi.
% n = 2 Formula di Cavalieri-Simpson.
% n = 3 Formula dei tre ottavi.

% Ampiezza intervallo punti utilizzati, dipende dal tipo di precisione
% adottata.
    h = (b-a)/n;
  
% Intervallo su cui costruire la quadratura.
% Ho n+1 punti su cui costruisco il polinomio interpolatore, che poi userò
% per integrare la funzione.
% Creo intervallo di n+1 punti equispaziati.
    x=linspace(a,b,n+1)';

% Scelgo la giusta formula di quadratura in base al grado di precisione
% alpha = costante di Newton-Cotes , non dipende dai punti ma dal tipo di
% formula utilizzata
    switch n
        case 1 % Formula dei Trapezi
            alpha = [1/2 1/2];
            q = h * (alpha(1)* f(a) + alpha(2) * f(b));
            
        case 2 % Formula di Cavalieri-Simpson
            alpha = [1/3 4/3 1/3];
            q = (h/3) * (f(a) + 4 * f((a+b)/2)+ f(b));
            
        case 3 % Formula dei Tre Ottavi
            alpha = [3/8 9/8 9/8 3/8];
    end
    
    









return