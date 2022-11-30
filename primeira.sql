-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 30-Nov-2022 às 01:30
-- Versão do servidor: 8.0.27
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `primeira`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `nome`, `senha`, `createdAt`, `updatedAt`) VALUES
(1, 'sabryna18@gmail.com', 'Sabryna Rodrigues', '123456789', '2022-11-15 01:36:30', '2022-11-15 01:36:30'),
(2, 'raquelsobin@gmail.com', 'Raquel Gomes', '05122000', '2022-11-15 01:49:17', '2022-11-15 01:49:17'),
(3, 'migueldarksouls@gmail.com', 'Miguel Silva', '13012020', '2022-11-15 01:52:46', '2022-11-15 01:52:46'),
(4, 'thiagogeo12@gmail.com', 'Thiago', 'geografia12', '2022-11-17 21:58:08', '2022-11-17 21:58:08'),
(5, 'eeeeeeeeeeee@gmail.com', 'Erick Nunes', '123456', '2022-11-17 22:22:36', '2022-11-17 22:22:36'),
(6, 'julia13@gmail.com', 'Julia Julia', '123456789', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'maisaamanda@gmail.com', 'Maisa Amanda', 'maisamaisa1313', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'soobindimples@gmail.com', 'Daniel', 'soobin2019', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, '', 'a', 'a', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
