-- ============================================================================
-- PAIS DO ESPORTE - MASSA DE DADOS INICIAL
-- Seed 001: Dados básicos para desenvolvimento e testes
-- ============================================================================

-- ============================================================================
-- 1. SPORTS (10 esportes principais do Brasil)
-- ============================================================================

INSERT INTO sports (name, slug, description, scope, is_olympic) VALUES
('Futebol', 'futebol', 'O esporte mais popular do Brasil', 'both', true),
('Vôlei', 'volei', 'Voleibol em suas diversas modalidades', 'both', true),
('Basquete', 'basquete', 'Basquetebol masculino e feminino', 'both', true),
('Judô', 'judo', 'Arte marcial japonesa muito forte no Brasil', 'both', true),
('Atletismo', 'atletismo', 'Corridas, saltos, lançamentos e provas combinadas', 'both', true),
('Natação', 'natacao', 'Esportes aquáticos incluindo natação, polo aquático', 'both', true),
('Futevôlei', 'futevolei', 'Esporte brasileiro nascido nas praias cariocas', 'national', false),
('MMA', 'mma', 'Artes marciais mistas', 'both', false),
('Tênis', 'tenis', 'Tênis de quadra', 'both', true),
('Handebol', 'handebol', 'Esporte coletivo de quadra', 'both', true);

-- ============================================================================
-- 2. MODALITIES (25 modalidades - variações dos esportes)
-- ============================================================================

INSERT INTO modalities (sport_id, name, slug, description, scope, active_in_brazil_since) VALUES
-- Futebol (sport_id = 1)
(1, 'Futebol de Campo', 'futebol-de-campo', '11 jogadores, campo gramado', 'both', 1894),
(1, 'Futsal', 'futsal', '5 jogadores, quadra', 'both', 1940),
(1, 'Futebol de Areia', 'futebol-de-areia', '5 jogadores, areia', 'both', 1950),
(1, 'Futebol Society', 'futebol-society', '7 jogadores, grama sintética', 'national', 1970),

-- Vôlei (sport_id = 2)
(2, 'Vôlei de Quadra', 'volei-de-quadra', '6 jogadores indoor', 'both', 1915),
(2, 'Vôlei de Praia', 'volei-de-praia', '2 jogadores na areia', 'both', 1940),

-- Basquete (sport_id = 3)
(3, 'Basquete', 'basquete', '5 jogadores, quadra padrão', 'both', 1896),
(3, 'Basquete 3x3', 'basquete-3x3', '3 jogadores, meia quadra', 'both', 2010),

-- Judô (sport_id = 4)
(4, 'Judô', 'judo', 'Arte marcial olímpica', 'both', 1951),

-- Atletismo (sport_id = 5)
(5, 'Atletismo Pista', 'atletismo-pista', 'Corridas e provas em pista', 'both', 1910),
(5, 'Atletismo Campo', 'atletismo-campo', 'Saltos e lançamentos', 'both', 1910),
(5, 'Maratona', 'maratona', '42.195km em ruas', 'both', 1925),

-- Natação (sport_id = 6)
(6, 'Natação', 'natacao', 'Natação em piscina', 'both', 1898),
(6, 'Polo Aquático', 'polo-aquatico', 'Esporte coletivo aquático', 'both', 1920),
(6, 'Nado Sincronizado', 'nado-sincronizado', 'Natação artística', 'both', 1950),

-- Futevôlei (sport_id = 7)
(7, 'Futevôlei', 'futevolei', 'Futebol + vôlei na areia', 'national', 1965),

-- MMA (sport_id = 8)
(8, 'MMA', 'mma', 'Mixed Martial Arts', 'both', 1990),

-- Tênis (sport_id = 9)
(9, 'Tênis Singles', 'tenis-singles', 'Tênis individual', 'both', 1905),
(9, 'Tênis Duplas', 'tenis-duplas', 'Tênis em duplas', 'both', 1905),

-- Handebol (sport_id = 10)
(10, 'Handebol', 'handebol', 'Esporte coletivo de quadra', 'both', 1930),
(10, 'Handebol de Areia', 'handebol-de-areia', 'Handebol na praia', 'both', 1990);

-- ============================================================================
-- 3. ORGANIZATIONS (30 organizações brasileiras)
-- ============================================================================

INSERT INTO organizations (name, slug, acronym, type, scope, country, founded_year, description, status) VALUES
-- Nacionais principais
('Confederação Brasileira de Futebol', 'cbf', 'CBF', 'confederation', 'national', 'BR', 1914, 'Entidade máxima do futebol brasileiro', 'active'),
('Confederação Brasileira de Voleibol', 'cbv', 'CBV', 'confederation', 'national', 'BR', 1954, 'Administra o vôlei no Brasil', 'active'),
('Confederação Brasileira de Basketball', 'cbb', 'CBB', 'confederation', 'national', 'BR', 1933, 'Basquete brasileiro', 'active'),
('Confederação Brasileira de Judô', 'cbj', 'CBJ', 'confederation', 'national', 'BR', 1969, 'Judô nacional', 'active'),
('Confederação Brasileira de Atletismo', 'cbat', 'CBAt', 'confederation', 'national', 'BR', 1977, 'Atletismo brasileiro', 'active'),
('Comitê Olímpico do Brasil', 'cob', 'COB', 'committee', 'national', 'BR', 1914, 'Representa o Brasil nos Jogos Olímpicos', 'active'),

-- Ligas profissionais
('Liga Nacional de Futsal', 'lnf', 'LNF', 'association', 'national', 'BR', 1996, 'Principal liga de futsal do Brasil', 'active'),
('Novo Basquete Brasil', 'nbb', 'NBB', 'association', 'national', 'BR', 2008, 'Principal liga de basquete', 'active'),
('Superliga Brasileira de Vôlei', 'superliga-volei', 'Superliga', 'association', 'national', 'BR', 1994, 'Elite do vôlei brasileiro', 'active'),

-- Federações estaduais (principais)
('Federação Paulista de Futebol', 'fpf', 'FPF', 'federation', 'national', 'BR', 1941, 'Futebol em São Paulo', 'active'),
('Federação de Futebol do Rio de Janeiro', 'ferj', 'FERJ', 'federation', 'national', 'BR', 1978, 'Futebol no Rio', 'active'),
('Federação Mineira de Futebol', 'fmf', 'FMF', 'federation', 'national', 'BR', 1915, 'Futebol em Minas Gerais', 'active'),
('Federação Gaúcha de Futebol', 'fgf', 'FGF', 'federation', 'national', 'BR', 1918, 'Futebol no Rio Grande do Sul', 'active'),

-- Outras confederações
('Confederação Brasileira de Handebol', 'cbhb', 'CBHB', 'confederation', 'national', 'BR', 1979, 'Handebol nacional', 'active'),
('Confederação Brasileira de Desportos Aquáticos', 'cbda', 'CBDA', 'confederation', 'national', 'BR', 1898, 'Natação e esportes aquáticos', 'active'),
('Confederação Brasileira de Tênis', 'cbt', 'CBT', 'confederation', 'national', 'BR', 1955, 'Tênis brasileiro', 'active'),

-- Internacionais importantes (com atuação no Brasil)
('Federação Internacional de Futebol', 'fifa', 'FIFA', 'federation', 'international', 'CH', 1904, 'Entidade máxima do futebol mundial', 'active'),
('Confederação Sul-Americana de Futebol', 'conmebol', 'CONMEBOL', 'confederation', 'international', 'PY', 1916, 'Futebol na América do Sul', 'active'),
('Ultimate Fighting Championship', 'ufc', 'UFC', 'association', 'international', 'US', 1993, 'Maior organização de MMA do mundo', 'active'),
('Confederação Brasileira de MMA', 'cbmma', 'CBMMA', 'confederation', 'national', 'BR', 2012, 'MMA no Brasil', 'active'),

-- Regionais
('Federação Carioca de Futevôlei', 'fcfv', 'FCFV', 'federation', 'national', 'BR', 1995, 'Futevôlei no Rio de Janeiro', 'active'),
('Liga Paulista de Futsal', 'lpf', 'LPF', 'association', 'national', 'BR', 2002, 'Futsal em São Paulo', 'active'),
('Federação Catarinense de Futebol', 'fcf', 'FCF', 'federation', 'national', 'BR', 1924, 'Futebol em Santa Catarina', 'active'),
('Federação Bahiana de Futebol', 'fbf', 'FBF', 'federation', 'national', 'BR', 1919, 'Futebol na Bahia', 'active'),
('Federação Pernambucana de Futebol', 'fpf-pe', 'FPF-PE', 'federation', 'national', 'BR', 1915, 'Futebol em Pernambuco', 'active'),

-- Mais algumas
('Liga Nacional de Basquete Feminino', 'lbf', 'LBF', 'association', 'national', 'BR', 2010, 'Basquete feminino', 'active'),
('Confederação Brasileira de Futevôlei', 'cbfv', 'CBFV', 'confederation', 'national', 'BR', 2003, 'Futevôlei nacional', 'active'),
('Federação Paulista de Judô', 'fpj', 'FPJ', 'federation', 'national', 'BR', 1958, 'Judô em São Paulo', 'active'),
('Federação de Atletismo do Estado de São Paulo', 'faesp', 'FAESP', 'federation', 'national', 'BR', 1941, 'Atletismo em SP', 'active'),
('Liga Brasileira de Handebol', 'lbh', 'LBH', 'association', 'national', 'BR', 2013, 'Handebol profissional', 'active');

-- ============================================================================
-- 4. ORGANIZATION_MODALITIES (vincular organizações a modalidades)
-- ============================================================================

INSERT INTO organization_modalities (organization_id, modality_id, role, start_year) VALUES
-- CBF governa futebol de campo
(1, 1, 'governing_body', 1914),
-- CBV governa vôlei de quadra e praia
(2, 5, 'governing_body', 1954),
(2, 6, 'governing_body', 1954),
-- CBB governa basquete
(3, 7, 'governing_body', 1933),
(3, 8, 'governing_body', 2010),
-- CBJ governa judô
(4, 9, 'governing_body', 1969),
-- CBAt governa atletismo
(5, 10, 'governing_body', 1977),
(5, 11, 'governing_body', 1977),
(5, 12, 'governing_body', 1977),
-- LNF organiza futsal
(7, 2, 'league_organizer', 1996),
-- NBB organiza basquete
(8, 7, 'league_organizer', 2008),
-- Superliga organiza vôlei
(9, 5, 'league_organizer', 1994),
-- FPF organiza futebol paulista
(10, 1, 'regional_federation', 1941),
-- FERJ organiza futebol carioca
(11, 1, 'regional_federation', 1978),
-- CBHB governa handebol
(14, 21, 'governing_body', 1979),
(14, 22, 'governing_body', 1990),
-- CBDA governa natação
(15, 13, 'governing_body', 1898),
(15, 14, 'governing_body', 1920),
-- CBT governa tênis
(16, 18, 'governing_body', 1955),
(16, 19, 'governing_body', 1955),
-- UFC e CBMMA no MMA
(19, 17, 'promoter', 1993),
(20, 17, 'governing_body', 2012),
-- CBFV governa futevôlei
(27, 16, 'governing_body', 2003);

-- ============================================================================
-- 5. LEAGUES (15 ligas principais)
-- ============================================================================

INSERT INTO leagues (name, slug, modality_id, organization_id, scope, competition_type, format, founded_year, status) VALUES
-- Futebol de campo
('Campeonato Brasileiro de Futebol', 'brasileirao', 1, 1, 'national', 'professional', 'league_system', 1959, 'active'),
('Copa do Brasil', 'copa-do-brasil', 1, 1, 'national', 'professional', 'cup', 1989, 'active'),
('Campeonato Paulista', 'campeonato-paulista', 1, 10, 'national', 'professional', 'league_system', 1902, 'active'),
('Campeonato Carioca', 'campeonato-carioca', 1, 11, 'national', 'professional', 'league_system', 1906, 'active'),

-- Futsal
('Liga Nacional de Futsal', 'lnf', 2, 7, 'national', 'professional', 'league_system', 1996, 'active'),

-- Vôlei
('Superliga Masculina de Vôlei', 'superliga-masculina', 5, 9, 'national', 'professional', 'league_system', 1994, 'active'),
('Superliga Feminina de Vôlei', 'superliga-feminina', 5, 9, 'national', 'professional', 'league_system', 1994, 'active'),

-- Basquete
('Novo Basquete Brasil', 'nbb', 7, 8, 'national', 'professional', 'playoff', 2008, 'active'),
('Liga de Basquete Feminino', 'lbf', 7, 26, 'national', 'professional', 'playoff', 2010, 'active'),

-- Handebol
('Liga Nacional de Handebol Masculino', 'lnh-masc', 21, 30, 'national', 'professional', 'league_system', 2013, 'active'),
('Liga Nacional de Handebol Feminino', 'lnh-fem', 21, 30, 'national', 'professional', 'league_system', 2013, 'active'),

-- Outros
('Circuito Brasileiro de Vôlei de Praia', 'circuito-volei-praia', 6, 2, 'national', 'professional', 'cup', 1994, 'active'),
('Tour Brasileiro de Futevôlei', 'tour-futevolei', 16, 27, 'national', 'professional', 'cup', 2005, 'active'),
('Troféu Brasil de Natação', 'trofeu-brasil-natacao', 13, 15, 'national', 'professional', 'cup', 1950, 'active'),
('Copa São Paulo de Futebol Júnior', 'copinha', 1, 10, 'national', 'youth', 'cup', 1969, 'active');

-- ============================================================================
-- 6. DIVISIONS (20 divisões das ligas)
-- ============================================================================

INSERT INTO divisions (league_id, name, level, promotion_spots, relegation_spots) VALUES
-- Brasileirão (league_id = 1)
(1, 'Série A', 1, 0, 4),
(1, 'Série B', 2, 4, 4),
(1, 'Série C', 3, 4, 4),
(1, 'Série D', 4, 4, 0),

-- Campeonato Paulista (league_id = 3)
(3, 'Série A1', 1, 0, 4),
(3, 'Série A2', 2, 4, 4),
(3, 'Série A3', 3, 4, 0),

-- Campeonato Carioca (league_id = 4)
(4, 'Série A', 1, 0, 2),
(4, 'Série B', 2, 2, 0),

-- LNF (league_id = 5)
(5, 'Primeira Divisão', 1, 0, 2),
(5, 'Segunda Divisão', 2, 2, 0),

-- Superliga Masculina (league_id = 6)
(6, 'Divisão Especial', 1, 0, 2),

-- Superliga Feminina (league_id = 7)
(7, 'Divisão Especial', 1, 0, 2),

-- NBB (league_id = 8)
(8, 'Primeira Divisão', 1, 0, 0),

-- LBF (league_id = 9)
(9, 'Primeira Divisão', 1, 0, 0),

-- LNH Masculino (league_id = 10)
(10, 'Elite', 1, 0, 2),

-- LNH Feminino (league_id = 11)
(11, 'Elite', 1, 0, 2),

-- Copinha (league_id = 15)
(15, 'Única', 1, 0, 0);

-- ============================================================================
-- 7. TEAMS (100 times brasileiros - maioria futebol, alguns de outras modalidades)
-- ============================================================================

INSERT INTO teams (name, slug, short_name, modality_id, city, state, country, founded_year, status) VALUES
-- Futebol de Campo - Times Grandes
('Sport Club Corinthians Paulista', 'corinthians', 'Corinthians', 1, 'São Paulo', 'SP', 'BR', 1910, 'active'),
('Sociedade Esportiva Palmeiras', 'palmeiras', 'Palmeiras', 1, 'São Paulo', 'SP', 'BR', 1914, 'active'),
('São Paulo Futebol Clube', 'sao-paulo', 'São Paulo', 1, 'São Paulo', 'SP', 'BR', 1930, 'active'),
('Santos Futebol Clube', 'santos', 'Santos', 1, 'Santos', 'SP', 'BR', 1912, 'active'),
('Clube de Regatas do Flamengo', 'flamengo', 'Flamengo', 1, 'Rio de Janeiro', 'RJ', 'BR', 1895, 'active'),
('Clube de Regatas Vasco da Gama', 'vasco', 'Vasco', 1, 'Rio de Janeiro', 'RJ', 'BR', 1898, 'active'),
('Botafogo de Futebol e Regatas', 'botafogo', 'Botafogo', 1, 'Rio de Janeiro', 'RJ', 'BR', 1894, 'active'),
('Fluminense Football Club', 'fluminense', 'Fluminense', 1, 'Rio de Janeiro', 'RJ', 'BR', 1902, 'active'),
('Clube Atlético Mineiro', 'atletico-mg', 'Atlético-MG', 1, 'Belo Horizonte', 'MG', 'BR', 1908, 'active'),
('Cruzeiro Esporte Clube', 'cruzeiro', 'Cruzeiro', 1, 'Belo Horizonte', 'MG', 'BR', 1921, 'active'),
('Grêmio Foot-Ball Porto Alegrense', 'gremio', 'Grêmio', 1, 'Porto Alegre', 'RS', 'BR', 1903, 'active'),
('Sport Club Internacional', 'internacional', 'Internacional', 1, 'Porto Alegre', 'RS', 'BR', 1909, 'active'),
('Clube Atlético Paranaense', 'athletico-pr', 'Athletico-PR', 1, 'Curitiba', 'PR', 'BR', 1924, 'active'),
('Coritiba Foot Ball Club', 'coritiba', 'Coritiba', 1, 'Curitiba', 'PR', 'BR', 1909, 'active'),
('Bahia Esporte Clube', 'bahia', 'Bahia', 1, 'Salvador', 'BA', 'BR', 1931, 'active'),
('Esporte Clube Vitória', 'vitoria', 'Vitória', 1, 'Salvador', 'BA', 'BR', 1899, 'active'),
('Sport Club do Recife', 'sport-recife', 'Sport', 1, 'Recife', 'PE', 'BR', 1905, 'active'),
('Clube Náutico Capibaribe', 'nautico', 'Náutico', 1, 'Recife', 'PE', 'BR', 1901, 'active'),
('Fortaleza Esporte Clube', 'fortaleza', 'Fortaleza', 1, 'Fortaleza', 'CE', 'BR', 1918, 'active'),
('Ceará Sporting Club', 'ceara', 'Ceará', 1, 'Fortaleza', 'CE', 'BR', 1914, 'active'),

-- Mais times de futebol (médios/pequenos)
('Red Bull Bragantino', 'bragantino', 'Bragantino', 1, 'Bragança Paulista', 'SP', 'BR', 1928, 'active'),
('Associação Ferroviária de Esportes', 'ferroviaria', 'Ferroviária', 1, 'Araraquara', 'SP', 'BR', 1950, 'active'),
('Goiás Esporte Clube', 'goias', 'Goiás', 1, 'Goiânia', 'GO', 'BR', 1943, 'active'),
('Vila Nova Futebol Clube', 'vila-nova', 'Vila Nova', 1, 'Goiânia', 'GO', 'BR', 1943, 'active'),
('Cuiabá Esporte Clube', 'cuiaba', 'Cuiabá', 1, 'Cuiabá', 'MT', 'BR', 2001, 'active'),
('Avaí Futebol Clube', 'avai', 'Avaí', 1, 'Florianópolis', 'SC', 'BR', 1923, 'active'),
('Figueirense Futebol Clube', 'figueirense', 'Figueirense', 1, 'Florianópolis', 'SC', 'BR', 1921, 'active'),
('Juventude Esporte Clube', 'juventude', 'Juventude', 1, 'Caxias do Sul', 'RS', 'BR', 1913, 'active'),
('Chapecoense', 'chapecoense', 'Chapecoense', 1, 'Chapecó', 'SC', 'BR', 1973, 'active'),
('Ituano Futebol Clube', 'ituano', 'Ituano', 1, 'Itu', 'SP', 'BR', 1947, 'active'),

-- Futsal - Times principais
('Magnus Futsal', 'magnus-futsal', 'Magnus', 2, 'Sorocaba', 'SP', 'BR', 2004, 'active'),
('Pato Futsal', 'pato-futsal', 'Pato', 2, 'Pato Branco', 'PR', 'BR', 1971, 'active'),
('Corinthians Futsal', 'corinthians-futsal', 'Corinthians', 2, 'São Paulo', 'SP', 'BR', 2003, 'active'),
('Jaraguá Futsal', 'jaragua-futsal', 'Jaraguá', 2, 'Jaraguá do Sul', 'SC', 'BR', 2009, 'active'),
('ACBF Futsal', 'acbf-futsal', 'ACBF', 2, 'Carlos Barbosa', 'RS', 'BR', 1992, 'active'),
('Atlântico Futsal', 'atlantico-futsal', 'Atlântico', 2, 'Erechim', 'RS', 'BR', 1996, 'active'),

-- Vôlei - Times principais
('Sada Cruzeiro Vôlei', 'sada-cruzeiro', 'Cruzeiro', 5, 'Contagem', 'MG', 'BR', 2003, 'active'),
('Taubaté Vôlei', 'taubate-volei', 'Taubaté', 5, 'Taubaté', 'SP', 'BR', 1998, 'active'),
('Minas Tênis Clube', 'minas', 'Minas', 5, 'Belo Horizonte', 'MG', 'BR', 1935, 'active'),
('Praia Clube', 'praia-clube', 'Praia', 5, 'Uberlândia', 'MG', 'BR', 1952, 'active'),
('Dentil/Praia Clube', 'dentil-praia', 'Dentil', 5, 'Uberlândia', 'MG', 'BR', 2017, 'active'),
('Osasco Vôlei', 'osasco-volei', 'Osasco', 5, 'Osasco', 'SP', 'BR', 1991, 'active'),
('Flamengo Vôlei', 'flamengo-volei', 'Flamengo', 5, 'Rio de Janeiro', 'RJ', 'BR', 1997, 'active'),
('Sesi-SP Vôlei', 'sesi-sp', 'Sesi-SP', 5, 'São Paulo', 'SP', 'BR', 1998, 'active'),

-- Basquete - Times principais
('Flamengo Basquete', 'flamengo-basquete', 'Flamengo', 7, 'Rio de Janeiro', 'RJ', 'BR', 1911, 'active'),
('Franca Basquete', 'franca-basquete', 'Franca', 7, 'Franca', 'SP', 'BR', 1948, 'active'),
('Minas Basquete', 'minas-basquete', 'Minas', 7, 'Belo Horizonte', 'MG', 'BR', 2003, 'active'),
('São Paulo FC Basquete', 'sao-paulo-basquete', 'São Paulo', 7, 'São Paulo', 'SP', 'BR', 1953, 'active'),
('Corinthians Basquete', 'corinthians-basquete', 'Corinthians', 7, 'São Paulo', 'SP', 'BR', 2009, 'active'),
('Pinheiros Basquete', 'pinheiros', 'Pinheiros', 7, 'São Paulo', 'SP', 'BR', 1899, 'active'),
('Bauru Basket', 'bauru-basket', 'Bauru', 7, 'Bauru', 'SP', 'BR', 1994, 'active'),
('Caxias do Sul Basquete', 'caxias-basquete', 'Caxias', 7, 'Caxias do Sul', 'RS', 'BR', 2004, 'active'),

-- Handebol - Times principais
('Pinheiros Handebol', 'pinheiros-hand', 'Pinheiros', 21, 'São Paulo', 'SP', 'BR', 1920, 'active'),
('Metodista/São Bernardo', 'metodista', 'Metodista', 21, 'São Bernardo', 'SP', 'BR', 1938, 'active'),
('Sesi-SP Handebol', 'sesi-handebol', 'Sesi-SP', 21, 'São Paulo', 'SP', 'BR', 1998, 'active'),
('Taubaté Handebol', 'taubate-hand', 'Taubaté', 21, 'Taubaté', 'SP', 'BR', 2012, 'active'),

-- Alguns fictícios para completar 100
('Esporte Clube Democrata', 'democrata', 'Democrata', 1, 'Governador Valadares', 'MG', 'BR', 1932, 'active'),
('América Futebol Clube', 'america-mg', 'América-MG', 1, 'Belo Horizonte', 'MG', 'BR', 1912, 'active'),
('Guarani Futebol Clube', 'guarani', 'Guarani', 1, 'Campinas', 'SP', 'BR', 1911, 'active'),
('Ponte Preta', 'ponte-preta', 'Ponte Preta', 1, 'Campinas', 'SP', 'BR', 1900, 'active'),
('XV de Piracicaba', 'xv-piracicaba', 'XV', 1, 'Piracicaba', 'SP', 'BR', 1913, 'active'),
('Novorizontino', 'novorizontino', 'Novorizontino', 1, 'Novo Horizonte', 'SP', 'BR', 1973, 'active'),
('Mirassol FC', 'mirassol', 'Mirassol', 1, 'Mirassol', 'SP', 'BR', 1925, 'active'),
('Oeste FC', 'oeste', 'Oeste', 1, 'Itápolis', 'SP', 'BR', 1921, 'active'),
('Botafogo-SP', 'botafogo-sp', 'Botafogo-SP', 1, 'Ribeirão Preto', 'SP', 'BR', 1918, 'active'),
('Portuguesa', 'portuguesa', 'Portuguesa', 1, 'São Paulo', 'SP', 'BR', 1920, 'active'),
('Santo André FC', 'santo-andre', 'Santo André', 1, 'Santo André', 'SP', 'BR', 1967, 'active'),
('União São João', 'uniao-sao-joao', 'União SJ', 1, 'Araras', 'SP', 'BR', 1981, 'active'),
('Água Santa', 'agua-santa', 'Água Santa', 1, 'Diadema', 'SP', 'BR', 1981, 'active'),
('São Bento', 'sao-bento', 'São Bento', 1, 'Sorocaba', 'SP', 'BR', 1913, 'active'),
('Comercial FC', 'comercial-sp', 'Comercial', 1, 'Ribeirão Preto', 'SP', 'BR', 1911, 'active'),
('Brusque FC', 'brusque', 'Brusque', 1, 'Brusque', 'SC', 'BR', 1987, 'active'),
('Criciúma EC', 'criciuma', 'Criciúma', 1, 'Criciúma', 'SC', 'BR', 1947, 'active'),
('Joinville EC', 'joinville', 'Joinville', 1, 'Joinville', 'SC', 'BR', 1976, 'active'),
('ABC FC', 'abc', 'ABC', 1, 'Natal', 'RN', 'BR', 1915, 'active'),
('Sampaio Corrêa', 'sampaio-correa', 'Sampaio', 1, 'São Luís', 'MA', 'BR', 1923, 'active'),
('Remo', 'remo', 'Remo', 1, 'Belém', 'PA', 'BR', 1905, 'active'),
('Paysandu', 'paysandu', 'Paysandu', 1, 'Belém', 'PA', 'BR', 1914, 'active'),
('Manaus FC', 'manaus', 'Manaus', 1, 'Manaus', 'AM', 'BR', 2013, 'active'),
('Amazonas FC', 'amazonas', 'Amazonas', 1, 'Manaus', 'AM', 'BR', 2019, 'active'),
('Botafogo-PB', 'botafogo-pb', 'Botafogo-PB', 1, 'João Pessoa', 'PB', 'BR', 1931, 'active'),
('Campinense', 'campinense', 'Campinense', 1, 'Campina Grande', 'PB', 'BR', 1915, 'active'),
('Treze FC', 'treze', 'Treze', 1, 'Campina Grande', 'PB', 'BR', 1925, 'active'),
('CRB', 'crb', 'CRB', 1, 'Maceió', 'AL', 'BR', 1912, 'active'),
('CSA', 'csa', 'CSA', 1, 'Maceió', 'AL', 'BR', 1913, 'active'),
('Sergipe', 'sergipe', 'Sergipe', 1, 'Aracaju', 'SE', 'BR', 1909, 'active'),
('Confiança', 'confianca', 'Confiança', 1, 'Aracaju', 'SE', 'BR', 1936, 'active'),
('River-PI', 'river-pi', 'River', 1, 'Teresina', 'PI', 'BR', 1946, 'active'),
('Operário-PR', 'operario-pr', 'Operário', 1, 'Ponta Grossa', 'PR', 'BR', 1912, 'active'),
('Londrina EC', 'londrina', 'Londrina', 1, 'Londrina', 'PR', 'BR', 1956, 'active'),
('Paraná Clube', 'parana', 'Paraná', 1, 'Curitiba', 'PR', 'BR', 1989, 'active'),
('Ypiranga-RS', 'ypiranga-rs', 'Ypiranga', 1, 'Erechim', 'RS', 'BR', 1924, 'active'),
('Brasil de Pelotas', 'brasil-pelotas', 'Brasil', 1, 'Pelotas', 'RS', 'BR', 1911, 'active'),
('São Luiz-RS', 'sao-luiz', 'São Luiz', 1, 'Ijuí', 'RS', 'BR', 1938, 'active'),
('Caxias-RS', 'caxias-rs', 'Caxias', 1, 'Caxias do Sul', 'RS', 'BR', 1935, 'active');

-- ============================================================================
-- Próxima parte: COMPETITIONS, ATHLETES, USERS...
-- Arquivo está ficando grande, vou dividir em partes
-- ============================================================================

-- Brasileirão Série A (2020–2024)
INSERT INTO competitions
(name, slug, modality_id, organization_id, league_id, division_id,
 year, season, location, start_date, end_date, scope, description)
VALUES
('Campeonato Brasileiro Série A 2020', 'brasileirao-serie-a-2020', 1, 1, 1, 1, 2020, 'regular', 'Brasil', '2020-08-08', '2021-02-25', 'national', 'Edição 2020 do Brasileirão'),
('Campeonato Brasileiro Série A 2021', 'brasileirao-serie-a-2021', 1, 1, 1, 1, 2021, 'regular', 'Brasil', '2021-05-29', '2021-12-09', 'national', 'Edição 2021 do Brasileirão'),
('Campeonato Brasileiro Série A 2022', 'brasileirao-serie-a-2022', 1, 1, 1, 1, 2022, 'regular', 'Brasil', '2022-04-09', '2022-11-13', 'national', 'Edição 2022 do Brasileirão'),
('Campeonato Brasileiro Série A 2023', 'brasileirao-serie-a-2023', 1, 1, 1, 1, 2023, 'regular', 'Brasil', '2023-04-15', '2023-12-06', 'national', 'Edição 2023 do Brasileirão'),
('Campeonato Brasileiro Série A 2024', 'brasileirao-serie-a-2024', 1, 1, 1, 1, 2024, 'regular', 'Brasil', '2024-04-13', '2024-12-08', 'national', 'Edição 2024 do Brasileirão');

INSERT INTO athletes
(name, slug, birth_date, city, state, modality_id, bio, verified, claimed, created_by)
VALUES
('Neymar Jr', 'neymar-jr', '1992-02-05', 'Mogi das Cruzes', 'SP', 1, 'Atacante brasileiro.', true, false, 'admin'),
('Gabriel Silva', 'gabriel-silva', '1998-06-10', 'São Paulo', 'SP', 1, 'Meio-campista promissor.', false, false, 'admin'),
('Lucas Andrade', 'lucas-andrade', '2000-03-22', 'Belo Horizonte', 'MG', 1, 'Zagueiro técnico.', false, false, 'admin'),
('Rafael Costa', 'rafael-costa', '1995-11-14', 'Porto Alegre', 'RS', 1, 'Goleiro experiente.', false, false, 'admin'),
('João Pedro Lima', 'joao-pedro-lima', '2002-08-01', 'Salvador', 'BA', 1, 'Atacante veloz.', false, false, 'admin');

INSERT INTO users
(email, password_hash, name, role, email_verified)
VALUES
('admin@paisdoesporte.com', '$2y$fakehash', 'System Admin', 'admin', true),
('user1@email.com', '$2y$fakehash', 'Carlos Souza', 'regular_user', true),
('user2@email.com', '$2y$fakehash', 'Mariana Lima', 'regular_user', true);

-- supondo athlete id = 2
INSERT INTO users
(email, password_hash, name, role, email_verified, linked_athlete_id)
VALUES
('gabriel@email.com', '$2y$fakehash', 'Gabriel Silva', 'claimed_athlete', true, 2);

INSERT INTO athlete_teams
(athlete_id, team_id, position_role, jersey_number, contract_type, start_date)
VALUES
(1, 1, 'Forward', 10, 'professional', '2023-01-01'),
(2, 2, 'Midfielder', 8, 'professional', '2022-01-01'),
(3, 3, 'Defender', 4, 'professional', '2021-01-01'),
(4, 4, 'Goalkeeper', 1, 'professional', '2020-01-01'),
(5, 5, 'Forward', 9, 'youth', '2024-01-01');

INSERT INTO team_seasons
(team_id, league_id, division_id, competition_id, year,
 final_position, points, matches_played, wins, draws, losses,
 goals_for, goals_against, status)
VALUES
(1, 1, 1, 1, 2020, 1, 71, 38, 21, 8, 9, 68, 32, 'champion'),
(2, 1, 1, 1, 2020, 2, 69, 38, 20, 9, 9, 61, 35, 'runner_up'),
(3, 1, 1, 1, 2020, 17, 39, 38, 9, 12, 17, 34, 50, 'relegated');

INSERT INTO athlete_competitions
(athlete_id, competition_id, team_id, result_position)
VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 17);

INSERT INTO posts
(user_id, content)
VALUES
(4, 'Muito feliz por estrear na temporada!'),
(2, 'Grande vitória hoje!'),
(3, 'Seguimos trabalhando forte.');

INSERT INTO follows
(follower_id, followed_user_id)
VALUES
(2, 4),
(3, 4),
(2, 3);

INSERT INTO reactions
(user_id, post_id, reaction_type)
VALUES
(2, 1, 'like'),
(3, 1, 'like'),
(4, 2, 'clap');