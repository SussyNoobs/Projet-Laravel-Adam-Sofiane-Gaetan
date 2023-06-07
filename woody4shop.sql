-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 04 mai 2023 à 10:43
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `woody4shop`
--

-- --------------------------------------------------------

--
-- Structure de la table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `user_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(2, 3, 1, 1, 49, NULL, NULL),
(10, 3, 2, 5, 245, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subcategory_count` int(11) NOT NULL DEFAULT 0,
  `product_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `slug`, `subcategory_count`, `product_count`, `created_at`, `updated_at`) VALUES
(1, 'Enfants', 'enfants', 1, 5, NULL, '2023-05-04 05:44:53'),
(3, 'Adolescents', 'adolescents', 1, 5, NULL, '2023-05-04 06:20:22'),
(6, 'Adultes', 'adultes', 1, 4, NULL, '2023-05-04 06:16:54');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_03_27_083234_laratrust_setup_tables', 1),
(6, '2023_04_03_064950_create_categories_table', 1),
(7, '2023_04_03_072010_create_subcategories_table', 2),
(8, '2023_04_03_072531_create_products_table', 3),
(9, '2023_04_21_132232_create_carts_table', 4),
(10, '2023_04_23_095932_create_shipping_infos_table', 5),
(11, '2023_04_23_104354_create_orders_table', 6);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userid` int(11) NOT NULL,
  `shipping_phoneNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_postalcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `userid`, `shipping_phoneNumber`, `shipping_city`, `shipping_postalcode`, `product_id`, `quantity`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, '0607080904', 'rdg', '42800', '3', 1, 49, 'pending', NULL, NULL),
(2, 2, '0607080904', 'rdg', '42800', '1', 1, 146, 'pending', NULL, NULL),
(3, 2, '0607080904', 'rdg', '42800', '3', 1, 49, 'pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'users-create', 'Create Users', 'Create Users', '2023-04-03 05:18:21', '2023-04-03 05:18:21'),
(2, 'users-read', 'Read Users', 'Read Users', '2023-04-03 05:18:21', '2023-04-03 05:18:21'),
(3, 'users-update', 'Update Users', 'Update Users', '2023-04-03 05:18:21', '2023-04-03 05:18:21'),
(4, 'users-delete', 'Delete Users', 'Delete Users', '2023-04-03 05:18:21', '2023-04-03 05:18:21'),
(5, 'payments-create', 'Create Payments', 'Create Payments', '2023-04-03 05:18:21', '2023-04-03 05:18:21'),
(6, 'payments-read', 'Read Payments', 'Read Payments', '2023-04-03 05:18:21', '2023-04-03 05:18:21'),
(7, 'payments-update', 'Update Payments', 'Update Payments', '2023-04-03 05:18:21', '2023-04-03 05:18:21'),
(8, 'payments-delete', 'Delete Payments', 'Delete Payments', '2023-04-03 05:18:21', '2023-04-03 05:18:21'),
(9, 'profile-read', 'Read Profile', 'Read Profile', '2023-04-03 05:18:21', '2023-04-03 05:18:21'),
(10, 'profile-update', 'Update Profile', 'Update Profile', '2023-04-03 05:18:21', '2023-04-03 05:18:21');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(9, 2),
(9, 3),
(10, 1),
(10, 2),
(10, 3);

-- --------------------------------------------------------

--
-- Structure de la table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_long_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `product_category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_subcategory_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `product_subcategory_id` int(11) NOT NULL,
  `product_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_short_des`, `product_long_des`, `price`, `product_category_name`, `product_subcategory_name`, `product_category_id`, `product_subcategory_id`, `product_img`, `quantity`, `slug`, `created_at`, `updated_at`) VALUES
(5, 'Jeep De 1930', 'Reconstruisez l\'histoire avec le puzzle 3D de la Jeep de 1930 !', 'Le puzzle 3D de la Jeep de 1930 est un jeu de construction en trois dimensions qui permet de recréer une maquette réaliste de la célèbre voiture militaire américaine. Ce puzzle est un excellent moyen de développer les compétences de résolution de problèmes et de coordination œil-main, tout en apprenant l\'histoire de ce véhicule emblématique. Le kit contient toutes les pièces nécessaires pour assembler la Jeep en 3D, ainsi qu\'un guide d\'instructions étape par étape facile à suivre. Une fois terminé, le puzzle mesure environ 25 cm de longueur, 15 cm de hauteur et 13 cm de largeur, et peut être exposé comme une pièce de collection ou utilisé comme un jouet amusant.', 55, 'Adolescents', 'Mécanique', 3, 5, 'upload/1764947044603831.png', 193, 'jeep-de-1930', NULL, NULL),
(6, 'Maquette d\'accordéon', 'Construisez votre propre chef-d\'œuvre musical avec notre maquette en bois d\'accordéon !', 'La maquette en bois d\'accordéon est un kit de construction qui permet de réaliser une réplique détaillée de cet instrument de musique iconique. Avec ses pièces en bois découpées au laser et son guide d\'instructions clair, cette maquette est facile à assembler et offre une expérience de construction agréable et enrichissante. Une fois terminé, l\'accordéon miniature mesure environ 50 cm de longueur, 30cm de hauteur et 35 cm de largeur, et peut être exposé fièrement comme un objet de décoration unique.', 79, 'Enfants', 'Instrument', 1, 4, 'upload/1764947285106181.png', 27, 'maquette-d\'accordéon', NULL, NULL),
(7, 'Maquette de Batterie', 'Devenez un batteur avec notre kit de construction en bois de batterie !', 'La réplique en bois de batterie est un kit de construction qui permet de construire une réplique miniature de cet instrument de musique populaire. Avec ses pièces en bois découpées avec précision au laser et son guide d\'instructions détaillé, cette maquette est facile à assembler et offre une expérience de construction amusante et gratifiante. Une fois terminé, la batterie miniature mesure environ 15 cm de longueur, 10 cm de hauteur et 7 cm de largeur, et peut être exposée comme une pièce de décoration originale.. Ce kit est parfait pour les futurs amateurs de musique, les futurs collectionneurs ou les futurs bricoleurs en herbe qui cherchent à s’initier au bricolage tout en s\'amusant.', 39, 'Enfants', 'Instrument', 1, 4, 'upload/1764947813748818.png', 37, 'maquette-de-batterie', NULL, NULL),
(8, 'Maquette de Guitare Electrique', 'Initiez votre enfant à la musique avec notre kit de construction de guitare électrique en bois !', 'Le kit de construction de guitare électrique en bois pour enfant est un excellent moyen d\'initier votre petit musicien en herbe à la fabrication et à la musique. Ce kit de construction comprend toutes les pièces nécessaires pour construire une guitare électrique miniature en bois de haute qualité. Les pièces sont découpées au laser avec précision pour un ajustement parfait, et le guide d\'instructions clair et détaillé est facile à suivre. Une fois terminé, la guitare mesure environ 15 cm de longueur, 40 cm de hauteur et 10 cm de largeur, et peut être exposée comme une pièce de décoration unique. Ce kit est parfait pour les enfants âgés de X à Y ans qui souhaitent découvrir la fabrication et la musique tout en s\'amusant.', 39, 'Enfants', 'Instrument', 1, 4, 'upload/1764948185456335.png', 38, 'maquette-de-guitare-electrique', NULL, NULL),
(9, 'Maquette de Saxophone', 'Apprenez à votre enfant à jouer du saxophone avec notre kit de construction de saxophone en bois pour enfant !', 'Le kit de construction de saxophone en bois pour enfant est un excellent moyen d\'initier votre jeune musicien en herbe à la fabrication et à la musique. Ce kit de construction comprend toutes les pièces nécessaires pour construire une réplique miniature de saxophone en bois de haute qualité. Les pièces sont découpées au laser avec précision pour un ajustement parfait, et le guide d\'instructions clair et détaillé est facile à suivre. Une fois terminé, le saxophone miniature mesure environ 15 cm de longueur, 40 cm de hauteur et 10 cm de largeur, et peut être exposé comme une pièce de décoration unique. Ce kit est parfait pour les enfants âgés de X à Y ans qui souhaitent découvrir la fabrication et la musique tout en s\'amusant.', 39, 'Enfants', 'Instrument', 1, 4, 'upload/1764948750508963.png', 38, 'maquette-de-saxophone', NULL, NULL),
(10, 'Horloge Hibou', 'Ajoutez une touche de nature à votre décor avec notre kit de construction d\'horloge hibou en bois', 'Le kit de construction d\'horloge hibou en bois pour adulte est une belle pièce de décoration à construire soi-même. Ce kit comprend toutes les pièces en bois découpées au laser pour construire une horloge murale miniature en forme de hibou. Le guide d\'instructions détaillé vous guidera à travers chaque étape du processus de construction. Cette maquette est un excellent projet pour les adultes qui cherchent à se détendre et à se divertir en construisant quelque chose de beau et d\'utile pour leur maison.', 129, 'Adultes', 'Robot', 6, 6, 'upload/1764949139427156.jpg', 43, 'horloge-hibou', NULL, NULL),
(11, 'Carrosse Citrouille', 'Revisitez un conte de fées classique avec notre kit de construction de carrosse citrouille en bois pour adolescents !', 'Le kit de construction de carrosse citrouille en bois pour adolescents est une maquette amusante et créative qui permet de revisiter le célèbre conte de fées de Cendrillon. Ce kit comprend toutes les pièces nécessaires pour construire une réplique miniature du carrosse citrouille, avec des pièces en bois découpées au laser pour un ajustement parfait et un guide d\'instructions détaillé pour vous guider à travers le processus de construction.', 59, 'Adolescents', 'Mécanique', 3, 5, 'upload/1764949364965441.png', 37, 'carrosse-citrouille', NULL, NULL),
(12, 'Voiture De Course Anciene', 'Construisez votre propre voiture de course classique avec notre kit de construction en bois pour adolescents !', 'Le kit de construction de voiture de course classique en bois pour adolescents est un projet amusant et éducatif qui permet de construire une réplique miniature d\'une voiture de course ancienne. Ce kit comprend toutes les pièces en bois découpées au laser pour un ajustement parfait, ainsi qu\'un guide d\'instructions détaillé pour vous guider à travers le processus de construction. Parfait pour ceux qui souhaitent découvrir la fabrication de maquettes tout en s\'amusant et en apprenant sur l\'histoire des voitures de course anciennes.', 59, 'Adolescents', 'Mécanique', 3, 5, 'upload/1764949504125182.png', 37, 'voiture-de-course-anciene', NULL, NULL),
(13, 'Lapin Steampunk', 'Ajoutez une touche de fantaisie à votre décor avec notre kit de construction de lapin Steampunk en bois !', 'Le kit de construction de lapin Steampunk en bois pour adulte est un projet créatif et original qui permet de construire une réplique miniature d\'un lapin fantastique. Ce kit comprend toutes les pièces en bois découpées au laser pour un ajustement parfait, ainsi qu\'un guide d\'instructions détaillé pour vous guider à travers le processus de construction. Le style Steampunk ajoute une touche de fantaisie et d\'imaginaire à cette maquette, qui est un excellent projet pour les adultes qui cherchent à se détendre et à se divertir tout en construisant quelque chose de beau et d\'unique.', 149, 'Adultes', 'Robot', 6, 6, 'upload/1764950345698166.png', 34, 'lapin-steampunk', NULL, NULL),
(14, 'Maquette de Navette Spaciale', 'Explorez l\'espace avec notre kit de construction de navette spatiale en bois pour adulte !', 'Le kit de construction de navette spatiale en bois pour adulte est un projet ambitieux qui permet de construire une réplique miniature de l\'un des symboles les plus emblématiques de la conquête spatiale. Ce kit comprend toutes les pièces en bois découpées au laser pour un ajustement parfait, ainsi qu\'un guide d\'instructions détaillé pour vous guider à travers le processus de construction. Ce projet est idéal pour les adultes passionnés d\'astronomie et d\'exploration spatiale, qui souhaitent construire quelque chose de beau et de significatif tout en apprenant sur la science et la technologie de l\'espace.', 129, 'Adultes', 'Robot', 6, 6, 'upload/1764950570309761.png', 33, 'maquette-de-navette-spaciale', NULL, NULL),
(15, 'Maquette de Sous-Marin Steampunk', 'Explorez les profondeurs avec notre kit de construction de sous-marin Steampunk en bois pour adulte !', 'Le kit de construction de sous-marin Steampunk en bois pour adulte est un projet créatif et original qui permet de construire une réplique miniature d\'un sous-marin fantastique. Ce kit comprend toutes les pièces en bois découpées au laser pour un ajustement parfait, ainsi qu\'un guide d\'instructions détaillé pour vous guider à travers le processus de construction. Le style Steampunk ajoute une touche de fantaisie et d\'imaginaire à cette maquette, qui est un excellent projet pour les adultes qui cherchent à se détendre et à se divertir tout en construisant quelque chose de beau et d\'unique. Cette maquette de sous-marin est également une excellente façon d\'explorer le monde fascinant des machines et de la technologie Steampunk.', 129, 'Adultes', 'Robot', 6, 6, 'upload/1764950765288399.png', 47, 'maquette-de-sous-marin-steampunk', NULL, NULL),
(16, 'Maquette de camion', 'Construisez votre propre camion en bois avec notre kit de construction pour adolescent !', 'Le kit de construction de camion en bois pour ado est un projet amusant et stimulant qui permet aux adolescents de construire leur propre réplique miniature d\'un camion. Ce kit comprend toutes les pièces en bois découpées au laser pour un ajustement parfait, ainsi qu\'un guide d\'instructions détaillé pour vous guider à travers le processus de construction. Ce projet de construction est idéal pour les adolescents qui aiment les défis créatifs et techniques, ainsi que pour ceux qui sont intéressés par les véhicules et la construction en bois. La satisfaction de voir un projet terminé de ses propres mains est inestimable, et cette maquette de camion en bois est une excellente façon d\'y parvenir.', 39, 'Adolescents', 'Mécanique', 3, 5, 'upload/1764950982961605.png', 52, 'maquette-de-camion', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'superadministrator', 'Superadministrator', 'Superadministrator', '2023-04-03 05:18:21', '2023-04-03 05:18:21'),
(2, 'administrator', 'Administrator', 'Administrator', '2023-04-03 05:18:21', '2023-04-03 05:18:21'),
(3, 'user', 'User', 'User', '2023-04-03 05:18:21', '2023-04-03 05:18:21');

-- --------------------------------------------------------

--
-- Structure de la table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\Models\\User'),
(3, 2, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Structure de la table `shipping_infos`
--

CREATE TABLE `shipping_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `shipping_infos`
--

INSERT INTO `shipping_infos` (`id`, `user_id`, `phone_number`, `city_name`, `postal_code`, `created_at`, `updated_at`) VALUES
(3, 2, '0607080904', 'rdg', '42800', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_count` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `subcategories`
--

INSERT INTO `subcategories` (`id`, `subcategory_name`, `category_id`, `category_name`, `product_count`, `slug`, `created_at`, `updated_at`) VALUES
(4, 'Instrument', 1, 'Enfants', 4, 'instrument', NULL, '2023-05-04 05:44:53'),
(5, 'Mécanique', 3, 'Adolescents', 4, 'mécanique', NULL, '2023-05-04 06:20:22'),
(6, 'Robot', 6, 'Adultes', 4, 'robot', NULL, '2023-05-04 06:16:54');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'gaetan', 'gaetan1234@gmail.com', NULL, '$2y$10$nRmDpGoNdbNb69mNYOj.zuSNck1LJzeuStOs.3yzCbcFuTiNJ1Nz2', 'R8qMeLz8nv7sTheIK0wakTBSU6lN1NPj4f3b4tdiGDIkKAguZNIS10aMaWLU', '2023-04-03 05:19:01', '2023-04-03 05:19:01'),
(2, 'Martin', 'Martin@gmail.com', NULL, '$2y$10$D7uaF11i4/4ZGvwkS1U6c.4H1LrXFwYkB9U9BG8JTydcBoMFpk1sW', 'IQ8F1s55tamiGSrTGGIHfIFxBWtpsc6CKRcKVV9T2p4aNgLEciLVh2RJ6A3E', '2023-04-21 09:42:45', '2023-04-21 09:42:45');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Index pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Index pour la table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Index pour la table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Index pour la table `shipping_infos`
--
ALTER TABLE `shipping_infos`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `shipping_infos`
--
ALTER TABLE `shipping_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
