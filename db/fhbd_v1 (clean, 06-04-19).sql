-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2019 at 05:32 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

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
  `prtclr_abbrv` varchar(30) DEFAULT NULL,
  `prtclr_amount` decimal(10,2) NOT NULL,
  `prtclr_status` varchar(10) NOT NULL DEFAULT 'Active',
  `prtclr_timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_particulars`
--

INSERT INTO `r_particulars` (`prtclr_ID`, `prtclr_desc`, `prtclr_abbrv`, `prtclr_amount`, `prtclr_status`, `prtclr_timestamp`) VALUES
(1, 'Application for Graduation', 'App for Grad', '150.00', 'Active', '2019-06-05 22:45:58'),
(2, 'Graduation Fee', 'Grad Fee', '600.00', 'Active', '2019-06-05 22:46:23'),
(3, 'Transcript of Records', 'TOR', '350.00', 'Active', '2019-06-05 22:46:09'),
(4, 'Diploma', 'Diploma', '200.00', 'Active', '2019-06-05 22:46:35'),
(5, 'Certification of Grades', 'CTC ', '150.00', 'Active', '2019-06-05 22:47:04'),
(6, 'NBI Clearance', 'NBI', '170.00', 'Disabled', '2019-06-05 22:47:17'),
(7, 'Alumni Fee', 'Alm Fee', '500.00', 'Disabled', '2019-06-05 22:49:42');

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
  `stud_transact_stat` varchar(20) NOT NULL DEFAULT 'PENDING',
  `stud_timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  MODIFY `prtclr_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `stud_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_student_transact`
--
ALTER TABLE `t_student_transact`
  MODIFY `strs_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_users_log`
--
ALTER TABLE `t_users_log`
  MODIFY `log_No` int(200) NOT NULL AUTO_INCREMENT;

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
