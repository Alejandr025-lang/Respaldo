-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-05-2026 a las 17:06:38
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mundial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `confederacion`
--

CREATE TABLE `confederacion` (
  `id_confederacion` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `siglas` varchar(10) NOT NULL,
  `region` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `confederacion`
--

INSERT INTO `confederacion` (`id_confederacion`, `nombre`, `siglas`, `region`) VALUES
(7, 'el máximo organismo del fútbol europeo, responsable de gestionar, promover y des', 'UEFA', 'Europa'),
(8, 'organismo rector del fútbol en América del Sur y la confederación continental má', 'CONMEBOL', 'America'),
(9, 'es una de las seis confederaciones de la FIFA, fundada en 1961. ', 'Concacaf', 'Norte america,centro america y el caribe'),
(10, ' es el organismo rector del fútbol, fútbol sala y fútbol playa en la mayor parte', 'AFC', 'Asia, Australia, Guam y las Islas Marianas del Norte.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id_equipo` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `codigo_fifa` char(3) NOT NULL,
  `entrenador` varchar(100) NOT NULL,
  `id_confederacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id_equipo`, `nombre`, `codigo_fifa`, `entrenador`, `id_confederacion`) VALUES
(1, 'Mexico', 'MEX', 'Aguirre', 9),
(2, 'ARGENTINA', 'ARG', 'scaloni', 8),
(3, 'COLOMBIA', 'COL', 'Pedro', 8),
(4, 'JAPON', 'JAP', 'Yamoto', 10),
(5, 'España', 'ESP', 'De la fuente', 7),
(6, 'Portugal', 'POR', 'Jose', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadio`
--

CREATE TABLE `estadio` (
  `id_estadio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ciudad` varchar(80) NOT NULL,
  `pais` varchar(80) NOT NULL,
  `capacidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadio`
--

INSERT INTO `estadio` (`id_estadio`, `nombre`, `ciudad`, `pais`, `capacidad`) VALUES
(1, 'CAMP NOU', 'BARCELONA', 'ESPAÑA', 105000),
(2, 'Santiago Bernabeu', 'Madrid', 'España', 83186),
(3, 'Estadio Banorte', 'Ciudad de Mexico', 'Mexico', 87000),
(4, 'Metropolitano', 'Madrid', 'España\r\n', 70460);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `id_jugador` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `posicion` varchar(30) NOT NULL,
  `numero_dorsal` tinyint(4) NOT NULL,
  `Fecha_nac` date NOT NULL,
  `id_equipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`id_jugador`, `nombre`, `posicion`, `numero_dorsal`, `Fecha_nac`, `id_equipo`) VALUES
(1, 'Armando Gonzalez', 'Delantero', 13, '1997-05-30', 1),
(2, 'Tala Rangel', 'Portero', 1, '1997-03-25', 1),
(3, 'Messi', 'Delantero', 10, '1985-06-24', 2),
(4, 'Cuti Romero', 'Defensa', 25, '1993-02-15', 2),
(5, 'Luis Diaz', 'Delantero', 7, '1999-11-24', 3),
(6, 'Lamine Yamal', 'Delantero', 19, '2006-07-13', 5),
(7, 'Pedri', 'Centrocampista', 8, '2003-09-26', 5),
(8, 'Cristiano Ronaldo', 'Delantero', 7, '1985-02-05', 6),
(9, 'Nuno Mendes', 'Defensa', 25, '1998-03-25', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido`
--

CREATE TABLE `partido` (
  `id_partido` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `fase` varchar(30) NOT NULL,
  `goles_local` tinyint(4) NOT NULL,
  `goles_visitante` tinyint(4) NOT NULL,
  `id_estadio` int(11) NOT NULL,
  `id_local` int(11) NOT NULL,
  `id_visitante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `confederacion`
--
ALTER TABLE `confederacion`
  ADD PRIMARY KEY (`id_confederacion`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id_equipo`),
  ADD KEY `id_confederacion` (`id_confederacion`);

--
-- Indices de la tabla `estadio`
--
ALTER TABLE `estadio`
  ADD PRIMARY KEY (`id_estadio`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`id_jugador`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `partido`
--
ALTER TABLE `partido`
  ADD PRIMARY KEY (`id_partido`),
  ADD KEY `id_visitante` (`id_visitante`),
  ADD KEY `id_local` (`id_local`),
  ADD KEY `id_estadio` (`id_estadio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `confederacion`
--
ALTER TABLE `confederacion`
  MODIFY `id_confederacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `estadio`
--
ALTER TABLE `estadio`
  MODIFY `id_estadio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `id_jugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `partido`
--
ALTER TABLE `partido`
  MODIFY `id_partido` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`id_confederacion`) REFERENCES `confederacion` (`id_confederacion`);

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `jugador_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id_equipo`);

--
-- Filtros para la tabla `partido`
--
ALTER TABLE `partido`
  ADD CONSTRAINT `partido_ibfk_1` FOREIGN KEY (`id_estadio`) REFERENCES `estadio` (`id_estadio`),
  ADD CONSTRAINT `partido_ibfk_2` FOREIGN KEY (`id_local`) REFERENCES `equipo` (`id_equipo`),
  ADD CONSTRAINT `partido_ibfk_3` FOREIGN KEY (`id_visitante`) REFERENCES `equipo` (`id_equipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
