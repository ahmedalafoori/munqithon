-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2025 at 11:12 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `munqithon`
--

-- --------------------------------------------------------

--
-- Table structure for table `animals`
--

CREATE TABLE `animals` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `people_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 30,
  `price` decimal(10,2) NOT NULL,
  `zoom_link` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('available','booked','completed','cancelled') NOT NULL DEFAULT 'available',
  `client_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`) VALUES
(1, 'البنك الأهلي السعودي'),
(2, 'مصرف الراجحي'),
(3, 'بنك الرياض'),
(4, 'البنك السعودي الفرنسي'),
(5, 'البنك السعودي البريطاني (ساب)'),
(6, 'البنك العربي الوطني'),
(7, 'بنك البلاد'),
(8, 'بنك الجزيرة'),
(9, 'بنك الإنماء'),
(10, 'البنك السعودي للاستثمار'),
(11, 'بنك الخليج الدولي'),
(12, 'بنك دويتشه'),
(13, 'بنك الإمارات دبي الوطني'),
(14, 'بنك أبوظبي الأول'),
(15, 'بنك الكويت الوطني'),
(16, 'بنك مسقط'),
(17, 'بنك قطر الوطني'),
(18, 'ستاندرد تشارترد'),
(19, 'بنك البحرين الوطني');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('doctor','clinic') NOT NULL DEFAULT 'doctor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chatbots`
--

CREATE TABLE `chatbots` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `reply` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`) VALUES
(1, 'riyadh'),
(2, 'jeddah');

-- --------------------------------------------------------

--
-- Table structure for table `clinic_appointments`
--

CREATE TABLE `clinic_appointments` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `clinic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clinic_appointment_requests`
--

CREATE TABLE `clinic_appointment_requests` (
  `patient_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clinic_bookings`
--

CREATE TABLE `clinic_bookings` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('pending','approved','rejected','completed','cancelled') NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clinic_bookings`
--

INSERT INTO `clinic_bookings` (`id`, `client_id`, `clinic_id`, `schedule_id`, `notes`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 7, 'ففففففففف', 'approved', '2025-03-30 20:17:16', '2025-03-30 20:37:56'),
(2, 1, 3, 7, 'ففففففففف', 'approved', '2025-03-30 20:23:27', '2025-03-30 20:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `clinic_rates`
--

CREATE TABLE `clinic_rates` (
  `id` int(11) NOT NULL,
  `clinic_appointment_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `rate` int(5) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clinic_schedules`
--

CREATE TABLE `clinic_schedules` (
  `id` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `max_bookings` int(11) NOT NULL DEFAULT 1,
  `zoom_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clinic_schedules`
--

INSERT INTO `clinic_schedules` (`id`, `clinic_id`, `date`, `start_time`, `end_time`, `max_bookings`, `zoom_link`, `created_at`) VALUES
(3, 2, '2025-03-26', '03:22:00', '21:22:00', 1, NULL, '2025-03-26 01:52:14'),
(4, 2, '2025-03-26', '03:22:00', '21:22:00', 1, NULL, '2025-03-26 02:07:23'),
(5, 2, '2025-03-26', '22:02:00', '02:02:00', 1, NULL, '2025-03-26 19:03:23'),
(6, 3, '2025-03-27', '03:47:00', '07:47:00', 2, NULL, '2025-03-27 00:47:45'),
(7, 3, '2025-03-30', '20:08:00', '22:08:00', 2, NULL, '2025-03-30 17:09:26'),
(8, 3, '2025-04-04', '01:42:00', '04:42:00', 1, 'http://localhost/phpmyadmin/index.php?route=/sql&pos=0&db=munqithon&table=clinic_schedules', '2025-04-03 22:42:06');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `user1_id` int(11) NOT NULL,
  `user2_id` int(11) NOT NULL,
  `last_message` text DEFAULT NULL,
  `last_message_time` timestamp NULL DEFAULT NULL,
  `unread_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_appointments`
--

CREATE TABLE `doctor_appointments` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` text NOT NULL,
  `price` double NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_appointment_requests`
--

CREATE TABLE `doctor_appointment_requests` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `doctor_appointment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_rates`
--

CREATE TABLE `doctor_rates` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `rate` int(5) NOT NULL,
  `time` time NOT NULL,
  `doctor_appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedule`
--

CREATE TABLE `doctor_schedule` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_booked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_schedule`
--

INSERT INTO `doctor_schedule` (`id`, `doctor_id`, `appointment_date`, `start_time`, `end_time`, `status`, `is_booked`, `created_at`) VALUES
(6, 2, '2025-03-26', '22:57:00', '14:57:00', 0, 0, '2025-03-26 19:57:18'),
(7, 2, '2025-03-26', '22:57:00', '14:57:00', 0, 0, '2025-03-26 20:17:25'),
(8, 2, '2025-03-26', '22:57:00', '14:57:00', 0, 0, '2025-03-26 20:21:43'),
(9, 2, '2025-03-26', '22:57:00', '14:57:00', 0, 0, '2025-03-26 20:21:45'),
(10, 5, '2025-03-27', '01:03:00', '05:03:00', 0, 0, '2025-03-26 22:03:23');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `message`, `is_read`, `created_at`) VALUES
(1, 1, 2, 'لللل', 1, '2025-03-26 02:34:27'),
(2, 2, 1, 'تتتتتت', 1, '2025-03-26 02:35:02'),
(3, 1, 2, 'ممم', 1, '2025-03-26 02:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `logo` text NOT NULL,
  `address` text NOT NULL,
  `bio` text NOT NULL,
  `role_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `iban` varchar(100) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `name`, `email`, `password`, `phone`, `status`, `logo`, `address`, `bio`, `role_id`, `city_id`, `account_number`, `iban`, `bank_id`) VALUES
(1, 'name1', 'name@gmail.com', '00000000', '0532353535', 1, 'background.jpg', 'address', 'bio', 1, 1, NULL, NULL, NULL),
(2, 'admin', 'admin@gmail.com', '00000000', '0532353535', 1, 'background.jpg', 'address', 'bio', 2, 1, '2333333333344444', 'اااااااا555555555', 9),
(3, 'احمد منصور هزاع العفوري', 'admin@admin.com', '123456789', '0733527310', 1, '2.mp4', 'حده', '1', 3, 1, NULL, NULL, NULL),
(4, 'احمد منصور هزاع العفوري', 'ahmedalafoori23@gmail.com', '14141414', '0778138153', 0, '1742533247_صورة واتساب بتاريخ 1446-09-20 في 22.58.56_f5b0d0e6.jpg', 'حده', '1', 4, 2, NULL, NULL, NULL),
(5, 'admindoc', 'admindoc@admin.com', '123456789', '0778138153', 1, '1743026584_شعار احمد عفوري متجر اطياف افقي.png', 'sawan', 'doctor', 2, 1, NULL, NULL, NULL),
(6, 'كرتون اكواب', 'ahmedalafoori23@gmail.com', '14141414', '0733527310', 1, '1744384319_Im2rzv8BdngueSsLkz5IzdXCTcdpdD48fR7Gdffg.png', 'حده', '1ققققققق', 1, 1, NULL, NULL, NULL),
(7, 'كرتون اكواب', 'ahmedalafoori4423@gmail.com', '14141414', '0733527310', 0, '1744384337_Im2rzv8BdngueSsLkz5IzdXCTcdpdD48fR7Gdffg.png', 'حده', '1ققققققق', 2, 1, NULL, NULL, NULL),
(8, 'admin@admin.com', 'mosfeer2011@gmail.com', '123456789', '0778138153', 1, '1744406187_ji.PNG', 'sawan', 'ففففف', 1, 1, NULL, NULL, NULL),
(9, 'admin@admin.com', 'aaa@aaa.aaa', '123456789', '0778138153', 0, '1744406833_صورة واتساب بتاريخ 1446-10-11 في 21.26.01_3c3a57af.jpg', 'sawan', 'doctor', 2, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `address` text NOT NULL,
  `animal` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `content` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rescue_reports`
--

CREATE TABLE `rescue_reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `animal_type` varchar(100) NOT NULL,
  `city_id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('pending','in_progress','completed','cancelled') NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rescue_reports`
--

INSERT INTO `rescue_reports` (`id`, `user_id`, `animal_type`, `city_id`, `location`, `description`, `contact_phone`, `image`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(2, 1, 'كلب', 1, '0', 'ىىىىىى', 'اااااااااااااا', 'rescue_1742957048_554.PNG', 'completed', 'سسسسسسس', '2025-03-26 02:44:08', '2025-03-26 03:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'client'),
(2, 'doctor'),
(3, 'clinic'),
(4, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subscription_type` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visit_requests`
--

CREATE TABLE `visit_requests` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `animal_type` varchar(255) NOT NULL,
  `animal_age` varchar(50) DEFAULT NULL,
  `symptoms` text NOT NULL,
  `address` text NOT NULL,
  `preferred_date` date NOT NULL,
  `preferred_time` time NOT NULL,
  `status` enum('pending','approved','rejected','completed') DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `people_id` (`people_id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `chatbots`
--
ALTER TABLE `chatbots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`patient_id`,`doctor_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clinic_appointments`
--
ALTER TABLE `clinic_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clinic_id` (`clinic_id`);

--
-- Indexes for table `clinic_appointment_requests`
--
ALTER TABLE `clinic_appointment_requests`
  ADD PRIMARY KEY (`patient_id`,`appointment_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `clinic_bookings`
--
ALTER TABLE `clinic_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `clinic_id` (`clinic_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `clinic_rates`
--
ALTER TABLE `clinic_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `clinic_appointment_id` (`clinic_appointment_id`);

--
-- Indexes for table `clinic_schedules`
--
ALTER TABLE `clinic_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clinic_id` (`clinic_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user1_id` (`user1_id`),
  ADD KEY `user2_id` (`user2_id`);

--
-- Indexes for table `doctor_appointments`
--
ALTER TABLE `doctor_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `doctor_appointment_requests`
--
ALTER TABLE `doctor_appointment_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_appointment_id` (`doctor_appointment_id`);

--
-- Indexes for table `doctor_rates`
--
ALTER TABLE `doctor_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_appointment_id` (`doctor_appointment_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `doctor_schedule`
--
ALTER TABLE `doctor_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `bank_id` (`bank_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `rescue_reports`
--
ALTER TABLE `rescue_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `appointment_id` (`appointment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `visit_requests`
--
ALTER TABLE `visit_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `client_id` (`client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animals`
--
ALTER TABLE `animals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `chatbots`
--
ALTER TABLE `chatbots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clinic_appointments`
--
ALTER TABLE `clinic_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clinic_bookings`
--
ALTER TABLE `clinic_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clinic_rates`
--
ALTER TABLE `clinic_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clinic_schedules`
--
ALTER TABLE `clinic_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_appointments`
--
ALTER TABLE `doctor_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_appointment_requests`
--
ALTER TABLE `doctor_appointment_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_rates`
--
ALTER TABLE `doctor_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_schedule`
--
ALTER TABLE `doctor_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rescue_reports`
--
ALTER TABLE `rescue_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visit_requests`
--
ALTER TABLE `visit_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `animals_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `clinic_schedules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chatbots`
--
ALTER TABLE `chatbots`
  ADD CONSTRAINT `chatbots_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clinic_appointments`
--
ALTER TABLE `clinic_appointments`
  ADD CONSTRAINT `clinic_appointments_ibfk_1` FOREIGN KEY (`clinic_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clinic_appointment_requests`
--
ALTER TABLE `clinic_appointment_requests`
  ADD CONSTRAINT `clinic_appointment_requests_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clinic_appointment_requests_ibfk_2` FOREIGN KEY (`appointment_id`) REFERENCES `clinic_appointments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clinic_bookings`
--
ALTER TABLE `clinic_bookings`
  ADD CONSTRAINT `clinic_bookings_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clinic_bookings_ibfk_2` FOREIGN KEY (`clinic_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clinic_bookings_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `clinic_schedules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clinic_rates`
--
ALTER TABLE `clinic_rates`
  ADD CONSTRAINT `clinic_rates_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clinic_rates_ibfk_2` FOREIGN KEY (`clinic_appointment_id`) REFERENCES `clinic_appointments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clinic_schedules`
--
ALTER TABLE `clinic_schedules`
  ADD CONSTRAINT `clinic_schedules_ibfk_1` FOREIGN KEY (`clinic_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_ibfk_1` FOREIGN KEY (`user1_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversations_ibfk_2` FOREIGN KEY (`user2_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `doctor_appointments`
--
ALTER TABLE `doctor_appointments`
  ADD CONSTRAINT `doctor_appointments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `doctor_appointment_requests`
--
ALTER TABLE `doctor_appointment_requests`
  ADD CONSTRAINT `doctor_appointment_requests_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `doctor_appointment_requests_ibfk_2` FOREIGN KEY (`doctor_appointment_id`) REFERENCES `doctor_appointments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `doctor_rates`
--
ALTER TABLE `doctor_rates`
  ADD CONSTRAINT `doctor_rates_ibfk_1` FOREIGN KEY (`doctor_appointment_id`) REFERENCES `doctor_appointments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `doctor_rates_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `doctor_schedule`
--
ALTER TABLE `doctor_schedule`
  ADD CONSTRAINT `doctor_schedule_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `people_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `people_ibfk_3` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rescue_reports`
--
ALTER TABLE `rescue_reports`
  ADD CONSTRAINT `rescue_reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rescue_reports_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
