-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Abr-2020 às 15:15
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mygames`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `games`
--

CREATE TABLE `games` (
  `g_id` int(11) NOT NULL,
  `g_user` int(11) DEFAULT NULL,
  `g_purchase` date NOT NULL,
  `g_title` varchar(128) NOT NULL,
  `g_description` text NOT NULL,
  `g_media` enum('F','D') NOT NULL DEFAULT 'F' COMMENT 'F = Física, D = Digital',
  `g_platform` int(11) NOT NULL,
  `g_status` enum('1','0') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `games`
--

INSERT INTO `games` (`g_id`, `g_user`, `g_purchase`, `g_title`, `g_description`, `g_media`, `g_platform`, `g_status`) VALUES
(1, 1, '2020-05-08', 'GOD OF WAR ', ' é uma série de jogos eletrônicos de ação-aventura vagamente baseado nas mitologias grega e nórdica sendo criado originalmente por David Jaffe da Santa Monica Studio.', 'F', 3, '1'),
(2, 2, '2020-02-03', 'GTA V', ' O jogo se passa no estado ficcional de San Andreas, com a história da campanha um jogador seguindo três criminosos e seus esforços para realizarem assaltos sob a pressão de uma agência governamental', 'D', 1, '1'),
(3, 1, '2020-03-15', 'PAY DAT 2', 'O jogo trata de uma premissa controversa: assalto a bancos. Você e um grupo de amigos ou desconhecidos devem colaborar para roubar dinheiro e fugir da polícia.', 'F', 1, '1'),
(4, 2, '2019-07-03', 'Battlegrounds', 'BATTLE ROYALE', 'D', 4, '0'),
(5, 2, '2020-05-08', 'PES 2019', 'Jogo de futebol para brincar com os amigos e competir para ganhar jogadores raros com CR7 e MESSI ', 'D', 4, '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `platforms`
--

CREATE TABLE `platforms` (
  `p_id` int(11) NOT NULL,
  `p_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `platforms`
--

INSERT INTO `platforms` (`p_id`, `p_name`) VALUES
(1, 'Xbox 360'),
(2, 'playstation '),
(3, 'playstation 4'),
(4, 'xbox one x');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `u_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `u_name` varchar(128) NOT NULL COMMENT 'Nome que aparece no aplicativo',
  `u_email` varchar(255) NOT NULL,
  `u_password` varchar(30) NOT NULL,
  `u_status` enum('1','0') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`u_id`, `u_date`, `u_name`, `u_email`, `u_password`, `u_status`) VALUES
(1, '2020-04-13 08:43:26', 'Vinicius de Sousa', 'vinicius@gmail.com', '159753', '1'),
(2, '2020-03-16 20:20:38', 'Eurinete Nunes', 'eurinete@gmail.com', 'nunes123', '1');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`g_id`),
  ADD KEY `g_user` (`g_user`),
  ADD KEY `g_platform` (`g_platform`);

--
-- Índices para tabela `platforms`
--
ALTER TABLE `platforms`
  ADD PRIMARY KEY (`p_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `games`
--
ALTER TABLE `games`
  MODIFY `g_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `platforms`
--
ALTER TABLE `platforms`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_ibfk_1` FOREIGN KEY (`g_user`) REFERENCES `users` (`u_id`),
  ADD CONSTRAINT `games_ibfk_2` FOREIGN KEY (`g_platform`) REFERENCES `platforms` (`p_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
