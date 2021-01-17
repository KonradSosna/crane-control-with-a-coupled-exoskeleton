% nazwa danych - bez indeksow
dane = 'cewka';
start = 1;
koniec = 4;
ts = 1e-4;
for i=start:koniec %% INKREMETNOWAC BEZ INDEKSOW - dac np. cewka0_%d <- bez 00%d
    if i < 10
        eval(['load ' sprintf('%s00%d',dane,i) '.mat;']);
    elseif i < 100
        eval(['load ' sprintf('%s0%d',dane,i) '.mat;']);
    else
        eval(['load ' sprintf('%s%d',dane,i) '.mat;']);
    end
end
% MOD1 = cewka001.Y(1,1).Name

MOD1=[]; prad_cewka=[];

% cewka001.Y(1,1).Name - mod1
% cewka001.Y(1,2).Name - prad_cewka1
for m=start:koniec
    if m < 10
        buffMOD1 = eval(sprintf('%s00%d.Y(1,1).Data;',dane,m));
        buffCewka= eval(sprintf('%s00%d.Y(1,2).Data;',dane,m));
    elseif m < 100
        buffMOD1 = eval(sprintf('%s0%d.Y(1,1).Data;',dane,m));
        buffCewka = eval(sprintf('%s0%d.Y(1,2).Data;',dane,m));
    else
        buffMOD1 = eval(sprintf('%s%d.Y(1,1).Data;',dane,m));
        buffCewka = eval(sprintf('%s%d.Y(1,2).Data;',dane,m));
    end
eval(sprintf('MOD1=[MOD1 buffMOD1];'));
eval(sprintf('prad_cewka=[prad_cewka buffCewka];'));
end

% wektor czasu:
t= 0:ts:length(MOD1)*ts-ts;
% plot(t,prad_cewka,t,MOD1)
plot(MOD1,prad_cewka)
% for n = start : koniec
% end
%%
wytnij_start=1.222e+05; 
wytnij_koniec=1.366e+05;
wytnij = prad_cewka(wytnij_start:wytnij_koniec);
%%
plot(wytnij)

%% tworzenie macierzy W

k = 90; n = 4;

X = 1:k; X=vander(X);
X = X(:,end-n:end);
W = (X'*X)\X';

