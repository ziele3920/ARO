%przygotowanie œrodowiska
clear;
clc;
%iloœæ obrazów
N=3;
NLstep0 = 10;
stepmultiper = 10;
littlesteps = 10;
Nsub = 10000;
%Jaki rozk³ad badamy 1-normalny,2 - jednostajny
Rozklad=1;
a1 = 200;
b1 = 300;
a2 = [200,200,250,250,290,290,300,300,350,350];
b2 =[300,300,350,350,390,390,400,400,450,450];
sig1 = [50,50,1,1,sqrt(0.2),sqrt(0.2),sqrt(0.5),sqrt(0.5),sqrt(0.5),sqrt(0.5)];
sig2 = [50,50,1,1,sqrt(0.2),sqrt(0.2),sqrt(0.5),sqrt(0.5),sqrt(0.5),sqrt(0.5)];
m1 = [250,250,0,0,0,0,0,0,0,0];
m2 = [250,250,1,1,1,1,5,5,7,7];
p1 = [0.25,0.5];
p2 = [0.75,0.5];
alfa = [1,3,5];
for i = 1 :10
     ErrMNN(i) = CountErrMNN(N, NLstep0,stepmultiper,littlesteps,Nsub , p1(rem(i,2)+1) , m1(i), sig1(i), m2(i), sig2(i));
     ErrMNU(i) = CountErrNNN(N, NLstep0,stepmultiper,littlesteps,Nsub , p1(rem(i,2)+1) , a1(i),b1(i),a2(i),b2(i));
     for j = 1 : 3
        ErraNNU(i,j) = CountErraNNU(alfa(j),N,NLstep0,stemmultiper,littlesteps,Nsub,p1(rem(i,2)+1),a1(i),b1(i),a2(i),b2(i));
        ErraNNN(i,j) = CountErraNNN(alfa(j),N,NLstep0,stemmultiper,littlesteps,Nsub,p1(rem(i,2)+1),m1(i), sig1(i), m2(i), sig2(i));
        
     end
     BayesN(i) = 0;
     BayesU(i) = 0;
     CalkaN(i) = 0;
     CalkaU(i) = 0;
     ErrMNN(:,2)
end
%PROGRAM G£ÓWNY

Bledy = zeros(length(N_P),6);
iter = 1;
srodowisko(1,1) = p1;
srodowisko(1,2) = A1;
srodowisko(1,3) = B1;
srodowisko(2,1) = 1 - p1;
srodowisko(2,2) = A2;
srodowisko(2,3) = B2;
Ryzyko = 0;

    Obrazy = zeros(2,N);
    Rozpoznane = zeros(7,N);
    Ciag_Uczacy = 0;

    if Rozklad == 2
%Generowanie obrazów z rozk³adem jednostajnym
        
%Generowanie obrazów z rozk³adem normalnym
    elseif Rozklad == 1
        A1 = M1;
        A2 = M2;
        B1 = Sigma1;
        B2 = Sigma2;
        
    else
        error('Nie prawidlowy rozklad');
    end
    %Obrazy

    %Ciag_Uczacy
    
   
    
    Bledy(iter,:) = Bledy(iter,:)/N;
    %Rozpoznanie
    iter = iter + 1;


h = figure;
plot(N_P,(Bledy(:,1)),'r+-');
hold on;
grid on;
plot(N_P,(Bledy(:,2)),'mo-');
plot(N_P,(Bledy(:,3)),'c*-');
plot(N_P,(Bledy(:,4)),'bx-');
plot(N_P,(Bledy(:,5)),'ks-');
plot(Rozpoznanie(7,:),'g');
legend('NM','NN alpha = 1','NN alpha = 3','NN alpha = 5','Bayes','Ryzyko');
print(h,'-djpeg','wykres_6.jpg');
%Rozpoznanie