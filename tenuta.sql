-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 12, 2025 alle 16:27
-- Versione del server: 10.11.11-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tenuta`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can view permission', 1, 'view_permission'),
(5, 'Can add group', 2, 'add_group'),
(6, 'Can change group', 2, 'change_group'),
(7, 'Can delete group', 2, 'delete_group'),
(8, 'Can view group', 2, 'view_group'),
(9, 'Can add user', 3, 'add_user'),
(10, 'Can change user', 3, 'change_user'),
(11, 'Can delete user', 3, 'delete_user'),
(12, 'Can view user', 3, 'view_user'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add centro_ distributivo', 6, 'add_centro_distributivo'),
(22, 'Can change centro_ distributivo', 6, 'change_centro_distributivo'),
(23, 'Can delete centro_ distributivo', 6, 'delete_centro_distributivo'),
(24, 'Can view centro_ distributivo', 6, 'view_centro_distributivo'),
(25, 'Can add cliente', 7, 'add_cliente'),
(26, 'Can change cliente', 7, 'change_cliente'),
(27, 'Can delete cliente', 7, 'delete_cliente'),
(28, 'Can view cliente', 7, 'view_cliente'),
(29, 'Can add evento', 8, 'add_evento'),
(30, 'Can change evento', 8, 'change_evento'),
(31, 'Can delete evento', 8, 'delete_evento'),
(32, 'Can view evento', 8, 'view_evento'),
(33, 'Can add prodotto', 9, 'add_prodotto'),
(34, 'Can change prodotto', 9, 'change_prodotto'),
(35, 'Can delete prodotto', 9, 'delete_prodotto'),
(36, 'Can view prodotto', 9, 'view_prodotto'),
(37, 'Can add responsabile', 10, 'add_responsabile'),
(38, 'Can change responsabile', 10, 'change_responsabile'),
(39, 'Can delete responsabile', 10, 'delete_responsabile'),
(40, 'Can view responsabile', 10, 'view_responsabile'),
(41, 'Can add ordine', 11, 'add_ordine'),
(42, 'Can change ordine', 11, 'change_ordine'),
(43, 'Can delete ordine', 11, 'delete_ordine'),
(44, 'Can view ordine', 11, 'view_ordine'),
(45, 'Can add partecipazione_evento', 12, 'add_partecipazione_evento'),
(46, 'Can change partecipazione_evento', 12, 'change_partecipazione_evento'),
(47, 'Can delete partecipazione_evento', 12, 'delete_partecipazione_evento'),
(48, 'Can view partecipazione_evento', 12, 'view_partecipazione_evento'),
(49, 'Can add dettaglio_ordine', 13, 'add_dettaglio_ordine'),
(50, 'Can change dettaglio_ordine', 13, 'change_dettaglio_ordine'),
(51, 'Can delete dettaglio_ordine', 13, 'delete_dettaglio_ordine'),
(52, 'Can view dettaglio_ordine', 13, 'view_dettaglio_ordine'),
(53, 'Can add deposito', 14, 'add_deposito'),
(54, 'Can change deposito', 14, 'change_deposito'),
(55, 'Can delete deposito', 14, 'delete_deposito'),
(56, 'Can view deposito', 14, 'view_deposito'),
(57, 'Can add recensione', 15, 'add_recensione'),
(58, 'Can change recensione', 15, 'change_recensione'),
(59, 'Can delete recensione', 15, 'delete_recensione'),
(60, 'Can view recensione', 15, 'view_recensione');

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'auth', 'group'),
(1, 'auth', 'permission'),
(3, 'auth', 'user'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(6, 'Tenuta', 'centro_distributivo'),
(7, 'Tenuta', 'cliente'),
(14, 'Tenuta', 'deposito'),
(13, 'Tenuta', 'dettaglio_ordine'),
(8, 'Tenuta', 'evento'),
(11, 'Tenuta', 'ordine'),
(12, 'Tenuta', 'partecipazione_evento'),
(9, 'Tenuta', 'prodotto'),
(15, 'Tenuta', 'recensione'),
(10, 'Tenuta', 'responsabile');

-- --------------------------------------------------------

--
-- Struttura della tabella `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Tenuta', '0001_initial', '2025-06-02 13:46:02.700910'),
(2, 'contenttypes', '0001_initial', '2025-06-02 13:46:02.779671'),
(3, 'contenttypes', '0002_remove_content_type_name', '2025-06-02 13:46:02.889698'),
(4, 'auth', '0001_initial', '2025-06-02 13:46:03.707612'),
(5, 'auth', '0002_alter_permission_name_max_length', '2025-06-02 13:46:03.786068'),
(6, 'auth', '0003_alter_user_email_max_length', '2025-06-02 13:46:03.880110'),
(7, 'auth', '0004_alter_user_username_opts', '2025-06-02 13:46:03.895742'),
(8, 'auth', '0005_alter_user_last_login_null', '2025-06-02 13:46:03.959466'),
(9, 'auth', '0006_require_contenttypes_0002', '2025-06-02 13:46:03.959466'),
(10, 'auth', '0007_alter_validators_add_error_messages', '2025-06-02 13:46:03.975104'),
(11, 'auth', '0008_alter_user_username_max_length', '2025-06-02 13:46:04.024259'),
(12, 'auth', '0009_alter_user_last_name_max_length', '2025-06-02 13:46:04.055673'),
(13, 'auth', '0010_alter_group_name_max_length', '2025-06-02 13:46:04.103666'),
(14, 'auth', '0011_update_proxy_permissions', '2025-06-02 13:46:04.119274'),
(15, 'auth', '0012_alter_user_first_name_max_length', '2025-06-02 13:46:04.151958'),
(16, 'sessions', '0001_initial', '2025-06-02 13:46:04.231271');

-- --------------------------------------------------------

--
-- Struttura della tabella `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2awa8f4d8j66dl7cvvzdtafxxf32zieq', 'eyJlbWFpbCI6ImdpZ2xpb2xhQGdtYWlsLmNvbSJ9:1uM22T:E-P9Ba74qQO9W8KAQ8mkwGYewv_Ph7CpeEPp8Fjp9gE', '2025-06-16 10:05:05.198680'),
('bisfo8y7hibgtjt71nwgpkd6oq7dnrt3', '.eJyrVsosjk8sLclIzSvJTE4sSU1RsiopKk3VAYun5GbmYZeFSKXmJmbmKFkppWfmlyXm5WU6pIME9JLzc5VqARDrIbU:1uPiil:tATL4HpSbtJNBDpkuZxcjvrCKDBKqAkWPo77BBdM8Zo', '2025-06-26 14:15:59.253026'),
('gdzjzhiolsdk87iam7821nlte98st1ks', 'eyJlbWFpbCI6ImdpZ2xpb2xhQGdtYWlsLmNvbSJ9:1uLnVm:ghBqQ88-CjNYa0Vp-MPfnFojiuI81cTr4fA03lsi-ao', '2025-06-15 18:34:22.561122'),
('vyzm15k2k2bhz3lquwi185r58m7mg66o', '.eJyrVkrNTczMUbJSSs_My3dIB3H0kvNzlXSUElNyM_PiYdJFmcnJiUUpyEpqAZEIFYM:1uLlJG:3SBUNBOiQOXa7G5m1fGtWZ5VLdprZS3OR_nBPsyh6Ds', '2025-06-15 16:13:18.344695'),
('xxd659616u4xwdu5q8v1e26city0ixas', 'eyJlbWFpbCI6Im9tYXJAZ21haWwuY29tIn0:1uLihp:aWIpDuQEMnYS7R6AaeQGRo0xU7jxJCtbdzT3TG3Ep40', '2025-06-15 13:26:29.265699');

-- --------------------------------------------------------

--
-- Struttura della tabella `tenuta_centro_distributivo`
--

CREATE TABLE `tenuta_centro_distributivo` (
  `id` int(11) NOT NULL,
  `regione` enum('Veneto','Puglia') NOT NULL,
  `indirizzo` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `responsabile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tenuta_centro_distributivo`
--

INSERT INTO `tenuta_centro_distributivo` (`id`, `regione`, `indirizzo`, `telefono`, `responsabile_id`) VALUES
(1, 'Veneto', 'Via della Tenuta 2000', '333 456 555', 1),
(2, 'Puglia', 'Via Beltrani 200', '344 678 9089', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `tenuta_cliente`
--

CREATE TABLE `tenuta_cliente` (
  `id` int(11) NOT NULL,
  `ruolo` enum('Privato','Commerciale') NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(128) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `ragione_sociale` varchar(100) NOT NULL,
  `partita_iva` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tenuta_cliente`
--

INSERT INTO `tenuta_cliente` (`id`, `ruolo`, `email`, `password`, `nome`, `cognome`, `ragione_sociale`, `partita_iva`) VALUES
(1, 'Privato', 'omar@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Omar', 'somaro', '', ''),
(2, 'Privato', 'tizio@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'tizio', 'ieri', '', ''),
(3, 'Commerciale', 'gigliola@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '', '', 'Azzurra', 'GIG1234567'),
(4, 'Privato', 'gino@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Gino', 'Domani', '', ''),
(6, 'Commerciale', 'gigio@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '', '', 'Dolomites', 'GIM123468'),
(7, 'Privato', 'allumedirocca@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Ankara', 'Alicantus', '', ''),
(8, 'Privato', 'mena@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Mena', 'Bellissimus', '', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `tenuta_deposito`
--

CREATE TABLE `tenuta_deposito` (
  `id` int(11) NOT NULL,
  `quantita` int(10) UNSIGNED NOT NULL CHECK (`quantita` >= 0),
  `centro_distributivo_id` int(11) NOT NULL,
  `prodotto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tenuta_deposito`
--

INSERT INTO `tenuta_deposito` (`id`, `quantita`, `centro_distributivo_id`, `prodotto_id`) VALUES
(1, 3, 1, 1),
(2, 4, 1, 2),
(3, 10, 1, 3),
(4, 9, 1, 4),
(5, 10, 1, 5),
(6, 10, 1, 6),
(7, 6, 1, 7),
(8, 8, 1, 8),
(9, 9, 1, 9),
(10, 6, 1, 10),
(11, 9, 1, 12),
(12, 8, 1, 13),
(13, 6, 1, 14),
(14, 4, 2, 1),
(15, 9, 2, 2),
(16, 5, 2, 3),
(17, 9, 2, 4),
(18, 8, 2, 5),
(19, 10, 2, 6),
(20, 8, 2, 7),
(21, 10, 2, 8),
(22, 9, 2, 9),
(23, 10, 2, 10),
(24, 8, 2, 12),
(25, 10, 2, 13),
(26, 9, 2, 14),
(27, 500, 1, 1),
(28, 500, 1, 2),
(29, 500, 1, 3),
(30, 500, 1, 4),
(31, 500, 1, 5),
(32, 500, 1, 6),
(33, 500, 1, 7),
(34, 500, 1, 8),
(35, 500, 1, 9),
(36, 500, 1, 10),
(37, 500, 1, 12),
(38, 500, 1, 13),
(39, 500, 1, 14),
(40, 500, 2, 1),
(41, 500, 2, 2),
(42, 500, 2, 3),
(43, 500, 2, 4),
(44, 500, 2, 5),
(45, 500, 2, 6),
(46, 500, 2, 7),
(47, 500, 2, 8),
(48, 500, 2, 9),
(49, 500, 2, 10),
(50, 500, 2, 12),
(51, 500, 2, 13),
(52, 500, 2, 14),
(53, 500, 1, 1),
(54, 500, 1, 2),
(55, 500, 1, 3),
(56, 500, 1, 4),
(57, 500, 1, 5),
(58, 500, 1, 6),
(59, 500, 1, 7),
(60, 500, 1, 8),
(61, 500, 1, 9),
(62, 500, 1, 10),
(63, 500, 1, 12),
(64, 500, 1, 13),
(65, 500, 1, 14),
(66, 500, 2, 1),
(67, 500, 2, 2),
(68, 500, 2, 3),
(69, 500, 2, 4),
(70, 500, 2, 5),
(71, 500, 2, 6),
(72, 500, 2, 7),
(73, 500, 2, 8),
(74, 500, 2, 9),
(75, 500, 2, 10),
(76, 500, 2, 12),
(77, 500, 2, 13),
(78, 500, 2, 14);

-- --------------------------------------------------------

--
-- Struttura della tabella `tenuta_dettaglio_ordine`
--

CREATE TABLE `tenuta_dettaglio_ordine` (
  `id` int(11) NOT NULL,
  `quantita` int(10) UNSIGNED NOT NULL CHECK (`quantita` >= 0),
  `prezzo_total` decimal(10,2) NOT NULL,
  `ordine_id` int(11) NOT NULL,
  `prodotto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tenuta_dettaglio_ordine`
--

INSERT INTO `tenuta_dettaglio_ordine` (`id`, `quantita`, `prezzo_total`, `ordine_id`, `prodotto_id`) VALUES
(1, 1, 45.00, 1, 1),
(2, 1, 30.00, 1, 2),
(3, 1, 60.00, 1, 5),
(4, 2, 90.00, 2, 1),
(5, 2, 84.00, 2, 3),
(6, 1, 60.00, 2, 5),
(7, 1, 6.00, 2, 9),
(8, 1, 7.00, 2, 12),
(9, 2, 60.00, 3, 2),
(10, 1, 55.00, 3, 4),
(11, 2, 8.00, 3, 7),
(12, 1, 7.00, 3, 14),
(13, 1, 4.00, 4, 7),
(14, 1, 5.50, 4, 8),
(15, 4, 20.00, 4, 10),
(16, 1, 7.00, 4, 12),
(17, 1, 7.00, 4, 13),
(18, 1, 55.00, 5, 4),
(19, 3, 135.00, 6, 1),
(20, 2, 84.00, 6, 3),
(21, 2, 8.00, 6, 7),
(22, 1, 7.00, 6, 14),
(23, 2, 60.00, 7, 2),
(24, 1, 5.50, 7, 8),
(25, 1, 7.00, 7, 13),
(26, 1, 45.00, 8, 1),
(27, 1, 4.00, 8, 7),
(28, 1, 7.00, 8, 14),
(29, 4, 180.00, 9, 1),
(30, 1, 6.00, 9, 9),
(31, 1, 7.00, 9, 14),
(32, 1, 7.00, 10, 14),
(33, 1, 45.00, 11, 1),
(34, 1, 45.00, 12, 1),
(35, 2, 60.00, 13, 2),
(36, 1, 42.00, 14, 3),
(37, 1, 7.00, 14, 12);

-- --------------------------------------------------------

--
-- Struttura della tabella `tenuta_evento`
--

CREATE TABLE `tenuta_evento` (
  `id` int(11) NOT NULL,
  `titolo` varchar(100) NOT NULL,
  `data_evento` date NOT NULL,
  `descrizione` longtext NOT NULL,
  `luogo_evento` varchar(255) NOT NULL,
  `iscrizione` int(11) NOT NULL,
  `prezzo` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tenuta_evento`
--

INSERT INTO `tenuta_evento` (`id`, `titolo`, `data_evento`, `descrizione`, `luogo_evento`, `iscrizione`, `prezzo`) VALUES
(1, 'Degustazione guidata di olio EVO', '2025-06-15', 'Assaggio guidato con esperto, confronto tra varietà di olio, abbinamenti con cibi.', 'Frantoio Aziendale, Via degli Ulivi 1', 20, 15.00),
(2, 'Raccolta delle olive esperienziale', '2025-10-20', 'Vivi la raccolta a mano delle olive e scopri il processo di molitura.', 'Uliveto Storico, Contrada Verde', 15, 25.00),
(3, 'Cena tra gli ulivi', '2025-09-10', 'Cena a km 0 immersi negli ulivi, con piatti che valorizzano l’olio aziendale.', 'Uliveto panoramico, Tenuta San Giorgio', 30, 40.00),
(4, 'Festa della molitura', '2025-11-05', 'Evento festivo per l’inizio della molitura, con musica, cibo e assaggi.', 'Frantoio aziendale', 100, 0.00),
(5, 'Passeggiata tra gli ulivi', '2025-04-21', 'Itinerario naturalistico con guida e degustazione finale.', 'Sentiero degli Ulivi, Borgo Antico', 25, 10.00),
(6, 'Laboratorio sull’olio per bambini', '2025-05-10', 'Attività didattiche sull’olio, giochi e piccole degustazioni pensate per i più piccoli.', 'Didattica Uliveto Scuole', 20, 8.00),
(7, 'Corso sull’olio e la salute', '2025-03-12', 'Seminario con nutrizionista sui benefici dell’olio EVO nella dieta mediterranea.', 'Sala conferenze, Agriturismo VerdeVita', 40, 12.50),
(8, 'Workshop di cucina con olio EVO', '2025-07-22', 'Corso pratico di cucina con chef locali e prodotti tipici.', 'Cucina didattica, Frantoio del Sole', 15, 30.00),
(9, 'Giornata a porte aperte', '2025-05-01', 'Visite guidate gratuite al frantoio e agli uliveti con possibilità di acquisto.', 'Frantoio e shop aziendale', 0, 0.00),
(10, 'Mercato contadino in azienda', '2025-06-30', 'Esposizione e vendita di prodotti agricoli locali in collaborazione con aziende partner.', 'Cortile aziendale', 0, 0.00);

-- --------------------------------------------------------

--
-- Struttura della tabella `tenuta_ordine`
--

CREATE TABLE `tenuta_ordine` (
  `id` int(11) NOT NULL,
  `stato` enum('Attesa','Spedito','Consegnato','Annullato') NOT NULL,
  `tipo_consegna` enum('Standard','Espresso') NOT NULL,
  `data_ordine` date NOT NULL,
  `metodo_pagamento` enum('Carta di credito','PayPal','Bonifico') NOT NULL,
  `regione_spedizione` varchar(50) NOT NULL,
  `indirizzo_spedizione` varchar(255) NOT NULL,
  `totale` decimal(10,2) NOT NULL,
  `richiesta_fattura` tinyint(1) NOT NULL,
  `centro_distributivo_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tenuta_ordine`
--

INSERT INTO `tenuta_ordine` (`id`, `stato`, `tipo_consegna`, `data_ordine`, `metodo_pagamento`, `regione_spedizione`, `indirizzo_spedizione`, `totale`, `richiesta_fattura`, `centro_distributivo_id`, `cliente_id`) VALUES
(1, 'Spedito', 'Espresso', '2025-06-02', 'PayPal', 'Sardegna', 'via Foscolo 5, Cagliari ', 135.00, 0, 2, 2),
(2, 'Spedito', 'Espresso', '2025-06-02', 'Bonifico', 'Molise', 'Via Montale 55, Campobasso', 247.00, 1, 2, 6),
(3, 'Spedito', 'Standard', '2025-06-02', 'Bonifico', 'Lazio', 'Piazza Giulio Cesare, 13, Roma', 130.00, 1, 1, 3),
(4, 'Annullato', 'Espresso', '2025-06-02', 'PayPal', 'Toscana', 'Viale delle Lumache, 67, Pistoia', 43.50, 0, 1, 1),
(5, 'Consegnato', 'Espresso', '2025-06-04', 'PayPal', 'Campania', 'via del trionfo, 5, Giugliano', 55.00, 0, 2, 6),
(6, 'Spedito', 'Standard', '2025-06-05', 'Carta di credito', 'Puglia', 'via delle ciliege, 12, Brindisi', 234.00, 0, 2, 2),
(7, 'Attesa', 'Standard', '2025-06-06', 'Carta di credito', 'Lazio', 'via della Repubblica, 23, Viterbo', 72.50, 0, 1, 4),
(8, 'Spedito', 'Standard', '2025-06-10', 'PayPal', 'Lombardia', 'via dei salici, 3, Pavia ', 56.00, 0, 1, 2),
(9, 'Attesa', 'Standard', '2025-06-11', 'PayPal', 'Valle d\'Aosta', 'via caracciolo, 21, Aosta', 193.00, 0, 1, 4),
(10, 'Attesa', 'Standard', '2025-06-11', 'Carta di credito', 'Friuli Venezia Giulia', 'via delle anguille, 4, Trieste ', 7.00, 0, 1, 4),
(11, 'Attesa', 'Standard', '2025-06-11', 'PayPal', 'Veneto', 'via delle rondini, 17, Rovigo ', 45.00, 0, 1, 4),
(12, 'Attesa', 'Standard', '2025-06-11', 'PayPal', 'Piemonte', 'via degli uncini, 23, Biella ', 45.00, 1, 1, 4),
(13, 'Attesa', 'Standard', '2025-06-11', 'PayPal', 'Abruzzo', 'via delle zucchine, 26, L\'Aquila ', 60.00, 1, 1, 3),
(14, 'Spedito', 'Espresso', '2025-06-12', 'PayPal', 'Campania', 'viale Vittorio Emanuele, 18, Sarno', 49.00, 1, 2, 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `tenuta_partecipazione_evento`
--

CREATE TABLE `tenuta_partecipazione_evento` (
  `id` int(11) NOT NULL,
  `stato` enum('confermato','annullato','attesa') NOT NULL,
  `numero_partecipanti` int(10) UNSIGNED NOT NULL CHECK (`numero_partecipanti` >= 0),
  `cliente_id` int(11) NOT NULL,
  `evento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tenuta_partecipazione_evento`
--

INSERT INTO `tenuta_partecipazione_evento` (`id`, `stato`, `numero_partecipanti`, `cliente_id`, `evento_id`) VALUES
(1, 'confermato', 2, 1, 1),
(2, 'attesa', 1, 2, 2),
(3, 'confermato', 4, 3, 3),
(4, 'annullato', 1, 4, 4),
(5, 'confermato', 3, 6, 5),
(6, 'confermato', 2, 7, 6),
(7, 'attesa', 1, 1, 7),
(8, 'confermato', 5, 2, 8),
(9, 'confermato', 2, 3, 9),
(10, 'annullato', 1, 4, 10);

-- --------------------------------------------------------

--
-- Struttura della tabella `tenuta_prodotto`
--

CREATE TABLE `tenuta_prodotto` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `immagine` varchar(100) NOT NULL,
  `prezzo` decimal(10,2) NOT NULL,
  `formato` varchar(50) NOT NULL,
  `descrizione` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tenuta_prodotto`
--

INSERT INTO `tenuta_prodotto` (`id`, `nome`, `immagine`, `prezzo`, `formato`, `descrizione`) VALUES
(1, 'Lattina d’olio da 5 litri', 'prodotti/olio5l.jpg', 45.00, '5L', 'Lattina di olio extravergine di oliva da 5 litri'),
(2, 'Lattina d’olio da 3 litri', 'prodotti/olio3l.jpg', 30.00, '3L', 'Lattina di olio extravergine di oliva da 3 litri'),
(3, 'Cartone da 6x0,75 l', 'prodotti/cartone6x075.jpg', 42.00, '6 x 0,75L', 'Cartone con 6 bottiglie da 0,75 litri di olio'),
(4, 'Cartone da 12x0,50 l', 'prodotti/cartone12x050.jpg', 55.00, '12 x 0,50L', 'Cartone con 12 bottiglie da 0,50 litri di olio'),
(5, 'Cartone da 12x0,50 l antirabbocco', 'prodotti/cartone12x050_antirabbocco.jpg', 60.00, '12 x 0,50L antirabbocco', 'Cartone con 12 bottiglie antirabbocco da 0,50 litri'),
(6, 'Mandorle sgusciate 0,500 gr', 'prodotti/mandorle500g.jpg', 8.50, '0,5kg', 'Sacchetto di mandorle sgusciate da 0,500 kg'),
(7, 'Lenticchie rosse 0,500 gr', 'prodotti/lenticchie500g.jpg', 4.00, '0,5kg', 'Sacchetto di lenticchie rosse da 0,500 kg'),
(8, 'Paté di olive varietà La Coratina 300 gr', 'prodotti/patecoratina300g.jpg', 5.50, '300g', 'Paté di olive La Coratina in vasetto da 300g'),
(9, 'Olive in acqua e sale 0,500 gr', 'prodotti/olive500g.jpg', 6.00, '0,5kg', 'Sacchetto di olive in acqua e sale da 0,500 kg'),
(10, 'Pomodorini secchi 0,500 gr', 'prodotti/pomodorinisecchi500g.jpg', 5.00, '0,5kg', 'Sacchetto di pomodorini secchi da 0,500 kg'),
(12, 'Vasetto di carciofi 300 gr', 'prodotti/vasetto_carciofi.jpg', 7.00, '300g', 'Vasetto di carciofi sott’olio da 300 grammi'),
(13, 'Vasetto di melanzane 300 gr', 'prodotti/vasetto_melanzane.jpg', 7.00, '300g', 'Vasetto di melanzane sott’olio da 300 grammi'),
(14, 'Vasetto di funghi 300 gr', 'prodotti/vasetto_funghi.jpg', 7.00, '300g', 'Vasetto di funghi sott’olio da 300 grammi');

-- --------------------------------------------------------

--
-- Struttura della tabella `tenuta_recensione`
--

CREATE TABLE `tenuta_recensione` (
  `id` int(11) NOT NULL,
  `testo` longtext NOT NULL,
  `valutazione` int(10) UNSIGNED NOT NULL CHECK (`valutazione` >= 0),
  `cliente_id` int(11) NOT NULL,
  `evento_id` int(11) DEFAULT NULL,
  `prodotto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tenuta_recensione`
--

INSERT INTO `tenuta_recensione` (`id`, `testo`, `valutazione`, `cliente_id`, `evento_id`, `prodotto_id`) VALUES
(1, 'prodotto all\'altezza delle aspettative', 4, 2, NULL, 1),
(2, 'Esperienza mistica che mi ha permesso di connettermi con la natura', 5, 2, 2, NULL),
(3, 'soddisfatto, i miei clienti sono rimasti molto contenti, di trovare un prodotto di qualità sulla tavola', 3, 6, NULL, 5),
(4, 'I miei clienti erano estasiati ', 3, 6, 5, NULL),
(5, 'Il prodotto non è molto buono', 1, 3, NULL, 14),
(6, 'Cena molto rilassante e immersiva', 4, 3, 3, NULL),
(7, 'Ottimo prodotto ', 4, 4, NULL, 8),
(8, 'Prodotto ben conservati', 4, 8, NULL, 12);

-- --------------------------------------------------------

--
-- Struttura della tabella `tenuta_responsabile`
--

CREATE TABLE `tenuta_responsabile` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tenuta_responsabile`
--

INSERT INTO `tenuta_responsabile` (`id`, `nome`, `cognome`, `email`, `password`) VALUES
(1, 'Riccardo', 'Muschio', 'riccardo@gmail.com', '9e1e06ec8e02f0a0074f2fcc6b26303b'),
(2, 'Giovanni', 'Muschio', 'giovanni@gmail.com', '9e1e06ec8e02f0a0074f2fcc6b26303b');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indici per le tabelle `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indici per le tabelle `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indici per le tabelle `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indici per le tabelle `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indici per le tabelle `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indici per le tabelle `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indici per le tabelle `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indici per le tabelle `tenuta_centro_distributivo`
--
ALTER TABLE `tenuta_centro_distributivo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Tenuta_centro_distri_responsabile_id_6b6fe930_fk_Tenuta_re` (`responsabile_id`);

--
-- Indici per le tabelle `tenuta_cliente`
--
ALTER TABLE `tenuta_cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `tenuta_deposito`
--
ALTER TABLE `tenuta_deposito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Tenuta_deposito_centro_distributivo__8faf8245_fk_Tenuta_ce` (`centro_distributivo_id`),
  ADD KEY `Tenuta_deposito_prodotto_id_8c516186_fk_Tenuta_prodotto_id` (`prodotto_id`);

--
-- Indici per le tabelle `tenuta_dettaglio_ordine`
--
ALTER TABLE `tenuta_dettaglio_ordine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Tenuta_dettaglio_ordine_ordine_id_45038f3f_fk_Tenuta_ordine_id` (`ordine_id`),
  ADD KEY `Tenuta_dettaglio_ord_prodotto_id_90a73f65_fk_Tenuta_pr` (`prodotto_id`);

--
-- Indici per le tabelle `tenuta_evento`
--
ALTER TABLE `tenuta_evento`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tenuta_ordine`
--
ALTER TABLE `tenuta_ordine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Tenuta_ordine_centro_distributivo__f7b938aa_fk_Tenuta_ce` (`centro_distributivo_id`),
  ADD KEY `Tenuta_ordine_cliente_id_a8cee0d6_fk_Tenuta_cliente_id` (`cliente_id`);

--
-- Indici per le tabelle `tenuta_partecipazione_evento`
--
ALTER TABLE `tenuta_partecipazione_evento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Tenuta_partecipazion_cliente_id_5f6cbc2d_fk_Tenuta_cl` (`cliente_id`),
  ADD KEY `Tenuta_partecipazion_evento_id_684f280b_fk_Tenuta_ev` (`evento_id`);

--
-- Indici per le tabelle `tenuta_prodotto`
--
ALTER TABLE `tenuta_prodotto`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tenuta_recensione`
--
ALTER TABLE `tenuta_recensione`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Tenuta_recensione_cliente_id_8f0dc0e4_fk_Tenuta_cliente_id` (`cliente_id`),
  ADD KEY `Tenuta_recensione_evento_id_38507934_fk_Tenuta_evento_id` (`evento_id`),
  ADD KEY `Tenuta_recensione_prodotto_id_39cbf4ac_fk_Tenuta_prodotto_id` (`prodotto_id`);

--
-- Indici per le tabelle `tenuta_responsabile`
--
ALTER TABLE `tenuta_responsabile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT per la tabella `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la tabella `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT per la tabella `tenuta_centro_distributivo`
--
ALTER TABLE `tenuta_centro_distributivo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `tenuta_cliente`
--
ALTER TABLE `tenuta_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `tenuta_deposito`
--
ALTER TABLE `tenuta_deposito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT per la tabella `tenuta_dettaglio_ordine`
--
ALTER TABLE `tenuta_dettaglio_ordine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT per la tabella `tenuta_evento`
--
ALTER TABLE `tenuta_evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `tenuta_ordine`
--
ALTER TABLE `tenuta_ordine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `tenuta_partecipazione_evento`
--
ALTER TABLE `tenuta_partecipazione_evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `tenuta_prodotto`
--
ALTER TABLE `tenuta_prodotto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `tenuta_recensione`
--
ALTER TABLE `tenuta_recensione`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `tenuta_responsabile`
--
ALTER TABLE `tenuta_responsabile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limiti per la tabella `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Limiti per la tabella `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limiti per la tabella `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limiti per la tabella `tenuta_centro_distributivo`
--
ALTER TABLE `tenuta_centro_distributivo`
  ADD CONSTRAINT `Tenuta_centro_distri_responsabile_id_6b6fe930_fk_Tenuta_re` FOREIGN KEY (`responsabile_id`) REFERENCES `tenuta_responsabile` (`id`);

--
-- Limiti per la tabella `tenuta_deposito`
--
ALTER TABLE `tenuta_deposito`
  ADD CONSTRAINT `Tenuta_deposito_centro_distributivo__8faf8245_fk_Tenuta_ce` FOREIGN KEY (`centro_distributivo_id`) REFERENCES `tenuta_centro_distributivo` (`id`),
  ADD CONSTRAINT `Tenuta_deposito_prodotto_id_8c516186_fk_Tenuta_prodotto_id` FOREIGN KEY (`prodotto_id`) REFERENCES `tenuta_prodotto` (`id`);

--
-- Limiti per la tabella `tenuta_dettaglio_ordine`
--
ALTER TABLE `tenuta_dettaglio_ordine`
  ADD CONSTRAINT `Tenuta_dettaglio_ord_prodotto_id_90a73f65_fk_Tenuta_pr` FOREIGN KEY (`prodotto_id`) REFERENCES `tenuta_prodotto` (`id`),
  ADD CONSTRAINT `Tenuta_dettaglio_ordine_ordine_id_45038f3f_fk_Tenuta_ordine_id` FOREIGN KEY (`ordine_id`) REFERENCES `tenuta_ordine` (`id`);

--
-- Limiti per la tabella `tenuta_ordine`
--
ALTER TABLE `tenuta_ordine`
  ADD CONSTRAINT `Tenuta_ordine_centro_distributivo__f7b938aa_fk_Tenuta_ce` FOREIGN KEY (`centro_distributivo_id`) REFERENCES `tenuta_centro_distributivo` (`id`),
  ADD CONSTRAINT `Tenuta_ordine_cliente_id_a8cee0d6_fk_Tenuta_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `tenuta_cliente` (`id`);

--
-- Limiti per la tabella `tenuta_partecipazione_evento`
--
ALTER TABLE `tenuta_partecipazione_evento`
  ADD CONSTRAINT `Tenuta_partecipazion_cliente_id_5f6cbc2d_fk_Tenuta_cl` FOREIGN KEY (`cliente_id`) REFERENCES `tenuta_cliente` (`id`),
  ADD CONSTRAINT `Tenuta_partecipazion_evento_id_684f280b_fk_Tenuta_ev` FOREIGN KEY (`evento_id`) REFERENCES `tenuta_evento` (`id`);

--
-- Limiti per la tabella `tenuta_recensione`
--
ALTER TABLE `tenuta_recensione`
  ADD CONSTRAINT `Tenuta_recensione_cliente_id_8f0dc0e4_fk_Tenuta_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `tenuta_cliente` (`id`),
  ADD CONSTRAINT `Tenuta_recensione_evento_id_38507934_fk_Tenuta_evento_id` FOREIGN KEY (`evento_id`) REFERENCES `tenuta_evento` (`id`),
  ADD CONSTRAINT `Tenuta_recensione_prodotto_id_39cbf4ac_fk_Tenuta_prodotto_id` FOREIGN KEY (`prodotto_id`) REFERENCES `tenuta_prodotto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
