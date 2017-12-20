function [n,x,fx] = Bisezione(f,a,b,toll,n_max)
% Input: 
%        f      macro contenente la funzione in x. 
%        a      estremo sinistro dell'intervallo.
%        b      estremo destro dell'intervallo.
%        toll   tolleranza sull'intervallo.
%        n_max  massimo numero di iterazioni.
% Output: 
%        x      approssimazione dello zero. 
%        fx     valore della funzione in x.
%        n      numero di iterazioni.

% Verifico se la funzione ha una radice nell'intervallo [a,b].
% Se falso , allora non posso applicare il metodo dicotomico.
% Questa verifica viene fatta applicando il teorema degli zeri.
% Se la valutazione dell'esspressione agli estremi assume segno opposto,
% esiste un punto che appartiene all'intervallo dove f(punto) = 0.

 if f(a) * f(b) > 0
        error('Non posso applicare il metodo dicotomico \n');
 end

 % Inizializzo numero iterazioni
 n = 0;

% Inizio a dimezzare l'intervallo provando che il puno medio non sia la
% radice cercata.
% Se il test fallisce verifico in che parte si trova la radice, arrestandomi
% quando ho raggiunto il numero massimo di iterazioni ammesse oppure
% quando non ho raggiunto la tolleranza ammessa dal problema.
% Utilizziamo il criterio d'arresto sull'ampiezza dell'intervallo
% considerato alla i-esima iterazione.
% |b(i) - a(i)| <= tolleranza -> (b-a)/(2^i) <= tolleranza 

while( ((b - a)/2) > toll && n < n_max )
    
    % Calcolo punto medio tra i due estremi dell'intervallo [a,b].
    x_0 = (a + b)/2;
    
    x = x_0;
    fx = f(x);
    
    % Se f(x_0) = 0 allora la radice è in x_0 , posso arrestare il
    % procedimento.
    if f(x_0) == 0
         x = x_0;
        return;
    end
    
    
    
    % Verifico presenza radice nell'intervallo di sinistra. 
    % Se il test è positivo aggiorno gli estremi dell'intervallo in esame
    % Nuovo intervallo è: [a, x_0]
    if (f(x_0) * f(a) < 0)
        b = x_0;
    end
    
    % Verifico presenza radice nell'intervallo di destra.
    % Se il test è positivo aggiorno gli estremi dell'intervallo in esame
    % Nuovo intervallo è: [x_0, b]
    if (f(x_0) * f(b) < 0)
        a = x_0;
    end
    
    % Incremento numero di iterazioni
    n = n +1;
    
    
end

return;