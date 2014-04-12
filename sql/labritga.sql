-- phpMyAdmin SQL Dump
-- version 4.0.6deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Sam 12 Avril 2014 à 17:16
-- Version du serveur: 5.5.35-0ubuntu0.13.10.1
-- Version de PHP: 5.5.3-1ubuntu2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `labritga`
--

-- --------------------------------------------------------

--
-- Structure de la table `BestJoueur`
--

CREATE TABLE IF NOT EXISTS `BestJoueur` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdJoueur` int(11) NOT NULL,
  `nbVote` int(11) NOT NULL DEFAULT '0',
  `Date` date NOT NULL,
  `IdWeekEnd` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdJoueur` (`IdJoueur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `Championnat`
--

CREATE TABLE IF NOT EXISTS `Championnat` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `Championnat`
--

INSERT INTO `Championnat` (`Id`, `Nom`) VALUES
(1, 'Promotion 1ere division'),
(2, '2eme Division');

-- --------------------------------------------------------

--
-- Structure de la table `Equipe`
--

CREATE TABLE IF NOT EXISTS `Equipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(100) COLLATE utf8_bin NOT NULL,
  `Victoire` int(11) NOT NULL,
  `Nul` int(11) NOT NULL,
  `Defaite` int(11) NOT NULL,
  `Penality` int(11) NOT NULL DEFAULT '0',
  `ButPour` int(11) NOT NULL,
  `ButContre` int(11) NOT NULL,
  `IdChampionnat` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `IdChampionnat` (`IdChampionnat`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Contenu de la table `Equipe`
--

INSERT INTO `Equipe` (`id`, `Nom`, `Victoire`, `Nul`, `Defaite`, `Penality`, `ButPour`, `ButContre`, `IdChampionnat`) VALUES
(1, 'Labrit 1', 12, 4, 1, 0, 54, 12, 1),
(2, 'St Medard US', 9, 3, 2, 0, 27, 12, 1),
(3, 'St Martin Geloux', 7, 4, 6, 0, 27, 26, 1),
(4, 'Pontonx AS 2', 5, 2, 8, 0, 20, 28, 1),
(5, 'St Justin ', 4, 5, 6, 0, 23, 31, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Joueur`
--

CREATE TABLE IF NOT EXISTS `Joueur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(100) COLLATE utf8_bin NOT NULL,
  `Prenom` varchar(100) COLLATE utf8_bin NOT NULL,
  `Photo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `nbBut` int(11) NOT NULL DEFAULT '0',
  `nbPasse` int(11) NOT NULL DEFAULT '0',
  `IdChampionnat` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IdChamp` (`IdChampionnat`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `Joueur`
--

INSERT INTO `Joueur` (`id`, `Nom`, `Prenom`, `Photo`, `nbBut`, `nbPasse`, `IdChampionnat`) VALUES
(1, 'Perrier', 'Alexandre', './images/photo.jpg', 10, 2, 1),
(2, 'Passeurieux', 'Arthur', './images/photo.jpg', 9, 4, 1),
(3, 'Deluzan', 'Etienne', './images/photo.jpg', 6, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Matchs`
--

CREATE TABLE IF NOT EXISTS `Matchs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdEquipeLocale` int(11) NOT NULL,
  `IdEquipeVisiteur` int(11) NOT NULL,
  `ScoreEquipe1` int(11) NOT NULL DEFAULT '0',
  `ScoreEquipe2` int(11) NOT NULL DEFAULT '0',
  `Date` date NOT NULL,
  `Journee` int(11) NOT NULL DEFAULT '0',
  `IsFinished` int(11) NOT NULL DEFAULT '0',
  `IsBegun` int(11) NOT NULL DEFAULT '0',
  `IdChampionnat` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdEquipeLocale` (`IdEquipeLocale`),
  KEY `IdEquipeVisiteur` (`IdEquipeVisiteur`),
  KEY `IdChampionnat` (`IdChampionnat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `Matchs`
--

INSERT INTO `Matchs` (`Id`, `IdEquipeLocale`, `IdEquipeVisiteur`, `ScoreEquipe1`, `ScoreEquipe2`, `Date`, `Journee`, `IsFinished`, `IsBegun`, `IdChampionnat`) VALUES
(1, 1, 2, 3, 1, '2014-03-30', 18, 1, 1, 1),
(2, 1, 5, 5, 0, '2013-09-08', 1, 1, 1, 1),
(3, 1, 3, 0, 0, '2014-04-13', 19, 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `News`
--

CREATE TABLE IF NOT EXISTS `News` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Titre` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Image` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `News`
--

INSERT INTO `News` (`id`, `Titre`, `Description`, `Image`) VALUES
(1, 'Lancement Application', 'Bonjour à tous je vous annonce le lancement de la toute nouvelle application mobile des Guas D''albret !\r\n', './images/lancement.jpg');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `BestJoueur`
--
ALTER TABLE `BestJoueur`
  ADD CONSTRAINT `BestJoueur_ibfk_1` FOREIGN KEY (`IdJoueur`) REFERENCES `Joueur` (`id`);

--
-- Contraintes pour la table `Equipe`
--
ALTER TABLE `Equipe`
  ADD CONSTRAINT `Equipe_ibfk_1` FOREIGN KEY (`IdChampionnat`) REFERENCES `Championnat` (`Id`);

--
-- Contraintes pour la table `Joueur`
--
ALTER TABLE `Joueur`
  ADD CONSTRAINT `Joueur_ibfk_1` FOREIGN KEY (`IdChampionnat`) REFERENCES `Championnat` (`Id`);

--
-- Contraintes pour la table `Matchs`
--
ALTER TABLE `Matchs`
  ADD CONSTRAINT `Matchs_ibfk_1` FOREIGN KEY (`IdEquipeLocale`) REFERENCES `Equipe` (`id`),
  ADD CONSTRAINT `Matchs_ibfk_2` FOREIGN KEY (`IdEquipeVisiteur`) REFERENCES `Equipe` (`id`),
  ADD CONSTRAINT `Matchs_ibfk_3` FOREIGN KEY (`IdChampionnat`) REFERENCES `Championnat` (`Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
