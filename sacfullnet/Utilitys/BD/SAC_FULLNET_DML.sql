-- Inserção de um usuário administrador de exemplo
INSERT INTO usuario(login, password, role)
VALUES
    ('admin', '$2a$10$ssurqCxJDYsjBNiB8ZAjxeRNhEfSKd5gpACwZ4Gzybq3Npyy5eqya', 'ADMIN'),
    ('usuario', '$2a$10$lZOIs1rJ7b4w59WRULhG/uK5yeL7mNVqJd0Zo72kRJcnh8rMIvIMu', 'USER');


--Inserção de um tipo de equipamento
INSERT INTO tipo_equipamento(descricao)
VALUES
  ('ONU'),
  ('Roteador');


-- Inserção de exemplos de produtos em cada tabela correspondente
INSERT INTO equipamento (nome, ip_address, configuracao, descricao, imagem, id_tipo_equipamento)
VALUES
    ('Roteador RG-1200 Intelbras', '10.0.0.1', '[Passo a Passo: Após ativar a ONU Fiberhome 02-B > Conecte o roteador TP-Link C5 com a porta Wan em uma das portas do modem Fiberhome 02-B instalado no local > Conecte o seu computador > Digite na página web de seu navegador: 10.0.0.1 (abrirá uma tela de login) > Acesse a senha que foi criada > Vá em Configuração SSID e PASSWORD > Preencha os campos com o nome e senha solicitado pelos clientes > Salve as configurações > Conecte na rede e teste a conexão junto ao cliente', 'O roteador RG-1200 suporta a frequência 2.4Ghz e 5ghz, é uma solução de rede avançada que oferece alta velocidade e desempenho, ideal para ambientes que exigem uma conexão estável e rápida. Com recursos de segurança aprimorados e facilidade de configuração, é uma escolha excelente para atender às necessidades de conectividade residencial ou empresarial.', 'ROTEADOR_RG_1200-INTELBRAS',1),
    ('Roteador TP-Link C6', '192.168.0.1', '[Passo a Passo: Após ativar a ONU Fiberhome 02-B > Conecte o roteador TP-Link C6 com a porta Wan em uma das portas do modem Fiberhome 02-B instalado no local > Conecte o seu computador > Digite na página web de seu navegador: 192.168.0.1 (abrirá uma tela de login) > Acesse com admin/admin > Vá em Configuração SSID e PASSWORD > Preencha os campos com o nome e senha solicitado pelos clientes > Salve as configurações > Conecte na rede e teste a conexão junto ao cliente', 'O roteador TP-Link C6 é um dispositivo dual-band com suporte a conexões sem fio 802.11ac. Ele oferece velocidades de até 1200Mbps e recursos avançados, como beamforming, que direciona o sinal Wi-Fi para dispositivos específicos, melhorando o desempenho da rede. É ideal para aplicações que exigem largura de banda e baixa latência, como streaming de vídeo e jogos online.', 'ROTEADOR_TP-LINK_C6',1),
    ('Roteador ZTE AC Dual-Band', '192.168.1.1', '[Passo a Passo: Após ativar a ONU Fiberhome 02-B > Conecte o roteador ZTE AC Dual-Band com a porta Wan em uma das portas do modem Fiberhome 02-B instalado no local > Conecte o seu computador > Digite na página web de seu navegador: 192.168.1.1 (abrirá uma tela de login) > Acesse com admin/admin ou multipro/multipro > Vá em Configuração SSID e PASSWORD > Preencha os campos com o nome e senha solicitado pelos clientes > Salve as configurações > Conecte na rede e teste a conexão junto ao cliente', 'O ZTE AC Dual-Band é um roteador Wi-Fi de alto desempenho que oferece conectividade de banda dupla para uma experiência de rede rápida e estável.', 'ROTEADOR_ZTE_AC',1),
    ('Roteador TP-Link C5', '192.168.0.1', '[Passo a Passo: Após ativar a ONU Fiberhome 02-B > Conecte o roteador TP-Link C5 com a porta Wan em uma das portas do modem Fiberhome 02-B instalado no local > Conecte o seu computador > Digite na página web de seu navegador: 192.168.0.1 (abrirá uma tela de login) > Acesse com admin/admin > Vá em Configuração SSID e PASSWORD > Preencha os campos com o nome e senha solicitado pelos clientes > Salve as configurações > Conecte na rede e teste a conexão junto ao cliente', 'O TP-Link C5 suporta a tecnologia dual-band, permitindo operação em duas frequências: 2,4 GHz e 5 GHz. Isso oferece maior flexibilidade e ajuda a evitar congestionamentos na rede. Este roteador é uma escolha popular para usuários que desejam uma rede Wi-Fi de alta qualidade e é frequentemente usado em ambientes domésticos e de pequenos escritórios.', 'ROTEADOR_TP-LINK_C5',1),
    ('ONU Fiberhome 02-B', '192.168.1.1', '[Passo a Passo no sistema SGP da Fullnet Telecomunicações: Administração > Cadastro > Fttx - Olt > Escolher a região na qual o cliente reside > Ir em OPÇÕES > ONUs não autorizadas > Clicar no mac que aparecer para ativação > Abrirá uma nova tela para AUTORIZAR ONU > Tipo de ONU: 5506-02-B > Onutemplate: Onu Fiberhome 5506-02-b - RP 1200 > Contrato Login: (será o PPPoE do cliente) > Ativar o acesso Web > Salvar]', 'A ONU Fiberhome-02-B é o equipamento instalado no usuário e é responsável em fazer a comunicação com o roteador que será instalado junto. Este equipamento termina a ligação da fibra óptica e oferece a interface de serviços ao usuário. O modelo AN5506-02-B possui uma porta Giga, uma porta Fast Ethernet e uma porta FXS (POTS) design discreto e é de fácil configuração atendendo todas as necessidades de serviços dos usuários finais. Ele oferece aos usuários serviços de comunicação e entretenimento na forma de dados, voz, vídeo, entre outras características, para satisfazer a procura de acesso integrada na sua casa ou empresa.A ONU é um equipamento ativo GPON que utiliza tecnologia passiva para transferência de dados bidirecional por uma única fibra óptica em distâncias de até 20km, ou seja, não existindo ativos entre a ONU e o chassi OLT. A Fiberhome através da linha de produtos GPON ONU AN5506 oferece a seus clientes uma ampla diversidade de serviços tais como Fast Ethernet, Gigabit Ethernet, VOIP, Wi-Fi, IPTV.', 'ONU_FIBERHOME_02-B',2),
    ('ONU Fiberhome 04-FA', '192.168.1.1', '[Passo a Passo no sistema SGP da Fullnet Telecomunicações: Administração > Cadastro > Fttx - Olt > Escolher a região na qual o cliente reside > Ir em OPÇÕES > ONUs não autorizadas > Clicar no mac que aparecer para ativação > Abrirá uma nova tela para AUTORIZAR ONU > Tipo de ONU: 5506-04-FA > Contrato Login: (será o PPPoE do cliente) > Ativar o acesso Web > Salvar]', 'A ONU (Optical Network Unit) é o equipamento instalado no usuário que recebe o sinal transmitido pela OLT. O modelo AN5506-04-FA possui 4 portas Giga Ethernet, 2 portas POTS e interface Wireless. O design discreto e é de fácil configuração atendendo todas as necessidades de serviços dos usuários finais', 'ONU_FIBERHOME_04-FA',2),
    ('Roteador Mercusys AC-1200', '192.168.1.1', '[Passo a Passo: Após ativar a ONU Fiberhome 02-B > Conecte o roteador Mercusys AC-1200 com a porta Wan em uma das portas do modem Fiberhome 02-B instalado no local > Conecte o seu computador > Digite na página web de seu navegador: 192.168.1.1 (abrirá uma tela de login) > Acesse com admin/admin > Vá em Configuração SSID e PASSWORD > Preencha os campos com o nome e senha solicitado pelos clientes > Salve as configurações > Conecte na rede e teste a conexão junto ao cliente', 'O Mercusys AC-1200 suporta a tecnologia dual-band, permitindo operação em duas frequências: 2,4 GHz e 5 GHz. Isso oferece maior flexibilidade e ajuda a evitar congestionamentos na rede. Este roteador é uma escolha popular para usuários que desejam uma rede Wi-Fi de alta qualidade e é frequentemente usado em ambientes domésticos e de pequenos escritórios.', 'ROTEADOR_MERCUSYS_AC-1200',2),
    ('Roteador TP-Link TL-940N', '192.168.0.1', '[Passo a Passo: Após ativar a ONU Fiberhome 02-B > Conecte o roteador TP-Link TL-940N com a porta Wan em uma das portas do modem Fiberhome 02-B instalado no local > Conecte o seu computador > Digite na página web de seu navegador: 192.168.0.1 (abrirá uma tela de login) > Acesse com admin/admin > Vá em Configuração SSID e PASSWORD > Preencha os campos com o nome e senha solicitado pelos clientes > Salve as configurações > Conecte na rede e teste a conexão junto ao cliente', 'O TP-Link TL-WR940N suporta a tecnologia dual-band, permitindo operação em duas frequências: 2,4 GHz e 5 GHz. Porém a velocidade máxima dele é de 100Mbps via Wireless e Cabo de Rede. Isso oferece maior flexibilidade e ajuda a evitar congestionamentos na rede. Este roteador é uma escolha popular para usuários que desejam uma rede Wi-Fi de alta qualidade e é frequentemente usado em ambientes domésticos e de pequenos escritórios.', 'ROTEADOR_TP-LINK_WR940N',2),
    ('Roteador Think AC-1200', '192.168.10.1', '[Passo a Passo: Após ativar a ONU Fiberhome 02-B > Conecte o roteador Think AC-1200 com a porta Wan em uma das portas do modem Fiberhome 02-B instalado no local > Conecte o seu computador > Digite na página web de seu navegador: 192.168.10.1 (abrirá uma tela de login) > Acesse a página com a senha ''admin'' > Vá em Configuração SSID e PASSWORD > Preencha os campos com o nome e senha solicitado pelos clientes > Salve as configurações > Conecte na rede e teste a conexão junto ao cliente', 'O roteador Think AC-1200 suporta a frequência 2.4Ghz e 5ghz, porém em uma velocidade menor da que os padrões de outra marca, em torno de 400Mbps via Wireless, seu firmware não suporta mais que isso, é uma solução de rede familiar que oferece uma velocidade razoavelmente alta e desempenho. Com recursos de segurança aprimorados e facilidade de configuração, é uma escolha excelente para atender às necessidades de conectividade residencial.', 'ROTEADOR_THINK_AC-1200',2),
    ('Roteador Huawei AC-1500', '192.168.3.1', '[Passo a Passo: Após ativar a ONU Fiberhome 02-B > Conecte o roteador Huawei AC-1500 com a porta Wan em uma das portas do modem Fiberhome 02-B instalado no local > Conecte o seu computador > Digite na página web de seu navegador: 192.168.3.1 (abrirá uma tela de login) > Acesse com admin/admin > Vá em Configuração SSID e PASSWORD > Preencha os campos com o nome e senha solicitado pelos clientes > Salve as configurações > Conecte na rede e teste a conexão junto ao cliente', 'O roteador Huawei AC-1200 suporta a frequência 2.4Ghz e 5ghz, ele também vem com a nova tecnologia WI-FI6 integrada em seu firmware é uma solução de rede avançada que oferece alta velocidade e desempenho, ideal para ambientes que exigem uma conexão estável e rápida. Com recursos de segurança aprimorados e facilidade de configuração, é uma escolha excelente para atender às necessidades de conectividade residencial ou empresarial.', 'ROTEADOR_HUAWEI_AC-1500',2);
     


INSERT INTO imagem (id_equipamento, filename, filepath, type)
VALUES
	(1, '1.jpeg', 'C:\Users\TI\Desktop\pastaTeste\tccdoscara\sacfullnet\Backend\images\1','image/jpeg'),
	(2, '2.jpeg', 'C:\Users\TI\Desktop\pastaTeste\tccdoscara\sacfullnet\Backend\images\2','image/jpeg'),
	(3, '3.jpeg', 'C:\Users\TI\Desktop\pastaTeste\tccdoscara\sacfullnet\Backend\images\3','image/jpeg'),
	(4, '4.jpeg', 'C:\Users\TI\Desktop\pastaTeste\tccdoscara\sacfullnet\Backend\images\4','image/jpeg'),
	(5, '5.jpeg', 'C:\Users\TI\Desktop\pastaTeste\tccdoscara\sacfullnet\Backend\images\5','image/jpeg'),
	(6, '6.jpeg', 'C:\Users\TI\Desktop\pastaTeste\tccdoscara\sacfullnet\Backend\images\6','image/jpeg'),
	(7, '7.jpeg', 'C:\Users\TI\Desktop\pastaTeste\tccdoscara\sacfullnet\Backend\images\7','image/jpeg'),
	(8, '8.jpeg', 'C:\Users\TI\Desktop\pastaTeste\tccdoscara\sacfullnet\Backend\images\8','image/jpeg'),
	(9, '9.jpeg', 'C:\Users\TI\Desktop\pastaTeste\tccdoscara\sacfullnet\Backend\images\9','image/jpeg'),
	(10, '10.jpeg','C:\Users\TI\Desktop\pastaTeste\tccdoscara\sacfullnet\Backend\images\10','image/jpeg');


-- Inserção de exemplos de FAQs relacionadas a configurações de equipamentos
INSERT INTO public.faq (titulo, solucao)
VALUES
  ('Como configurar a rede Wi-Fi no Roteador RG-1200 Intelbras?', 'Para configurar a rede Wi-Fi no Roteador RG-1200 Intelbras, siga os seguintes passos: [Passo 1: Ir na página WEB e digitar o ip_address Padrão: 10.0.0.1] [Passo 2: Pedirá para que seja definida sua senha de acesso e senha do Wi-Fi] [Passo 3: Quando acessar o roteador, vá em CONFIGURAÇÕES DE Wi-Fi] [Passo 4: Clique em Nome e Senha Wi-Fi para ir no campo de alterar configurações] [Passo 5: Alterar Nome da rede Wi-Fi e Senha da rede Wi-Fi]. [Passo 6: Aplicar as configurações na Rede Wi-Fi 2.4Ghz e Rede Wi-Fi 5G] [Passo 7: Clique em Salvar]'),
  ('Como criar rede de visitante no Roteador RG-1200 Intelbras?', '[Passo 1: Após acessar a interface do roteador] [Passo 2: Vá em Rede para Visitantes] [Passo 3: Ativar o botão REDE PARA VISITANTES] [Passo 4: Altere os campos de nome da rede 2.4Ghz e 5Ghz e coloque a senha que deseja] [Passo 5: Vá em VALIDADE e deixe "SEMPRE"] [Passo 6: Em Banda compartilhada entre os convidados, limite o quanto deseja que tenha de consumo máximo de seu plano de internet.] [Passo 7: Clique SALVAR]'),
  ('Qual é a senha padrão de fábrica do Roteador TP-Link C6?', 'A senha padrão de fábrica do Roteador TP-Link C6 é "admin". Certifique-se de alterá-la após a configuração inicial.'),
  ('Qual é a senha padrão de fábrica do Roteador ZTE AC Dual-Band?', 'A senha padrão de fábrica do Roteador ZTE AC Dual-Band é "admin" ou "multipro". Certifique-se de alterá-la após a configuração inicial.'),
  ('Qual é a senha padrão de fábrica da ONU Fiberhome 04-FA?', 'A senha padrão de fábrica da ONU Fiberhome 04-FA é "%0|F?H@f!berhO3e" ou "full2879". Certifique-se de alterá-la após a configuração inicial.'),
  ('Qual é a senha padrão de fábrica da ONU Fiberhome 02-B?', 'A senha padrão de fábrica da ONU Fiberhome 04-FA é "admin" ou "full2879". Certifique-se de alterá-la após a configuração inicial.'),  ('Como atualizar o firmware no Roteador ZTE AC Dual-Band?', 'Para atualizar o firmware no Roteador ZTE AC Dual-Band, siga as instruções fornecidas no manual do usuário ou no site oficial da ZTE.'),
  ('Como redefinir o Roteador TP-Link C5 para as configurações de fábrica?', 'Para redefinir o Roteador TP-Link C5 para as configurações de fábrica, encontre o botão de reinicialização na parte traseira do roteador e mantenha-o pressionado por 20 segundos.'),
  ('Como habilitar a função de economia de energia na ONU Fiberhome 04-FA?', 'Para habilitar a função de economia de energia na ONU Fiberhome 04-FA, vá para as configurações de energia na interface de administração e siga as instruções.'),
  ('Como configurar uma rede de convidados no Roteador ZTE AC Dual-Band?', 'Para configurar uma rede de convidados no Roteador ZTE AC Dual-Band, acesse a interface de administração e encontre as configurações de rede de convidados. Feito isso, coloque o nome desejado em SSID e a senha em PASSWORD'),
  ('Como melhorar a segurança da rede no Roteador TP-Link C6?', 'Para melhorar a segurança da rede no Roteador TP-Link C6, ative recursos como firewall, filtragem de MAC e alteração frequente de senha.'),
  ('Como restaurar as configurações de fábrica na ONU Fiberhome 02-B?', 'Para restaurar as configurações de fábrica na ONU Fiberhome 02-B, acesse a interface de administração e encontre a opção de restauração de fábrica nas configurações. Certifique-se de fazer backup de suas configurações antes disso.'),
  ('Qual a fonte que o Roteador ZTE AC Dual-Band utiliza?', 'Fonte 12v 1.5a'),
  ('Qual a fonte que o Roteador TP-Link C6 utiliza?', 'Fonte 12v 1.5a'),
  ('Qual a fonte que o Roteador RG-1200 Intelbras utiliza?', 'Fonte 12v 1.0a'),
  ('Qual a fonte que o Roteador TP-Link C5 utiliza?', 'Fonte 12v 1.0a'),
  ('Qual a fonte que a ONU Fiberhome 02-B utiliza?', 'Fonte 12v 1.0a'),
  ('Qual a fonte que a ONU Fiberhome 04-FA utiliza?', 'Fonte 12v 1.5a'),
  ('Qual a velocidade máxima suportada pelo Roteador RG-1200 Intelbras?', 'Velocidade máxima de 400Mbps no Wi-Fi e 1Gbps em conexão cabeada'),
  ('Qual a velocidade máxima suportada pelo Roteador ZTE AC Dual-Band?', 'Velocidade máxima de 550Mbps no Wi-Fi e 1Gbps em conexão cabeada'),
  ('Qual a velocidade máxima suportada pelo Roteador TP-Link C5?', 'Velocidade máxima de 400Mbps no Wi-Fi e 1Gbps em conexão cabeada'),
  ('Qual a velocidade máxima suportada pelo Roteador TP-Link C6?', 'Velocidade máxima de 500Mbps no Wi-Fi e 1Gbps em conexão cabeada'),
  ('Qual a velocidade máxima suportada pela ONU Fiberhome 04-FA com tecnologia Wi-Fi 5?', 'Velocidade máxima de 500Mbps no Wi-Fi e 1.2Gbps em conexão cabeada'),
  ('Qual a velocidade máxima suportada pela ONU Fiberhome 04-FA com tecnologia Wi-Fi 6?', 'Velocidade máxima de 900Mbps no Wi-Fi e 1.5Gbps em conexão cabeada');



-- Associação de FAQs a equipamentos
INSERT INTO faq_has_equipamento (id_faq, id_equipamento)
VALUES
  (1, 1),
  (2, 1),
  (3, 2),
  (4, 3),
  (5, 6),
  (6, 5),
  (7, 4),
  (8, 6),
  (9, 3),
  (10, 2),
  (11, 5),
  (12, 3),
  (13, 2),
  (14, 1),
  (15, 4),
  (16, 6),
  (17, 5),
  (18, 1),
  (19, 3),
  (20, 4),
  (21, 2),
  (22, 6),
  (23, 6),
  (22,5);