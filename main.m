%przygotowanie œrodowiska
clear;
clc;
%iloœæ obrazów
N=3;
NLstep0 = 10;
stepmultiper = 10;
littlesteps = 40;
nSub = 1000;
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
ErrMNN = zeros(10,N,2);
ErrMNU = zeros(10,N,2);
ErraNNU = zeros(10,3,N,2);
ErraNNN = zeros(10,3,N,2);
ErrBayesN = zeros(10,N,2);
ErrBayesU = zeros(10,N,2);


for i = 1 : 1
     subImageN = GenerateImageN(nSub, p1(rem(i,2)+1) , m1(i), sig1(i), m2(i), sig2(i));
     subImageU = GenerateImageU(nSub, p1(rem(i,2)+1) , a1,b1,a2(i),b2(i));
     ErrMNN(i,:,:) =  CountErrMNN(N, NLstep0,stepmultiper,littlesteps, subImageN , p1(rem(i,2)+1) , m1(i), sig1(i), m2(i), sig2(i));
     ErrMNU(i,:,:) = CountErrMNU(N, NLstep0,stepmultiper,littlesteps,subImageU , p1(rem(i,2)+1) , a1,b1,a2(i),b2(i));
     %for j = 1 : 3
     %   ErraNNU(i,j,:,:) = CountErraNNU(alfa(j),N,NLstep0,stepmultiper,littlesteps,subImageU,p1(rem(i,2)+1),a1,b1,a2(i),b2(i));
      %  ErraNNN(i,j,:,:) = CountErraNNN(alfa(j),N,NLstep0,stepmultiper,littlesteps,subImageN,p1(rem(i,2)+1),m1(i), sig1(i), m2(i), sig2(i));
        
    % end
     ErrBayesN(i,:,:) = CountErrBayesN(N, NLstep0,stepmultiper,littlesteps,subImageN , p1(rem(i,2)+1) , m1(i), sig1(i), m2(i), sig2(i));
     ErrBayesU(i,:,:) = CountErrBayesU(N, NLstep0,stepmultiper,littlesteps,subImageU, p1(rem(i,2)+1) , a1, b1, a2(i), b2(i));
end
%PROGRAM G£ÓWNY

h = figure;
plot(ErrMNN(1,:,1),(ErrMNN(1,:,2)),'mo-');
hold on;
grid on;
plot(ErrMNU(1,:,1),(ErrMNU(1,:,2)),'bx-');
plot(ErrMNU(1,:,1),(ErrMNU(1,:,2)),'r+-');
plot(ErrBayesN(1,:,1),(ErrBayesN(1,:,2)),'c*-');
plot(ErrBayesU(1,:,1),(ErrBayesU(1,:,2)),'r+-');
hold on;
grid on;

%plot(N_P,(Bledy(:,5)),'ks-');
%plot(Rozpoznanie(7,:),'g');
%legend('NM','NN alpha = 1','NN alpha = 3','NN alpha = 5','Bayes','Ryzyko');
%print(h,'-djpeg','wykres_6.jpg');
%