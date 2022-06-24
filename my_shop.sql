-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : ven. 24 juin 2022 à 11:45
-- Version du serveur :  5.7.34
-- Version de PHP : 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `my_shop`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Colliers'),
(2, 'Boucles d\'oreilles'),
(3, 'Bagues'),
(4, 'Bracelets');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220204085847', '2022-02-04 08:59:28', 364),
('DoctrineMigrations\\Version20220204090352', '2022-02-04 09:03:58', 149);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `date`, `address`) VALUES
(1, 5, '2022-03-22 10:26:14', '5 rue karina'),
(2, 5, '2022-03-22 10:45:56', '5 rue karina');

-- --------------------------------------------------------

--
-- Structure de la table `order_line`
--

CREATE TABLE `order_line` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_line`
--

INSERT INTO `order_line` (`id`, `product_id`, `orders_id`, `quantity`, `price`) VALUES
(1, 17, 1, 1, 29),
(2, 10, 2, 1, 29);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `photo`, `price`, `description`) VALUES
(1, 1, 'Collier Glitter Heart', '1_necklace_glitter_heart.png', 39.9, 'Le collier Glitter Heart est orné d\'une alternance de petits cœurs et de pierres semi-précieuses rondes. \r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L \r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nPierres semi-précieuses : Zirconium (blanches)\r\nLongueur : réglable, 40 à 45 cm'),
(2, 1, 'Collier Kalea Heart', '2_necklace_kalea_heart.png', 35.9, 'Le collier Kalea Heart ressemble à notre collier Kalea très prisé, mais au lieu d\'avoir des petits pendentifs ronds, il a cinq adorables pendentifs en forme de cœur.  \r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L \r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nLongueur : réglable, 40 à 45 cm'),
(3, 1, 'Collier Spirit', '3_necklace_spirit.png', 29.9, 'Collier large en forme de boucle, parfait pour tout type de look.\r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L \r\n\r\nLongueur : 55 cm\r\nLargeur : 6 mm'),
(4, 1, 'Collier Sun', '4_necklace_sun.png', 39.9, 'Le collier Sun ajoutera de l\'élégance à n\'importe quelle tenue. Habillée ou décontractée, l\'allure intemporelle du collier associée à son pendentif branché accentuera chaque encolure. \r\n\r\nRésistant à l\'eau et à la décoloration, pas besoin de s\'inquiéter de perdre la valeur que ce collier apporte à n\'importe quelle tenue.\r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L\r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nLongueur : Réglable de 50 cm à 55 cm\r\nTaille du pendentif : 18 mm'),
(5, 1, 'Collier World Map', '5_necklace_worldmap_gold.png', 35.9, 'Notre collier World Map est un must absolu ! \r\n\r\nPas seulement pour les voyageurs et les passionnés d\'aventure, mais pour tout le monde ! Et c\'est exactement à quoi cet accessoire mignon te fera penser tous les jours.\r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L\r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nLongueur : réglable, 40 cm à 45 cm\r\nPendentif : 17 mm (diamètre)'),
(6, 1, 'Collier Fashion Show', '6_necklace_fashion_show_gold.png', 39.9, 'Le collier Fashion Show, très à la mode, attire les regards ! Les mailles du collier, de tailles différentes, présentent de fines hachures supplémentaires à leur surface et reposent agréablement sur la peau. Le collier est également parfait pour créer des looks superposés sympas. \r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L\r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nLongueur : réglable, 50 cm à 55 cm'),
(7, 1, 'Collier Loli', '7_necklace_loli_gold.png', 32.31, 'Notre nouvelle collection PURELEI x Kim est enfin arrivée.\r\n\r\nEnsemble, nous avons créé des bijoux qui t\'invitent à rêver. Le collier Loli complète la collection avec un bijou simple mais classe. Un must et une base idéale pour d\'innombrables styles de combinaison !\r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L\r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nLongueur : réglable, 40 cm à 45 cm'),
(8, 1, 'Collier Luna', '8_necklace_luna_gold.png', 39.9, 'Côté sombre de la Lune.\r\n\r\nLe collier Luna en deux partis avec des pendentifs en forme de petites lunes est un incontournable ! La lune est le satellite naturel le plus visible dans le ciel après le soleil, et est profondément enracinée dans la culture hawaïenne. C\'est le collier polyvalent parfait pour ta vie de tous les jours, il donne un sentiment de vacances et s\'adapte à toutes tes tenues !\r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L\r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nLongueur : réglable, 35 cm à 40 cm'),
(9, 2, 'Boucles d\'oreilles Glamorous', '1_earring_glamorous.png', 19.9, 'Les boucles d\'oreilles Glamorous sont l\'accessoire idéal pour toute occasion. Les créoles brillantes iront avec tous tes looks. \r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L \r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nTaille : 28 mm (diamètre), largeur 4,9 mm\r\nPoids : 19,39 g'),
(10, 2, 'Boucles d\'oreilles Ke Kai', '2_earring_kekai_gold.png', 29.9, 'Les boucles d\'oreilles Ke Kai sont un véritable accessoire spécial. La légère torsion des boucles d\'oreilles en fait la pièce maîtresse de ta tenue et attire à coup sûr tous les regards sur toi !\r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L\r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nTaille : 42 mm (diamètre)'),
(11, 2, 'Boucles d\'oreilles Malhini', '3_earring_malihini_gold.png', 25.9, 'Les boucles d\'oreilles Malihini sont stylées et audacieuses avec un design unique qui attirera tous les regards. Elles sont également exemptées d\'irritation et résistantes à l\'eau grâce à la durabilité de l\'Acier inoxydable 316L.\r\n\r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L\r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats'),
(12, 2, 'Boucles d\'oreilles Naia', '4_earring_naia.png', 32.31, 'Les mignonnes créoles aux charmes rayonnants en forme de coquillage insufflent une dose supplémentaire de mer à chaque regard ! Sur la plage, dans la piscine ou sous l\'eau : avec les boucles d\'oreilles Naia, tu emportes toujours la mer avec toi.\r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L\r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nA propos : ces bijoux sont également étanches comme d\'habitude, de sorte que vous pouvez plonger dans l\'eau sans aucun souci.'),
(13, 2, 'Boucles d\'oreilles Karma', '5_earring_karma_gold.png', 29.9, 'Le design des boucles d\'oreilles Karma délivre parfaitement la signification du karma : Le cercle symbolise le cycle de la vie et nous rappelle également que chacune de nos actions aboutit à une action différente. On récolte ce que l\'on a semé !\r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L\r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nTaille : 15 mm (diamètre)'),
(14, 2, 'Boucles d\'oreilles Honu', '6_earring_honu.png', 35.9, 'Extravagantes et belles : découvre nos nouvelles Opulent Hoops !\r\n\r\nTu aimes les bijoux insolites ? Les surprenantes boucles d’oreilles Honu attirent tous les regards et te donnent un look cool et expressif.\r\n\r\nAu fait : ce bijou est composé de perles naturelles. Celles-ci peuvent différer légèrement en forme, taille et couleur - tu reçois un bijou unique.\r\n\r\nMatériel\r\nOr : Acier inoxydable 316L plaqué or 18 carats\r\nArgent : Acier inoxydable 316L\r\nOr rose : Acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nPerles : perles d\'eau douce (blanches)\r\nTaille des créoles : 26 mm (diamètre)\r\nHauteur totale : 43 mm'),
(15, 2, 'Boucles d\'oreilles Aina', '7_earring_aina.png', 39.9, 'Créoles avec des perles. \r\n\r\nMatériel\r\n\r\nOr : Acier inoxydable 316L plaqué or 18 carats\r\nArgent :   Acier inoxydable 316L \r\nOr rose :  Acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nPerles : eau douce, acier inoxydable\r\n\r\nDiamètre des créoles : 22 mm \r\nTaille des perles : environ 4 mm \r\n\r\nBilles en métal : 1,8 mm et 3 mm\r\n\r\nRemarque : Les perles étant des produits naturels, leur forme et leur couleur peuvent varier légèrement.'),
(16, 2, 'Boucles d\'oreilles Kauwela', '8_earring_kauwela.png', 35.9, 'Boucles d\'oreilles abstraites avec pendentif en perle.\r\n\r\nMatériel\r\n\r\nOr : Acier inoxydable 316L plaqué or 18 carats\r\nArgent :   Acier inoxydable 316L \r\nOr rose :  Acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nPerles : Keshi\r\n\r\nTaille des boucles d\'oreilles : 20 mm \r\nLongueur des perles : 10 mm \r\n\r\nRemarque : Les perles étant des produits naturels, leur forme et leur couleur peuvent varier légèrement.'),
(17, 3, 'Bague Hope', '1_ring_hope.png', 29.9, 'Cette bague légèrement mobile est complétée par une pierre précieuse de couleur. Portée seule ou en combinaison, elle attirera tous les regards !\r\n\r\nMatériel\r\nOr : Acier inoxydable 316L plaqué or 18 carats\r\nArgent : Acier inoxydable 316L \r\nOr rose : Acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nPierre précieuse : Zircone (verte ; pour l\'or rose : champagne)\r\nÉpaisseur : 4,5 mm\r\n\r\nDisponible en plusieurs tailles.'),
(18, 3, 'Bague Nakuna', '2_ring_nakuna.png', 35.9, 'Rends les fêtes spéciales avec notre nouvelle Festive Collection ! Collaboration exclusive en matière de design avec les sœurs Damm & Palme.\r\n\r\nEgaye ton look festif avec la bague Nakuna. Conçue discrète, mais tout sauf ordinaire en raison de sa forme naturellement incurvée. Cette bague simple est également parfaite pour se combiner avec le look \"hip stacking\". \r\n\r\nComplète ton look de bijou avec le collier Nakuna et les boucles d\'oreilles Nakuna !\r\n\r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L\r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nDisponible en différentes tailles.\r\nLargeur : 4 mm'),
(19, 3, 'Bague Kauwela', '3_ring_kauwela.png', 35.9, 'Bague joliment incurvée avec un design abstrait. \r\n\r\nMatériel\r\n\r\nOr : Acier inoxydable 316L plaqué or 18 carats\r\nArgent :   Acier inoxydable 316L \r\nOr rose :  Acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nPerles : Keshi, verre, acier inoxydable\r\n\r\nDisponible en différentes tailles.'),
(20, 3, 'Bague Pureness Bold', '4_ring_pureness_bold.png', 29.9, 'Avec cette bague, le nom dit tout. Le design épuré est une déclaration en soi.\r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L\r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nDisponible en différentes tailles.'),
(21, 3, 'Bague Malhini', '5_ring_malhini_gold.png', 35.9, 'Combinée ou en solo, la bague Malihini accentue n\'importe quel look avec son style brillant. Résistante à l\'eau, donc pas d\'inquiétude lors tes activités quotidiennes.\r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L \r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nDisponible en différentes tailles.'),
(22, 3, 'Bague Laula', '6_ring_laula.png', 45.9, 'C\'est le moment de briller ! La forme et la disposition asymétriques des pierres font de cette bague un accessoire de très spécial.\r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L\r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nPierres précieuses : Zircone (blanches)'),
(23, 3, 'Bague Precious Fine', '7_ring_precious_fine.png', 35.9, 'La bague torsadée avec la pierre précieuse constitue un bijou délicat.\r\n\r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L\r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nPierre précieuse : Zircone (blanche)\r\n\r\nTaille de la pierre : longueur 3,5 mm, largeur 3,5 mm\r\n\r\nDisponible en différentes tailles.'),
(24, 3, 'Bague Loli', '8_ring_loli_gold.png', 32.31, 'Notre nouvelle collection PURELEI x Kim est enfin arrivée. Ensemble, nous avons créé des bijoux qui vous invitent à rêver.\r\n\r\nLa bague Loli complète la collection avec un bijou simple mais précieux. Elle s\'intègre parfaitement à la saison des fêtes et peut être combiné avec d\'autres bagues.\r\n\r\nMatériel\r\nOr : acier inoxydable 316L plaqué or 18 carats\r\nArgent : acier inoxydable 316L\r\nOr rose : acier inoxydable 316L plaqué or rose 18 carats\r\n\r\nDisponible en différentes tailles.');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `address`, `mail`, `roles`, `last_login`) VALUES
(3, 'admin', '$2y$13$GqVZ88aKGuBWWpiSS20F/.KYqnTWNqT647vBxTg/p9vFUaIqsUBBC', '5 rue admin', 'admin@admin.fr', 'ROLE_ADMIN', '2022-03-17 10:31:42'),
(4, 'a', '$2y$13$iCAJZ34xSmznP7seVYWgKOHS6g7cxbzmS9vcBjvGk/Lj/P0S4Jiou', 'aa', 'a@a.fr', 'ROLE_ADMIN', '2022-03-17 10:37:13'),
(5, 'karina', '$2y$13$9TNC.K.rZYIQB/vdAnOPguREUC0bKv5vhQqvVRpvFmX.tT9dwYRtS', '5 rue karina', 'karina@karina.fr', 'ROLE_ADMIN', '2022-03-22 07:30:49'),
(6, 'toto', '$2y$13$qgZaPQxwwNh9sIqUbr000u1T1KZUcnR2/NTM1GEA0Ke4yQIu5xTDK', 'toto', 'toto@toto.fr', 'ROLE_USER', '2022-03-22 08:27:59'),
(7, 'bla', '$2y$13$9R7TkjKP7gvXIK0Nazj70u0MQHzDlHUMn.EU.oVXEZd/EPbLYZz0C', 'bla', 'bla@bla.fr', 'ROLE_USER', '2022-03-22 08:29:00'),
(8, 'bla', '$2y$13$jT2cnCKCM.e3lwGHsdgBQuadqzIy2iHK0wsKNypP/spKwgScpxzNq', 'bla', 'bla@bla.fr', 'ROLE_USER', '2022-03-22 08:29:27'),
(9, 'b', '$2y$13$QCPUnm.XSv0c6nsoRXc2CenkDRemCexNEXZ1vEf/ifZ3PN1r5A8oC', 'b', 'b', 'ROLE_USER', '2022-03-22 08:36:35'),
(10, 'b', '$2y$13$.8wQZwACYGF6tWVR50D7q.OErb3Mhywb6bnfMGqlwYIhBvnfKKu2m', 'b', 'b', 'ROLE_USER', '2022-03-22 08:36:48');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E52FFDEEA76ED395` (`user_id`);

--
-- Index pour la table `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9CE58EE14584665A` (`product_id`),
  ADD KEY `IDX_9CE58EE1CFFE9AD6` (`orders_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `order_line`
--
ALTER TABLE `order_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_E52FFDEEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `FK_9CE58EE14584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_9CE58EE1CFFE9AD6` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
