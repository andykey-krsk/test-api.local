-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 10 2021 г., 08:38
-- Версия сервера: 10.4.19-MariaDB
-- Версия PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test_api`
--

-- --------------------------------------------------------

--
-- Структура таблицы `img`
--

CREATE TABLE `img` (
  `img_id` bigint(20) UNSIGNED NOT NULL,
  `img_small` varchar(100) NOT NULL,
  `img_full` varchar(100) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `img`
--

INSERT INTO `img` (`img_id`, `img_small`, `img_full`, `product_id`) VALUES
(1, 'Laboriosam ex ex odio tempore.', 'Omnis qui voluptatem dolores delectus culpa maiores maxime. Similique quae ipsum atque ad nisi et. F', 1),
(2, 'Voluptatem velit et dolorum praesentium.', 'Quis error sed nihil sunt fugiat. Optio provident maiores aliquam. Aut earum quasi possimus veritati', 1),
(3, 'Eos alias earum recusandae ut qui.', 'Quaerat molestias totam officia et aliquid nam esse. Ullam dicta ut quo nihil aut ipsa cum provident', 1),
(4, 'Et possimus totam labore quas magni error optio.', 'Autem distinctio hic dolores tempore. Ea officiis ratione at. Veritatis qui et magni mollitia alias ', 2),
(5, 'Fuga neque sequi dolor pariatur et qui.', 'Et qui voluptatibus exercitationem repudiandae quo exercitationem quis dolores. Voluptas quos qui nu', 3),
(6, 'Dolores quos maxime non dolore.', 'Veniam dolores eaque sint vel optio aut. Adipisci necessitatibus voluptatem adipisci suscipit provid', 3),
(7, 'Et sit qui vel aspernatur.', 'Harum facere sunt similique architecto est nesciunt architecto. Aut et ut aut. Tenetur impedit dolor', 4),
(8, 'Cupiditate fuga sed rerum consequatur dolores est eos laudantium.', 'Culpa consectetur maiores velit et eum accusantium. Consequatur autem hic et. Fugiat occaecati aut e', 4),
(9, 'Quibusdam error veniam ex optio qui vitae et.', 'Repellat corporis libero rerum. Sint error fugiat sunt accusamus praesentium rerum occaecati. Simili', 5),
(10, 'Rerum hic corrupti labore earum dolor deserunt.', 'Harum sit rerum in error. Deleniti odio aut rerum quo qui qui consectetur. Molestias ut voluptatibus', 5),
(11, 'Eaque ut omnis exercitationem est nihil quia doloribus.', 'Quod sint fugit eaque. Voluptatum reprehenderit et et ut. Vitae quae illum minima voluptate est. Sin', 6),
(12, 'Aliquid aut quis quia non eligendi.', 'Ut magni nihil aut vero eveniet. Error quod error sit quia nesciunt ipsam. Commodi atque id at quis ', 6),
(13, 'Aut consequatur maiores quibusdam eum molestiae sed.', 'Architecto id necessitatibus explicabo perferendis consequatur et. Qui similique itaque est eius max', 6),
(14, 'Vel hic nesciunt nemo rerum inventore.', 'Aut ea sed fuga quo non quibusdam. Unde sed sunt occaecati quas quas veritatis porro. Distinctio sap', 7),
(15, 'Aspernatur maxime consequatur quae quis molestiae consectetur blanditiis a.', 'Corporis est placeat natus sed asperiores et. Eius at est voluptate voluptate facere. Optio id quaer', 7),
(16, 'Nihil aliquid qui repellendus doloribus.', 'Facere nobis rerum animi quam. Expedita repudiandae rerum laboriosam et quae optio facere. Eaque duc', 8),
(17, 'Aut quidem laborum iusto dolorem.', 'Architecto aut id sapiente architecto aut et iste aut. Accusantium veniam reiciendis laborum qui non', 8),
(18, 'Iste debitis voluptatibus fugit asperiores eos.', 'Repellat laboriosam laborum ipsa reprehenderit et est quo. Temporibus ad repellat perspiciatis paria', 9),
(19, 'Veritatis dolor beatae asperiores sed inventore quia et.', 'Qui aut enim sunt tenetur. Asperiores sint possimus repudiandae vitae odio. Minus amet nobis provide', 9),
(20, 'Autem ea aliquid quaerat.', 'Rerum aut odio molestiae rerum voluptas. Est et et error minima sint. Iure aspernatur quo optio cons', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `number` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('новый','подтвержден','оплачен','отправлен','закрыт','отменен') NOT NULL DEFAULT 'новый',
  `coment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_id`, `date`, `number`, `user_id`, `status`, `coment`) VALUES
(1, '1981-08-17', 100000, 4, 'отправлен', 'Коментарий'),
(2, '1995-05-07', 100001, 5, 'отменен', 'Коментарий'),
(3, '2005-03-09', 100002, 6, 'отменен', 'Коментарий'),
(4, '1999-07-19', 100003, 7, 'подтвержден', 'Коментарий'),
(5, '2007-11-14', 100004, 8, 'закрыт', 'Коментарий'),
(6, '2020-04-27', 100005, 9, 'оплачен', 'Коментарий'),
(7, '2000-06-09', 100006, 10, 'подтвержден', 'Коментарий'),
(8, '2002-11-02', 100007, 11, 'оплачен', 'Коментарий'),
(9, '1986-10-03', 100008, 12, 'отменен', 'Коментарий'),
(10, '1976-01-04', 100009, 13, 'отменен', 'Коментарий'),
(31, '2021-10-09', 100010, 11, 'новый', 'Коментарий'),
(32, '2021-10-09', 100011, 11, 'новый', NULL),
(33, '2021-10-09', 100012, 11, 'новый', 'текст коментария'),
(34, '2021-10-09', 100013, 11, 'новый', 'текст коментария'),
(35, '2021-10-09', 100014, 11, 'новый', 'текст коментария'),
(36, '2021-10-09', 100015, 11, 'новый', 'текст коментария'),
(37, '2021-10-09', 100016, 11, 'новый', 'текст коментария'),
(38, '2021-10-09', 100017, 11, 'новый', 'текст коментария'),
(39, '2021-10-09', 100018, 11, 'новый', 'текст коментария'),
(40, '2021-10-10', 100019, 11, 'новый', 'текст коментария');

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE `order_product` (
  `or_pr_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_product`
--

INSERT INTO `order_product` (`or_pr_id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 1, 1, 5),
(2, 2, 2, 4),
(3, 3, 3, 10),
(4, 4, 4, 5),
(5, 5, 5, 3),
(6, 6, 6, 3),
(7, 7, 7, 2),
(8, 8, 8, 2),
(9, 9, 9, 5),
(10, 1, 2, 6),
(31, 31, 1, 5),
(32, 31, 2, 6),
(33, 32, 1, 5),
(34, 32, 2, 6),
(35, 33, 1, 5),
(36, 33, 2, 6),
(37, 34, 1, 5),
(38, 34, 2, 6),
(39, 35, 1, 5),
(40, 35, 2, 6),
(41, 36, 1, 5),
(42, 36, 2, 6),
(43, 37, 1, 5),
(44, 37, 2, 6),
(45, 39, 1, 5),
(46, 39, 2, 6),
(47, 40, 1, 5),
(48, 40, 2, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_description` text NOT NULL,
  `product_price` decimal(10,0) NOT NULL,
  `group` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `product_price`, `group`) VALUES
(1, 'porro', 'Autem corporis temporibus rem asperiores non sit. Ex distinctio quia deserunt. Rerum aut provident voluptates aperiam voluptatem voluptatibus officiis.', '373', 'c'),
(2, 'ut', 'Qui enim et impedit aspernatur aut. Necessitatibus numquam aut consectetur quis laboriosam voluptates qui. Sit itaque velit temporibus et voluptas qui. Culpa architecto velit veritatis nulla sint beatae.', '49', 'b'),
(3, 'error', 'Facere ipsum pariatur quaerat. Sint vitae iusto libero quia velit architecto corporis.', '491', 'c'),
(4, 'natus', 'Asperiores molestiae ducimus qui inventore modi. Atque mollitia rem tenetur ut est omnis doloremque. Voluptatem dolorem suscipit accusamus dignissimos omnis est. Aperiam distinctio rerum blanditiis cum aperiam impedit.', '792', 'a'),
(5, 'maxime', 'Dolores repudiandae debitis voluptas ea id placeat. Ut ullam enim assumenda quo est mollitia amet. Praesentium labore earum commodi autem accusantium iste voluptas.', '181', 'b'),
(6, 'aut', 'Quae sint ex sed adipisci perferendis. Cupiditate natus ullam aliquid odit quas a. Mollitia et dolore maxime dolorem. Aut in mollitia ut dolor delectus.', '412', 'a'),
(7, 'quod', 'Voluptatem consequatur placeat cum magni. Esse delectus quos vero assumenda assumenda. Et qui eligendi adipisci aspernatur.', '80', 'b'),
(8, 'laboriosam', 'Explicabo hic unde aut suscipit. Nihil neque ut eligendi dolor saepe mollitia doloribus. Assumenda rerum minus ullam sed nihil quam.', '407', 'c'),
(9, 'exercitationem', 'Dolore ipsam vitae magni nesciunt. Harum amet necessitatibus ipsam laudantium. Necessitatibus repudiandae sit perspiciatis necessitatibus esse. Enim necessitatibus assumenda iure praesentium cumque laboriosam corrupti.', '484', 'a'),
(10, 'voluptas', 'Voluptatum enim adipisci distinctio rerum culpa iure tenetur aut. Asperiores quod eligendi recusandae qui alias rem. Ut quis similique quae ratione sed non saepe. Harum ut repudiandae ut.', '656', 'a');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `name`, `phone`) VALUES
(4, 'ex', '78659144051'),
(5, 'porro', '78674814666'),
(6, 'fugiat', '78785106998'),
(7, 'repudiandae', '78498023840'),
(8, 'sunt', '78410892881'),
(9, 'itaque', '78360986492'),
(10, 'porro', '78335592619'),
(11, 'corrupti', '78814904538'),
(12, 'sit', '78925905299'),
(13, 'ipsam', '78835843306');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`img_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `number` (`number`);

--
-- Индексы таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`or_pr_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `img`
--
ALTER TABLE `img`
  MODIFY `img_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `order_product`
--
ALTER TABLE `order_product`
  MODIFY `or_pr_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
