-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Jún 20. 09:05
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `workshop_mvc`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `category`
--

CREATE TABLE `category` (
  `category_id` int(2) NOT NULL,
  `category_name_hun` varchar(100) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `category_name_eng` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `category`
--

INSERT INTO `category` (`category_id`, `category_name_hun`, `category_name_eng`) VALUES
(1, 'Mechanika', 'Mechanics'),
(2, 'Hőtan/Termodinamika', 'Thermodinamics'),
(3, 'Elektromosságtan', 'Electricity'),
(4, 'Atomfizika', 'Atomic physics'),
(5, 'Fénytan/Optika', 'Optics'),
(6, 'Csillagászat/Gravitáció', 'Astronomy/Space physics');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `category_topic`
--

CREATE TABLE `category_topic` (
  `cat_top_id` int(10) NOT NULL,
  `category_id` int(2) NOT NULL,
  `topic_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `category_topic`
--

INSERT INTO `category_topic` (`cat_top_id`, `category_id`, `topic_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 2, 11),
(12, 2, 12),
(13, 2, 13),
(14, 2, 14),
(15, 3, 15),
(16, 3, 16),
(17, 3, 17),
(18, 2, 18),
(19, 4, 19),
(20, 3, 19),
(21, 5, 20),
(22, 5, 21),
(23, 4, 21),
(24, 4, 22),
(25, 4, 23),
(26, 6, 24);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `containers`
--

CREATE TABLE `containers` (
  `content_id` int(5) NOT NULL,
  `container_id` varchar(30) NOT NULL,
  `container_type` varchar(20) NOT NULL,
  `content_hun` text CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `content_eng` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `containers`
--

INSERT INTO `containers` (`content_id`, `container_id`, `container_type`, `content_hun`, `content_eng`) VALUES
(1, 'reg_button', 'html', 'Regisztráció', 'Sign in'),
(2, 'login_button', 'html', 'Belépés', 'Login'),
(3, 'category_menu_label', 'html', 'KATEGÓRIÁK:', 'BRANCHES:'),
(4, 'search_topic', 'input', 'A keresett fogalom…', 'Topic to find…'),
(5, 'classroom', 'html', 'Osztályterem', 'Classroom'),
(6, 'school_work', 'html', 'Tananyagok', 'School work'),
(7, 'regname', 'input', 'Név… (kötelező kitölteni!)', 'Name…. (must be filled out!)'),
(8, 'regemail', 'input', 'Email… (kötelező kitölteni!)', 'Email…. (must be filled out!)'),
(9, 'regpass', 'input', 'Jelszó… (minimum 6 karakter)', 'Password...(6 character at least)'),
(10, 'regpass2', 'input', 'Jelszó ismét…', 'Password check..'),
(11, 'regphone', 'input', 'Mobilszám… (nem kötelező!)', 'Phone number… (optional!)'),
(12, 'regsubmit', 'html', 'Regisztráció', 'Sign In'),
(13, 'loginemail', 'input', 'Email… (kötelező kitölteni!)', 'Email…. (must be filled out!)'),
(14, 'loginpass', 'input', 'Jelszó… (kötelező kitölteni!)', 'Password... (must be filled out!)'),
(15, 'loginsubmit', 'html', 'Belépés', 'Login'),
(16, 'logo', 'img', 'images/laboratory_hun.jpg', 'images/laboratory_eng.jpg'),
(17, 'logout_button', 'html', 'Kilépés', 'Logout'),
(18, 'must_fillout_error1', 'html', 'A fenti mezőt kötelező kitölteni!', 'This field must be filled out!'),
(19, 'regerror1', 'html', 'Ezzel az emailcímmel már regisztrált felhasználó!', 'Another user signed in with this email address!'),
(20, 'regerror2', 'html', 'Ezzel a névvel már regisztrált egy felhasználó!', 'Another user already signed in with this name!'),
(21, 'registry_success', 'html', 'Sikeres regisztráció! Kérem lépjen be!', 'Successful registration! Please, log in!'),
(22, 'pass2_error', 'html', 'A jelszó megerősítés nem egyezik az eredetivel!', 'Password check failed!'),
(23, 'must_fillout_error2', 'html', 'A fenti mezőt kötelező kitölteni!', 'This field must be filled out!'),
(24, 'must_fillout_error3', 'html', 'A fenti mezőt kötelező kitölteni!', 'This field must be filled out!'),
(25, 'must_fillout_error0', 'html', 'A fenti mezőt kötelező kitölteni!', 'This field must be filled out!'),
(26, 'pass_short_error', 'html', 'A jelszó hossza minimum 6 karakter!', 'The password must be at least 6 characters long!'),
(27, 'loginerror1', 'html', 'Ezzel az emailcímmel nem található felhasználó!', 'No user found with this email address!'),
(28, 'loginerror2', 'html', 'A jelszó nem megfelelő!', 'The password is incorrect!'),
(29, 'login_success', 'html', 'Sikeres belépés!', 'Successful login!'),
(30, 'search_button', 'html', 'Új keresés &nbsp;<i class=\"fa fa-search\"></i>', 'New search &nbsp;<i class=\"fa fa-search\"></i>'),
(31, 'loginemail_label', 'html', 'Felhasználó email címe', 'User email address'),
(32, 'loginpass_label', 'html', 'Jelszó', 'Password'),
(33, 'regname_label', 'html', 'Felhasználó neve', 'User name'),
(34, 'regpass2_label', 'html', 'Jelszó ismétlése', 'Check password'),
(35, 'regpass_label', 'html', 'Jelszó', 'Password'),
(36, 'regemail_label', 'html', 'Felhasználó email címe', 'User email address'),
(37, 'regphone_label', 'html', 'Telefonszám (nem kötelező)', 'Phone number (optional)'),
(38, 'topic_label1', 'html', 'Témakörök a &nbsp;', 'Chapters of &nbsp;'),
(39, 'topic_label2', 'html', '&nbsp; kategórián belül: &nbsp;', '&nbsp; category: &nbsp;');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(6) NOT NULL,
  `customer_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `password`, `email`, `phone`) VALUES
(1, 'Admin', 'ec6a6536ca304edf844d1d248a4f08dc', 'admin@admin.com', '06707070707'),
(6, 'mb', '3cdf5666859f6906c283a1058cd5b9a7', 'mb@mb.hu', '33333'),
(12, 'molnarb', '9db06bcff9248837f86d1a6bcf41c9e7', 'molnar@molnar.hu', ''),
(13, 'molnar', '9db06bcff9248837f86d1a6bcf41c9e7', 'mb@mb.com', ''),
(14, 'molnarbotond', 'a02cc9a3fc5def5275b5ca22f0d8f414', 'mbotond@mb.hu', '222222222');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(5) NOT NULL,
  `feedback_type` varchar(20) NOT NULL,
  `feedback_hun` text CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `feedback_eng` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `feedback_type`, `feedback_hun`, `feedback_eng`) VALUES
(1, 'error', 'Ezzel az emailcímmel már regisztrált felhasználó!', 'A customer already signed in with this email!'),
(2, 'error', 'Név megadása kötelező!', 'Name required!'),
(3, 'error', 'Email megadása kötelező!', 'Email is required!'),
(4, 'error', 'Jelszó megadása kötelező!', 'Password required!'),
(5, 'error', 'A jelszó megerősítés nem egyezik az eredetivel', 'Password confirmation failed!'),
(6, 'feedback', 'Hiba az űrlap kitöltésében:', 'Error filling out the form:'),
(7, 'feedback', 'Az adatokat elmentettük, kérem lépjen be!', 'The data has been saved, please log in!'),
(8, 'feedback', 'Hiba az adatok mentésében!', 'Data saving failure!'),
(9, 'feedback', 'Sikertelen belépés az oldalra!', 'Access denied!'),
(10, 'feedback', 'Sikeres bejelentkezés!', 'Succesful login!'),
(11, 'feedback', 'Sikertelen bejelentkezés!', 'Login fgailed!');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `subtopic`
--

CREATE TABLE `subtopic` (
  `subtopic_id` int(4) NOT NULL,
  `subtopic_name_hun` varchar(100) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `subtopic_name_eng` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `subtopic`
--

INSERT INTO `subtopic` (`subtopic_id`, `subtopic_name_hun`, `subtopic_name_eng`) VALUES
(1, 'Egyenes vonalú mozgás', 'Linear motion'),
(2, 'Egyenletes mozgás', 'Uniform motion'),
(3, 'Egyenletesen gyorsuló mozgás', 'Uniform accelerating motion'),
(4, 'Egyenletes körmozgás', 'Uniform circular motion'),
(5, 'Gyorsuló körmozgás', 'Accelerating circular motion'),
(6, 'Harmonikus rezgőmozgás', 'Harmonic oscillation'),
(7, 'Hajítás', 'Projectile motion'),
(8, 'Bolygók mozgása', 'Orbital motion'),
(9, 'Newton 1. törvénye', 'Newton\'s 1st law'),
(10, 'Newton 2. törvénye', 'Newton\'s 2nd law'),
(11, 'Newton 3. törvénye', 'Newton\'s 3rd law'),
(12, 'Súrlódási erő', 'Friction force'),
(13, 'Közegellenállási erő', 'Fluid resistance'),
(14, 'Súly', 'Weight'),
(15, 'Tömegvonzási  erő', 'Gravity force'),
(16, 'Rugalmas erő', 'Elastic force'),
(17, 'Mechanikai munka', 'Mechanical work'),
(18, 'Konzervatív erők', 'Conservative forces'),
(19, 'Helyzeti energia', 'Potential energy'),
(20, 'Mozgási energia', 'Kinetic energy'),
(21, 'Rugalmas energia', 'Elastic potential energy'),
(22, 'Munkatétel', 'Work and Energy'),
(23, 'Energia megmaradás', 'Conservation of energy'),
(24, 'Lendület', 'Momentum'),
(25, 'Tömegpont rendszer', 'Point of mass system'),
(26, 'Lendület megmaradás', 'Conservation of momentum'),
(27, 'Ütközések', 'Collisions'),
(28, 'Forgatónyomaték', 'Torque'),
(29, 'Merev test egyensúlya', 'Rigid body equilibrium'),
(30, 'Gyorsuló forgómozgás', 'Accelerating rotational motion'),
(31, 'Mechanikai hullámok', 'Mechanical waves'),
(32, 'Elektromágneses hullámok', 'Electromagnetic waves'),
(33, 'Sűrűség', 'Density'),
(34, 'Nyomás', 'Pressure'),
(35, 'Pascal törvény', 'Pascal Law'),
(36, 'Hidrosztatikai nyomás', 'Hydrostatic pressure'),
(37, 'Áramló közeg', 'Flowing medium'),
(38, 'Hőmérséklet', 'Temperature'),
(39, 'Hőtágulás', 'Thermal expansion'),
(40, 'Hőcsere folyamatok', 'Heat transfer'),
(41, 'Hőkapacitás', 'Heat capacity'),
(42, 'Halmazállapot változások', 'Physical state changes'),
(43, 'Gáztörvények', 'Gas laws'),
(44, 'Gázok kinetikus modellje', 'Kinetic model of gases'),
(45, 'Belső energia', 'Internal energy'),
(46, 'A termodinamika 1. főtétele', 'Law 1 of thermodynamics'),
(47, 'A termodinamika 2. főtétele', 'Law 2 of thermodynamics'),
(48, 'Elektromos alapjelenségek', 'Basic electrical phenomena'),
(49, 'Coulomb törvény', 'Coulomb Law'),
(50, 'Elektrosztatikus tér', 'Electrostatic field'),
(51, 'Töltések vezetőn', 'Electric charge on conductors'),
(52, 'Elektomos áram', 'Electric current'),
(53, 'Gerjesztési törvény', 'Excitation law'),
(54, 'Elektromos indukció', 'Electrical induction'),
(55, 'Váltóáram', 'Alternating current'),
(56, 'Egyenáram', 'Direct current'),
(57, 'Maxwell egyenletek', 'Maxwell equations'),
(58, 'A fény hullámtermészete', 'The wave nature of light'),
(59, 'A fény részecsketermészete', 'Particle nature of light'),
(60, 'Sugármenetek', 'Light rays path'),
(61, 'Leképező eszközök', 'Optical instruments'),
(62, 'Atommodellek', 'Atomic models'),
(63, 'Elektronhéj', 'Electron shell'),
(64, 'Az anyag kettős természete', 'The dual nature of matter'),
(65, 'Nukleáris energia', 'Nuclear energy'),
(66, 'Nukleáris erőmű', 'Nuclear power plant'),
(67, 'Energia termelés', 'Primary energy types'),
(68, 'Speciális relativitás', 'Special relativity'),
(69, 'Kozmogónia', 'Cosmogony'),
(70, 'Naprendszer', 'Solar system');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `topic`
--

CREATE TABLE `topic` (
  `topic_id` int(3) NOT NULL,
  `topic_name_hun` varchar(100) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `topic_name_eng` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `topic`
--

INSERT INTO `topic` (`topic_id`, `topic_name_hun`, `topic_name_eng`) VALUES
(1, 'Egyszerű mozgások', 'Simple motions'),
(2, 'Összetett mozgások', 'Complex motions'),
(3, 'Periodikus mozgások', 'Periodic motions'),
(4, 'Newton törvények', 'Newtonian laws'),
(5, 'Erők', 'Forces'),
(6, 'Munka/Mechanikai Energia', 'Work/Mechanical Energies'),
(7, 'Lendület/Ütközések', 'Momentum/Collisions'),
(8, 'Kiterjedt testek/Forgómozgás', 'Extended bodies/Rotary motion'),
(9, 'Hullámok', 'Waves'),
(10, 'Deformálható közegek mechanikája', 'Mechanics of fluids'),
(11, 'Hőmérséklet változása', 'Temperature change'),
(12, 'Hőcsere', 'Heat transfer'),
(13, 'Gázok kinetikus modellje', 'Kinetic model  of gases'),
(14, 'Termodinamika főtételei', 'Laws of Themodinamics'),
(15, 'Elektrosztatika', 'Static electric fields'),
(16, 'Elektromos áram', 'Electric current'),
(17, 'Elektromágneses jelenségek', 'Electromagnetism'),
(18, 'Halmazállapot-változások', 'Change of state'),
(19, 'Fizikai optika/Elektromágneses hullámok', 'Electromagnetic waves'),
(20, 'Geometriai optika', 'Optics'),
(21, 'A fény kettős természete', 'Dual nature of light'),
(22, 'Az atom szerkezete', 'Atomic structure'),
(23, 'Atommag fizika', 'Nuclear physics'),
(24, 'Csillagászat', 'Astronomy');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `topic_subtopic`
--

CREATE TABLE `topic_subtopic` (
  `top_sub_id` int(5) NOT NULL,
  `topic_id` int(3) NOT NULL,
  `subtopic_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- A tábla indexei `category_topic`
--
ALTER TABLE `category_topic`
  ADD PRIMARY KEY (`cat_top_id`);

--
-- A tábla indexei `containers`
--
ALTER TABLE `containers`
  ADD PRIMARY KEY (`content_id`);

--
-- A tábla indexei `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- A tábla indexei `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- A tábla indexei `subtopic`
--
ALTER TABLE `subtopic`
  ADD PRIMARY KEY (`subtopic_id`);

--
-- A tábla indexei `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`topic_id`);

--
-- A tábla indexei `topic_subtopic`
--
ALTER TABLE `topic_subtopic`
  ADD PRIMARY KEY (`top_sub_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `category_topic`
--
ALTER TABLE `category_topic`
  MODIFY `cat_top_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT a táblához `containers`
--
ALTER TABLE `containers`
  MODIFY `content_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT a táblához `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT a táblához `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT a táblához `subtopic`
--
ALTER TABLE `subtopic`
  MODIFY `subtopic_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT a táblához `topic`
--
ALTER TABLE `topic`
  MODIFY `topic_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT a táblához `topic_subtopic`
--
ALTER TABLE `topic_subtopic`
  MODIFY `top_sub_id` int(5) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
