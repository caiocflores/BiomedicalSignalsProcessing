
% sujeito f2y02
load f2y02m.mat
whos;
fs = 250;

% respiracao
resp = val(1,:);
plot(resp(1:10000));
figure; plot(resp(100000:110000)); title('Resp'); grid;

% ECG 
ecg = val(2,:); figure; plot(ecg(1:10000));
figure; plot(ecg(100000:110000)); title('ECG'); grid;

% pressao sanguinea
bp = val(3,:); figure;
plot(bp(100000:110000)); title('BP'); grid;

% conversao para escala correta 
% verificando valores de base e da ganho do arquivo .info
base=0; gain=409.6; ecg=(ecg-base)./gain; figure;
plot(ecg(100000:110000)); grid;
title('ECG na escala correta');

resp =(resp-base)./gain; figure; plot(resp(100000:110000));
title('Resp na escala correta'); 

bp =(bp-base)./gain; figure; plot(bp(100000:110000));
title('BP na escala correta'); % idem

% vetor de tempo para 5 min = 300 segundos
% os vetores resp, ecg e bp possuem o mesmo tamanho
% length(resp) = length(ecg) = length(bp)
time_5min = (300:600); % intervalo de tempo 300-600 (5 min)
% interessante pegar mais pro meio para que o sinal já tenha 
% se estabilizado

% ajustando os sinais de ecg e resp para 300:600 também
ecg = ecg(300:600);
resp = resp(300:600);

% TAREFA1 
% plotar dados da resp e ECG
subplot(1,2,1);
plot(time_5min, ecg); grid;
xlabel('Tempo (s)');
ylabel('ECG (mV)');
title('ECG x Tempo');

subplot(1,2,2);
plot(time_5min, resp);
xlabel('Tempo (s)');
ylabel('Resp (mV)');
title('Resp x Tempo'); 