% Kelompok 3
% 16101032	RIFQI FIRMAN SYAH
% 18101047	FANNY SYARIFUDIN
% 18101058	MUHAMMAD RAFIK SYAHPUTRA DAMANIK
% 18101068	THOBIB KHOIRUL ANNAS
close all;clear;clc; 
sig=load('ecg_60hz_200.dat'); % Untuk memanggil data ecg dengan file name ecg_60hz_200.dat 
N=length(sig);  % Variabel n merupakan dimensi vektor sig
fs=200; % Variabel fs bernilai 200 
t=[0:N-1]/fs; 
figure(1);subplot(4,2,1);plot(sig)
% figure(1); Untuk menampilkan figure ke 1
          % subplot(4,2,1); Untuk menggabungkan plot grafik dalam satu paragraf
                     % plot(sig) untuk menggambar grafik dari variabel sig
title('Original Signal') % Untuk menampilkan teks Original Signal
%%
     %           Low Pass Filter
b=1/32*[1 0 0 0 0 0 -2 0 0 0 0 0 1]; % Untuk membentuk ukuran signal variabel b dalam kolom tersebut
a=[1 -2 1];              % Untuk membentuk ukuran signal variabel a dalam kolom tersebut
sigL=filter(b,a,sig);    % untuk memfilter signal dari variabel b , a, dan sig yang disimpan ke variabel sigL
subplot(4,2,3);plot(sigL)% subplot(4,2,3) untuk menggabungkan plot grafik dalam satu figure
              % plot(sigL)untuk menggabar grafik dari variable sigL
title('Low Pass Filter') % Untuk menampilkan teks Low Pass Filter
subplot(4,2,4);zplane(b,a)% untuk membuat Imaginary part & Real Part
%%
     %           High Pass Filter
b=[-1/32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1/32]; % Untuk membentuk ukuran signal variabel b dalam kolom tersebut
a=[1 -1];  % Untuk membentuk ukuran signal variabel a dalam kolom tersebut
sigH=filter(b,a,sigL);  % untuk memfilter signal dari variabel b , a, dan sigL yang disimpan ke variabel sigH
subplot(4,2,5);plot(sigH) % subplot(4,2,5) untuk menggabungkan plot grafik dalam satu figure
              % plot(sigH)untuk menggabar grafik dari variable sigL
title('High Pass Filter') % Untuk menampilkan teks High Pass Filter
subplot(4,2,6);zplane(b,a) % untuk membuat Imaginary part & Real Part
%%
     %          Derivative Base Filter
b=[1/4 1/8 0 -1/8 -1/4]; % Untuk membentuk ukuran signal variabel b dalam kolom tersebut
a=[1];  % Untuk membentuk ukuran signal variabel a dalam kolom tersebut
sigD=filter(b,a,sigH); % untuk memfilter signal dari variabel b , a, dan sigD yang disimpan ke variabel sigH
subplot(4,2,7);plot(sigD) % subplot(4,2,7) untuk menggabungkan plot grafik dalam satu figure
              % plot(sigD)untuk menggabar grafik dari variable sigD
title('Derivative Base Filter') % Untuk menampilkan teks Derivative Base Filter
subplot(4,2,8);zplane(b,a) % untuk membuat Imaginary part & Real Part