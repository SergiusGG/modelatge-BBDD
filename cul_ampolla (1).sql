-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-07-2020 a las 12:50:07
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cul_ampolla`
--
CREATE DATABASE IF NOT EXISTS `cul_ampolla` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cul_ampolla`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `nom` varchar(20) NOT NULL,
  `adreça_postal` int(11) NOT NULL,
  `telefon` int(11) NOT NULL,
  `correu_electronic` varchar(20) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`nom`, `adreça_postal`, `telefon`, `correu_electronic`, `id_client`) VALUES
('Pepe', 8033, 666666666, 'pepe@pp.com', 1),
('Chiky', 8354, 999999999, 'chiky@mail.com', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `marca` varchar(11) NOT NULL,
  `id_ulleres` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `marca`, `id_ulleres`) VALUES
(3, 'RayBan', 1),
(4, 'Nike', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidor`
--

CREATE TABLE `proveidor` (
  `nom` varchar(20) NOT NULL,
  `telefon` int(11) NOT NULL,
  `fax` int(11) NOT NULL,
  `nif` varchar(10) NOT NULL,
  `id_proveidor` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `carrer` varchar(30) NOT NULL,
  `numero` int(11) NOT NULL,
  `pis` int(11) NOT NULL,
  `porta` varchar(5) NOT NULL,
  `ciutat` varchar(20) NOT NULL,
  `codi_postal` int(11) NOT NULL,
  `pais` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveidor`
--

INSERT INTO `proveidor` (`nom`, `telefon`, `fax`, `nif`, `id_proveidor`, `id_marca`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`) VALUES
('LaCueva', 555555555, 333333333, '7378597H', 1, 4, 'Calle Desengaño', 6, 2, '1', 'Barcelona', 8757, 'España'),
('Daewoo', 222222222, 77777777, '5737593V', 2, 3, 'Montepinar', 21, 5, '3', 'Barcelona', 8535, 'España');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registre`
--

CREATE TABLE `registre` (
  `id_registre` int(11) NOT NULL,
  `data_registre` date NOT NULL,
  `recomanacio` varchar(30) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registre`
--

INSERT INTO `registre` (`id_registre`, `data_registre`, `recomanacio`, `id_cliente`) VALUES
(1, '2020-07-07', 'Arthur', 2),
(2, '2019-12-11', 'Jack', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `treballador`
--

CREATE TABLE `treballador` (
  `id_treballador` int(11) NOT NULL,
  `nom_treballador` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `treballador`
--

INSERT INTO `treballador` (`id_treballador`, `nom_treballador`) VALUES
(1, 'Manuel Garcia'),
(2, 'Joaquín Hernandez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `graduacio` int(11) NOT NULL,
  `muntura` enum('flotant','pasta','metallica','') NOT NULL,
  `color_muntura` varchar(15) NOT NULL,
  `color_vidre_esq` varchar(10) NOT NULL,
  `color_vidre_dret` varchar(10) NOT NULL,
  `preu` int(11) NOT NULL,
  `id_ulleres` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`graduacio`, `muntura`, `color_muntura`, `color_vidre_esq`, `color_vidre_dret`, `preu`, `id_ulleres`) VALUES
(3, 'pasta', 'rojo', 'verde', 'negro', 400, 1),
(2, 'flotant', 'naranja', 'gris', 'negro', 200, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres_clients`
--

CREATE TABLE `ulleres_clients` (
  `id_client` int(11) NOT NULL,
  `id_ulleres` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ulleres_clients`
--

INSERT INTO `ulleres_clients` (`id_client`, `id_ulleres`) VALUES
(2, 1),
(2, 2),
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_treballador`
--

CREATE TABLE `venta_treballador` (
  `id_treballador` int(11) NOT NULL,
  `id_ulleres` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta_treballador`
--

INSERT INTO `venta_treballador` (`id_treballador`, `id_ulleres`) VALUES
(1, 1),
(2, 2),
(2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`),
  ADD KEY `id_ulleres` (`id_ulleres`);

--
-- Indices de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`id_proveidor`),
  ADD KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `registre`
--
ALTER TABLE `registre`
  ADD PRIMARY KEY (`id_registre`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `treballador`
--
ALTER TABLE `treballador`
  ADD PRIMARY KEY (`id_treballador`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ulleres`);

--
-- Indices de la tabla `ulleres_clients`
--
ALTER TABLE `ulleres_clients`
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_ulleres` (`id_ulleres`);

--
-- Indices de la tabla `venta_treballador`
--
ALTER TABLE `venta_treballador`
  ADD KEY `id_treballador` (`id_treballador`),
  ADD KEY `id_ulleres` (`id_ulleres`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  MODIFY `id_proveidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `registre`
--
ALTER TABLE `registre`
  MODIFY `id_registre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `treballador`
--
ALTER TABLE `treballador`
  MODIFY `id_treballador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ulleres` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `marca_ibfk_1` FOREIGN KEY (`id_ulleres`) REFERENCES `ulleres` (`id_ulleres`);

--
-- Filtros para la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD CONSTRAINT `proveidor_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`);

--
-- Filtros para la tabla `registre`
--
ALTER TABLE `registre`
  ADD CONSTRAINT `registre_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id_client`);

--
-- Filtros para la tabla `ulleres_clients`
--
ALTER TABLE `ulleres_clients`
  ADD CONSTRAINT `ulleres_clients_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `ulleres_clients_ibfk_2` FOREIGN KEY (`id_ulleres`) REFERENCES `ulleres` (`id_ulleres`);

--
-- Filtros para la tabla `venta_treballador`
--
ALTER TABLE `venta_treballador`
  ADD CONSTRAINT `venta_treballador_ibfk_1` FOREIGN KEY (`id_treballador`) REFERENCES `treballador` (`id_treballador`),
  ADD CONSTRAINT `venta_treballador_ibfk_2` FOREIGN KEY (`id_ulleres`) REFERENCES `ulleres` (`id_ulleres`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
