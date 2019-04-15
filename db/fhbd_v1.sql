-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2019 at 04:17 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fhbd_v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `r_courses`
--

CREATE TABLE `r_courses` (
  `course_ID` int(10) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `course_desc` varchar(255) NOT NULL,
  `course_status` varchar(10) NOT NULL DEFAULT 'Active',
  `course_timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_courses`
--

INSERT INTO `r_courses` (`course_ID`, `course_code`, `course_desc`, `course_status`, `course_timestamp`) VALUES
(1, 'BSIT', 'Bachelor of Science in Information Technology', 'Active', '2019-04-05 00:00:00'),
(2, 'BSBA-MM', 'Bachelor of Science in Business Administration Major in Marketing Management', 'Active', '2019-04-05 00:00:00'),
(3, 'BSBA-HRDM', 'Bachelor of Science in Business Administration Major in Human Resource Development Management', 'Active', '2019-04-05 00:00:00'),
(4, 'BSENT', 'Bachelor of Science in Entrepreneurship', 'Active', '2019-04-05 00:00:00'),
(5, 'BBTE', 'Bachelor of Business Teaching Education', 'Active', '2019-04-05 00:00:00'),
(6, 'DOMT', 'Diploma in Office Management technology', 'Active', '2019-04-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `r_office`
--

CREATE TABLE `r_office` (
  `office_ID` int(10) NOT NULL,
  `office_name` varchar(50) NOT NULL,
  `office_stat` bit(1) NOT NULL,
  `office_timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_office`
--

INSERT INTO `r_office` (`office_ID`, `office_name`, `office_stat`, `office_timestamp`) VALUES
(1, 'Cashier\'s Office', b'1', '2019-04-05 00:00:00'),
(2, 'Office of the Branch Director', b'1', '2019-04-11 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `r_particulars`
--

CREATE TABLE `r_particulars` (
  `prtclr_ID` int(10) NOT NULL,
  `prtclr_desc` varchar(100) NOT NULL,
  `prtclr_amount` decimal(10,2) NOT NULL,
  `prtclr_status` varchar(10) NOT NULL DEFAULT 'Active',
  `prtclr_timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_particulars`
--

INSERT INTO `r_particulars` (`prtclr_ID`, `prtclr_desc`, `prtclr_amount`, `prtclr_status`, `prtclr_timestamp`) VALUES
(1, 'Application for Graduation', '150.00', 'Active', '2019-04-05 00:00:00'),
(2, 'Graduation Fee', '600.00', 'Active', '2019-04-05 00:00:00'),
(3, 'Transcript of Records', '350.00', 'Active', '2019-04-05 00:00:00'),
(4, 'Diploma', '200.00', 'Active', '2019-04-05 00:00:00'),
(5, 'Certification of Grades', '150.00', 'Active', '2019-04-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `r_user_role`
--

CREATE TABLE `r_user_role` (
  `usr_ID` int(10) NOT NULL,
  `usr_desc` varchar(50) NOT NULL,
  `usr_stat` bit(1) NOT NULL,
  `usr_timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_user_role`
--

INSERT INTO `r_user_role` (`usr_ID`, `usr_desc`, `usr_stat`, `usr_timestamp`) VALUES
(1, 'Administrator', b'1', '2019-04-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `t_accounts`
--

CREATE TABLE `t_accounts` (
  `acc_ID` int(10) NOT NULL,
  `acc_empID` int(10) NOT NULL,
  `acc_username` varchar(100) NOT NULL,
  `acc_password` varchar(100) NOT NULL,
  `acc_user_role` int(10) NOT NULL,
  `acc_picture` varchar(255) NOT NULL DEFAULT 'default.png',
  `acc_mod_date` datetime NOT NULL,
  `acc_active_flag` varchar(10) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_accounts`
--

INSERT INTO `t_accounts` (`acc_ID`, `acc_empID`, `acc_username`, `acc_password`, `acc_user_role`, `acc_picture`, `acc_mod_date`, `acc_active_flag`) VALUES
(1, 1, 'admin', 'admin', 1, 'default.png', '2019-04-11 11:47:13', 'Active'),
(2, 2, 'edgardo_delmo', 'delmo', 1, 'default.png', '2019-04-11 00:00:00', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `t_employees`
--

CREATE TABLE `t_employees` (
  `emp_ID` int(10) NOT NULL,
  `emp_lastname` varchar(100) NOT NULL,
  `emp_middlename` varchar(100) DEFAULT NULL,
  `emp_firstname` varchar(100) NOT NULL,
  `emp_office` int(10) NOT NULL,
  `emp_position` varchar(50) NOT NULL,
  `emp_picture` varchar(255) NOT NULL DEFAULT 'default.png',
  `emp_signatory` varchar(10) NOT NULL,
  `emp_active_flag` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_employees`
--

INSERT INTO `t_employees` (`emp_ID`, `emp_lastname`, `emp_middlename`, `emp_firstname`, `emp_office`, `emp_position`, `emp_picture`, `emp_signatory`, `emp_active_flag`) VALUES
(1, 'Gonzalbo', 'B.', 'Merly', 1, 'SUC Administrative Staff', 'default.png', 'sig1', b'1'),
(2, 'Delmo', 'S.', 'Edgardo', 2, 'Branch Director', '', 'sig2', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `t_report_bug`
--

CREATE TABLE `t_report_bug` (
  `rb_ID` int(10) NOT NULL,
  `rb_reporter` int(10) NOT NULL,
  `rb_desc` varchar(255) NOT NULL,
  `rb_timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_student_info`
--

CREATE TABLE `t_student_info` (
  `stud_ID` int(10) NOT NULL,
  `stud_number` varchar(30) NOT NULL,
  `stud_lref_num` varchar(50) DEFAULT NULL,
  `stud_lastname` varchar(100) NOT NULL,
  `stud_givenname` varchar(100) NOT NULL,
  `stud_middleinit` varchar(3) DEFAULT NULL,
  `stud_sex` varchar(10) NOT NULL,
  `stud_birthdate` date NOT NULL,
  `stud_degree_prog` int(10) NOT NULL,
  `stud_year_level` varchar(10) NOT NULL,
  `stud_zipcode` varchar(10) DEFAULT NULL,
  `stud_email_add` varchar(100) NOT NULL,
  `stud_mobile_number` varchar(11) NOT NULL,
  `stud_timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_student_info`
--

INSERT INTO `t_student_info` (`stud_ID`, `stud_number`, `stud_lref_num`, `stud_lastname`, `stud_givenname`, `stud_middleinit`, `stud_sex`, `stud_birthdate`, `stud_degree_prog`, `stud_year_level`, `stud_zipcode`, `stud_email_add`, `stud_mobile_number`, `stud_timestamp`) VALUES
(1, '2015-00044-CM-0', '', 'Balmoria', 'Daniel', 'D', 'Male', '1998-11-30', 1, '4', '', 'danielbalmoria@gmail.com', '09397333256', '2019-04-11 16:18:38'),
(2, '2015-00194-CM-0', '', 'Valdez', 'Eric kristopher', 'P', 'Male', '1999-08-24', 1, '4', '', 'ericvaldezxc@gmail.com', '09165770480', '2019-04-11 16:20:59'),
(3, '2015-00075-CM-0', '', 'Agnir', 'Lowell Dave', 'E', 'Male', '1999-04-21', 1, '4', '1850', 'lowell.agnir@gmail.com', '09293767107', '2019-04-11 16:23:30'),
(4, '2015-00065-CM-0', '', 'Magtibay', 'Joshua Miguel', 'P', 'Male', '1998-12-03', 1, '4', '1127', 'joshuamiguelmagtibay17@gmail.com', '09164859500', '2019-04-11 16:25:10'),
(5, '2015-00004-CM-0', '', 'Maglaque', 'Gerard', 'O', 'Male', '1999-07-15', 1, '4', '1123', 'stirlessearth23@gmail.com', '09291633781', '2019-04-11 16:26:45'),
(6, '2015-00141-CM-0', '', 'Gutierrez', 'John Carlo', 'V', 'Male', '1999-01-02', 1, '4', '1116', 'jcgutierrez0102@live.com.ph', '09770482434', '2019-04-11 16:29:38'),
(7, '2015-00147-CM-0', '', 'RIOS', 'RHEA', 'F', 'Female', '1999-08-13', 1, '4', '1128', 'rhearios71@gmail.com', '09167600247', '2019-04-11 16:33:56'),
(8, '2015-00040-CM-0', '', 'RONQUILLO', 'FRANCHESCA', 'N', 'Female', '1998-01-22', 1, '4', '1422', 'youreronq@gmail.com', '09282778193', '2019-04-11 16:35:39'),
(9, '2015-00019-CM-0', '', 'TIU', 'OLIVEN', 'T', 'Male', '1998-09-01', 1, '4', '3023', 'feralflare91@gmail.com', '09195327266', '2019-04-11 16:38:07'),
(10, '2015-00175-CM-0', '', 'CORDERO', 'MC CHRISTENE', 'N', 'Female', '1998-09-10', 1, '4', '1206', 'mariantionie07@gmail.com', '09083063400', '2019-04-11 16:40:17'),
(11, '2015-00211-CM-0', '', 'Vigan', 'Jeremiah', 'D', 'Male', '1998-10-30', 1, '4', '', 'jeremiahvigan3011@gmail.com', '09999137023', '2019-04-11 16:42:33'),
(12, '2015-00200-CM-0', '', 'DoÃ±os', 'Jocer', 'P', 'Male', '1998-11-01', 1, '4', '', 'jocerxnew@gmail.com', '09993555925', '2019-04-11 16:44:22'),
(13, '2015-00048-CM-0', '', 'Ilaida Jr', 'Esperato', 'C', 'Male', '1998-07-17', 1, '4', '1121', 'iesperato@gmail.com', '09387165369', '2019-04-11 16:48:00'),
(14, '2015-00192-CM-0', '', 'Cagulang', 'Anne Nicole', 'A.', 'Female', '1999-02-12', 1, '4', '1860', 'nicole.wiredonwed@gmail.com', '09669434530', '2019-04-11 16:49:29'),
(15, '2015-00152-CM-0', '', 'Labayen', 'Raven Joyce', 'H.', 'Female', '1998-06-29', 1, '4', '1118', 'ravenlabayen@gmail.com', '09959287972', '2019-04-11 16:50:31'),
(16, '2015-00135-CM-0', '', 'Mape', 'Sheena Mae', 'DC', 'Female', '1999-05-09', 1, '4', '1121', 'sheenmape09@gmail.com', '09485052350', '2019-04-11 16:51:42'),
(17, '2015-00118-CM-0', '', 'Paler', 'Jade Bernardine', 'B.', 'Female', '1999-06-15', 1, '4', '1117', 'jadebernardinepaler@gmail.com', '09568593736', '2019-04-11 16:52:54'),
(18, '2015-00080-CM-0', '', 'VALENCIA', 'MARIELLE NICOLE', 'L.', 'Female', '1998-12-17', 1, '4', '1121', 'mnvalencia17@gmail.com', '09269719891', '2019-04-11 16:57:31'),
(19, '2015-00138-CM-0', '', 'GABRIEL', 'OLIVER', 'J', 'Male', '1998-11-16', 1, '4', '1106', 'olivergab19@gmail.com', '09156595899', '2019-04-11 16:59:26'),
(21, '2015-00410-CM-0', '', 'ALEJANDRIA', 'MA. MICHAELA', 'C.', 'Female', '1998-06-17', 1, '4', '1100', 'mikaalej@gmail.com', '09395093565', '2019-04-11 17:03:11'),
(22, '2015-00073-CM-0', '', 'LOYOLA', 'JOHN PATRICK', 'B.', 'Male', '1998-11-04', 1, '4', '1127', 'loyolapat04@gmail.com', '09309758130', '2019-04-11 17:04:09'),
(23, '2015-00106-CM-0', '', 'WOODS', 'CLARK IAN', 'N.', 'Male', '1998-04-09', 1, '4', '1107', 'clarkianwoods@gmail.com', '09289018775', '2019-04-11 17:39:31'),
(24, '2015-00014-CM-0', '', 'PAULO', 'JEREMIAH', 'D.', 'Male', '1998-12-30', 1, '4', '1121', 'paulo_jeremiah@yahoo.com', '09052929309', '2019-04-11 17:41:03'),
(25, '2015-00193-CM-0', '', 'BALATBAT', 'CRISTIAN', 'O', 'Male', '1999-10-26', 1, '4', '1117', 'cristianbalatbat@yahoo.com', '09531176022', '2019-04-11 17:42:56'),
(26, '2015-00171-CM-0', '', 'MASADA', 'CLARENCE', 'P', 'Female', '2015-01-15', 3, '4', '1107', 'cpmasada@gmail.com', '09955462014', '2019-04-12 09:01:45'),
(27, '2015-00168-CM-0', '', 'GATCHALIAN', 'CHARESS JOY', 'B', 'Female', '1999-05-07', 3, '4', '', 'charessjoy@gmail.com', '09303553361', '2019-04-12 09:04:34'),
(28, '2015-00306-CM-0', '', 'ORTALEZA', 'MIA GRACE', 'B', 'Female', '1999-02-10', 4, '4', '1121', 'miaortaleza@gmail.com', '09397895390', '2019-04-12 09:52:14'),
(29, '2015-00631-CM-0', '', 'GACAD', 'UNICE MAE', 'E.', 'Female', '1998-12-18', 4, '4', '1100', 'Unicemae18@gmail.com', '09271672331', '2019-04-12 09:54:47'),
(30, '2015-00011-CM-0', '', 'NGO', 'MARIELLA', 'T.', 'Female', '1998-04-10', 2, '4', '1421', 'mariella.mhea@gmail.com', '09565523874', '2019-04-12 10:58:59'),
(31, '2015-00038-CM-0', '', 'SUYAT', 'ANGELICA', 'D.', 'Female', '1998-08-30', 2, '4', '1421', 'angelica_suyadeciolea@yahoo.com', '09071087419', '2019-04-12 11:00:59'),
(32, '2015-00154-CM-0', '', 'MANIBLE', 'MA. RONA', 'L.', 'Female', '1995-11-14', 2, '4', '1128', 'ma.rona_manible@yahoo.com', '09269740424', '2019-04-12 11:02:47'),
(33, '2015-00321-CM-0', '', 'RAMIREZ', 'ANGELI MAY', 'O.', 'Female', '1998-05-30', 2, '4', '1121', 'angelimay21@gmail.com', '09157883674', '2019-04-12 11:05:10'),
(34, '2015-00023-CM-0', '', 'FRILLES', 'VINCENT', 'F', 'Male', '1999-09-15', 2, '4', '', 'vincentfrilles@yahoo.com', '09067744086', '2019-04-12 11:06:43'),
(35, '2015-00068-CM-0', '', 'GANAPIN', 'JESSA JOYCE', 'B', 'Female', '1998-10-14', 2, '4', '1121', 'jjganapin@gmail.com', '09123125502', '2019-04-12 11:09:18'),
(36, '2015-00069-CM-0', '', 'ALMOETE', 'LYNNETTE', 'S', 'Female', '1996-01-04', 2, '4', '1121', 'lethalmoete@gmail.com', '09095856388', '2019-04-12 11:10:30'),
(37, '2015-00682-CM-0', '', 'MONDONEDO', 'SERINA JOY', 'O', 'Female', '1997-12-18', 4, '4', '', 'mserinajoy@yahoo.com', '09456429411', '2019-04-12 11:13:16'),
(38, '2015-00379-CM-0', '', 'ATUTUBO', 'DANIEL JON', 'R', 'Male', '1997-06-05', 4, '4', '1121', 'danieljonatutubo@yahoo.com', '09777069683', '2019-04-12 11:15:29'),
(39, '2015-00137-CM-0', '', 'REYES', 'SHAELLIN', 'M', 'Female', '1999-02-02', 2, '4', '1420', 'reyes.shaellin@yahoo.com', '09567942459', '2019-04-12 11:17:29'),
(40, '2014-00165-CM-0', '', 'PAESTE', 'DIANA JANE', 'T', 'Female', '1997-08-16', 2, '4', '', 'paestediana@yahoo.com', '09358584225', '2019-04-12 11:20:10'),
(41, '2015-00164-CM-0', '', 'MERCADO', 'JENKY', 'A', 'Female', '1999-02-13', 3, '4', '1126', 'mercadojenky1395@gmail.com', '09292196801', '2019-04-12 11:24:08'),
(42, '2015-00061-CM-0', '', 'FABABEIR', 'MARIEL', 'T', 'Female', '1998-06-03', 3, '4', '1119', 'marielfababeir@gmail.com', '09091699754', '2019-04-12 11:27:15'),
(43, '2015-00178-CM-0', '', 'CERENEO', 'RUTH EVE', 'G', 'Female', '1997-11-18', 3, '4', '1121', 'ruthcereneo@gmail.com', '09267668200', '2019-04-12 11:29:20'),
(44, '2015-00553-CM-0', '', 'VERZOSA', 'DANIELLE', 'A', 'Female', '1999-01-02', 3, '4', '1126', 'elleverzosa0214@gmail.com', '09168272520', '2019-04-12 11:32:38'),
(45, '2015-00252-CM-0', '', 'LEDUNA', 'LHYKA COLEEN', 'J', 'Female', '1999-03-28', 3, '4', '1121', 'lhkacolln.lhyka@gmail.com', '09282548175', '2019-04-12 11:34:11'),
(46, '2015-00202-CM-0', '', 'SANCHEZ', 'JENNIFER', 'T', 'Female', '1998-07-15', 1, '4', '1100', 'jennifertubansanchez@gmail.com', '09261810968', '2019-04-12 11:35:46'),
(47, '2015-00096-CM-0', '', 'CATAP', 'LOWIE', 'S.', 'Male', '1985-09-04', 1, '4', '1121', 'patacetnomaseiwol@yahoo.com', '09998467484', '2019-04-12 11:37:11'),
(48, '2015-00222-CM-0', '', 'GARCIA', 'ANGELIKA', 'B', 'Female', '1999-01-27', 3, '4', '1121', 'gbangelika27@gmail.com', '09126130613', '2019-04-12 11:39:51'),
(49, '2015-00003-CM-0', '', 'ALIWALAS', 'SOLEIL AWIT', 'T', 'Female', '1999-08-17', 3, '4', '1116', 'soleilawitaliwalas@gmail.com', '09497561776', '2019-04-12 11:41:38'),
(50, '2015-00056-CM-0', '', 'BAUTISTA', 'MOIRA DIANNE', 'E.', 'Female', '1999-06-04', 3, '4', '1121', 'MOIRADIANNE.MD@gmail.com', '09279567545', '2019-04-12 11:44:12'),
(51, '2015-00569-CM-0', '', 'GRAIDA', 'MIKHAELLA', 'S.', 'Female', '1996-06-12', 3, '4', '1114', 'alleahkim.adiarg12@gmail.com', '09058768970', '2019-04-12 11:46:20'),
(52, '2015-00029-CM-0', '', 'TATOY', 'DANICA', 'B.', 'Female', '1998-10-18', 3, '4', '3023', 'danicatatoy18@gmail.com', '09354065795', '2019-04-12 11:47:51'),
(53, '2015-00721-CM-1', '', 'FRANCISCO', 'MARY JAZMINE', 'C.', 'Female', '1995-05-11', 3, '4', '1120', 'maryjazfrancisco@gmail.com', '09055582143', '2019-04-12 11:49:47'),
(54, '2015-00035-CM-0', '', 'LEGADA', 'ELISA ANDREA', 'G.', 'Female', '1993-09-22', 3, '4', '1121', 'legadaandrea@gmail.com', '09201129594', '2019-04-12 11:51:51'),
(55, '2015-00077-CM-0', '', 'STA. CRUZ', 'ROSE CARLA', 'S.', 'Female', '1998-10-05', 3, '4', '1106', 'kakaistacruz@gmail.com', '09664419739', '2019-04-12 11:53:52'),
(56, '2015-00610-CM-1', '', 'BULATAO', 'CHRISTIAN GAREN', 'Q.', 'Male', '1998-08-16', 3, '4', '1121', 'christiangaren16@gmail.com', '09162803526', '2019-04-12 11:56:08'),
(57, '2015-00117-CM-0', '', 'SELFIDES', 'JOCELYN', 'P', 'Female', '1998-07-24', 2, '4', '1126', 'selfides.jocelyn@yahoo.com', '09350077270', '2019-04-12 11:59:12'),
(58, '2015-00022-CM-0', '', 'MADRONERO', 'LORAINNE ANNE', 'P', 'Female', '1999-01-31', 3, '4', '1421', 'lainne.31@gmail.com', '09383360215', '2019-04-12 12:00:37'),
(59, '2015-00105-CM-0', '', 'SAYCON', 'ELHAJOY', 'C', 'Female', '1998-10-23', 3, '4', '1127', 'SAYCONELHAJOY@YAHOO.COM', '09758936266', '2019-04-12 12:02:34'),
(60, '2015-00370-CM-0', '', 'FELIZARIO', 'ROSELYN ANN', '', 'Female', '1998-04-20', 3, '4', '1119', 'felizariorara@gmail.com', '09291194564', '2019-04-12 12:04:12'),
(61, '2015-00358-CM-0', '', 'ZAPANTA', 'ALEXIS NICOLE', 'T', 'Female', '1997-10-28', 3, '4', '1121', 'lexisnikolai@gamil.com', '09204973145', '2019-04-12 12:05:36'),
(62, '2015-00189-CM-0', '', 'GINEZ', 'SHIENA MAE ', 'P', 'Female', '1998-08-27', 3, '4', '1860', 'shenginez@gmail.com', '09083221626', '2019-04-12 12:06:57'),
(63, '2015-00158-CM-0', '', 'BARGABINO', 'MA. ALEXANDRA', 'O.', 'Female', '1998-12-17', 3, '4', '1126', 'alexandrabargabino1998@gmail.com', '09212282915', '2019-04-12 12:08:54'),
(64, '2015-00632-CM-0', '', 'FRONDA', 'GRACE ANGELEE', 'E', 'Female', '1998-09-12', 4, '4', '1119', 'graceangelee.gaef@gmail.com', '09397396917', '2019-04-12 12:10:14'),
(65, '2015-00313-CM-0', '', 'SANTOS', 'AUDREY', 'B', 'Female', '1998-07-13', 4, '4', '1121', 'audreysantos2113@gmail.com', '09993381978', '2019-04-12 12:11:30'),
(66, '2015-00575-CM-0', '', 'MANIGO', 'KRISTINEL JOY', 'D.', 'Female', '1998-12-24', 3, '4', '1105', 'krstineljoymanigo24@gmail.com', '09957358531', '2019-04-12 12:13:00'),
(67, '2015-00586-CM-0', '', 'BESA', 'MARIE-CRIS', 'C.', 'Female', '1997-05-22', 3, '4', '1117', 'mariecrisbesa@gmail.com', '09393690841', '2019-04-12 12:14:58'),
(68, '2015-00207-CM-0', '', 'BALDIVIA', 'ERMA KINDRA', 'V.', 'Female', '1998-04-08', 3, '4', '1126', 'kindrabaldivia@gmail.com', '09053535308', '2019-04-12 12:16:18'),
(69, '2015-00234-CM-0', '', 'DELOSO', 'JOHN ROBIN', 'B', 'Male', '1998-11-11', 3, '4', '1121', 'johnrobindeloso@gmail.com', '09309209413', '2019-04-12 12:17:39'),
(70, '2015-00335-CM-0', '', 'ZONIO', 'JEFFREY', 'G', 'Male', '1990-02-10', 3, '4', '1121', 'cgjheff021090@gmail.com', '9527725', '2019-04-12 12:19:34'),
(71, '2014-00323-CM-0', '', 'ZAMORA', 'KEVIN JOHN', 'D', 'Male', '1997-10-08', 4, '4', '1121', 'kevinjohndz14@gmail.com', '09387142360', '2019-04-12 12:21:26'),
(72, '2015-00107-CM-0', '', 'TORRES', 'CRIS JEROME', 'C.', 'Male', '1997-01-04', 4, '4', '1107', 'Crisjerometorres04@gmail.com', '09105765155', '2019-04-12 12:23:37'),
(73, '2015-00172-CM-0', '', 'BUARA', 'JEAN ALANIS', 'B', 'Female', '1999-10-12', 2, '4', '1101', 'jbuara.il@gmail.com', '09984916351', '2019-04-12 12:30:00'),
(74, '2015-00583-CM-0', '', 'BUENAFLOR', 'JESSA ROSE', 'E', 'Female', '1998-01-25', 3, '4', '1126', 'buenaflor910@gmail.com', '09073049126', '2019-04-12 12:32:12'),
(75, '2015-00269-CM-0', '', 'OLIVAR', 'FORCELYN', 'G', 'Female', '1998-09-04', 2, '4', '1119', 'seanseanolivar@gmail.com', '09164857611', '2019-04-12 12:33:54'),
(76, '2015-00585-CM-0', '', 'BUTIL', 'GENELLA ZHETA MARGARETTE', 'R', 'Female', '1999-12-05', 2, '4', '1121', 'genellabutil@gmail.com', '09128755552', '2019-04-12 12:35:27'),
(77, '2014-00190-CM-0', '', 'MARCELO', 'MARLON', 'J.', 'Male', '1996-12-10', 3, '4', '', 'marlonmarcelo454@gmail.com', '09123140031', '2019-04-12 12:37:15'),
(78, '2015-00267-CM-0', '', 'SIRUMA', 'GRACIEL', 'M', 'Female', '1998-06-26', 3, '4', '1119', 'Gracielsiruma17@gmail.com', '09066817198', '2019-04-12 12:40:00'),
(79, '2015-00578-CM-0', '', 'UY', 'DANICA', 'D', 'Female', '1999-04-12', 3, '4', '1119', 'danicauy12@gmail.com', '09556151150', '2019-04-12 12:41:29'),
(80, '2015-00033-CM-0', '', 'RUZ', 'JIRAH ANNE', 'A', 'Female', '1999-04-02', 3, '4', '1126', 'jirah.ruz02@gmail.com', '09364079957', '2019-04-12 12:42:41'),
(81, '2015-00028-CM-0', '', 'SORIANO', 'ROXANNE MARIE', 'M', 'Female', '1999-08-23', 3, '4', '3023', 'roxannesoriano12345@gmail.com', '09554376888', '2019-04-12 12:44:06'),
(82, '2015-00232-CM-0', '', 'REGENCIA', 'MARY ELIZABETH FRANCE', 'R', 'Female', '1998-03-17', 3, '4', '1023', 'elizabethfranceregencia@gmail.com', '09056244474', '2019-04-12 12:47:27'),
(83, '2015-00713-CM-1', '', 'COSTIN', 'MARIEL', 'V', 'Female', '1997-09-03', 3, '4', '1121', 'MARIELCOSTIN3@GMAIL.COM', '09163424310', '2019-04-12 12:48:53'),
(84, '2015-00009-CM-0', '', 'DELOS REYES', 'MELISSA', '', 'Female', '1998-10-23', 1, '4', '1128', 'melissandelosreyes@gmail.com', '09192651278', '2019-04-12 12:51:10'),
(85, '2015-00705-CM-1', '', 'DUCUSIN', 'JOANNER DHAN PAULUS ', 'A', 'Male', '1996-02-03', 2, '4', '1118', 'jdhan.ducusin@gmail.com', '09263046187', '2019-04-12 12:53:50'),
(86, '2015-00163-CM-0', '', 'NAVARRO', 'JOY BERLETH', 'F.', 'Female', '1998-04-08', 3, '4', '3023', 'Berlethnavarro19@gmail.com', '09959860191', '2019-04-12 12:58:16'),
(87, '2015-00238-CM-0', '', 'BALBON', 'KYLE JADE', 'A', 'Female', '1999-01-23', 3, '4', '1421', 'kylejeyd@gmail.com', '09269720578', '2019-04-12 13:01:26'),
(88, '2015-00205-CM-0', '', 'RIVERA', 'ALBERT', 'J', 'Male', '1999-08-08', 3, '4', '1127', 'jaronel09@gmail.com', '09216352382', '2019-04-12 13:03:04'),
(89, '2015-00190-CM-0', '', 'LOMIBAO', 'CHRISTOFFER CHARLES', 'D', 'Male', '1999-05-16', 3, '4', '1124', 'christofferlomibao16@gmail.com', '09955777040', '2019-04-12 13:05:19'),
(90, '2015-00090-CM-0', '', 'CHAVEZ', 'HONEY GRACE', 'P', 'Female', '1996-12-15', 5, '4', '1126', 'chavezhoneygrace15@gmail.com', '09669401024', '2019-04-12 13:08:19'),
(91, '2015-00093-CM-0', '', 'AGUANZA', 'LEIZEL MAE ', 'L', 'Female', '1999-01-21', 5, '4', '', '', '09398960144', '2019-04-12 13:10:13'),
(92, '2015-00245-CM-0', '', 'BON', 'JERALDINE', 'C', 'Female', '1998-05-20', 5, '4', '1119', 'bonjeraldine016@gmail.com', '09672300280', '2019-04-12 13:12:20'),
(93, '2015-00250-CM-0', '', 'CAWALING', 'KAYE', 'D', 'Female', '1998-06-18', 5, '4', '', 'CAWALING.KAYE@YAHOO.COM', '09999816808', '2019-04-12 13:14:26'),
(94, '2015-00100-CM-0', '', 'CANLAS', 'ALDRIN', 'S', 'Male', '1997-06-17', 3, '4', '1119', 'canlasaldrin17@gmail.com', '09567049752', '2019-04-12 13:16:55'),
(95, '2015-00114-CM-0', '', 'CABILES', 'JHAN CHRISTIAN', 'S', 'Male', '1997-12-01', 3, '4', '1127', 'bobcabiles@gmail.com', '09453681848', '2019-04-12 13:18:30'),
(96, '2015-00184-CM-0', '', 'BARRAMEDA', 'JAYSON', 'D', 'Male', '1997-07-14', 3, '4', '1121', 'JajayBarrameda20@gmail.com', '09071435323', '2019-04-12 13:20:31'),
(97, '2015-00228-CM-0', '', 'BERNAL', 'KEITH FRANCH', 'D', 'Female', '1997-07-30', 1, '4', '1118', 'keithfranch@gmail.com', '09391836158', '2019-04-12 13:23:30'),
(98, '2015-00625-CM-0', '', 'LIZADA', 'ANGELIKA', '', 'Female', '1998-09-16', 3, '4', '1127', 'angelkalizada2@gmail.com', '09155053536', '2019-04-12 13:25:41'),
(99, '2015-00045-CM-0', '', 'CAMPO', 'MARY GRACE', 'C', 'Female', '1999-02-13', 3, '4', '1127', 'gracemin130@gmail.com', '09563721487', '2019-04-12 13:27:06'),
(100, '2015-00667', 'CM-0', 'ALMACIN', 'AIRA', 'D', 'Female', '1999-02-15', 4, '4', '', 'aira_almacin@yahoo.com', '09217052913', '2019-04-12 13:32:11'),
(101, '2015-00260-CM-0', '', 'CORDERO ', 'JEFF ANDREI', 'A', 'Male', '1998-09-17', 3, '4', '', 'jeffcordero17@yahoo.com', '09753318682', '2019-04-12 13:43:22'),
(102, '2015-00129-CM-0', '', 'DE GUZMAN', 'CLARISSA LANE', 'C', 'Female', '1998-02-10', 3, '4', '1102', 'clcdeguzman10@gmail.com', '09952000105', '2019-04-12 13:47:32'),
(103, '2015-00218-CM-0', '', 'ROMERO', 'MIKKA', 'L.', 'Female', '1998-01-27', 3, '4', '1860', 'mikkaromero123@gmail.com', '09289564362', '2019-04-12 14:16:48'),
(104, '2015-00002-CM-0', '', 'LACSAMANA', 'EMMANUEL JOHN', 'E', 'Male', '1998-09-01', 3, '4', '3023', 'ejohnlacsamana@gmail.com', '09201111623', '2019-04-12 14:20:23'),
(105, '2015-00547-CM-0', '', 'RUZ', 'CIARRA JAMICAH', 'M', 'Female', '1999-01-12', 3, '4', '1126', 'ciarrajamicahruz2@gmail.com', '09079898833', '2019-04-12 14:22:39'),
(107, '2015-00007-CM-0', '', 'APO', 'ALYANA MAE', 'L', 'Female', '1999-09-22', 1, '4', '1116', 'yanaapo22@gmail.com', '09995022093', '2019-04-12 14:26:41'),
(108, '2015-00197-CM-0', '', 'VILLEGAS', 'RONELYN', 'M', 'Female', '1997-06-04', 1, '4', '1104', 'ronelynvillegas@gmail.com', '09568446582', '2019-04-12 14:28:26'),
(109, '2015-00628-CM-0', '', 'SUELA', 'LEONARD', 'C', 'Male', '1998-05-25', 4, '4', '1860', 'suela.leonard@yahoo.com', '09398619727', '2019-04-12 14:31:46'),
(110, '2015-00256-CM-0', '', 'DELA CRUZ', 'JOSHUA MARIE', 'T', 'Female', '1999-03-14', 3, '4', '1120', 'delacruzjoshuamarie14@gmail.com', '09777560607', '2019-04-12 14:34:01'),
(111, '2015-00573-CM-0', '', 'POGIO', 'MARICEL', 'B', 'Female', '1994-10-17', 3, '4', '1870', 'pogiomaricel@gmail.com', '09457950593', '2019-04-12 14:35:38'),
(112, '2015-00565-CM-0', '', 'AMBROSIO', 'JOHN HAROLD', 'F', 'Male', '1999-09-27', 3, '4', '1127', 'nnacho2799@gmail.com', '09776092892', '2019-04-12 14:37:34'),
(114, '2015-00099-CM-0', '', 'ORCENA', 'BEA HATTHAL', '', 'Female', '1999-12-13', 3, '4', '', 'carapace.popsicle@gmal.com', '09211967174', '2019-04-12 14:41:10'),
(115, '2015-00289-CM-0', '', 'MARCOS', 'JAN ALEN GREG', 'M', 'Male', '1998-11-09', 5, '4', '', 'marcosjag099@gmail.com', '09464903139', '2019-04-12 14:46:12'),
(116, '2015-00063-CM-0', '', 'GUMANIT', 'MA. VENUS', 'S', 'Female', '1996-09-10', 5, '4', '1126', 'gmntmariavenus@gmail.com', '09652205893', '2019-04-12 14:49:24'),
(117, '2015-00253-CM-0', '', 'ASUZANO', 'REGINA LYNN', 'M', 'Female', '1999-03-13', 5, '4', '1119', 'regina.asuzano@gmail.com', '09168330291', '2019-04-12 14:51:05'),
(118, '2015-00113-CM-0', '', 'CASCAYAN', 'ROSELLE MAE', 'C', 'Female', '1998-12-15', 5, '4', '1121', 'rosellemaecascayan@gmail.com', '09391620903', '2019-04-12 14:53:35'),
(119, '2015-00311-CM-0', '', 'LUMAUIG', 'RACHELLE', 'A', 'Female', '1999-12-17', 5, '4', '', 'rchlllumauig@gmail.com', '09292652684', '2019-04-12 14:54:55'),
(120, '2015-00300-CM-0', '', 'GALOPE', 'JENNY LYN', 'M.', 'Female', '1999-08-10', 5, '4', '', 'jgalope10@gmail.com', '09356767825', '2019-04-12 14:56:41'),
(121, '2015-00314-CM-0', '', 'MISAJON', 'KHRISTEL LANE', 'D.', 'Female', '1998-08-12', 5, '4', '1121', 'khristeldumaran@gmail.com', '09106917952', '2019-04-12 14:58:13'),
(122, '2015-00671-CM-0', '', 'SAN PEDRO ', 'JAYSON MAREU ', 'C', 'Male', '1994-11-07', 4, '4', '1103', 'jaysonsp7@gmail.com', '', '2019-04-12 14:59:52'),
(123, '2015-00111-CM-0', '', 'PEDROSO', 'JAMRAH GRACE', 'G.', 'Female', '1997-10-27', 2, '4', '', 'jamrahgracepedroso@gmail.com', '09306492459', '2019-04-12 15:03:55'),
(124, '2015-00136-CM-0', '', 'TAPAN', 'VIKTORIYA ', 'I', 'Female', '1998-11-01', 2, '4', '1121', 'tapanviktoriya1@gmail.com', '09550265503', '2019-04-12 15:05:54'),
(125, '2015-00010-CM-0', '', 'ARZADON', 'ANGELICA JOYCE', 'T', 'Female', '1998-08-27', 2, '4', '1808', 'angelicajoyce.arzadon@gmail.com', '09208270615', '2019-04-12 15:07:31'),
(126, '2015-00104-CM-0', '', 'OCAY', 'REMMEL', '', 'Male', '1997-09-20', 1, '4', '1116', 'ocayremmel20@gmail.com', '09205490070', '2019-04-12 15:09:33'),
(127, '2015-00244-CM-0', '', 'INDITA', 'JANESSA RHICA', 'V', 'Female', '1998-07-03', 3, '4', '1125', 'janessaindita@gmail.com', '09285721177', '2019-04-12 15:12:50'),
(128, '2015-00188-CM-0', '', 'GONZALES', 'JOHN AUSTIN', 'N', 'Male', '1998-12-01', 3, '4', '', 'johnaustiiin18@gmail.com', '09164766850', '2019-04-12 15:14:12'),
(129, '2015-00226-CM-0', '', 'OMILLA', 'MARIA ANGELICA', 'M.', 'Female', '1999-01-08', 5, '4', '1121', 'angelicaomilla@gmail.com', '09366568970', '2019-04-12 15:16:36'),
(130, '2015-00310-CM-0', '', 'PASILAN', 'PATRICIA NICOLE', '', 'Female', '1998-09-29', 5, '4', '1118', 'patricianicolepasilan@gmail.com', '09096378789', '2019-04-12 15:19:06'),
(131, '2015-00087-CM-0', '', 'MATEO', 'RONNA MAY', 'M', 'Female', '1998-12-20', 5, '4', '1119', 'ronnamaymateo2@gmail.com', '09157946608', '2019-04-12 15:21:43'),
(132, '2015-00088-CM-0', '', 'CASIPE', 'AILEEN JOY', 'C', 'Female', '1999-08-06', 5, '4', '1127', 'aileenjoy0806@gmail.com', '09568446576', '2019-04-12 15:23:51'),
(133, '2015-00027-CM-0', '', 'JORGE', 'DANICA ROSE', 'R', 'Female', '1998-10-13', 2, '4', '1121', 'jorge.danicarose@yahoo.com', '09302189670', '2019-04-12 15:26:53'),
(134, '2015-00707-CM-1', '', 'MUÃ‘OZ', 'MICHAEL CEDRIC', 'V', 'Male', '1997-10-23', 3, '4', '', 'cedmunozz@gmail.com', '09156981670', '2019-04-12 15:45:18'),
(135, '2015-00242-CM-0', '', 'ORABA', 'KEA MAE', 'O', 'Female', '1997-12-19', 3, '4', '', 'KEAORABA.18@GMAIL.COM', '09751742160', '2019-04-12 16:01:30'),
(136, '2015-00031-CM-0', '', 'DELA CERNA', 'SHEINA', 'D', 'Female', '1999-05-23', 2, '4', '1427', 'sheindlc@gmail.com', '09556841124', '2019-04-12 16:17:58'),
(137, '2015-00030-CM-0', '', 'PADOLINA', 'EDCARLO', 'N', 'Male', '1998-11-08', 2, '4', '1427', 'edcarlopadolina14@gmail.com', '09331744601', '2019-04-12 16:19:04'),
(138, '2015-00666-CM-0', '', 'ROMERO', 'JERICHO', 'C', 'Male', '1998-10-19', 4, '4', '1117', 'romerojericho69@yahoo.com', '09507269464', '2019-04-13 10:41:21'),
(139, '2015-00580-CM-0', '', 'MANALANSAN', 'JOHN-ROI', 'G', 'Male', '1998-09-14', 1, '4', '1850', 'roigatan27@gmail.com', '09669236827', '2019-04-13 11:08:47'),
(140, '2015-00283-CM-0', '', 'CANO', 'MELCRIS', 'F', 'Female', '1998-10-18', 4, '4', '1121', 'melcriscano@gmail.com', '09987390442', '2019-04-13 13:30:42'),
(141, '2015-00236-CM-0', '', 'ENTEÃ‘A', 'WENDELL', 'N.', 'Male', '1998-08-09', 4, '4', '1127', 'wendell.entena@gmail.com', '09296319517', '2019-04-13 13:35:25'),
(142, '2015-00203-CM-0', '', 'OLASIMAN', 'MC REVEN', 'T', 'Male', '1998-01-28', 2, '4', '1119', 'mcrevenolasiman@gmail.com', '09269009602', '2019-04-13 14:00:57'),
(143, '2015-00373-CM-0', '', 'PABILONIA', 'ADYLYN', 'P.', 'Female', '1998-12-26', 4, '4', '1124', 'adylynhoran@gmail.com', '09059501746', '2019-04-13 14:08:18'),
(144, '2015-00409-CM-0', '', 'OLIBAN', 'ALEXSA', 'R', 'Female', '1998-09-22', 4, '4', '1119', 'alexsa.oliban922@gmail.com', '09502101458', '2019-04-13 14:10:11'),
(145, '2015-00561-CM-0', '', 'PITAO', 'ROSEJANE', 'A.', 'Female', '1997-10-18', 4, '4', '1900', 'rosejanepitao001@gmail.com', '09107508077', '2019-04-13 14:12:40'),
(146, '2015-00650-CM-0', '', 'CASTAÃ‘AREZ', 'AIRA SHAYNE', 'C', 'Female', '1998-07-25', 4, '4', '1119', 'aira_castanarez@yahoo.com', '09753656493', '2019-04-13 14:15:22'),
(147, '2015-00475-CM-0', '', 'JARJAONEL ', 'JASTINRED', 'E', 'Male', '1995-11-06', 4, '4', '1126', 'lenoraj_pula@yahoo.com', '09568452351', '2019-04-13 14:17:36'),
(148, '2015-00336-CM-0', '', 'LUSANTA', 'JOHN LEMUEL', 'G', 'Male', '1998-09-30', 4, '4', '1119', 'lusantajohn@gmail.com', '09993152419', '2019-04-13 14:21:44'),
(149, '2015-00097-CM-0', '', 'REFOGIO', 'EMMANUELLE CHRISTIAN', '', 'Male', '1998-05-12', 5, '4', '', 'emmanuelle.crfg@gmail.com', '09457633300', '2019-04-13 14:43:06'),
(150, '2015-00221-CM-0', '', 'MONTANO', 'JASMINE MAE', 'B', 'Female', '1998-09-21', 1, '4', '', 'jasmonmontano@gmail.com', '09100837358', '2019-04-13 15:03:38'),
(151, '2015-00224-CM-0', '', 'DELACRUZ', 'ANGELINE', 'M', 'Female', '1998-12-15', 2, '4', '1121', 'angelinedelacruz098@yahoo.com', '09750393226', '2019-04-13 15:38:15'),
(152, '2015-00298-CM-0', '', 'NAVARRO', 'RENATO JR.', 'P', 'Male', '1999-05-27', 4, '4', '1121', 'renatonavarro27@gmail.com', '09224951600', '2019-04-13 15:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `t_student_transact`
--

CREATE TABLE `t_student_transact` (
  `strs_ID` int(10) NOT NULL,
  `strs_stud_num` varchar(30) NOT NULL,
  `strs_prtclr_ref` int(10) NOT NULL,
  `strs_timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_student_transact`
--

INSERT INTO `t_student_transact` (`strs_ID`, `strs_stud_num`, `strs_prtclr_ref`, `strs_timestamp`) VALUES
(1, '2015-00044-CM-0', 1, '2019-04-11 16:18:38'),
(2, '2015-00044-CM-0', 2, '2019-04-11 16:18:38'),
(3, '2015-00044-CM-0', 3, '2019-04-11 16:18:38'),
(4, '2015-00044-CM-0', 4, '2019-04-11 16:18:38'),
(5, '2015-00044-CM-0', 5, '2019-04-11 16:18:38'),
(6, '2015-00194-CM-0', 1, '2019-04-11 16:20:59'),
(7, '2015-00194-CM-0', 2, '2019-04-11 16:20:59'),
(8, '2015-00194-CM-0', 3, '2019-04-11 16:20:59'),
(9, '2015-00194-CM-0', 4, '2019-04-11 16:20:59'),
(10, '2015-00194-CM-0', 5, '2019-04-11 16:20:59'),
(11, '2015-00075-CM-0', 1, '2019-04-11 16:23:31'),
(12, '2015-00075-CM-0', 2, '2019-04-11 16:23:31'),
(13, '2015-00075-CM-0', 3, '2019-04-11 16:23:31'),
(14, '2015-00075-CM-0', 4, '2019-04-11 16:23:31'),
(15, '2015-00075-CM-0', 5, '2019-04-11 16:23:31'),
(16, '2015-00065-CM-0', 1, '2019-04-11 16:25:10'),
(17, '2015-00065-CM-0', 2, '2019-04-11 16:25:10'),
(18, '2015-00065-CM-0', 3, '2019-04-11 16:25:10'),
(19, '2015-00065-CM-0', 4, '2019-04-11 16:25:10'),
(20, '2015-00065-CM-0', 5, '2019-04-11 16:25:10'),
(21, '2015-00004-CM-0', 1, '2019-04-11 16:26:45'),
(22, '2015-00004-CM-0', 2, '2019-04-11 16:26:45'),
(23, '2015-00004-CM-0', 3, '2019-04-11 16:26:45'),
(24, '2015-00004-CM-0', 4, '2019-04-11 16:26:45'),
(25, '2015-00004-CM-0', 5, '2019-04-11 16:26:45'),
(26, '2015-00141-CM-0', 1, '2019-04-11 16:29:38'),
(27, '2015-00141-CM-0', 2, '2019-04-11 16:29:38'),
(28, '2015-00141-CM-0', 3, '2019-04-11 16:29:38'),
(29, '2015-00141-CM-0', 4, '2019-04-11 16:29:38'),
(30, '2015-00141-CM-0', 5, '2019-04-11 16:29:38'),
(31, '2015-00147-CM-0', 1, '2019-04-11 16:33:56'),
(32, '2015-00147-CM-0', 2, '2019-04-11 16:33:56'),
(33, '2015-00147-CM-0', 3, '2019-04-11 16:33:56'),
(34, '2015-00147-CM-0', 4, '2019-04-11 16:33:56'),
(35, '2015-00147-CM-0', 5, '2019-04-11 16:33:57'),
(36, '2015-00040-CM-0', 1, '2019-04-11 16:35:39'),
(37, '2015-00040-CM-0', 2, '2019-04-11 16:35:39'),
(38, '2015-00040-CM-0', 3, '2019-04-11 16:35:40'),
(39, '2015-00040-CM-0', 4, '2019-04-11 16:35:40'),
(40, '2015-00040-CM-0', 5, '2019-04-11 16:35:40'),
(41, '2015-00019-CM-0', 1, '2019-04-11 16:38:08'),
(42, '2015-00019-CM-0', 2, '2019-04-11 16:38:08'),
(43, '2015-00019-CM-0', 3, '2019-04-11 16:38:08'),
(44, '2015-00019-CM-0', 4, '2019-04-11 16:38:08'),
(45, '2015-00019-CM-0', 5, '2019-04-11 16:38:08'),
(46, '2015-00175-CM-0', 1, '2019-04-11 16:40:17'),
(47, '2015-00175-CM-0', 2, '2019-04-11 16:40:17'),
(48, '2015-00175-CM-0', 3, '2019-04-11 16:40:17'),
(49, '2015-00175-CM-0', 4, '2019-04-11 16:40:17'),
(50, '2015-00175-CM-0', 5, '2019-04-11 16:40:17'),
(51, '2015-00211-CM-0', 1, '2019-04-11 16:42:33'),
(52, '2015-00211-CM-0', 2, '2019-04-11 16:42:33'),
(53, '2015-00211-CM-0', 3, '2019-04-11 16:42:33'),
(54, '2015-00211-CM-0', 4, '2019-04-11 16:42:33'),
(55, '2015-00211-CM-0', 5, '2019-04-11 16:42:33'),
(56, '2015-00200-CM-0', 1, '2019-04-11 16:44:22'),
(57, '2015-00200-CM-0', 2, '2019-04-11 16:44:22'),
(58, '2015-00200-CM-0', 3, '2019-04-11 16:44:22'),
(59, '2015-00200-CM-0', 4, '2019-04-11 16:44:22'),
(60, '2015-00200-CM-0', 5, '2019-04-11 16:44:23'),
(61, '2015-00048-CM-0', 1, '2019-04-11 16:48:00'),
(62, '2015-00048-CM-0', 2, '2019-04-11 16:48:00'),
(63, '2015-00048-CM-0', 3, '2019-04-11 16:48:00'),
(64, '2015-00048-CM-0', 4, '2019-04-11 16:48:00'),
(65, '2015-00048-CM-0', 5, '2019-04-11 16:48:00'),
(66, '2015-00192-CM-0', 1, '2019-04-11 16:49:29'),
(67, '2015-00192-CM-0', 2, '2019-04-11 16:49:29'),
(68, '2015-00192-CM-0', 3, '2019-04-11 16:49:29'),
(69, '2015-00192-CM-0', 4, '2019-04-11 16:49:29'),
(70, '2015-00192-CM-0', 5, '2019-04-11 16:49:29'),
(71, '2015-00152-CM-0', 1, '2019-04-11 16:50:31'),
(72, '2015-00152-CM-0', 2, '2019-04-11 16:50:31'),
(73, '2015-00152-CM-0', 3, '2019-04-11 16:50:31'),
(74, '2015-00152-CM-0', 4, '2019-04-11 16:50:31'),
(75, '2015-00152-CM-0', 5, '2019-04-11 16:50:31'),
(76, '2015-00135-CM-0', 1, '2019-04-11 16:51:42'),
(77, '2015-00135-CM-0', 2, '2019-04-11 16:51:42'),
(78, '2015-00135-CM-0', 3, '2019-04-11 16:51:42'),
(79, '2015-00135-CM-0', 4, '2019-04-11 16:51:42'),
(80, '2015-00135-CM-0', 5, '2019-04-11 16:51:42'),
(81, '2015-00118-CM-0', 1, '2019-04-11 16:52:54'),
(82, '2015-00118-CM-0', 2, '2019-04-11 16:52:54'),
(83, '2015-00118-CM-0', 3, '2019-04-11 16:52:54'),
(84, '2015-00118-CM-0', 4, '2019-04-11 16:52:54'),
(85, '2015-00118-CM-0', 5, '2019-04-11 16:52:55'),
(86, '2015-00080-CM-0', 1, '2019-04-11 16:57:31'),
(87, '2015-00080-CM-0', 2, '2019-04-11 16:57:31'),
(88, '2015-00080-CM-0', 3, '2019-04-11 16:57:31'),
(89, '2015-00080-CM-0', 4, '2019-04-11 16:57:31'),
(90, '2015-00080-CM-0', 5, '2019-04-11 16:57:31'),
(91, '2015-00138-CM-0', 1, '2019-04-11 16:59:26'),
(92, '2015-00138-CM-0', 2, '2019-04-11 16:59:27'),
(93, '2015-00138-CM-0', 3, '2019-04-11 16:59:27'),
(94, '2015-00138-CM-0', 4, '2019-04-11 16:59:27'),
(95, '2015-00138-CM-0', 5, '2019-04-11 16:59:27'),
(101, '2015-00410-CM-0', 1, '2019-04-11 17:03:11'),
(102, '2015-00410-CM-0', 2, '2019-04-11 17:03:11'),
(103, '2015-00410-CM-0', 3, '2019-04-11 17:03:11'),
(104, '2015-00410-CM-0', 4, '2019-04-11 17:03:11'),
(105, '2015-00410-CM-0', 5, '2019-04-11 17:03:11'),
(106, '2015-00073-CM-0', 1, '2019-04-11 17:04:09'),
(107, '2015-00073-CM-0', 2, '2019-04-11 17:04:09'),
(108, '2015-00073-CM-0', 3, '2019-04-11 17:04:09'),
(109, '2015-00073-CM-0', 4, '2019-04-11 17:04:09'),
(110, '2015-00073-CM-0', 5, '2019-04-11 17:04:09'),
(111, '2015-00106-CM-0', 1, '2019-04-11 17:39:31'),
(112, '2015-00106-CM-0', 2, '2019-04-11 17:39:31'),
(113, '2015-00106-CM-0', 3, '2019-04-11 17:39:31'),
(114, '2015-00106-CM-0', 4, '2019-04-11 17:39:31'),
(115, '2015-00106-CM-0', 5, '2019-04-11 17:39:31'),
(116, '2015-00014-CM-0', 1, '2019-04-11 17:41:03'),
(117, '2015-00014-CM-0', 2, '2019-04-11 17:41:03'),
(118, '2015-00014-CM-0', 3, '2019-04-11 17:41:03'),
(119, '2015-00014-CM-0', 4, '2019-04-11 17:41:03'),
(120, '2015-00014-CM-0', 5, '2019-04-11 17:41:03'),
(121, '2015-00193-CM-0', 1, '2019-04-11 17:42:56'),
(122, '2015-00193-CM-0', 2, '2019-04-11 17:42:56'),
(123, '2015-00193-CM-0', 3, '2019-04-11 17:42:56'),
(124, '2015-00193-CM-0', 4, '2019-04-11 17:42:56'),
(125, '2015-00193-CM-0', 5, '2019-04-11 17:42:56'),
(126, '2015-00171-CM-0', 1, '2019-04-12 09:01:45'),
(127, '2015-00171-CM-0', 2, '2019-04-12 09:01:45'),
(128, '2015-00171-CM-0', 3, '2019-04-12 09:01:45'),
(129, '2015-00171-CM-0', 4, '2019-04-12 09:01:45'),
(130, '2015-00171-CM-0', 5, '2019-04-12 09:01:45'),
(131, '2015-00168-CM-0', 1, '2019-04-12 09:04:34'),
(132, '2015-00168-CM-0', 2, '2019-04-12 09:04:34'),
(133, '2015-00168-CM-0', 3, '2019-04-12 09:04:34'),
(134, '2015-00168-CM-0', 4, '2019-04-12 09:04:34'),
(135, '2015-00168-CM-0', 5, '2019-04-12 09:04:34'),
(136, '2015-00306-CM-0', 1, '2019-04-12 09:52:14'),
(137, '2015-00306-CM-0', 2, '2019-04-12 09:52:14'),
(138, '2015-00306-CM-0', 3, '2019-04-12 09:52:14'),
(139, '2015-00306-CM-0', 4, '2019-04-12 09:52:14'),
(140, '2015-00306-CM-0', 5, '2019-04-12 09:52:14'),
(141, '2015-00631-CM-0', 1, '2019-04-12 09:54:47'),
(142, '2015-00631-CM-0', 2, '2019-04-12 09:54:47'),
(143, '2015-00631-CM-0', 3, '2019-04-12 09:54:47'),
(144, '2015-00631-CM-0', 4, '2019-04-12 09:54:47'),
(145, '2015-00631-CM-0', 5, '2019-04-12 09:54:47'),
(146, '2015-00011-CM-0', 1, '2019-04-12 10:58:59'),
(147, '2015-00011-CM-0', 2, '2019-04-12 10:58:59'),
(148, '2015-00011-CM-0', 3, '2019-04-12 10:58:59'),
(149, '2015-00011-CM-0', 4, '2019-04-12 10:58:59'),
(150, '2015-00011-CM-0', 5, '2019-04-12 10:58:59'),
(151, '2015-00038-CM-0', 1, '2019-04-12 11:00:59'),
(152, '2015-00038-CM-0', 2, '2019-04-12 11:00:59'),
(153, '2015-00038-CM-0', 3, '2019-04-12 11:00:59'),
(154, '2015-00038-CM-0', 4, '2019-04-12 11:00:59'),
(155, '2015-00038-CM-0', 5, '2019-04-12 11:00:59'),
(156, '2015-00154-CM-0', 1, '2019-04-12 11:02:47'),
(157, '2015-00154-CM-0', 2, '2019-04-12 11:02:47'),
(158, '2015-00154-CM-0', 3, '2019-04-12 11:02:47'),
(159, '2015-00154-CM-0', 4, '2019-04-12 11:02:47'),
(160, '2015-00154-CM-0', 5, '2019-04-12 11:02:47'),
(161, '2015-00321-CM-0', 1, '2019-04-12 11:05:10'),
(162, '2015-00321-CM-0', 2, '2019-04-12 11:05:10'),
(163, '2015-00321-CM-0', 3, '2019-04-12 11:05:10'),
(164, '2015-00321-CM-0', 4, '2019-04-12 11:05:11'),
(165, '2015-00321-CM-0', 5, '2019-04-12 11:05:11'),
(166, '2015-00023-CM-0', 1, '2019-04-12 11:06:43'),
(167, '2015-00023-CM-0', 2, '2019-04-12 11:06:43'),
(168, '2015-00023-CM-0', 3, '2019-04-12 11:06:43'),
(169, '2015-00023-CM-0', 4, '2019-04-12 11:06:43'),
(170, '2015-00023-CM-0', 5, '2019-04-12 11:06:43'),
(171, '2015-00068-CM-0', 1, '2019-04-12 11:09:18'),
(172, '2015-00068-CM-0', 2, '2019-04-12 11:09:18'),
(173, '2015-00068-CM-0', 3, '2019-04-12 11:09:18'),
(174, '2015-00068-CM-0', 4, '2019-04-12 11:09:18'),
(175, '2015-00068-CM-0', 5, '2019-04-12 11:09:18'),
(176, '2015-00069-CM-0', 1, '2019-04-12 11:10:30'),
(177, '2015-00069-CM-0', 2, '2019-04-12 11:10:30'),
(178, '2015-00069-CM-0', 3, '2019-04-12 11:10:30'),
(179, '2015-00069-CM-0', 4, '2019-04-12 11:10:30'),
(180, '2015-00069-CM-0', 5, '2019-04-12 11:10:30'),
(181, '2015-00682-CM-0', 1, '2019-04-12 11:13:16'),
(182, '2015-00682-CM-0', 2, '2019-04-12 11:13:16'),
(183, '2015-00682-CM-0', 3, '2019-04-12 11:13:16'),
(184, '2015-00682-CM-0', 4, '2019-04-12 11:13:16'),
(185, '2015-00682-CM-0', 5, '2019-04-12 11:13:16'),
(186, '2015-00379-CM-0', 1, '2019-04-12 11:15:29'),
(187, '2015-00379-CM-0', 2, '2019-04-12 11:15:29'),
(188, '2015-00379-CM-0', 3, '2019-04-12 11:15:29'),
(189, '2015-00379-CM-0', 4, '2019-04-12 11:15:29'),
(190, '2015-00379-CM-0', 5, '2019-04-12 11:15:29'),
(191, '2015-00137-CM-0', 1, '2019-04-12 11:17:29'),
(192, '2015-00137-CM-0', 2, '2019-04-12 11:17:29'),
(193, '2015-00137-CM-0', 3, '2019-04-12 11:17:29'),
(194, '2015-00137-CM-0', 4, '2019-04-12 11:17:29'),
(195, '2015-00137-CM-0', 5, '2019-04-12 11:17:29'),
(196, '2014-00165-CM-0', 1, '2019-04-12 11:20:10'),
(197, '2014-00165-CM-0', 2, '2019-04-12 11:20:10'),
(198, '2014-00165-CM-0', 3, '2019-04-12 11:20:10'),
(199, '2014-00165-CM-0', 4, '2019-04-12 11:20:10'),
(200, '2014-00165-CM-0', 5, '2019-04-12 11:20:10'),
(201, '2015-00164-CM-0', 1, '2019-04-12 11:24:08'),
(202, '2015-00164-CM-0', 2, '2019-04-12 11:24:08'),
(203, '2015-00164-CM-0', 3, '2019-04-12 11:24:08'),
(204, '2015-00164-CM-0', 4, '2019-04-12 11:24:08'),
(205, '2015-00164-CM-0', 5, '2019-04-12 11:24:08'),
(206, '2015-00061-CM-0', 1, '2019-04-12 11:27:15'),
(207, '2015-00061-CM-0', 2, '2019-04-12 11:27:15'),
(208, '2015-00061-CM-0', 3, '2019-04-12 11:27:15'),
(209, '2015-00061-CM-0', 4, '2019-04-12 11:27:15'),
(210, '2015-00061-CM-0', 5, '2019-04-12 11:27:15'),
(211, '2015-00178-CM-0', 1, '2019-04-12 11:29:20'),
(212, '2015-00178-CM-0', 2, '2019-04-12 11:29:20'),
(213, '2015-00178-CM-0', 3, '2019-04-12 11:29:20'),
(214, '2015-00178-CM-0', 4, '2019-04-12 11:29:20'),
(215, '2015-00178-CM-0', 5, '2019-04-12 11:29:20'),
(216, '2015-00553-CM-0', 1, '2019-04-12 11:32:38'),
(217, '2015-00553-CM-0', 2, '2019-04-12 11:32:38'),
(218, '2015-00553-CM-0', 3, '2019-04-12 11:32:38'),
(219, '2015-00553-CM-0', 4, '2019-04-12 11:32:38'),
(220, '2015-00553-CM-0', 5, '2019-04-12 11:32:38'),
(221, '2015-00252-CM-0', 1, '2019-04-12 11:34:11'),
(222, '2015-00252-CM-0', 2, '2019-04-12 11:34:11'),
(223, '2015-00252-CM-0', 3, '2019-04-12 11:34:11'),
(224, '2015-00252-CM-0', 4, '2019-04-12 11:34:11'),
(225, '2015-00252-CM-0', 5, '2019-04-12 11:34:11'),
(226, '2015-00202-CM-0', 1, '2019-04-12 11:35:46'),
(227, '2015-00202-CM-0', 2, '2019-04-12 11:35:46'),
(228, '2015-00202-CM-0', 3, '2019-04-12 11:35:46'),
(229, '2015-00202-CM-0', 4, '2019-04-12 11:35:46'),
(230, '2015-00202-CM-0', 5, '2019-04-12 11:35:46'),
(231, '2015-00096-CM-0', 1, '2019-04-12 11:37:11'),
(232, '2015-00096-CM-0', 2, '2019-04-12 11:37:11'),
(233, '2015-00096-CM-0', 3, '2019-04-12 11:37:11'),
(234, '2015-00096-CM-0', 4, '2019-04-12 11:37:11'),
(235, '2015-00096-CM-0', 5, '2019-04-12 11:37:11'),
(236, '2015-00222-CM-0', 1, '2019-04-12 11:39:51'),
(237, '2015-00222-CM-0', 2, '2019-04-12 11:39:51'),
(238, '2015-00222-CM-0', 3, '2019-04-12 11:39:51'),
(239, '2015-00222-CM-0', 4, '2019-04-12 11:39:51'),
(240, '2015-00222-CM-0', 5, '2019-04-12 11:39:51'),
(241, '2015-00003-CM-0', 1, '2019-04-12 11:41:38'),
(242, '2015-00003-CM-0', 2, '2019-04-12 11:41:38'),
(243, '2015-00003-CM-0', 3, '2019-04-12 11:41:38'),
(244, '2015-00003-CM-0', 4, '2019-04-12 11:41:38'),
(245, '2015-00003-CM-0', 5, '2019-04-12 11:41:38'),
(246, '2015-00056-CM-0', 1, '2019-04-12 11:44:12'),
(247, '2015-00056-CM-0', 2, '2019-04-12 11:44:12'),
(248, '2015-00056-CM-0', 3, '2019-04-12 11:44:12'),
(249, '2015-00056-CM-0', 4, '2019-04-12 11:44:12'),
(250, '2015-00056-CM-0', 5, '2019-04-12 11:44:12'),
(251, '2015-00569-CM-0', 1, '2019-04-12 11:46:20'),
(252, '2015-00569-CM-0', 2, '2019-04-12 11:46:20'),
(253, '2015-00569-CM-0', 3, '2019-04-12 11:46:20'),
(254, '2015-00569-CM-0', 4, '2019-04-12 11:46:20'),
(255, '2015-00569-CM-0', 5, '2019-04-12 11:46:20'),
(256, '2015-00029-CM-0', 1, '2019-04-12 11:47:51'),
(257, '2015-00029-CM-0', 2, '2019-04-12 11:47:51'),
(258, '2015-00029-CM-0', 3, '2019-04-12 11:47:51'),
(259, '2015-00029-CM-0', 4, '2019-04-12 11:47:51'),
(260, '2015-00029-CM-0', 5, '2019-04-12 11:47:51'),
(261, '2015-00721-CM-1', 1, '2019-04-12 11:49:47'),
(262, '2015-00721-CM-1', 2, '2019-04-12 11:49:47'),
(263, '2015-00721-CM-1', 3, '2019-04-12 11:49:47'),
(264, '2015-00721-CM-1', 4, '2019-04-12 11:49:47'),
(265, '2015-00721-CM-1', 5, '2019-04-12 11:49:47'),
(266, '2015-00035-CM-0', 1, '2019-04-12 11:51:51'),
(267, '2015-00035-CM-0', 2, '2019-04-12 11:51:51'),
(268, '2015-00035-CM-0', 3, '2019-04-12 11:51:51'),
(269, '2015-00035-CM-0', 4, '2019-04-12 11:51:51'),
(270, '2015-00035-CM-0', 5, '2019-04-12 11:51:51'),
(271, '2015-00077-CM-0', 1, '2019-04-12 11:53:52'),
(272, '2015-00077-CM-0', 2, '2019-04-12 11:53:52'),
(273, '2015-00077-CM-0', 3, '2019-04-12 11:53:52'),
(274, '2015-00077-CM-0', 4, '2019-04-12 11:53:52'),
(275, '2015-00077-CM-0', 5, '2019-04-12 11:53:52'),
(276, '2015-00610-CM-1', 1, '2019-04-12 11:56:08'),
(277, '2015-00610-CM-1', 2, '2019-04-12 11:56:08'),
(278, '2015-00610-CM-1', 3, '2019-04-12 11:56:08'),
(279, '2015-00610-CM-1', 4, '2019-04-12 11:56:08'),
(280, '2015-00610-CM-1', 5, '2019-04-12 11:56:08'),
(281, '2015-00117-CM-0', 1, '2019-04-12 11:59:12'),
(282, '2015-00117-CM-0', 2, '2019-04-12 11:59:12'),
(283, '2015-00117-CM-0', 3, '2019-04-12 11:59:12'),
(284, '2015-00117-CM-0', 4, '2019-04-12 11:59:12'),
(285, '2015-00117-CM-0', 5, '2019-04-12 11:59:12'),
(286, '2015-00022-CM-0', 1, '2019-04-12 12:00:37'),
(287, '2015-00022-CM-0', 2, '2019-04-12 12:00:37'),
(288, '2015-00022-CM-0', 3, '2019-04-12 12:00:37'),
(289, '2015-00022-CM-0', 4, '2019-04-12 12:00:37'),
(290, '2015-00022-CM-0', 5, '2019-04-12 12:00:37'),
(291, '2015-00105-CM-0', 1, '2019-04-12 12:02:34'),
(292, '2015-00105-CM-0', 2, '2019-04-12 12:02:34'),
(293, '2015-00105-CM-0', 3, '2019-04-12 12:02:34'),
(294, '2015-00105-CM-0', 4, '2019-04-12 12:02:34'),
(295, '2015-00105-CM-0', 5, '2019-04-12 12:02:34'),
(296, '2015-00370-CM-0', 1, '2019-04-12 12:04:12'),
(297, '2015-00370-CM-0', 2, '2019-04-12 12:04:12'),
(298, '2015-00370-CM-0', 3, '2019-04-12 12:04:12'),
(299, '2015-00370-CM-0', 4, '2019-04-12 12:04:12'),
(300, '2015-00370-CM-0', 5, '2019-04-12 12:04:12'),
(301, '2015-00358-CM-0', 1, '2019-04-12 12:05:36'),
(302, '2015-00358-CM-0', 2, '2019-04-12 12:05:36'),
(303, '2015-00358-CM-0', 3, '2019-04-12 12:05:36'),
(304, '2015-00358-CM-0', 4, '2019-04-12 12:05:36'),
(305, '2015-00358-CM-0', 5, '2019-04-12 12:05:36'),
(306, '2015-00189-CM-0', 1, '2019-04-12 12:06:57'),
(307, '2015-00189-CM-0', 2, '2019-04-12 12:06:57'),
(308, '2015-00189-CM-0', 3, '2019-04-12 12:06:57'),
(309, '2015-00189-CM-0', 4, '2019-04-12 12:06:57'),
(310, '2015-00189-CM-0', 5, '2019-04-12 12:06:57'),
(311, '2015-00158-CM-0', 1, '2019-04-12 12:08:54'),
(312, '2015-00158-CM-0', 2, '2019-04-12 12:08:55'),
(313, '2015-00158-CM-0', 3, '2019-04-12 12:08:55'),
(314, '2015-00158-CM-0', 4, '2019-04-12 12:08:55'),
(315, '2015-00158-CM-0', 5, '2019-04-12 12:08:55'),
(316, '2015-00632-CM-0', 1, '2019-04-12 12:10:14'),
(317, '2015-00632-CM-0', 2, '2019-04-12 12:10:14'),
(318, '2015-00632-CM-0', 3, '2019-04-12 12:10:14'),
(319, '2015-00632-CM-0', 4, '2019-04-12 12:10:14'),
(320, '2015-00632-CM-0', 5, '2019-04-12 12:10:14'),
(321, '2015-00313-CM-0', 1, '2019-04-12 12:11:30'),
(322, '2015-00313-CM-0', 2, '2019-04-12 12:11:30'),
(323, '2015-00313-CM-0', 3, '2019-04-12 12:11:30'),
(324, '2015-00313-CM-0', 4, '2019-04-12 12:11:30'),
(325, '2015-00313-CM-0', 5, '2019-04-12 12:11:30'),
(326, '2015-00575-CM-0', 1, '2019-04-12 12:13:00'),
(327, '2015-00575-CM-0', 2, '2019-04-12 12:13:00'),
(328, '2015-00575-CM-0', 3, '2019-04-12 12:13:00'),
(329, '2015-00575-CM-0', 4, '2019-04-12 12:13:00'),
(330, '2015-00575-CM-0', 5, '2019-04-12 12:13:00'),
(331, '2015-00586-CM-0', 1, '2019-04-12 12:14:58'),
(332, '2015-00586-CM-0', 2, '2019-04-12 12:14:58'),
(333, '2015-00586-CM-0', 3, '2019-04-12 12:14:58'),
(334, '2015-00586-CM-0', 4, '2019-04-12 12:14:58'),
(335, '2015-00586-CM-0', 5, '2019-04-12 12:14:58'),
(336, '2015-00207-CM-0', 1, '2019-04-12 12:16:18'),
(337, '2015-00207-CM-0', 2, '2019-04-12 12:16:18'),
(338, '2015-00207-CM-0', 3, '2019-04-12 12:16:18'),
(339, '2015-00207-CM-0', 4, '2019-04-12 12:16:18'),
(340, '2015-00207-CM-0', 5, '2019-04-12 12:16:18'),
(341, '2015-00234-CM-0', 1, '2019-04-12 12:17:39'),
(342, '2015-00234-CM-0', 2, '2019-04-12 12:17:39'),
(343, '2015-00234-CM-0', 3, '2019-04-12 12:17:39'),
(344, '2015-00234-CM-0', 4, '2019-04-12 12:17:39'),
(345, '2015-00234-CM-0', 5, '2019-04-12 12:17:39'),
(346, '2015-00335-CM-0', 1, '2019-04-12 12:19:34'),
(347, '2015-00335-CM-0', 2, '2019-04-12 12:19:34'),
(348, '2015-00335-CM-0', 3, '2019-04-12 12:19:34'),
(349, '2015-00335-CM-0', 4, '2019-04-12 12:19:34'),
(350, '2015-00335-CM-0', 5, '2019-04-12 12:19:34'),
(351, '2014-00323-CM-0', 1, '2019-04-12 12:21:26'),
(352, '2014-00323-CM-0', 2, '2019-04-12 12:21:26'),
(353, '2014-00323-CM-0', 3, '2019-04-12 12:21:26'),
(354, '2014-00323-CM-0', 4, '2019-04-12 12:21:26'),
(355, '2014-00323-CM-0', 5, '2019-04-12 12:21:26'),
(356, '2015-00107-CM-0', 1, '2019-04-12 12:23:37'),
(357, '2015-00107-CM-0', 2, '2019-04-12 12:23:37'),
(358, '2015-00107-CM-0', 3, '2019-04-12 12:23:37'),
(359, '2015-00107-CM-0', 4, '2019-04-12 12:23:37'),
(360, '2015-00107-CM-0', 5, '2019-04-12 12:23:37'),
(361, '2015-00172-CM-0', 1, '2019-04-12 12:30:00'),
(362, '2015-00172-CM-0', 2, '2019-04-12 12:30:00'),
(363, '2015-00172-CM-0', 3, '2019-04-12 12:30:00'),
(364, '2015-00172-CM-0', 4, '2019-04-12 12:30:00'),
(365, '2015-00172-CM-0', 5, '2019-04-12 12:30:00'),
(366, '2015-00583-CM-0', 1, '2019-04-12 12:32:12'),
(367, '2015-00583-CM-0', 2, '2019-04-12 12:32:12'),
(368, '2015-00583-CM-0', 3, '2019-04-12 12:32:12'),
(369, '2015-00583-CM-0', 4, '2019-04-12 12:32:12'),
(370, '2015-00583-CM-0', 5, '2019-04-12 12:32:12'),
(371, '2015-00269-CM-0', 1, '2019-04-12 12:33:54'),
(372, '2015-00269-CM-0', 2, '2019-04-12 12:33:54'),
(373, '2015-00269-CM-0', 3, '2019-04-12 12:33:54'),
(374, '2015-00269-CM-0', 4, '2019-04-12 12:33:54'),
(375, '2015-00269-CM-0', 5, '2019-04-12 12:33:54'),
(376, '2015-00585-CM-0', 1, '2019-04-12 12:35:27'),
(377, '2015-00585-CM-0', 2, '2019-04-12 12:35:27'),
(378, '2015-00585-CM-0', 3, '2019-04-12 12:35:27'),
(379, '2015-00585-CM-0', 4, '2019-04-12 12:35:27'),
(380, '2015-00585-CM-0', 5, '2019-04-12 12:35:27'),
(381, '2014-00190-CM-0', 1, '2019-04-12 12:37:15'),
(382, '2014-00190-CM-0', 2, '2019-04-12 12:37:15'),
(383, '2014-00190-CM-0', 3, '2019-04-12 12:37:15'),
(384, '2014-00190-CM-0', 4, '2019-04-12 12:37:15'),
(385, '2014-00190-CM-0', 5, '2019-04-12 12:37:15'),
(386, '2015-00267-CM-0', 1, '2019-04-12 12:40:00'),
(387, '2015-00267-CM-0', 2, '2019-04-12 12:40:00'),
(388, '2015-00267-CM-0', 3, '2019-04-12 12:40:00'),
(389, '2015-00267-CM-0', 4, '2019-04-12 12:40:00'),
(390, '2015-00267-CM-0', 5, '2019-04-12 12:40:00'),
(391, '2015-00578-CM-0', 1, '2019-04-12 12:41:29'),
(392, '2015-00578-CM-0', 2, '2019-04-12 12:41:29'),
(393, '2015-00578-CM-0', 3, '2019-04-12 12:41:29'),
(394, '2015-00578-CM-0', 4, '2019-04-12 12:41:29'),
(395, '2015-00578-CM-0', 5, '2019-04-12 12:41:29'),
(396, '2015-00033-CM-0', 1, '2019-04-12 12:42:41'),
(397, '2015-00033-CM-0', 2, '2019-04-12 12:42:41'),
(398, '2015-00033-CM-0', 3, '2019-04-12 12:42:41'),
(399, '2015-00033-CM-0', 4, '2019-04-12 12:42:41'),
(400, '2015-00033-CM-0', 5, '2019-04-12 12:42:41'),
(401, '2015-00028-CM-0', 1, '2019-04-12 12:44:06'),
(402, '2015-00028-CM-0', 2, '2019-04-12 12:44:06'),
(403, '2015-00028-CM-0', 3, '2019-04-12 12:44:06'),
(404, '2015-00028-CM-0', 4, '2019-04-12 12:44:06'),
(405, '2015-00028-CM-0', 5, '2019-04-12 12:44:06'),
(406, '2015-00232-CM-0', 1, '2019-04-12 12:47:27'),
(407, '2015-00232-CM-0', 2, '2019-04-12 12:47:27'),
(408, '2015-00232-CM-0', 3, '2019-04-12 12:47:27'),
(409, '2015-00232-CM-0', 4, '2019-04-12 12:47:27'),
(410, '2015-00232-CM-0', 5, '2019-04-12 12:47:27'),
(411, '2015-00713-CM-1', 1, '2019-04-12 12:48:53'),
(412, '2015-00713-CM-1', 2, '2019-04-12 12:48:53'),
(413, '2015-00713-CM-1', 3, '2019-04-12 12:48:53'),
(414, '2015-00713-CM-1', 4, '2019-04-12 12:48:53'),
(415, '2015-00713-CM-1', 5, '2019-04-12 12:48:53'),
(416, '2015-00009-CM-0', 1, '2019-04-12 12:51:10'),
(417, '2015-00009-CM-0', 2, '2019-04-12 12:51:10'),
(418, '2015-00009-CM-0', 3, '2019-04-12 12:51:10'),
(419, '2015-00009-CM-0', 4, '2019-04-12 12:51:10'),
(420, '2015-00009-CM-0', 5, '2019-04-12 12:51:10'),
(421, '2015-00705-CM-1', 1, '2019-04-12 12:53:50'),
(422, '2015-00705-CM-1', 2, '2019-04-12 12:53:50'),
(423, '2015-00705-CM-1', 3, '2019-04-12 12:53:50'),
(424, '2015-00705-CM-1', 4, '2019-04-12 12:53:50'),
(425, '2015-00705-CM-1', 5, '2019-04-12 12:53:50'),
(426, '2015-00163-CM-0', 1, '2019-04-12 12:58:16'),
(427, '2015-00163-CM-0', 2, '2019-04-12 12:58:16'),
(428, '2015-00163-CM-0', 3, '2019-04-12 12:58:16'),
(429, '2015-00163-CM-0', 4, '2019-04-12 12:58:16'),
(430, '2015-00163-CM-0', 5, '2019-04-12 12:58:16'),
(431, '2015-00238-CM-0', 1, '2019-04-12 13:01:26'),
(432, '2015-00238-CM-0', 2, '2019-04-12 13:01:26'),
(433, '2015-00238-CM-0', 3, '2019-04-12 13:01:26'),
(434, '2015-00238-CM-0', 4, '2019-04-12 13:01:26'),
(435, '2015-00238-CM-0', 5, '2019-04-12 13:01:26'),
(436, '2015-00205-CM-0', 1, '2019-04-12 13:03:04'),
(437, '2015-00205-CM-0', 2, '2019-04-12 13:03:04'),
(438, '2015-00205-CM-0', 3, '2019-04-12 13:03:04'),
(439, '2015-00205-CM-0', 4, '2019-04-12 13:03:04'),
(440, '2015-00205-CM-0', 5, '2019-04-12 13:03:04'),
(441, '2015-00190-CM-0', 1, '2019-04-12 13:05:19'),
(442, '2015-00190-CM-0', 2, '2019-04-12 13:05:19'),
(443, '2015-00190-CM-0', 3, '2019-04-12 13:05:19'),
(444, '2015-00190-CM-0', 4, '2019-04-12 13:05:19'),
(445, '2015-00190-CM-0', 5, '2019-04-12 13:05:19'),
(446, '2015-00090-CM-0', 1, '2019-04-12 13:08:19'),
(447, '2015-00090-CM-0', 2, '2019-04-12 13:08:19'),
(448, '2015-00090-CM-0', 3, '2019-04-12 13:08:20'),
(449, '2015-00090-CM-0', 4, '2019-04-12 13:08:20'),
(450, '2015-00090-CM-0', 5, '2019-04-12 13:08:20'),
(451, '2015-00093-CM-0', 1, '2019-04-12 13:10:13'),
(452, '2015-00093-CM-0', 2, '2019-04-12 13:10:13'),
(453, '2015-00093-CM-0', 3, '2019-04-12 13:10:13'),
(454, '2015-00093-CM-0', 4, '2019-04-12 13:10:13'),
(455, '2015-00093-CM-0', 5, '2019-04-12 13:10:13'),
(456, '2015-00245-CM-0', 1, '2019-04-12 13:12:20'),
(457, '2015-00245-CM-0', 2, '2019-04-12 13:12:20'),
(458, '2015-00245-CM-0', 3, '2019-04-12 13:12:20'),
(459, '2015-00245-CM-0', 4, '2019-04-12 13:12:20'),
(460, '2015-00245-CM-0', 5, '2019-04-12 13:12:20'),
(461, '2015-00250-CM-0', 1, '2019-04-12 13:14:26'),
(462, '2015-00250-CM-0', 2, '2019-04-12 13:14:26'),
(463, '2015-00250-CM-0', 3, '2019-04-12 13:14:26'),
(464, '2015-00250-CM-0', 4, '2019-04-12 13:14:26'),
(465, '2015-00250-CM-0', 5, '2019-04-12 13:14:26'),
(466, '2015-00100-CM-0', 1, '2019-04-12 13:16:55'),
(467, '2015-00100-CM-0', 2, '2019-04-12 13:16:55'),
(468, '2015-00100-CM-0', 3, '2019-04-12 13:16:55'),
(469, '2015-00100-CM-0', 4, '2019-04-12 13:16:55'),
(470, '2015-00100-CM-0', 5, '2019-04-12 13:16:55'),
(471, '2015-00114-CM-0', 1, '2019-04-12 13:18:30'),
(472, '2015-00114-CM-0', 2, '2019-04-12 13:18:30'),
(473, '2015-00114-CM-0', 3, '2019-04-12 13:18:30'),
(474, '2015-00114-CM-0', 4, '2019-04-12 13:18:30'),
(475, '2015-00114-CM-0', 5, '2019-04-12 13:18:30'),
(476, '2015-00184-CM-0', 1, '2019-04-12 13:20:31'),
(477, '2015-00184-CM-0', 2, '2019-04-12 13:20:31'),
(478, '2015-00184-CM-0', 3, '2019-04-12 13:20:31'),
(479, '2015-00184-CM-0', 4, '2019-04-12 13:20:31'),
(480, '2015-00184-CM-0', 5, '2019-04-12 13:20:31'),
(481, '2015-00228-CM-0', 1, '2019-04-12 13:23:30'),
(482, '2015-00228-CM-0', 2, '2019-04-12 13:23:30'),
(483, '2015-00228-CM-0', 3, '2019-04-12 13:23:30'),
(484, '2015-00228-CM-0', 4, '2019-04-12 13:23:30'),
(485, '2015-00228-CM-0', 5, '2019-04-12 13:23:30'),
(486, '2015-00625-CM-0', 1, '2019-04-12 13:25:41'),
(487, '2015-00625-CM-0', 2, '2019-04-12 13:25:41'),
(488, '2015-00625-CM-0', 3, '2019-04-12 13:25:41'),
(489, '2015-00625-CM-0', 4, '2019-04-12 13:25:41'),
(490, '2015-00625-CM-0', 5, '2019-04-12 13:25:41'),
(491, '2015-00045-CM-0', 1, '2019-04-12 13:27:06'),
(492, '2015-00045-CM-0', 2, '2019-04-12 13:27:06'),
(493, '2015-00045-CM-0', 3, '2019-04-12 13:27:06'),
(494, '2015-00045-CM-0', 4, '2019-04-12 13:27:06'),
(495, '2015-00045-CM-0', 5, '2019-04-12 13:27:06'),
(496, '2015-00667', 1, '2019-04-12 13:32:11'),
(497, '2015-00667', 2, '2019-04-12 13:32:11'),
(498, '2015-00667', 3, '2019-04-12 13:32:11'),
(499, '2015-00667', 4, '2019-04-12 13:32:11'),
(500, '2015-00667', 5, '2019-04-12 13:32:11'),
(501, '2015-00260-CM-0', 1, '2019-04-12 13:43:22'),
(502, '2015-00260-CM-0', 2, '2019-04-12 13:43:22'),
(503, '2015-00260-CM-0', 3, '2019-04-12 13:43:22'),
(504, '2015-00260-CM-0', 4, '2019-04-12 13:43:22'),
(505, '2015-00260-CM-0', 5, '2019-04-12 13:43:22'),
(506, '2015-00129-CM-0', 1, '2019-04-12 13:47:32'),
(507, '2015-00129-CM-0', 2, '2019-04-12 13:47:32'),
(508, '2015-00129-CM-0', 3, '2019-04-12 13:47:32'),
(509, '2015-00129-CM-0', 4, '2019-04-12 13:47:32'),
(510, '2015-00129-CM-0', 5, '2019-04-12 13:47:32'),
(511, '2015-00218-CM-0', 1, '2019-04-12 14:16:48'),
(512, '2015-00218-CM-0', 2, '2019-04-12 14:16:48'),
(513, '2015-00218-CM-0', 3, '2019-04-12 14:16:48'),
(514, '2015-00218-CM-0', 4, '2019-04-12 14:16:48'),
(515, '2015-00218-CM-0', 5, '2019-04-12 14:16:48'),
(516, '2015-00002-CM-0', 1, '2019-04-12 14:20:24'),
(517, '2015-00002-CM-0', 2, '2019-04-12 14:20:24'),
(518, '2015-00002-CM-0', 3, '2019-04-12 14:20:24'),
(519, '2015-00002-CM-0', 4, '2019-04-12 14:20:24'),
(520, '2015-00002-CM-0', 5, '2019-04-12 14:20:24'),
(521, '2015-00547-CM-0', 1, '2019-04-12 14:22:39'),
(522, '2015-00547-CM-0', 2, '2019-04-12 14:22:39'),
(523, '2015-00547-CM-0', 3, '2019-04-12 14:22:39'),
(524, '2015-00547-CM-0', 4, '2019-04-12 14:22:39'),
(525, '2015-00547-CM-0', 5, '2019-04-12 14:22:39'),
(526, '2015-00028-CM-0', 1, '2019-04-12 14:25:01'),
(527, '2015-00028-CM-0', 2, '2019-04-12 14:25:01'),
(528, '2015-00028-CM-0', 3, '2019-04-12 14:25:01'),
(529, '2015-00028-CM-0', 4, '2019-04-12 14:25:01'),
(530, '2015-00028-CM-0', 5, '2019-04-12 14:25:01'),
(531, '2015-00007-CM-0', 1, '2019-04-12 14:26:41'),
(532, '2015-00007-CM-0', 2, '2019-04-12 14:26:41'),
(533, '2015-00007-CM-0', 3, '2019-04-12 14:26:41'),
(534, '2015-00007-CM-0', 4, '2019-04-12 14:26:41'),
(535, '2015-00007-CM-0', 5, '2019-04-12 14:26:41'),
(536, '2015-00197-CM-0', 1, '2019-04-12 14:28:26'),
(537, '2015-00197-CM-0', 2, '2019-04-12 14:28:26'),
(538, '2015-00197-CM-0', 3, '2019-04-12 14:28:26'),
(539, '2015-00197-CM-0', 4, '2019-04-12 14:28:26'),
(540, '2015-00197-CM-0', 5, '2019-04-12 14:28:26'),
(541, '2015-00628-CM-0', 1, '2019-04-12 14:31:46'),
(542, '2015-00628-CM-0', 2, '2019-04-12 14:31:46'),
(543, '2015-00628-CM-0', 3, '2019-04-12 14:31:47'),
(544, '2015-00628-CM-0', 4, '2019-04-12 14:31:47'),
(545, '2015-00628-CM-0', 5, '2019-04-12 14:31:47'),
(546, '2015-00256-CM-0', 1, '2019-04-12 14:34:01'),
(547, '2015-00256-CM-0', 2, '2019-04-12 14:34:01'),
(548, '2015-00256-CM-0', 3, '2019-04-12 14:34:01'),
(549, '2015-00256-CM-0', 4, '2019-04-12 14:34:01'),
(550, '2015-00256-CM-0', 5, '2019-04-12 14:34:01'),
(551, '2015-00573-CM-0', 1, '2019-04-12 14:35:38'),
(552, '2015-00573-CM-0', 2, '2019-04-12 14:35:38'),
(553, '2015-00573-CM-0', 3, '2019-04-12 14:35:38'),
(554, '2015-00573-CM-0', 4, '2019-04-12 14:35:38'),
(555, '2015-00573-CM-0', 5, '2019-04-12 14:35:38'),
(556, '2015-00565-CM-0', 1, '2019-04-12 14:37:34'),
(557, '2015-00565-CM-0', 2, '2019-04-12 14:37:34'),
(558, '2015-00565-CM-0', 3, '2019-04-12 14:37:34'),
(559, '2015-00565-CM-0', 4, '2019-04-12 14:37:34'),
(560, '2015-00565-CM-0', 5, '2019-04-12 14:37:34'),
(561, '2015-00218-CM-0', 1, '2019-04-12 14:39:32'),
(562, '2015-00218-CM-0', 2, '2019-04-12 14:39:32'),
(563, '2015-00218-CM-0', 3, '2019-04-12 14:39:32'),
(564, '2015-00218-CM-0', 4, '2019-04-12 14:39:32'),
(565, '2015-00218-CM-0', 5, '2019-04-12 14:39:32'),
(566, '2015-00099-CM-0', 1, '2019-04-12 14:41:10'),
(567, '2015-00099-CM-0', 2, '2019-04-12 14:41:10'),
(568, '2015-00099-CM-0', 3, '2019-04-12 14:41:10'),
(569, '2015-00099-CM-0', 4, '2019-04-12 14:41:10'),
(570, '2015-00099-CM-0', 5, '2019-04-12 14:41:10'),
(571, '2015-00289-CM-0', 1, '2019-04-12 14:46:12'),
(572, '2015-00289-CM-0', 2, '2019-04-12 14:46:12'),
(573, '2015-00289-CM-0', 3, '2019-04-12 14:46:12'),
(574, '2015-00289-CM-0', 4, '2019-04-12 14:46:12'),
(575, '2015-00289-CM-0', 5, '2019-04-12 14:46:12'),
(576, '2015-00063-CM-0', 1, '2019-04-12 14:49:24'),
(577, '2015-00063-CM-0', 2, '2019-04-12 14:49:25'),
(578, '2015-00063-CM-0', 3, '2019-04-12 14:49:25'),
(579, '2015-00063-CM-0', 4, '2019-04-12 14:49:25'),
(580, '2015-00063-CM-0', 5, '2019-04-12 14:49:25'),
(581, '2015-00253-CM-0', 1, '2019-04-12 14:51:05'),
(582, '2015-00253-CM-0', 2, '2019-04-12 14:51:05'),
(583, '2015-00253-CM-0', 3, '2019-04-12 14:51:05'),
(584, '2015-00253-CM-0', 4, '2019-04-12 14:51:05'),
(585, '2015-00253-CM-0', 5, '2019-04-12 14:51:05'),
(586, '2015-00113-CM-0', 1, '2019-04-12 14:53:35'),
(587, '2015-00113-CM-0', 2, '2019-04-12 14:53:35'),
(588, '2015-00113-CM-0', 3, '2019-04-12 14:53:35'),
(589, '2015-00113-CM-0', 4, '2019-04-12 14:53:35'),
(590, '2015-00113-CM-0', 5, '2019-04-12 14:53:35'),
(591, '2015-00311-CM-0', 1, '2019-04-12 14:54:55'),
(592, '2015-00311-CM-0', 2, '2019-04-12 14:54:55'),
(593, '2015-00311-CM-0', 3, '2019-04-12 14:54:55'),
(594, '2015-00311-CM-0', 4, '2019-04-12 14:54:55'),
(595, '2015-00311-CM-0', 5, '2019-04-12 14:54:55'),
(596, '2015-00300-CM-0', 1, '2019-04-12 14:56:41'),
(597, '2015-00300-CM-0', 2, '2019-04-12 14:56:41'),
(598, '2015-00300-CM-0', 3, '2019-04-12 14:56:41'),
(599, '2015-00300-CM-0', 4, '2019-04-12 14:56:41'),
(600, '2015-00300-CM-0', 5, '2019-04-12 14:56:41'),
(601, '2015-00314-CM-0', 1, '2019-04-12 14:58:13'),
(602, '2015-00314-CM-0', 2, '2019-04-12 14:58:13'),
(603, '2015-00314-CM-0', 3, '2019-04-12 14:58:13'),
(604, '2015-00314-CM-0', 4, '2019-04-12 14:58:13'),
(605, '2015-00314-CM-0', 5, '2019-04-12 14:58:13'),
(606, '2015-00671-CM-0', 1, '2019-04-12 14:59:52'),
(607, '2015-00671-CM-0', 2, '2019-04-12 14:59:52'),
(608, '2015-00671-CM-0', 3, '2019-04-12 14:59:52'),
(609, '2015-00671-CM-0', 4, '2019-04-12 14:59:52'),
(610, '2015-00671-CM-0', 5, '2019-04-12 14:59:52'),
(611, '2015-00111-CM-0', 1, '2019-04-12 15:03:55'),
(612, '2015-00111-CM-0', 2, '2019-04-12 15:03:55'),
(613, '2015-00111-CM-0', 3, '2019-04-12 15:03:55'),
(614, '2015-00111-CM-0', 4, '2019-04-12 15:03:55'),
(615, '2015-00111-CM-0', 5, '2019-04-12 15:03:55'),
(616, '2015-00136-CM-0', 1, '2019-04-12 15:05:54'),
(617, '2015-00136-CM-0', 2, '2019-04-12 15:05:54'),
(618, '2015-00136-CM-0', 3, '2019-04-12 15:05:54'),
(619, '2015-00136-CM-0', 4, '2019-04-12 15:05:54'),
(620, '2015-00136-CM-0', 5, '2019-04-12 15:05:54'),
(621, '2015-00010-CM-0', 1, '2019-04-12 15:07:31'),
(622, '2015-00010-CM-0', 2, '2019-04-12 15:07:31'),
(623, '2015-00010-CM-0', 3, '2019-04-12 15:07:31'),
(624, '2015-00010-CM-0', 4, '2019-04-12 15:07:31'),
(625, '2015-00010-CM-0', 5, '2019-04-12 15:07:31'),
(626, '2015-00104-CM-0', 1, '2019-04-12 15:09:34'),
(627, '2015-00104-CM-0', 2, '2019-04-12 15:09:34'),
(628, '2015-00104-CM-0', 3, '2019-04-12 15:09:34'),
(629, '2015-00104-CM-0', 4, '2019-04-12 15:09:34'),
(630, '2015-00104-CM-0', 5, '2019-04-12 15:09:34'),
(631, '2015-00244-CM-0', 1, '2019-04-12 15:12:50'),
(632, '2015-00244-CM-0', 2, '2019-04-12 15:12:50'),
(633, '2015-00244-CM-0', 3, '2019-04-12 15:12:50'),
(634, '2015-00244-CM-0', 4, '2019-04-12 15:12:50'),
(635, '2015-00244-CM-0', 5, '2019-04-12 15:12:50'),
(636, '2015-00188-CM-0', 1, '2019-04-12 15:14:12'),
(637, '2015-00188-CM-0', 2, '2019-04-12 15:14:12'),
(638, '2015-00188-CM-0', 3, '2019-04-12 15:14:12'),
(639, '2015-00188-CM-0', 4, '2019-04-12 15:14:12'),
(640, '2015-00188-CM-0', 5, '2019-04-12 15:14:12'),
(641, '2015-00226-CM-0', 1, '2019-04-12 15:16:36'),
(642, '2015-00226-CM-0', 2, '2019-04-12 15:16:36'),
(643, '2015-00226-CM-0', 3, '2019-04-12 15:16:36'),
(644, '2015-00226-CM-0', 4, '2019-04-12 15:16:36'),
(645, '2015-00226-CM-0', 5, '2019-04-12 15:16:37'),
(646, '2015-00310-CM-0', 1, '2019-04-12 15:19:06'),
(647, '2015-00310-CM-0', 2, '2019-04-12 15:19:06'),
(648, '2015-00310-CM-0', 3, '2019-04-12 15:19:06'),
(649, '2015-00310-CM-0', 4, '2019-04-12 15:19:06'),
(650, '2015-00310-CM-0', 5, '2019-04-12 15:19:06'),
(651, '2015-00087-CM-0', 1, '2019-04-12 15:21:43'),
(652, '2015-00087-CM-0', 2, '2019-04-12 15:21:43'),
(653, '2015-00087-CM-0', 3, '2019-04-12 15:21:43'),
(654, '2015-00087-CM-0', 4, '2019-04-12 15:21:43'),
(655, '2015-00087-CM-0', 5, '2019-04-12 15:21:43'),
(656, '2015-00088-CM-0', 1, '2019-04-12 15:23:51'),
(657, '2015-00088-CM-0', 2, '2019-04-12 15:23:51'),
(658, '2015-00088-CM-0', 3, '2019-04-12 15:23:51'),
(659, '2015-00088-CM-0', 4, '2019-04-12 15:23:51'),
(660, '2015-00088-CM-0', 5, '2019-04-12 15:23:51'),
(661, '2015-00027-CM-0', 1, '2019-04-12 15:26:54'),
(662, '2015-00027-CM-0', 2, '2019-04-12 15:26:54'),
(663, '2015-00027-CM-0', 3, '2019-04-12 15:26:54'),
(664, '2015-00027-CM-0', 4, '2019-04-12 15:26:54'),
(665, '2015-00027-CM-0', 5, '2019-04-12 15:26:54'),
(666, '2015-00707-CM-1', 1, '2019-04-12 15:45:18'),
(667, '2015-00707-CM-1', 2, '2019-04-12 15:45:18'),
(668, '2015-00707-CM-1', 3, '2019-04-12 15:45:18'),
(669, '2015-00707-CM-1', 4, '2019-04-12 15:45:19'),
(670, '2015-00707-CM-1', 5, '2019-04-12 15:45:19'),
(671, '2015-00242-CM-0', 1, '2019-04-12 16:01:30'),
(672, '2015-00242-CM-0', 2, '2019-04-12 16:01:30'),
(673, '2015-00242-CM-0', 3, '2019-04-12 16:01:30'),
(674, '2015-00242-CM-0', 4, '2019-04-12 16:01:30'),
(675, '2015-00242-CM-0', 5, '2019-04-12 16:01:30'),
(676, '2015-00031-CM-0', 1, '2019-04-12 16:17:58'),
(677, '2015-00031-CM-0', 2, '2019-04-12 16:17:58'),
(678, '2015-00031-CM-0', 3, '2019-04-12 16:17:58'),
(679, '2015-00031-CM-0', 4, '2019-04-12 16:17:58'),
(680, '2015-00031-CM-0', 5, '2019-04-12 16:17:58'),
(681, '2015-00030-CM-0', 1, '2019-04-12 16:19:04'),
(682, '2015-00030-CM-0', 2, '2019-04-12 16:19:04'),
(683, '2015-00030-CM-0', 3, '2019-04-12 16:19:04'),
(684, '2015-00030-CM-0', 4, '2019-04-12 16:19:04'),
(685, '2015-00030-CM-0', 5, '2019-04-12 16:19:04'),
(686, '2015-00666-CM-0', 1, '2019-04-13 10:41:21'),
(687, '2015-00666-CM-0', 2, '2019-04-13 10:41:21'),
(688, '2015-00666-CM-0', 3, '2019-04-13 10:41:21'),
(689, '2015-00666-CM-0', 4, '2019-04-13 10:41:21'),
(690, '2015-00666-CM-0', 5, '2019-04-13 10:41:21'),
(691, '2015-00580-CM-0', 1, '2019-04-13 11:08:47'),
(692, '2015-00580-CM-0', 2, '2019-04-13 11:08:47'),
(693, '2015-00580-CM-0', 3, '2019-04-13 11:08:47'),
(694, '2015-00580-CM-0', 4, '2019-04-13 11:08:47'),
(695, '2015-00580-CM-0', 5, '2019-04-13 11:08:47'),
(696, '2015-00283-CM-0', 1, '2019-04-13 13:30:42'),
(697, '2015-00283-CM-0', 2, '2019-04-13 13:30:42'),
(698, '2015-00283-CM-0', 3, '2019-04-13 13:30:42'),
(699, '2015-00283-CM-0', 4, '2019-04-13 13:30:42'),
(700, '2015-00283-CM-0', 5, '2019-04-13 13:30:42'),
(701, '2015-00236-CM-0', 1, '2019-04-13 13:35:25'),
(702, '2015-00236-CM-0', 2, '2019-04-13 13:35:25'),
(703, '2015-00236-CM-0', 3, '2019-04-13 13:35:25'),
(704, '2015-00236-CM-0', 4, '2019-04-13 13:35:25'),
(705, '2015-00236-CM-0', 5, '2019-04-13 13:35:25'),
(706, '2015-00203-CM-0', 1, '2019-04-13 14:00:57'),
(707, '2015-00203-CM-0', 2, '2019-04-13 14:00:57'),
(708, '2015-00203-CM-0', 3, '2019-04-13 14:00:57'),
(709, '2015-00203-CM-0', 4, '2019-04-13 14:00:57'),
(710, '2015-00203-CM-0', 5, '2019-04-13 14:00:57'),
(711, '2015-00373-CM-0', 1, '2019-04-13 14:08:18'),
(712, '2015-00373-CM-0', 2, '2019-04-13 14:08:18'),
(713, '2015-00373-CM-0', 3, '2019-04-13 14:08:18'),
(714, '2015-00373-CM-0', 4, '2019-04-13 14:08:18'),
(715, '2015-00373-CM-0', 5, '2019-04-13 14:08:18'),
(716, '2015-00409-CM-0', 1, '2019-04-13 14:10:11'),
(717, '2015-00409-CM-0', 2, '2019-04-13 14:10:11'),
(718, '2015-00409-CM-0', 3, '2019-04-13 14:10:12'),
(719, '2015-00409-CM-0', 4, '2019-04-13 14:10:12'),
(720, '2015-00409-CM-0', 5, '2019-04-13 14:10:12'),
(721, '2015-00561-CM-0', 1, '2019-04-13 14:12:40'),
(722, '2015-00561-CM-0', 2, '2019-04-13 14:12:40'),
(723, '2015-00561-CM-0', 3, '2019-04-13 14:12:40'),
(724, '2015-00561-CM-0', 4, '2019-04-13 14:12:40'),
(725, '2015-00561-CM-0', 5, '2019-04-13 14:12:40'),
(726, '2015-00650-CM-0', 1, '2019-04-13 14:15:22'),
(727, '2015-00650-CM-0', 2, '2019-04-13 14:15:22'),
(728, '2015-00650-CM-0', 3, '2019-04-13 14:15:22'),
(729, '2015-00650-CM-0', 4, '2019-04-13 14:15:22'),
(730, '2015-00650-CM-0', 5, '2019-04-13 14:15:22'),
(731, '2015-00475-CM-0', 1, '2019-04-13 14:17:36'),
(732, '2015-00475-CM-0', 2, '2019-04-13 14:17:36'),
(733, '2015-00475-CM-0', 3, '2019-04-13 14:17:36'),
(734, '2015-00475-CM-0', 4, '2019-04-13 14:17:36'),
(735, '2015-00475-CM-0', 5, '2019-04-13 14:17:36'),
(736, '2015-00336-CM-0', 1, '2019-04-13 14:21:44'),
(737, '2015-00336-CM-0', 2, '2019-04-13 14:21:44'),
(738, '2015-00336-CM-0', 3, '2019-04-13 14:21:44'),
(739, '2015-00336-CM-0', 4, '2019-04-13 14:21:44'),
(740, '2015-00336-CM-0', 5, '2019-04-13 14:21:44'),
(741, '2015-00097-CM-0', 1, '2019-04-13 14:43:06'),
(742, '2015-00097-CM-0', 2, '2019-04-13 14:43:06'),
(743, '2015-00097-CM-0', 3, '2019-04-13 14:43:06'),
(744, '2015-00097-CM-0', 4, '2019-04-13 14:43:06'),
(745, '2015-00097-CM-0', 5, '2019-04-13 14:43:06'),
(746, '2015-00221-CM-0', 1, '2019-04-13 15:03:38'),
(747, '2015-00221-CM-0', 2, '2019-04-13 15:03:38'),
(748, '2015-00221-CM-0', 3, '2019-04-13 15:03:38'),
(749, '2015-00221-CM-0', 4, '2019-04-13 15:03:38'),
(750, '2015-00221-CM-0', 5, '2019-04-13 15:03:38'),
(751, '2015-00224-CM-0', 1, '2019-04-13 15:38:15'),
(752, '2015-00224-CM-0', 2, '2019-04-13 15:38:15'),
(753, '2015-00224-CM-0', 3, '2019-04-13 15:38:16'),
(754, '2015-00224-CM-0', 4, '2019-04-13 15:38:16'),
(755, '2015-00224-CM-0', 5, '2019-04-13 15:38:16'),
(756, '2015-00298-CM-0', 1, '2019-04-13 15:39:42'),
(757, '2015-00298-CM-0', 2, '2019-04-13 15:39:42'),
(758, '2015-00298-CM-0', 3, '2019-04-13 15:39:42'),
(759, '2015-00298-CM-0', 4, '2019-04-13 15:39:42'),
(760, '2015-00298-CM-0', 5, '2019-04-13 15:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `t_users_log`
--

CREATE TABLE `t_users_log` (
  `log_No` int(200) NOT NULL,
  `log_userID` int(10) NOT NULL,
  `log_usertype` int(10) NOT NULL,
  `log_datestamp` date NOT NULL,
  `log_timestamp` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_users_log`
--

INSERT INTO `t_users_log` (`log_No`, `log_userID`, `log_usertype`, `log_datestamp`, `log_timestamp`) VALUES
(1, 1, 1, '2019-04-05', '15:29:47'),
(2, 1, 1, '2019-04-05', '15:30:56'),
(3, 1, 1, '2019-04-05', '18:32:18'),
(4, 1, 1, '2019-04-06', '09:54:58'),
(5, 1, 1, '2019-04-06', '10:33:43'),
(6, 1, 1, '2019-04-06', '11:00:10'),
(7, 1, 1, '2019-04-06', '11:47:50'),
(8, 1, 1, '2019-04-11', '11:37:34'),
(9, 1, 1, '2019-04-11', '14:17:39'),
(10, 1, 1, '2019-04-11', '15:20:40'),
(11, 1, 1, '2019-04-11', '15:21:13'),
(12, 1, 1, '2019-04-11', '16:08:50'),
(13, 1, 1, '2019-04-11', '16:15:36'),
(14, 1, 1, '2019-04-11', '17:39:31'),
(15, 1, 1, '2019-04-11', '17:44:24'),
(16, 1, 1, '2019-04-12', '08:38:52'),
(17, 1, 1, '2019-04-12', '14:16:14'),
(18, 1, 1, '2019-04-13', '09:58:49'),
(19, 1, 1, '2019-04-15', '09:58:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `r_courses`
--
ALTER TABLE `r_courses`
  ADD PRIMARY KEY (`course_ID`);

--
-- Indexes for table `r_office`
--
ALTER TABLE `r_office`
  ADD PRIMARY KEY (`office_ID`);

--
-- Indexes for table `r_particulars`
--
ALTER TABLE `r_particulars`
  ADD PRIMARY KEY (`prtclr_ID`);

--
-- Indexes for table `r_user_role`
--
ALTER TABLE `r_user_role`
  ADD PRIMARY KEY (`usr_ID`);

--
-- Indexes for table `t_accounts`
--
ALTER TABLE `t_accounts`
  ADD PRIMARY KEY (`acc_ID`),
  ADD KEY `FK_acc_role` (`acc_user_role`),
  ADD KEY `FK_acc_emp` (`acc_empID`);

--
-- Indexes for table `t_employees`
--
ALTER TABLE `t_employees`
  ADD PRIMARY KEY (`emp_ID`),
  ADD KEY `FK_emp_off` (`emp_office`);

--
-- Indexes for table `t_report_bug`
--
ALTER TABLE `t_report_bug`
  ADD PRIMARY KEY (`rb_ID`),
  ADD KEY `FK_reporter` (`rb_reporter`);

--
-- Indexes for table `t_student_info`
--
ALTER TABLE `t_student_info`
  ADD PRIMARY KEY (`stud_ID`),
  ADD UNIQUE KEY `stud_number` (`stud_number`),
  ADD KEY `FK_degree` (`stud_degree_prog`);

--
-- Indexes for table `t_student_transact`
--
ALTER TABLE `t_student_transact`
  ADD PRIMARY KEY (`strs_ID`),
  ADD KEY `FK_stud_num` (`strs_stud_num`),
  ADD KEY `FK_particular` (`strs_prtclr_ref`);

--
-- Indexes for table `t_users_log`
--
ALTER TABLE `t_users_log`
  ADD PRIMARY KEY (`log_No`),
  ADD KEY `FK_loguserID` (`log_userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `r_courses`
--
ALTER TABLE `r_courses`
  MODIFY `course_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `r_office`
--
ALTER TABLE `r_office`
  MODIFY `office_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_particulars`
--
ALTER TABLE `r_particulars`
  MODIFY `prtclr_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `r_user_role`
--
ALTER TABLE `r_user_role`
  MODIFY `usr_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_accounts`
--
ALTER TABLE `t_accounts`
  MODIFY `acc_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_employees`
--
ALTER TABLE `t_employees`
  MODIFY `emp_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_report_bug`
--
ALTER TABLE `t_report_bug`
  MODIFY `rb_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_student_info`
--
ALTER TABLE `t_student_info`
  MODIFY `stud_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `t_student_transact`
--
ALTER TABLE `t_student_transact`
  MODIFY `strs_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=761;

--
-- AUTO_INCREMENT for table `t_users_log`
--
ALTER TABLE `t_users_log`
  MODIFY `log_No` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_accounts`
--
ALTER TABLE `t_accounts`
  ADD CONSTRAINT `FK_acc_emp` FOREIGN KEY (`acc_empID`) REFERENCES `t_employees` (`emp_ID`),
  ADD CONSTRAINT `FK_acc_role` FOREIGN KEY (`acc_user_role`) REFERENCES `r_user_role` (`usr_ID`);

--
-- Constraints for table `t_employees`
--
ALTER TABLE `t_employees`
  ADD CONSTRAINT `FK_emp_off` FOREIGN KEY (`emp_office`) REFERENCES `r_office` (`office_ID`);

--
-- Constraints for table `t_report_bug`
--
ALTER TABLE `t_report_bug`
  ADD CONSTRAINT `FK_reporter` FOREIGN KEY (`rb_reporter`) REFERENCES `t_accounts` (`acc_ID`);

--
-- Constraints for table `t_student_info`
--
ALTER TABLE `t_student_info`
  ADD CONSTRAINT `FK_degree` FOREIGN KEY (`stud_degree_prog`) REFERENCES `r_courses` (`course_ID`);

--
-- Constraints for table `t_student_transact`
--
ALTER TABLE `t_student_transact`
  ADD CONSTRAINT `FK_particular` FOREIGN KEY (`strs_prtclr_ref`) REFERENCES `r_particulars` (`prtclr_ID`),
  ADD CONSTRAINT `FK_stud_num` FOREIGN KEY (`strs_stud_num`) REFERENCES `t_student_info` (`stud_number`);

--
-- Constraints for table `t_users_log`
--
ALTER TABLE `t_users_log`
  ADD CONSTRAINT `FK_loguserID` FOREIGN KEY (`log_userID`) REFERENCES `t_accounts` (`acc_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
