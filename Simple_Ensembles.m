%% histograma.m
% 
% Criado em 2024-08-24 às 16:50:13
% Autor: GabrielCampelo
% 
% Resumo: Este script gera um número especificado de matrizes aleatórias de ordem n x n com entradas de -1 ou 1,
%         diagonaliza essas matrizes, coleta todos os autovalores e plota um histograma normalizado da distribuição dos autovalores.
% 
% Detalhes: O código realiza as seguintes etapas:
%          1. Solicita ao usuário o tamanho da matriz e o número de matrizes a serem diagonalizadas.
%          2. Gera matrizes aleatórias, torna-as hermitianas e coleta seus autovalores.
%          3. Plota um histograma normalizado dos autovalores.
% 

%% Limpeza do ambiente
% clear all remove todas as variáveis do workspace do MATLAB
% close all fecha todas as figuras abertas.
% Isso garante que o código comece com um ambiente limpo.
clear all
close all

%% Entrada de parâmetros
% Solicita ao usuário o tamanho da matriz
prompt = '\nDigite o tamanho da matriz: ';
n = input(prompt);

% Solicita ao usuário o número de matrizes a serem diagonalizadas
prompt = '\nDigite o número de matrizes a serem diagonalizadas: ';
Nmatr = input(prompt);

%% Inicialização das variáveis
% Pré-aloca x como um vetor linear para armazenar todos os autovalores
x = zeros(Nmatr * n, 1);

% Inicializa o índice para o preenchimento dos autovalores
index = 1;

%% Geração das matrizes e coleta dos autovalores
for i = 1:Nmatr
    % Gera uma matriz n x n com entradas aleatórias de -1 ou 1
    M = randi([-1, 1], n, n);
    
    % Torna a matriz hermitiana para garantir que os autovalores sejam reais
    M = triu(M) + triu(M, 1)';
    
    % Coleta os autovalores da matriz
    eigs = eig(M);
    
    % Armazena os autovalores em x de forma linear
    x(index:index+n-1) = eigs;
    
    % Atualiza o índice para a próxima posição de armazenamento
    index = index + n;
end

%% Plotagem do histograma
% Calcula o valor máximo absoluto dos autovalores para definir os intervalos do histograma
max_val = max(abs(x));
edges = linspace(-max_val, max_val, 100);

% Cria uma nova figura para o histograma
figure;

% Plota o histograma normalizado dos autovalores
histogram(x, edges, 'Normalization','probability');
title('Histograma dos Autovalores');  % Define o título do histograma
xlabel('Autovalores');  % Define o rótulo do eixo x
ylabel('p(x)');  % Define o rótulo do eixo y