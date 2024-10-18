%% Gaussian_Orthogonal_Ensemble.m
% 
% Criado em: 2024-10-16 às 13:45:15
% Autor: Gabriel Campelo
% 
% Resumo: 
% O código gera matrizes aleatórias com distribuição gaussiana, transforma-as 
% em matrizes hermitianas e coleta seus autovalores. Por fim, plota um histograma
% normalizado desses autovalores.
% 
% Etapas:
% 1. Solicita ao usuário o tamanho da matriz e o número de matrizes a serem diagonalizadas.
% 2. Gera matrizes aleatórias, torna-as hermitianas e coleta seus autovalores.
% 3. Plota um histograma normalizado dos autovalores.m histograma normalizado dos autovalores.
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
    % Gera uma matriz n x n com entradas aleatórias escolhidas a partir de função densidade probabilidade de Gauss 
    M = randn(n);
    
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
ylabel('Frequência');  % Define o rótulo do eixo y