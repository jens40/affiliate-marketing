-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 13. Mrz 2020 um 12:37
-- Server-Version: 10.1.39-MariaDB
-- PHP-Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `affiliate_marketing`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_deleted` int(1) NOT NULL,
  `is_active` int(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_date` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `confirm_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `admins`
--

INSERT INTO `admins` (`admin_id`, `email`, `is_deleted`, `is_active`, `name`, `password`, `created_date`, `password_hash`, `confirm_password`) VALUES
(2, '1234@1234.de', 0, 1, 'admin', '$2y$13$qkxMTYsdTm7MCharqZulbO38tnGwyHcfLvXFNGDFe99fRhcN4BEiS', '2020-03-13 11:48:38', '', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `banners`
--

CREATE TABLE `banners` (
  `banner_id` int(255) NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL,
  `created_at` date NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categories`
--

CREATE TABLE `categories` (
  `category_id` int(255) NOT NULL,
  `network_id` int(255) NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL,
  `api_category_id` int(255) NOT NULL,
  `no_of_programs` varchar(255) NOT NULL,
  `parent_id` int(255) DEFAULT '0',
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `categories`
--

INSERT INTO `categories` (`category_id`, `network_id`, `is_active`, `is_deleted`, `api_category_id`, `no_of_programs`, `parent_id`, `created_at`, `updated_at`, `name`, `description`) VALUES
(2, 1, 1, 0, 65756, '', NULL, '2020-03-13', '2020-03-13', 'fgbxdfgb', 'fgdbgfbxfgbfg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cms`
--

CREATE TABLE `cms` (
  `cms_id` int(255) NOT NULL,
  `is_deleted` int(1) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `content_en` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `cms`
--

INSERT INTO `cms` (`cms_id`, `is_deleted`, `title_en`, `content_en`) VALUES
(1, 0, 'retrataregaerg', '<p>regergergreg<br></p>');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `creative_ads`
--

CREATE TABLE `creative_ads` (
  `creative_ad_id` int(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `creative_ads`
--

INSERT INTO `creative_ads` (`creative_ad_id`, `content`, `is_deleted`) VALUES
(1, 'dfhbgfdbfd', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deals`
--

CREATE TABLE `deals` (
  `deal_id` int(255) NOT NULL,
  `network_id` int(255) NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `featured` int(1) NOT NULL,
  `end_date` date NOT NULL,
  `coupon_id` int(255) NOT NULL,
  `program_id` int(255) NOT NULL,
  `minimum_order_value` int(255) NOT NULL,
  `start_date` date NOT NULL,
  `expire_date` date NOT NULL,
  `last_change_date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `voucher_types` varchar(255) NOT NULL,
  `partnership_status` varchar(255) NOT NULL,
  `integration_code` varchar(255) NOT NULL,
  `customer_restriction` varchar(255) NOT NULL,
  `sys_user_ip` varchar(255) NOT NULL,
  `destination_url` varchar(255) NOT NULL,
  `discount_fixed` varchar(255) NOT NULL,
  `discount_variable` varchar(255) NOT NULL,
  `discount_code` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deal_banners`
--

CREATE TABLE `deal_banners` (
  `deal_banner_id` int(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `is_deleted` int(1) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `deal_banners`
--

INSERT INTO `deal_banners` (`deal_banner_id`, `title`, `content`, `type`, `created_at`, `is_deleted`, `is_active`) VALUES
(1, 'fdbydfb', 'dfbydfbyfd', 'H', '2020-03-13', 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deal_categories`
--

CREATE TABLE `deal_categories` (
  `deal_category_id` int(255) NOT NULL,
  `category_id` int(255) NOT NULL,
  `deal_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deal_stores`
--

CREATE TABLE `deal_stores` (
  `deal_store_id` int(255) NOT NULL,
  `store_id` int(255) NOT NULL,
  `deal_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `faqs`
--

CREATE TABLE `faqs` (
  `faq_id` int(11) NOT NULL,
  `question_en` varchar(255) NOT NULL,
  `answer_en` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `faqs`
--

INSERT INTO `faqs` (`faq_id`, `question_en`, `answer_en`) VALUES
(1, 'dcfnbdfx', 'gbfdbdfbdfb');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `networks`
--

CREATE TABLE `networks` (
  `network_id` int(255) NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL,
  `cron_daily` varchar(255) NOT NULL,
  `create_category` varchar(255) NOT NULL,
  `create_store` varchar(255) NOT NULL,
  `notify_stores` varchar(255) NOT NULL,
  `notify_categories` varchar(255) NOT NULL,
  `auto_publish` varchar(255) NOT NULL,
  `network_name` varchar(255) NOT NULL,
  `network_customer_id` int(255) NOT NULL,
  `network_passphrase` varchar(255) NOT NULL,
  `network_site_id` int(255) NOT NULL,
  `network_site_locale` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `networks`
--

INSERT INTO `networks` (`network_id`, `is_active`, `is_deleted`, `cron_daily`, `create_category`, `create_store`, `notify_stores`, `notify_categories`, `auto_publish`, `network_name`, `network_customer_id`, `network_passphrase`, `network_site_id`, `network_site_locale`) VALUES
(1, 1, 0, '1', '1', '1', '1', '1', '1', 'rtjdsrtj', 6547457, 'fghjgfhgf', 546, 'gffghnfgnj');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `newsletter_subscriber`
--

CREATE TABLE `newsletter_subscriber` (
  `newsletter_id` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `newsletter_subscriber_id` int(255) NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `products`
--

CREATE TABLE `products` (
  `product_id` int(255) NOT NULL,
  `network_id` int(255) NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL,
  `is_featured` int(1) NOT NULL,
  `price` varchar(255) NOT NULL,
  `is_stock` varchar(255) NOT NULL,
  `retail_price` varchar(255) NOT NULL,
  `sale_price` varchar(255) NOT NULL,
  `feed_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `buy_url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `advertiser_name` varchar(255) NOT NULL,
  `store_id` int(255) NOT NULL,
  `additional_info` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stores`
--

CREATE TABLE `stores` (
  `store_id` int(255) NOT NULL,
  `network_id` int(255) NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `api_store_id` int(255) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `store_logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indizes für die Tabelle `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indizes für die Tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indizes für die Tabelle `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`cms_id`);

--
-- Indizes für die Tabelle `creative_ads`
--
ALTER TABLE `creative_ads`
  ADD PRIMARY KEY (`creative_ad_id`);

--
-- Indizes für die Tabelle `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`deal_id`);

--
-- Indizes für die Tabelle `deal_banners`
--
ALTER TABLE `deal_banners`
  ADD PRIMARY KEY (`deal_banner_id`);

--
-- Indizes für die Tabelle `deal_stores`
--
ALTER TABLE `deal_stores`
  ADD PRIMARY KEY (`deal_store_id`);

--
-- Indizes für die Tabelle `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`faq_id`);

--
-- Indizes für die Tabelle `networks`
--
ALTER TABLE `networks`
  ADD PRIMARY KEY (`network_id`);

--
-- Indizes für die Tabelle `newsletter_subscriber`
--
ALTER TABLE `newsletter_subscriber`
  ADD PRIMARY KEY (`newsletter_id`);

--
-- Indizes für die Tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indizes für die Tabelle `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `banners`
--
ALTER TABLE `banners`
  MODIFY `banner_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `cms`
--
ALTER TABLE `cms`
  MODIFY `cms_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `creative_ads`
--
ALTER TABLE `creative_ads`
  MODIFY `creative_ad_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `deals`
--
ALTER TABLE `deals`
  MODIFY `deal_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `deal_banners`
--
ALTER TABLE `deal_banners`
  MODIFY `deal_banner_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `deal_stores`
--
ALTER TABLE `deal_stores`
  MODIFY `deal_store_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `faqs`
--
ALTER TABLE `faqs`
  MODIFY `faq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `networks`
--
ALTER TABLE `networks`
  MODIFY `network_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `newsletter_subscriber`
--
ALTER TABLE `newsletter_subscriber`
  MODIFY `newsletter_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(255) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
