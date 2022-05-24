-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  Dim 29 août 2021 à 20:45
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `aenv3`
--

-- --------------------------------------------------------

--
-- Structure de la table `accoustique`
--

CREATE TABLE `accoustique` (
  `code` varchar(3) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `day` float DEFAULT NULL,
  `night` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `accoustique`
--

INSERT INTO `accoustique` (`code`, `name`, `day`, `night`) VALUES
('1', 'Accoustique 1', 1.3, 4),
('2', 'Accoustique 2', 1.2, 1.8),
('3', 'Accoustique 3', 1.15, 1.725),
('4', 'Accoustique 4', 1, 1.5),
('5a', 'Accoustique 5a', 0.85, 1.275),
('5b', 'Accoustique 5b', 0.7, 1.05);

-- --------------------------------------------------------

--
-- Structure de la table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_ref` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `carts`
--

INSERT INTO `carts` (`id`, `user_ref`) VALUES
(2, 1),
(3, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `cart_products`
--

CREATE TABLE `cart_products` (
  `id` int(11) NOT NULL,
  `cart_ref` int(11) NOT NULL,
  `product_ref` varchar(255) NOT NULL,
  `reservedate` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_ref` int(11) DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL,
  `ht` float DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `ttc` float DEFAULT NULL,
  `state` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `user_ref`, `date`, `ht`, `tva`, `ttc`, `state`) VALUES
(1, 2, '2021-08-29', NULL, NULL, NULL, 1),
(2, 2, '2021-08-29', NULL, NULL, NULL, 2),
(3, 3, '2021-08-29', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `order_products`
--

CREATE TABLE `order_products` (
  `id` int(11) NOT NULL,
  `order_ref` int(11) DEFAULT NULL,
  `product_ref` varchar(255) DEFAULT NULL,
  `reservedate` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `order_products`
--

INSERT INTO `order_products` (`id`, `order_ref`, `product_ref`, `reservedate`) VALUES
(1, 1, 'MONOUNI', '2021-09-04'),
(2, 1, 'MONOWEEK', '2021-09-05'),
(3, 1, 'MONOSEM', '2021-09-03'),
(4, 2, 'MONOMEN', '2021-09-05'),
(5, 2, 'MONOMEN', '2021-09-04'),
(6, 3, 'MONOUNI', '2021-08-31'),
(7, 3, 'MONOSEM', '2021-09-05'),
(8, 3, 'MONOMEN', '2021-09-03');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `reference` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `ht` float DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `ttc` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`reference`, `name`, `type`, `description`, `ht`, `tva`, `ttc`) VALUES
('MONOWEEK', 'Mono-turbine/Bi-turbine', 'Week-end/JF (non basé)', 'Redevance d\'atterrissage', 34.5, 6.9, 41.4),
('MONOSEM', 'Mono-turbine/Bi-turbine', 'Semaine (non basé)	', 'Redevance d\'atterrissage', 31.17, 6.23, 37.4),
('MONOMEN', 'Mono-turbine/Bi-turbine', 'Avion basé (mensuel)	', 'Redevance d\'atterrissage', 113, 22, 135.6),
('MONOUNI', 'Mono-turbine/Bi-turbine', 'Avion basé (unité)', 'Redevance d\'atterrissage', 15.25, 3.05, 18.3),
('REACWEE', 'Réacteur', 'Week-end/JF (non basé)	', 'Redevance d\'atterrissage', 41.17, 8.23, 49.4),
('REACSEM', 'Réacteur', 'Semaine (non basé)	', 'Redevance d\'atterrissage', 31.17, 7.43, 44.6),
('REACMEN', 'Réacteur', 'Avion basé (mensuel)	', 'Redevance d\'atterrissage', 120, 24, 144),
('REACUNI', 'Réacteur', 'Avion basé (unité)	', 'Redevance d\'atterrissage', 18, 3.6, 21.6);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `birthdate` varchar(10) NOT NULL,
  `rank` int(11) DEFAULT '1',
  `address` varchar(255) DEFAULT NULL,
  `zipcode` varchar(15) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `registerdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `firstname`, `lastname`, `birthdate`, `rank`, `address`, `zipcode`, `country`, `registerdate`) VALUES
(1, 'alexis.moyse@gmail.com', 'e315ceef29e03c0360070a952eba732306ba3f7c', 'Alexis', 'Moyse', '29/04/1999', 2, '17 rue de Pontault', '77330', 'France', '2021-08-28 16:16:37'),
(2, 'ora@ora.com', '1d7d2b9598ffcb9ff6a5cbaaedb5d2f83b9e032b', 'ora', 'ora', '01/01/1910', 2, '1 rue ora', '12345', 'Ora', '2021-08-29 09:50:18'),
(3, 'muda@muda.com', '3d5742579c6ede16a4dfb22ceb4fd49c1629d6ae', 'muda', 'muda', '22/11/1987', 2, '2 rue muda', '77777', 'France', '2021-08-29 20:18:55');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accoustique`
--
ALTER TABLE `accoustique`
  ADD PRIMARY KEY (`code`);

--
-- Index pour la table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_ref` (`user_ref`);

--
-- Index pour la table `cart_products`
--
ALTER TABLE `cart_products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_ref` (`user_ref`);

--
-- Index pour la table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_ref` (`order_ref`),
  ADD KEY `product_ref` (`product_ref`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`reference`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `cart_products`
--
ALTER TABLE `cart_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
