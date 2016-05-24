%przygotowanie œrodowiska
clear;
close all;
clc;
%iloœæ obrazów
N=8;
NLstep0 = 5;
stepmultiper = 5;
littlesteps = 40;
nSub = 10^5;
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
ErrMNN = zeros(N,2);
ErrMNU = zeros(N,2);
ErraNNU = zeros(3,N,2);
ErraNNN = zeros(3,N,2);
ErrBayesN = zeros(N,2);
ErrBayesU = zeros(N,2);

%tutaj sobie tyczmasowo ustawiam dla którego zestawu parametrów chce liczyæ
z = 2;

%for i = z : z
     subImageN = GenerateImageN(nSub, p1(rem(z,2)+1) , m1(z), sig1(z), m2(z), sig2(z));
     subImageU = GenerateImageU(nSub, p1(rem(z,2)+1) , a1,b1,a2(z),b2(z));
     ErrMNN =  CountErrMNN(N, NLstep0,stepmultiper,littlesteps, subImageN , p1(rem(z,2)+1) , m1(z), sig1(z), m2(z), sig2(z));
     ErrMNU = CountErrMNU(N, NLstep0,stepmultiper,littlesteps,subImageU , p1(rem(z,2)+1) , a1,b1,a2(z),b2(z));
     for j = 1 : 3
        ErraNNU(j,:,:) = CountErraNNU(alfa(j),N,NLstep0,stepmultiper,littlesteps,subImageU,p1(rem(z,2)+1),a1,b1,a2(z),b2(z));
        ErraNNN(j,:,:) = CountErraNNN(alfa(j),N,NLstep0,stepmultiper,littlesteps,subImageN,p1(rem(z,2)+1),m1(z), sig1(z), m2(z), sig2(z));
        
     end
     ErrBayesN = CountErrBayesN(N, NLstep0,stepmultiper,littlesteps,subImageN , p1(rem(z,2)+1) , m1(z), sig1(z), m2(z), sig2(z));
     ErrBayesU = CountErrBayesU(N, NLstep0,stepmultiper,littlesteps,subImageU, p1(rem(z,2)+1) , a1, b1, a2(z), b2(z));
%end
%PROGRAM G£ÓWNY


lineWidth = 2;
hN = figure(1);
subplot(121);
semilogx(ErrMNN(:,1),(ErrMNN(:,2)),'mo-', 'LineWidth', lineWidth);
%plot(ErrMNN(:,1),(ErrMNN(:,2)),'mo-', 'LineWidth', lineWidth);
hold on;
grid on;
semilogx(ErrBayesN(:,1),(ErrBayesN(:,2)),'c*-', 'LineWidth', lineWidth);
semilogx(ErrBayesN(:,1),(ErraNNN(1,:,2)),'bx-', 'LineWidth', lineWidth);
semilogx(ErrBayesN(:,1),(ErraNNN(2,:,2)),'r+-', 'LineWidth', lineWidth);
semilogx(ErrBayesN(:,1),(ErraNNN(3,:,2)),'ks-', 'LineWidth', lineWidth);
%trza tutaj jeszcze plotn¹æ teoretyczne ryzyko


%legend('MN', 'Bayes', '1-NN','3-NN', '5-NN');
str = sprintf('Przypadek %d dla rozk³adu normalnego',z);
xlabel('d³ugoœæ ci¹gu ucz¹cego');
ylabel('u³amek b³êdnej klasyfikacji');
title(str);


subplot(122);
semilogx(ErrMNU(:,1),(ErrMNU(:,2)),'mo-', 'LineWidth', lineWidth);
hold on;
grid on;
semilogx(ErrBayesN(:,1),(ErrBayesU(:,2)),'c*-', 'LineWidth', lineWidth);
semilogx(ErrBayesN(:,1),(ErraNNU(1,:,2)),'bx-', 'LineWidth', lineWidth);
semilogx(ErrBayesN(:,1),(ErraNNU(2,:,2)),'r+-', 'LineWidth', lineWidth);
semilogx(ErrBayesN(:,1),(ErraNNU(3,:,2)),'ks-', 'LineWidth', lineWidth);
%trza tutaj jeszcze plotn¹æ teoretyczne ryzyko

%legend('MN', 'Bayes', '1-NN','3-NN', '5-NN');
str = sprintf('Przypadek %d dla rozk³adu równomiernego',z);
xlabel('d³ugoœæ ci¹gu ucz¹cego');
ylabel('u³amek b³êdnej klasyfikacji');
title(str);

%print(h,'-djpeg','wykres_6.jpg');
%