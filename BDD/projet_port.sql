-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 14 déc. 2022 à 09:32
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_port`
--

-- --------------------------------------------------------

--
-- Structure de la table `acheminement`
--

CREATE TABLE `acheminement` (
  `idAch` int(11) NOT NULL,
  `idTra` int(11) NOT NULL,
  `idCli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `acheminement`
--

INSERT INTO `acheminement` (`idAch`, `idTra`, `idCli`) VALUES
(1, 2, 2),
(2, 1, 1),
(3, 4, 3),
(4, 3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `armateur`
--

CREATE TABLE `armateur` (
  `idArm` int(11) NOT NULL,
  `nom_arm` varchar(50) NOT NULL,
  `idTra` int(11) NOT NULL,
  `siret_arm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `armateur`
--

INSERT INTO `armateur` (`idArm`, `nom_arm`, `idTra`, `siret_arm`) VALUES
(1, 'fuji', 2, 2213),
(2, 'mezza', 1, 3129),
(3, 'MaritimeTrans', 3, 5980),
(4, 'Armatrans', 4, 327);

-- --------------------------------------------------------

--
-- Structure de la table `bateau`
--

CREATE TABLE `bateau` (
  `idBat` int(11) NOT NULL,
  `capacite_max` int(11) DEFAULT NULL,
  `nb_emplacement` int(11) DEFAULT NULL,
  `idArm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bateau`
--

INSERT INTO `bateau` (`idBat`, `capacite_max`, `nb_emplacement`, `idArm`) VALUES
(1, 1500, 500, 1),
(2, 1000, 800, 2),
(3, 500, 150, 4),
(4, 1500, 900, 3);

-- --------------------------------------------------------

--
-- Structure de la table `cargaison`
--

CREATE TABLE `cargaison` (
  `idCar` int(11) NOT NULL,
  `jour_depart` datetime NOT NULL,
  `idBat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cargaison`
--

INSERT INTO `cargaison` (`idCar`, `jour_depart`, `idBat`) VALUES
(1, '2022-12-30 12:00:00', 1),
(2, '2022-12-26 22:00:00', 2),
(6, '2023-03-17 16:20:00', 3),
(7, '2023-01-31 16:50:00', 4);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idCli` int(11) NOT NULL,
  `nom_cli` varchar(50) DEFAULT NULL,
  `prenom_cli` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idCli`, `nom_cli`, `prenom_cli`) VALUES
(1, 'lord', 'kev'),
(2, 'chev', 'rom'),
(3, 'SAKURABA', 'Raymond'),
(4, 'Jones', 'Jim');

-- --------------------------------------------------------

--
-- Structure de la table `conteneur`
--

CREATE TABLE `conteneur` (
  `idCon` int(11) NOT NULL,
  `longueur` int(11) DEFAULT NULL,
  `largeur` int(11) DEFAULT NULL,
  `hauteur` int(11) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `poids_vide` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `conteneur`
--

INSERT INTO `conteneur` (`idCon`, `longueur`, `largeur`, `hauteur`, `volume`, `poids_vide`) VALUES
(1, 5, 2, 2, 33, 2.2),
(2, 12, 2, 2, 67, 3.7);

-- --------------------------------------------------------

--
-- Structure de la table `contenu_conteneur`
--

CREATE TABLE `contenu_conteneur` (
  `idContenu` int(11) NOT NULL,
  `idCar` int(11) NOT NULL,
  `idCon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `contenu_conteneur`
--

INSERT INTO `contenu_conteneur` (`idContenu`, `idCar`, `idCon`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 6, 2),
(4, 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `destination`
--

CREATE TABLE `destination` (
  `idDes` int(11) NOT NULL,
  `nom_des` varchar(50) DEFAULT NULL,
  `idAch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `destination`
--

INSERT INTO `destination` (`idDes`, `nom_des`, `idAch`) VALUES
(3, 'shanghai', 1),
(4, 'kelang', 2),
(5, 'Fort-de-France', 3),
(6, 'Antononina', 4);

-- --------------------------------------------------------

--
-- Structure de la table `est_contenu_dans`
--

CREATE TABLE `est_contenu_dans` (
  `id_car` int(11) NOT NULL,
  `id_ach` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `est_contenu_dans`
--

INSERT INTO `est_contenu_dans` (`id_car`, `id_ach`) VALUES
(1, 1),
(2, 2),
(6, 3),
(7, 4);

-- --------------------------------------------------------

--
-- Structure de la table `marchandise`
--

CREATE TABLE `marchandise` (
  `idMar` int(11) NOT NULL,
  `nom_mar` varchar(50) DEFAULT NULL,
  `longueur` double NOT NULL,
  `poids` double NOT NULL,
  `largeur` double NOT NULL,
  `hauteur` double NOT NULL,
  `fragile` tinyint(1) DEFAULT NULL,
  `idAch` int(11) NOT NULL,
  `idContenu` int(11) NOT NULL,
  `idTra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `marchandise`
--

INSERT INTO `marchandise` (`idMar`, `nom_mar`, `longueur`, `poids`, `largeur`, `hauteur`, `fragile`, `idAch`, `idContenu`, `idTra`) VALUES
(1, 'voiture', 5, 2.2, 2, 2, NULL, 1, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `transitaire`
--

CREATE TABLE `transitaire` (
  `idTra` int(11) NOT NULL,
  `nom_tra` varchar(50) NOT NULL,
  `siret_tra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `transitaire`
--

INSERT INTO `transitaire` (`idTra`, `nom_tra`, `siret_tra`) VALUES
(1, 'express', 123),
(2, 'coliss', 122),
(3, 'TransLogistics', 1234),
(4, 'Seafroid', 5643);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acheminement`
--
ALTER TABLE `acheminement`
  ADD PRIMARY KEY (`idAch`),
  ADD KEY `idTra` (`idTra`),
  ADD KEY `idCli` (`idCli`);

--
-- Index pour la table `armateur`
--
ALTER TABLE `armateur`
  ADD PRIMARY KEY (`idArm`),
  ADD KEY `idTra` (`idTra`);

--
-- Index pour la table `bateau`
--
ALTER TABLE `bateau`
  ADD PRIMARY KEY (`idBat`),
  ADD KEY `idArm` (`idArm`);

--
-- Index pour la table `cargaison`
--
ALTER TABLE `cargaison`
  ADD PRIMARY KEY (`idCar`),
  ADD KEY `idBat` (`idBat`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idCli`);

--
-- Index pour la table `conteneur`
--
ALTER TABLE `conteneur`
  ADD PRIMARY KEY (`idCon`);

--
-- Index pour la table `contenu_conteneur`
--
ALTER TABLE `contenu_conteneur`
  ADD PRIMARY KEY (`idContenu`),
  ADD KEY `idCar` (`idCar`),
  ADD KEY `idCon` (`idCon`);

--
-- Index pour la table `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`idDes`),
  ADD KEY `idAch` (`idAch`);

--
-- Index pour la table `est_contenu_dans`
--
ALTER TABLE `est_contenu_dans`
  ADD PRIMARY KEY (`id_car`,`id_ach`),
  ADD KEY `id_ach` (`id_ach`),
  ADD KEY `id_car` (`id_car`);

--
-- Index pour la table `marchandise`
--
ALTER TABLE `marchandise`
  ADD PRIMARY KEY (`idMar`),
  ADD KEY `idAch` (`idAch`),
  ADD KEY `idContenu` (`idContenu`),
  ADD KEY `idTra` (`idTra`);

--
-- Index pour la table `transitaire`
--
ALTER TABLE `transitaire`
  ADD PRIMARY KEY (`idTra`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acheminement`
--
ALTER TABLE `acheminement`
  MODIFY `idAch` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `armateur`
--
ALTER TABLE `armateur`
  MODIFY `idArm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `bateau`
--
ALTER TABLE `bateau`
  MODIFY `idBat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `cargaison`
--
ALTER TABLE `cargaison`
  MODIFY `idCar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `idCli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `conteneur`
--
ALTER TABLE `conteneur`
  MODIFY `idCon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `contenu_conteneur`
--
ALTER TABLE `contenu_conteneur`
  MODIFY `idContenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `destination`
--
ALTER TABLE `destination`
  MODIFY `idDes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `marchandise`
--
ALTER TABLE `marchandise`
  MODIFY `idMar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `transitaire`
--
ALTER TABLE `transitaire`
  MODIFY `idTra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `acheminement`
--
ALTER TABLE `acheminement`
  ADD CONSTRAINT `acheminement_ibfk_1` FOREIGN KEY (`idTra`) REFERENCES `transitaire` (`idTra`),
  ADD CONSTRAINT `acheminement_ibfk_2` FOREIGN KEY (`idCli`) REFERENCES `client` (`idCli`);

--
-- Contraintes pour la table `armateur`
--
ALTER TABLE `armateur`
  ADD CONSTRAINT `armateur_ibfk_1` FOREIGN KEY (`idTra`) REFERENCES `transitaire` (`idTra`);

--
-- Contraintes pour la table `bateau`
--
ALTER TABLE `bateau`
  ADD CONSTRAINT `bateau_ibfk_1` FOREIGN KEY (`idArm`) REFERENCES `armateur` (`idArm`);

--
-- Contraintes pour la table `cargaison`
--
ALTER TABLE `cargaison`
  ADD CONSTRAINT `cargaison_ibfk_1` FOREIGN KEY (`idBat`) REFERENCES `bateau` (`idBat`);

--
-- Contraintes pour la table `contenu_conteneur`
--
ALTER TABLE `contenu_conteneur`
  ADD CONSTRAINT `contenu_conteneur_ibfk_1` FOREIGN KEY (`idCar`) REFERENCES `cargaison` (`idCar`),
  ADD CONSTRAINT `contenu_conteneur_ibfk_2` FOREIGN KEY (`idCon`) REFERENCES `conteneur` (`idCon`);

--
-- Contraintes pour la table `destination`
--
ALTER TABLE `destination`
  ADD CONSTRAINT `destination_ibfk_1` FOREIGN KEY (`idAch`) REFERENCES `acheminement` (`idAch`);

--
-- Contraintes pour la table `est_contenu_dans`
--
ALTER TABLE `est_contenu_dans`
  ADD CONSTRAINT `est_contenu_dans_ibfk_1` FOREIGN KEY (`id_car`) REFERENCES `cargaison` (`idCar`),
  ADD CONSTRAINT `est_contenu_dans_ibfk_2` FOREIGN KEY (`id_ach`) REFERENCES `acheminement` (`idAch`);

--
-- Contraintes pour la table `marchandise`
--
ALTER TABLE `marchandise`
  ADD CONSTRAINT `marchandise_ibfk_1` FOREIGN KEY (`idAch`) REFERENCES `acheminement` (`idAch`),
  ADD CONSTRAINT `marchandise_ibfk_2` FOREIGN KEY (`idContenu`) REFERENCES `contenu_conteneur` (`idContenu`),
  ADD CONSTRAINT `marchandise_ibfk_3` FOREIGN KEY (`idTra`) REFERENCES `transitaire` (`idTra`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
