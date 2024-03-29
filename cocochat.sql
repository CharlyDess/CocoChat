-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 22-10-2019 a las 15:57:44
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cocochat`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amigos`
--

DROP TABLE IF EXISTS `amigos`;
CREATE TABLE IF NOT EXISTS `amigos` (
  `idAmistad` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idAmigo` int(11) NOT NULL,
  `apodo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idAmistad`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idAmigo` (`idAmigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `amigos`
--

INSERT INTO `amigos` (`idAmistad`, `idUsuario`, `idAmigo`, `apodo`) VALUES
(1, 1, 2, 'amiguis'),
(2, 3, 1, 'amigui1'),
(5, 3, 2, 'amigui2'),
(6, 2, 3, 'esau');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE IF NOT EXISTS `grupos` (
  `idGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idGrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`idGrupo`, `nombre`) VALUES
(1, 'Grupo 1'),
(2, 'Grupo 2'),
(3, ''),
(4, 'asdfas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajesamigos`
--

DROP TABLE IF EXISTS `mensajesamigos`;
CREATE TABLE IF NOT EXISTS `mensajesamigos` (
  `idMensaje` int(11) NOT NULL AUTO_INCREMENT,
  `idAmistad` int(11) NOT NULL,
  `mensaje` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`idMensaje`),
  KEY `idAmistad` (`idAmistad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajesgrupos`
--

DROP TABLE IF EXISTS `mensajesgrupos`;
CREATE TABLE IF NOT EXISTS `mensajesgrupos` (
  `idMensaje` int(11) NOT NULL AUTO_INCREMENT,
  `idGrupo` int(11) NOT NULL,
  `mensaje` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`idMensaje`),
  KEY `idGrupo` (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `username`, `password`, `nombre`) VALUES
(1, 'efra', '123456', 'Efrain '),
(2, '1', '1', '1'),
(3, 'H3lltronik', '123', 'esau'),
(4, 'pacheco', '123', 'diego');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosgrupo`
--

DROP TABLE IF EXISTS `usuariosgrupo`;
CREATE TABLE IF NOT EXISTS `usuariosgrupo` (
  `idRelacion` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idGrupo` int(11) NOT NULL,
  PRIMARY KEY (`idRelacion`),
  KEY `idGrupo` (`idGrupo`),
  KEY `idUsuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD CONSTRAINT `amigoID` FOREIGN KEY (`idAmigo`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarioID` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mensajesamigos`
--
ALTER TABLE `mensajesamigos`
  ADD CONSTRAINT `mensajesamigos_ibfk_1` FOREIGN KEY (`idAmistad`) REFERENCES `amigos` (`idAmistad`);

--
-- Filtros para la tabla `mensajesgrupos`
--
ALTER TABLE `mensajesgrupos`
  ADD CONSTRAINT `mensajesgrupos_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`);

--
-- Filtros para la tabla `usuariosgrupo`
--
ALTER TABLE `usuariosgrupo`
  ADD CONSTRAINT `grupoID` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuariosgrupo_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
