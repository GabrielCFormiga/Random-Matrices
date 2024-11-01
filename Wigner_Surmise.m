%% Wigner_Surmise.m
% 
% Criado em 2024-10-01 às 11:23:46
% Autor: Gabriel Campelo
% 
% Resumo: Este código calcula o espaçamento dos autovalores de N matrizes aleatórias GOE 2x2 e plota uma curva de densidade de espaçamento normalizada.
%

% n := ordem da matriz
n = 2;

% N := número de matrizes a serem diagonalizadas
N = input('\nDigite o número de matrizes a serem diagonalizadas: ');

% s(i) := espaçamento dos autovalores i-ésima matriz
s = zeros(N, 1);

%% Geração das matrizes e coleta dos espaçamentos dos autovalores
for i = 1:N
    % Gera uma matriz n x n com entradas aleatórias com distribuição normal (GOE)
    M = randn(n);
    
    % Torna a matriz simétrica para garantir autovalores reais
    M = (M + M') / 2;
    
    % Calcula os autovalores da matriz
    eigs = eig(M);
    
    % Calcula o espaçamento entre os autovalores
    s(i) = abs(eigs(1) - eigs(2));
end

%% Criação de uma curva de densidade a partir do histograma
num_bins = 50;

% Calcula os valores do histograma e os pontos centrais dos bins
[counts, edges] = histcounts(s, num_bins, 'Normalization', 'pdf');
bin_centers = (edges(1:end-1) + edges(2:end)) / 2;

% Cria a figura e plota a curva de densidade
figure;
plot(bin_centers, counts, 'LineWidth', 2);
title('Distribuição de Espaçamento dos Autovalores (Wigner Surmise)');
xlabel('Espaçamento (s)');
ylabel('Densidade de Probabilidade p(s)');
