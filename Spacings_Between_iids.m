%% Spacings_Between_iids.m
% 
% Criado em 2024-11-19 às 08:32:12
% Autor: Gabriel Campelo
% 
% Variáveis i.i.d. não se repelem, mas, ao contrário, se atraem: 
% a probabilidade de lacunas desaparecendo, s → 0, não desaparece, 
% como ocorre no caso dos autovalores de RMT!
%

%% Entrada de parâmetros
prompt = '\nDigite o número de variáveis aleatórias do experimento: ';
N = input(prompt);

prompt = '\nDigite o número de experimentos: ';
qtd_experimentos = input(prompt); 

%% Coleta dos espaçamentos
% s(i, j) := X(j + 1) - X(j) para o i-ésimo experimento
s = zeros(qtd_experimentos, N - 1);  

for i = 1:qtd_experimentos
    % Escolha de N v.a.'s a partir da função densidade probabilidade de Gauss 
    X = randn(N);
    X = sort(X);
    
    for j = 1:N - 1
        s(i, j) = X(j + 1) -X(j);
    end

    % fprintf('\nExperimento %d:\n', i);
    % for j = 1:N
    %     fprintf('%.3f ', X(j));
    % end
    % fprintf('\n');
end

%% Criação de uma curva de densidade a partir do histograma

num_bins = 50;

% Calcula os valores do histograma e os pontos centrais dos bins
[counts, edges] = histcounts(s, num_bins, 'Normalization', 'pdf');
bin_centers = (edges(1:end-1) + edges(2:end)) / 2;

% Cria a figura e plota a curva de densidade
figure;
plot(bin_centers, counts, 'LineWidth', 2);
title("Distribuição de Espaçamento das v.a.'s");
xlabel('Espaçamento (s)');
ylabel('Densidade de Probabilidade p(s)');
