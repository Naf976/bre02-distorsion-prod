-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 01 juil. 2024 à 11:40
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bre02-distorsion-prod`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Videogames'),
(2, 'Movies'),
(3, 'Books');

-- --------------------------------------------------------

--
-- Structure de la table `channels`
--

DROP TABLE IF EXISTS `channels`;
CREATE TABLE IF NOT EXISTS `channels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `channels`
--

INSERT INTO `channels` (`id`, `name`, `category_id`) VALUES
(1, 'Mass Effect', 1),
(2, 'World of Warcraft', 1),
(3, 'Baldur\'s Gate', 1),
(4, 'His Dark Materials', 3),
(5, 'Harry Potter', 3),
(6, 'Star Wars', 2),
(7, 'Matrix', 2);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `name`, `url`) VALUES
(1, 'moi-carre.jpg', 'assets/uploads/icnCfMes.jpg'),
(3, 'hugues-rond-150.png', 'assets/uploads/knApfMMm.png');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(2047) NOT NULL,
  `channel_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `content`, `channel_id`, `user_id`, `created_at`) VALUES
(1, 'Did you hear that? They\'ve shut down the main reactor. We\'ll be destroyed for sure. This is madness! We\'re doomed! There\'ll be no escape for the Princess this time. What\'s that? Artoo! Artoo-Detoo, where are you? At last! Where have you been? They\'re heading in this direction.', 6, 1, '2023-12-09 15:09:44'),
(2, 'It\'s like a second language for me, I\'m as fluent in. All right shut up! I\'ll take this one. Luke, take these two over to the garage, will you? I want you to have both of them cleaned up before dinner. But I was going into Toshi Station to pick up some power converters. You can waste time with your friends when your chores are done. Now come on, get to it! All right, come on! And the red one, come on.', 6, 2, '2023-12-14 15:10:00'),
(3, 'It\'s a short range fighter. There aren\'t any bases around here. Where did it come from? It sure is leaving in a big hurry. If they identify us, we\'re in big trouble. Not if I can help it.', 6, 2, '2023-12-14 15:10:15'),
(4, 'But it also obeys your commands. Hokey religions and ancient weapons are no match for a good blaster at your side, kid. You don\'t believe in the Force, do you? Kid, I\'ve flown from one side of this galaxy to the other. I\'ve seen a lot of strange stuff, but I\'ve never seen anything to make me believe there\'s one all-powerful force controlling everything. There\'s no mystical energy field that controls my destiny.', 6, 1, '2024-01-17 15:10:36'),
(5, 'Set your course for Princess Leia\'s home planet of Alderaan. With pleasure. Lock the door, Artoo. All right, check that side of the street. It\'s secure. Move on to the next door.', 6, 2, '2024-02-01 10:33:49'),
(14, 'red or blue ?\r\n        ', 7, 2, '2024-02-05 15:39:25'),
(15, 'you have weird taste in wines\r\n        ', 7, 1, '2024-02-05 15:40:37');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(5) NOT NULL,
  `image_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `image_id` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `image_id`) VALUES
(1, 'Gaëllan', '$2y$10$EY10XcXe/AcOj.myv/sF6ONh99fP.qUWlNL.4M0oDbOUW0JI1p2tS', 'ADMIN', 1),
(2, 'Lufolas', '$2y$10$EY10XcXe/AcOj.myv/sF6ONh99fP.qUWlNL.4M0oDbOUW0JI1p2tS', 'USER', 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `channels`
--
ALTER TABLE `channels`
  ADD CONSTRAINT `channels_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `media` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
