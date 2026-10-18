-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2026 a las 04:09:17
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
-- Base de datos: `tienda_maquillaje`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL,
  `nombre_marca` varchar(50) NOT NULL,
  `pais_origen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `nombre_marca`, `pais_origen`) VALUES
(1, 'Rare Beauty', 'Estados Unidos'),
(2, 'Maybelline', 'Estados Unidos'),
(3, 'Fenty Beauty', 'Estados Unidos'),
(4, 'L`Oréal Paris', 'Francia'),
(5, 'NARS', 'Francia'),
(6, 'MAC Cosmetics', 'Canadá'),
(7, 'Charlotte Tilbury', 'Reino Unido'),
(8, 'NYX Professional', 'Estados Unidos'),
(9, 'KVD Beauty', 'Estados Unidos'),
(10, 'Too Faced', 'Estados Unidos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `precio` decimal(8,2) NOT NULL,
  `id_marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `categoria`, `precio`, `id_marca`) VALUES
(1, 'Soft Pinch Liquid Blush', 'Rostro', 23.00, 1),
(2, 'Lash Sensational Sky High Mascara', 'Ojos', 11.50, 2),
(3, 'Gloss Bomb Universal Lip Luminizer', 'Labios', 21.00, 3),
(4, 'Infallible Fresh Wear Foundation', 'Rostro', 15.99, 4),
(5, 'Radiant Creamy Concealer', 'Rostro', 32.00, 5),
(6, 'Studio Fix Fluid SPF 15', 'Rostro', 39.00, 6),
(7, 'Pillow Talk Lipstick', 'Labios', 35.00, 7),
(8, 'Butter Gloss Lip Gloss', 'Labios', 6.00, 8),
(9, 'Tattoo Liner Liquid Eyeliner', 'Ojos', 23.00, 9),
(10, 'Better Than Sex Mascara', 'Ojos', 28.00, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `nombre_cliente` varchar(100) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_venta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `nombre_cliente`, `id_producto`, `cantidad`, `fecha_venta`) VALUES
(1, 'Sofía Martínez', 1, 2, '2026-09-01'),
(2, 'Camila Hernández', 3, 1, '2026-10-05'),
(3, 'Valeria Gómez', 2, 3, '2026-07-03'),
(4, 'Mariana López', 5, 1, '2026-03-15'),
(5, 'Andrea Torres', 7, 1, '2026-09-12'),
(6, 'Lucía Ramírez', 8, 4, '2026-10-06'),
(7, 'Daniela Flores', 10, 1, '2026-02-07'),
(8, 'Gabriela Morales', 4, 2, '2026-10-27'),
(9, 'Fernanda Castillo', 9, 1, '2026-08-09'),
(10, 'Vanessa Gonzales', 6, 1, '2026-06-10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
