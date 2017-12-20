function [y b dy d ] = Horner(a,n,x)
% Input: 
%        a      vettore dei coefficenti del polinomio. 
%        n      grado del polinomio.
%        x      punto in cui si vuole valutare il polinomio.
%        
% Output: 
%        y      valore del polinomio nel punto x. (immagine polinomio). 
%        b      valori coefficenti dipendenti da x  
%        dy     valori coefficenti della derivata prima dipendenti da x
%        d      derivata prima del polinomio nel punto x.
% p(x) = a_0 * x^n + a_1 * x^n-1 + a_2 * x^n-2 + ... + a_n
% Valuta il polinomio di grado n con i coefficenti a nel punto x.
% L'algoritmo permette di calcolare il valore di x con n moltiplicazioni e
% n addizzioni.
% Contrariamente al metodo tradizionale per la valutazione di un polinomio
% che impiegava (n*(n+1))/2 moltiplicazioni, il metodo di Horner ci
% permette di ridurre la complessità di valutazione di un polinomio.
% b_n mi permette di passare dai coefficenti a b(x) 
% pi(X) = b_n
% esempio iterazione:
% b1 = a1
% b2 = b1 * x + a2;
% b3 = b2 * x + a3;
% Quindi mi permette di arrivare al valore del polinomio valutato in un
% punto x svolgendo ricorsivamente delle somme e prodotti utilizzando i
% termini calcolati all'iterazione precedente.
% Il valore del polinomio valutato in x è contenito nell'ultimo termine
% calcolato nel vettore b.

% Primo elemento
  b(1) = a(1);
  
  % ciclo dal secondo coefficente fino all'ultimo
  for i = 2: n+1
      b(i) = b(i-1) * x + a(i);
  end
  
  % Valore del polinomio valutato in x
  y = b(n+1);
  
  
  % L'algoritmo di Horner permette di scrivere la derivata prima del
  % polinomio, senza bisogno di calcolarla.
  % Il valore della derivata prima del polinomio calcolata nel punto x è
  % contenuto nell'ultimo termine calcolato ricorsivamente nel vettore dy.
  
  
  % Numero di argomenti richiesti in output, non calcolo derivata prima se
  % non richiesto come parametro di uscita.
    if nargout > 2
        
        % calcolo derivata del polinomio nel punto x
        dy(1) = b(1);
        
        for i= 2: n
            dy(i) = dy(i-1) * x + b(i);
        end
        d = dy(n);
    end
  
  
return



