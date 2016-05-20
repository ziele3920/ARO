function [calka] = Calka(Rozklad,Obraz,srodowisko,step)
    y = 0;
    for i=1:2
        if Rozklad == 2
            y(i, : ) = srodowisko(i,1) * unifpdf(Obraz, srodowisko(i,2), srodowisko(i,3));
        else
            y(i, : ) = srodowisko(i,1) * normpdf(Obraz, srodowisko(i,2), srodowisko(i,3));
        end
    end
    calka = sum(min(y(1, : ), y(2, : )))*step;
end