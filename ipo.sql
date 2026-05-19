-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Tempo de geração: 19-Maio-2026 às 11:48
-- Versão do servidor: 8.4.9
-- versão do PHP: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dados: `ipo`
--
CREATE DATABASE IF NOT EXISTS `ipo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ipo`;

DELIMITER $$
--
-- Procedimentos
--
DROP PROCEDURE IF EXISTS `gerar_clientes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gerar_clientes` (IN `quantidade` INT)   BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE nif_base INT;

    WHILE i <= quantidade DO
        
        -- Gera um número aleatório de 8 dígitos
        SET nif_base = FLOOR(10000000 + (RAND() * 89999999));

        INSERT INTO cliente (nome, morada, nif)
        VALUES (
            CONCAT('Nome Zpto', i),
            CONCAT('Rua Exemplo Nº ', i),
            CONCAT('2', nif_base)  -- NIF começa por 2
        );

        SET i = i + 1;

    END WHILE;

END$$

DROP PROCEDURE IF EXISTS `gerar_inspetores`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gerar_inspetores` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE nome_aleatorio VARCHAR(100);
    DECLARE email_aleatorio VARCHAR(150);

    WHILE i <= 50 DO
        
        -- Gera nome tipo Inspetor Xpto + número aleatório
        SET nome_aleatorio = CONCAT('Inspetor_', FLOOR(1 + (RAND() * 1000)));

        -- Gera email baseado no nome + número incremental
        SET email_aleatorio = CONCAT(LOWER(nome_aleatorio), i, '@empresa.pt');

        INSERT INTO inspetor (nome, email)
        VALUES (nome_aleatorio, email_aleatorio);

        SET i = i + 1;

    END WHILE;

END$$

DROP PROCEDURE IF EXISTS `mostra_nifs_duplicados`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostra_nifs_duplicados` ()   BEGIN

	SELECT * FROM vw_nifs_duplicados;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `codcli` int NOT NULL,
  `nome` varchar(150) NOT NULL,
  `morada` text NOT NULL,
  `nif` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`codcli`, `nome`, `morada`, `nif`) VALUES
(1, 'Nome Zpto1', 'Rua Exemplo Nº 1', '219016320'),
(3, 'Nome Zpto3', 'Rua Exemplo Nº 3', '221512351'),
(4, 'Nome Zpto4', 'Rua Exemplo Nº 4', '298424975'),
(5, 'Nome Zpto5', 'Rua Exemplo Nº 5', '257587826'),
(6, 'Nome Zpto6', 'Rua Exemplo Nº 6', '272664209'),
(7, 'Nome Zpto7', 'Rua Exemplo Nº 7', '290557569'),
(8, 'Nome Zpto8', 'Rua Exemplo Nº 8', '244795225'),
(9, 'Nome Zpto9', 'Rua Exemplo Nº 9', '232303421'),
(10, 'Nome Zpto10', 'Rua Exemplo Nº 10', '217131434'),
(11, 'Nome Zpto11', 'Rua Exemplo Nº 11', '268746908'),
(12, 'Nome Zpto12', 'Rua Exemplo Nº 12', '212340246'),
(13, 'Nome Zpto13', 'Rua Exemplo Nº 13', '225460507'),
(14, 'Nome Zpto14', 'Rua Exemplo Nº 14', '280281801'),
(15, 'Nome Zpto15', 'Rua Exemplo Nº 15', '245027491'),
(16, 'Nome Zpto16', 'Rua Exemplo Nº 16', '264292055'),
(17, 'Nome Zpto17', 'Rua Exemplo Nº 17', '286377805'),
(18, 'Nome Zpto18', 'Rua Exemplo Nº 18', '249012867'),
(19, 'Nome Zpto19', 'Rua Exemplo Nº 19', '265930920'),
(20, 'Nome Zpto20', 'Rua Exemplo Nº 20', '282616006'),
(21, 'Nome Zpto21', 'Rua Exemplo Nº 21', '225287273'),
(22, 'Nome Zpto22', 'Rua Exemplo Nº 22', '248588348'),
(23, 'Nome Zpto23', 'Rua Exemplo Nº 23', '267079927'),
(24, 'Nome Zpto24', 'Rua Exemplo Nº 24', '289634593'),
(25, 'Nome Zpto25', 'Rua Exemplo Nº 25', '256933191'),
(26, 'Nome Zpto26', 'Rua Exemplo Nº 26', '295762178'),
(27, 'Nome Zpto27', 'Rua Exemplo Nº 27', '228011321'),
(28, 'Nome Zpto28', 'Rua Exemplo Nº 28', '222770074'),
(29, 'Nome Zpto29', 'Rua Exemplo Nº 29', '219816411'),
(30, 'Nome Zpto30', 'Rua Exemplo Nº 30', '220771835'),
(31, 'Nome Zpto31', 'Rua Exemplo Nº 31', '234409947'),
(32, 'Nome Zpto32', 'Rua Exemplo Nº 32', '299734230'),
(33, 'Nome Zpto33', 'Rua Exemplo Nº 33', '225441320'),
(34, 'Nome Zpto34', 'Rua Exemplo Nº 34', '288003909'),
(35, 'Nome Zpto35', 'Rua Exemplo Nº 35', '283695590'),
(36, 'Nome Zpto36', 'Rua Exemplo Nº 36', '254466228'),
(37, 'Nome Zpto37', 'Rua Exemplo Nº 37', '211244374'),
(38, 'Nome Zpto38', 'Rua Exemplo Nº 38', '262823186'),
(39, 'Nome Zpto39', 'Rua Exemplo Nº 39', '290382815'),
(40, 'Nome Zpto40', 'Rua Exemplo Nº 40', '273444523'),
(41, 'Nome Zpto41', 'Rua Exemplo Nº 41', '286074171'),
(42, 'Nome Zpto42', 'Rua Exemplo Nº 42', '220037292'),
(43, 'Nome Zpto43', 'Rua Exemplo Nº 43', '211963948'),
(44, 'Nome Zpto44', 'Rua Exemplo Nº 44', '279707865'),
(45, 'Nome Zpto45', 'Rua Exemplo Nº 45', '282647486'),
(46, 'Nome Zpto46', 'Rua Exemplo Nº 46', '274113842'),
(47, 'Nome Zpto47', 'Rua Exemplo Nº 47', '222626754'),
(48, 'Nome Zpto48', 'Rua Exemplo Nº 48', '260792246'),
(49, 'Nome Zpto49', 'Rua Exemplo Nº 49', '246080974'),
(50, 'Nome Zpto50', 'Rua Exemplo Nº 50', '238028135'),
(51, 'Nome Zpto51', 'Rua Exemplo Nº 51', '241897755'),
(52, 'Nome Zpto52', 'Rua Exemplo Nº 52', '285404375'),
(53, 'Nome Zpto53', 'Rua Exemplo Nº 53', '221328615'),
(54, 'Nome Zpto54', 'Rua Exemplo Nº 54', '220429950'),
(55, 'Nome Zpto55', 'Rua Exemplo Nº 55', '228163908'),
(56, 'Nome Zpto56', 'Rua Exemplo Nº 56', '269529693'),
(57, 'Nome Zpto57', 'Rua Exemplo Nº 57', '273156749'),
(58, 'Nome Zpto58', 'Rua Exemplo Nº 58', '257194668'),
(59, 'Nome Zpto59', 'Rua Exemplo Nº 59', '256503095'),
(60, 'Nome Zpto60', 'Rua Exemplo Nº 60', '210931478'),
(61, 'Nome Zpto61', 'Rua Exemplo Nº 61', '255148103'),
(62, 'Nome Zpto62', 'Rua Exemplo Nº 62', '252946089'),
(63, 'Nome Zpto63', 'Rua Exemplo Nº 63', '289286140'),
(64, 'Nome Zpto64', 'Rua Exemplo Nº 64', '297592436'),
(65, 'Nome Zpto65', 'Rua Exemplo Nº 65', '230103767'),
(66, 'Nome Zpto66', 'Rua Exemplo Nº 66', '227741527'),
(67, 'Nome Zpto67', 'Rua Exemplo Nº 67', '238396336'),
(68, 'Nome Zpto68', 'Rua Exemplo Nº 68', '298757102'),
(69, 'Nome Zpto69', 'Rua Exemplo Nº 69', '298596508'),
(70, 'Nome Zpto70', 'Rua Exemplo Nº 70', '296711238'),
(71, 'Nome Zpto71', 'Rua Exemplo Nº 71', '287766673'),
(72, 'Nome Zpto72', 'Rua Exemplo Nº 72', '248699654'),
(73, 'Nome Zpto73', 'Rua Exemplo Nº 73', '260198254'),
(74, 'Nome Zpto74', 'Rua Exemplo Nº 74', '254892311'),
(75, 'Nome Zpto75', 'Rua Exemplo Nº 75', '283866798'),
(76, 'Nome Zpto76', 'Rua Exemplo Nº 76', '264657063'),
(77, 'Nome Zpto77', 'Rua Exemplo Nº 77', '261684923'),
(78, 'Nome Zpto78', 'Rua Exemplo Nº 78', '214453430'),
(79, 'Nome Zpto79', 'Rua Exemplo Nº 79', '257212381'),
(80, 'Nome Zpto80', 'Rua Exemplo Nº 80', '252701620'),
(81, 'Nome Zpto81', 'Rua Exemplo Nº 81', '281870962'),
(82, 'Nome Zpto82', 'Rua Exemplo Nº 82', '261249955'),
(83, 'Nome Zpto83', 'Rua Exemplo Nº 83', '250636891'),
(84, 'Nome Zpto84', 'Rua Exemplo Nº 84', '259434596'),
(85, 'Nome Zpto85', 'Rua Exemplo Nº 85', '245262309'),
(86, 'Nome Zpto86', 'Rua Exemplo Nº 86', '238007761'),
(87, 'Nome Zpto87', 'Rua Exemplo Nº 87', '244251883'),
(88, 'Nome Zpto88', 'Rua Exemplo Nº 88', '297236135'),
(89, 'Nome Zpto89', 'Rua Exemplo Nº 89', '273425030'),
(90, 'Nome Zpto90', 'Rua Exemplo Nº 90', '265416747'),
(91, 'Nome Zpto91', 'Rua Exemplo Nº 91', '296808651'),
(92, 'Nome Zpto92', 'Rua Exemplo Nº 92', '297793018'),
(93, 'Nome Zpto93', 'Rua Exemplo Nº 93', '298539142'),
(94, 'Nome Zpto94', 'Rua Exemplo Nº 94', '299316662'),
(95, 'Nome Zpto95', 'Rua Exemplo Nº 95', '210965887'),
(96, 'Nome Zpto96', 'Rua Exemplo Nº 96', '216879451'),
(97, 'Nome Zpto97', 'Rua Exemplo Nº 97', '241499595'),
(98, 'Nome Zpto98', 'Rua Exemplo Nº 98', '256859627'),
(99, 'Nome Zpto99', 'Rua Exemplo Nº 99', '259799355');

-- --------------------------------------------------------

--
-- Estrutura da tabela `empregados`
--

DROP TABLE IF EXISTS `empregados`;
CREATE TABLE `empregados` (
  `id` int NOT NULL,
  `idloja` int NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `funcao` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `inspecao`
--

DROP TABLE IF EXISTS `inspecao`;
CREATE TABLE `inspecao` (
  `codinspecao` int NOT NULL,
  `codcli` int NOT NULL,
  `codmatricula` varchar(8) NOT NULL,
  `codinspetor` int NOT NULL,
  `datainspecao` date NOT NULL,
  `numerofaltas` int NOT NULL,
  `descricaofaltas` text NOT NULL,
  `aprovado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `inspetor`
--

DROP TABLE IF EXISTS `inspetor`;
CREATE TABLE `inspetor` (
  `codinspetor` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `inspetor`
--

INSERT INTO `inspetor` (`codinspetor`, `nome`, `email`) VALUES
(1, 'Inspetor_930', 'inspetor_9301@empresa.pt'),
(2, 'Inspetor_290', 'inspetor_2902@empresa.pt'),
(3, 'Inspetor_662', 'inspetor_6623@empresa.pt'),
(4, 'Inspetor_440', 'inspetor_4404@empresa.pt'),
(5, 'Inspetor_210', 'inspetor_2105@empresa.pt'),
(6, 'Inspetor_733', 'inspetor_7336@empresa.pt'),
(7, 'Inspetor_33', 'inspetor_337@empresa.pt'),
(8, 'Inspetor_965', 'inspetor_9658@empresa.pt'),
(9, 'Inspetor_727', 'inspetor_7279@empresa.pt'),
(10, 'Inspetor_740', 'inspetor_74010@empresa.pt'),
(11, 'Inspetor_520', 'inspetor_52011@empresa.pt'),
(12, 'Inspetor_376', 'inspetor_37612@empresa.pt'),
(13, 'Inspetor_323', 'inspetor_32313@empresa.pt'),
(14, 'Inspetor_483', 'inspetor_48314@empresa.pt'),
(15, 'Inspetor_448', 'inspetor_44815@empresa.pt'),
(16, 'Inspetor_788', 'inspetor_78816@empresa.pt'),
(17, 'Inspetor_597', 'inspetor_59717@empresa.pt'),
(18, 'Inspetor_620', 'inspetor_62018@empresa.pt'),
(19, 'Inspetor_310', 'inspetor_31019@empresa.pt'),
(20, 'Inspetor_690', 'inspetor_69020@empresa.pt'),
(21, 'Inspetor_518', 'inspetor_51821@empresa.pt'),
(22, 'Inspetor_521', 'inspetor_52122@empresa.pt'),
(23, 'Inspetor_52', 'inspetor_5223@empresa.pt'),
(24, 'Inspetor_693', 'inspetor_69324@empresa.pt'),
(25, 'Inspetor_310', 'inspetor_31025@empresa.pt'),
(26, 'Inspetor_469', 'inspetor_46926@empresa.pt'),
(27, 'Inspetor_416', 'inspetor_41627@empresa.pt'),
(28, 'Inspetor_671', 'inspetor_67128@empresa.pt'),
(29, 'Inspetor_106', 'inspetor_10629@empresa.pt'),
(30, 'Inspetor_517', 'inspetor_51730@empresa.pt'),
(31, 'Inspetor_266', 'inspetor_26631@empresa.pt'),
(32, 'Inspetor_781', 'inspetor_78132@empresa.pt'),
(33, 'Inspetor_106', 'inspetor_10633@empresa.pt'),
(34, 'Inspetor_185', 'inspetor_18534@empresa.pt'),
(35, 'Inspetor_607', 'inspetor_60735@empresa.pt'),
(36, 'Inspetor_478', 'inspetor_47836@empresa.pt'),
(37, 'Inspetor_571', 'inspetor_57137@empresa.pt'),
(38, 'Inspetor_422', 'inspetor_42238@empresa.pt'),
(39, 'Inspetor_393', 'inspetor_39339@empresa.pt'),
(40, 'Inspetor_701', 'inspetor_70140@empresa.pt'),
(41, 'Inspetor_326', 'inspetor_32641@empresa.pt'),
(42, 'Inspetor_524', 'inspetor_52442@empresa.pt'),
(43, 'Inspetor_642', 'inspetor_64243@empresa.pt'),
(44, 'Inspetor_636', 'inspetor_63644@empresa.pt'),
(45, 'Inspetor_256', 'inspetor_25645@empresa.pt'),
(46, 'Inspetor_371', 'inspetor_37146@empresa.pt'),
(47, 'Inspetor_88', 'inspetor_8847@empresa.pt'),
(48, 'Inspetor_325', 'inspetor_32548@empresa.pt'),
(49, 'Inspetor_359', 'inspetor_35949@empresa.pt'),
(50, 'Inspetor_821', 'inspetor_82150@empresa.pt');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lojas`
--

DROP TABLE IF EXISTS `lojas`;
CREATE TABLE `lojas` (
  `stamp` int NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `local` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `telefone` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca` (
  `codmarca` int NOT NULL,
  `marca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `marca`
--

INSERT INTO `marca` (`codmarca`, `marca`) VALUES
(1, 'Toyota'),
(2, 'Volkswagen'),
(3, 'Chevrolet'),
(4, 'Ford'),
(5, 'Honda'),
(6, 'Hyundai'),
(7, 'Nissan'),
(8, 'BMW'),
(9, 'Mercedes-Benz'),
(10, 'Audi'),
(11, 'Kia'),
(12, 'Peugeot'),
(13, 'Renault'),
(14, 'Fiat'),
(15, 'Jeep'),
(16, 'Mitsubishi'),
(17, 'Volvo'),
(18, 'Porsche'),
(19, 'Land Rover'),
(20, 'Jaguar'),
(21, 'Subaru'),
(22, 'Mazda'),
(23, 'Suzuki'),
(24, 'Citroën'),
(25, 'Chery'),
(26, 'BYD'),
(27, 'Tesla'),
(28, 'Ram'),
(29, 'GMC'),
(30, 'Cadillac'),
(31, 'Lexus'),
(32, 'Infiniti'),
(33, 'Acura'),
(34, 'Mini'),
(35, 'Dodge'),
(36, 'Chrysler'),
(37, 'Alfa Romeo'),
(38, 'Ferrari'),
(39, 'Lamborghini'),
(40, 'Maserati'),
(41, 'Bentley'),
(42, 'Rolls-Royce'),
(43, 'Aston Martin'),
(44, 'Bugatti'),
(45, 'McLaren'),
(46, 'Troller'),
(47, 'SsangYong'),
(48, 'Geely'),
(49, 'Great Wall'),
(50, 'Haval'),
(51, 'JAC'),
(52, 'GWM'),
(53, 'Cupra'),
(54, 'Seat'),
(55, 'Skoda'),
(56, 'Genesis'),
(57, 'Rivian'),
(58, 'Lucid'),
(59, 'Polestar'),
(60, 'Smart'),
(61, 'Iveco'),
(62, 'Scania'),
(63, 'MAN'),
(64, 'DAF'),
(65, 'Isuzu'),
(66, 'Hino'),
(67, 'Foton'),
(68, 'Agrale'),
(69, 'Kawasaki'),
(70, 'Yamaha'),
(71, 'Harley-Davidson'),
(72, 'Ducati'),
(73, 'Triumph'),
(74, 'Royal Enfield'),
(75, 'BMW Motorrad'),
(76, '_aiai');

-- --------------------------------------------------------

--
-- Estrutura da tabela `proprietario_veiculo`
--

DROP TABLE IF EXISTS `proprietario_veiculo`;
CREATE TABLE `proprietario_veiculo` (
  `idProProprietarioVeiculo` int NOT NULL,
  `idProprietario` int NOT NULL,
  `idVeiculo` int NOT NULL,
  `dono` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
CREATE TABLE `veiculo` (
  `codveiculo` int NOT NULL,
  `codmatricula` varchar(8) NOT NULL,
  `codcli` int NOT NULL,
  `codmarca` int NOT NULL,
  `datalivrete` date NOT NULL,
  `anofabrico` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_nifs_duplicados`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `vw_nifs_duplicados`;
CREATE TABLE `vw_nifs_duplicados` (
`nif` varchar(10)
,`num` bigint
);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codcli`),
  ADD KEY `nif` (`nif`);

--
-- Índices para tabela `empregados`
--
ALTER TABLE `empregados`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `inspecao`
--
ALTER TABLE `inspecao`
  ADD PRIMARY KEY (`codinspecao`),
  ADD KEY `codcli` (`codcli`),
  ADD KEY `codmatricula` (`codmatricula`),
  ADD KEY `codinspetor` (`codinspetor`),
  ADD KEY `datainspecao` (`datainspecao`);

--
-- Índices para tabela `inspetor`
--
ALTER TABLE `inspetor`
  ADD PRIMARY KEY (`codinspetor`);

--
-- Índices para tabela `lojas`
--
ALTER TABLE `lojas`
  ADD PRIMARY KEY (`stamp`);

--
-- Índices para tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`codmarca`);

--
-- Índices para tabela `proprietario_veiculo`
--
ALTER TABLE `proprietario_veiculo`
  ADD PRIMARY KEY (`idProProprietarioVeiculo`),
  ADD KEY `idProprietario` (`idProprietario`,`idVeiculo`),
  ADD KEY `idVeiculo` (`idVeiculo`);

--
-- Índices para tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`codveiculo`),
  ADD KEY `codmatricula` (`codmatricula`),
  ADD KEY `codcli` (`codcli`),
  ADD KEY `codmarca` (`codmarca`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codcli` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008002;

--
-- AUTO_INCREMENT de tabela `empregados`
--
ALTER TABLE `empregados`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `inspecao`
--
ALTER TABLE `inspecao`
  MODIFY `codinspecao` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `inspetor`
--
ALTER TABLE `inspetor`
  MODIFY `codinspetor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de tabela `lojas`
--
ALTER TABLE `lojas`
  MODIFY `stamp` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `codmarca` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de tabela `proprietario_veiculo`
--
ALTER TABLE `proprietario_veiculo`
  MODIFY `idProProprietarioVeiculo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `codveiculo` int NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_nifs_duplicados`
--
DROP TABLE IF EXISTS `vw_nifs_duplicados`;

DROP VIEW IF EXISTS `vw_nifs_duplicados`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_nifs_duplicados`  AS SELECT `c`.`nif` AS `nif`, count(`c`.`nif`) AS `num` FROM `cliente` AS `c` WHERE (ifnull((select count(`c1`.`nif`) from `cliente` `c1` where (`c1`.`nif` = `c`.`nif`)),0) > 1) GROUP BY `c`.`nif` ORDER BY count(`c`.`nif`) DESC ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
