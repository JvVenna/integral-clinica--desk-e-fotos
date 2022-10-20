-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Jun-2022 às 15:36
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_paciente_consulta_medico`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbconsultas`
--

CREATE TABLE `tbconsultas` (
  `clcodigo` int(11) NOT NULL,
  `cldata` varchar(30) DEFAULT NULL,
  `clhorario` varchar(30) DEFAULT NULL,
  `clcpf` int(11) NOT NULL,
  `clcrm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tblogin`
--

CREATE TABLE `tblogin` (
  `nome` varchar(30) DEFAULT NULL,
  `clsenha` int(11) DEFAULT NULL,
  `clcodigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tblogin`
--

INSERT INTO `tblogin` (`nome`, `clsenha`, `clcodigo`) VALUES
('1', 1, 1),
('2', 2, 2),
('3', 3, 3),
('lucas souza', 123456, 8),
('1', 1, 123),
('João Victor', 1, 362);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbloginadm`
--

CREATE TABLE `tbloginadm` (
  `codigo` int(11) NOT NULL,
  `senha` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbloginadm`
--

INSERT INTO `tbloginadm` (`codigo`, `senha`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbmedicamentos`
--

CREATE TABLE `tbmedicamentos` (
  `nome` varchar(40) DEFAULT NULL,
  `codigo` int(11) NOT NULL,
  `tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbmedicamentos`
--

INSERT INTO `tbmedicamentos` (`nome`, `codigo`, `tipo`) VALUES
('Remedio', 4, 2),
('7', 79, 7),
('Novalgina', 123, 2),
('jorge', 9709, 8),
('Rivotril', 2147483647, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbmedicos`
--

CREATE TABLE `tbmedicos` (
  `data_nascimento` varchar(10) DEFAULT NULL,
  `nome` varchar(50) DEFAULT 'NOT NULL',
  `crm` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbmedicos`
--

INSERT INTO `tbmedicos` (`data_nascimento`, `nome`, `crm`) VALUES
('432243', 'fghjfg', 2),
('54354', 'joao', 123),
('uihui', 'jlkdjfd', 1231),
('564364', 'joao', 23424),
('6675', 'hjkhjhjk', 65567),
('4523', 'yujhng', 453253),
('23/03/2004', 'João Victor Venancio', 2147483647);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbpacientes`
--

CREATE TABLE `tbpacientes` (
  `nome` varchar(50) DEFAULT NULL,
  `cpf` int(100) NOT NULL,
  `data_nascimento` varchar(10) DEFAULT NULL,
  `cep` int(100) DEFAULT NULL,
  `numero_casa` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbconsultas`
--
ALTER TABLE `tbconsultas`
  ADD PRIMARY KEY (`clcodigo`),
  ADD KEY `fk_tbconsultas_to_tbmedicos` (`clcrm`),
  ADD KEY `fk_tbconsultas_to_tbpacientes` (`clcpf`);

--
-- Índices para tabela `tblogin`
--
ALTER TABLE `tblogin`
  ADD PRIMARY KEY (`clcodigo`);

--
-- Índices para tabela `tbloginadm`
--
ALTER TABLE `tbloginadm`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `tbmedicamentos`
--
ALTER TABLE `tbmedicamentos`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `tbmedicos`
--
ALTER TABLE `tbmedicos`
  ADD PRIMARY KEY (`crm`);

--
-- Índices para tabela `tbpacientes`
--
ALTER TABLE `tbpacientes`
  ADD PRIMARY KEY (`cpf`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbconsultas`
--
ALTER TABLE `tbconsultas`
  ADD CONSTRAINT `fk_tbconsultas_to_tbmedicos` FOREIGN KEY (`clcrm`) REFERENCES `tbmedicos` (`crm`),
  ADD CONSTRAINT `fk_tbconsultas_to_tbpacientes` FOREIGN KEY (`clcpf`) REFERENCES `tbpacientes` (`cpf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
