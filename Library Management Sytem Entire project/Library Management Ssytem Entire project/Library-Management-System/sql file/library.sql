SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'Admin PESCE', 'admin@gmail.com', 'admin', '1234', '2021-01-20 17:52:51');


CREATE TABLE `tblauthors` (
  `id` int(11) NOT NULL,
  `AuthorName` varchar(159) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `tblauthors` (`id`, `AuthorName`, `creationDate`, `UpdationDate`) VALUES
(1, 'P C Tripathi', '2021-01-20 12:49:09', '2021-01-20 15:16:59'),
(2, 'G K Guptha', '2021-01-20 14:30:23', '2021-01-20 15:15:09'),
(3, 'Robert C', '2021-01-20 14:35:08','2021-01-20 16:54:41' ),
(4, 'R K Narayan', '2021-01-20 14:35:21', '2021-01-20 16:54:41'),
(5, 'Andrew S', '2021-01-20 14:35:08','2021-01-20 16:54:41' ),
(6, 'Alok Mani Tripathi', '2021-01-20 14:35:08','2021-01-20 16:54:41' ),
(7, 'Benjamin Graham', '2021-01-20 14:35:08','2021-01-20 16:54:41' );


CREATE TABLE `tblbooks` (
  `id` int(11) NOT NULL,
  `BookName` varchar(255) DEFAULT NULL,
  `CatId` int(11) DEFAULT NULL,
  `AuthorId` int(11) DEFAULT NULL,
  `ISBNNumber` int(20) DEFAULT NULL,
  `BookPrice` int(11) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `tblbooks` (`id`, `BookName`, `CatId`, `AuthorId`, `ISBNNumber`, `BookPrice`, `RegDate`, `UpdationDate`) VALUES
(1, 'Principles of Management', 1, 1, 978168092, 395, '2021-01-20 20:04:55', '2021-01-20 21:54:41'),
(2, 'Introduction to Data Mining with Case Studies', 1, 2, 978812034, 380, '2021-01-20 20:17:31', '2021-01-20 21:13:17'),
(3, 'Modern Operating Systems', 1, 5, 978013595, 710, '2021-01-20 21:17:31', '2021-01-20 21:19:17'),
(4, 'Learning Robotic Process Automation', 1, 6, 978178847, 3499, '2021-01-21 21:17:31', '2021-01-21 21:19:17'),
(5, 'The Intelligent Investor', 2, 7, 978006055, 250, '2021-01-21 22:17:31', '2021-01-21 23:19:17'),
(6, 'The Guide', 3, 4, 978818598, 156, '2021-01-22 22:17:31', '2021-01-22 23:19:17'),
(7, 'The Intelligent Investor', 3, 4, 185986005, 144, '2021-01-21 22:17:31', '2021-01-21 23:19:17'),
(8, 'A Tiger for Malgudi', 3, 4, 185986111, 122, '2021-01-21 22:17:31', '2021-01-21 23:19:17');


CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `tblcategory` (`id`, `CategoryName`, `Status`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Engineering', 1, '2021-01-20 18:35:25', '2021-01-20 16:00:42'),
(2, 'Business and Management', 1, '2021-01-20 18:35:39', '2021-01-20 17:13:03'),
(3, 'Novels', 1, '2021-01-20 18:35:55', '2021-01-20 19:36:16'),
(4, 'Sports', 0, '2021-01-20 18:36:16', '2021-01-20 19:36:16');


CREATE TABLE `tblissuedbookdetails` (
  `id` int(11) NOT NULL,
  `BookId` int(11) DEFAULT NULL,
  `StudentID` varchar(150) DEFAULT NULL,
  `IssuesDate` timestamp NULL DEFAULT current_timestamp(),
  `ReturnDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `RetrunStatus` int(1) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `tblstudents` (
  `id` int(11) NOT NULL,
  `StudentId` varchar(100) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `USN` varchar(10) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `tblstudents` (`id`, `StudentId`, `FullName`, `USN`,`EmailId`, `MobileNumber`, `Password`, `Status`, `RegDate`, `UpdationDate`) VALUES
(1, '1001', 'Nithin', '4PS18IS034','nithin@gmail.com', '9999999999', '1234', 1, '2021-01-21 18:07:29', NULL),
(2, '1002', 'Shashank', '4PS18IS042','shashank@gmail.com', '9423462212', '1234', 0, '2021-01-21 18:08:45', '2020-01-23 18:14:45'),
(3, '1003', 'Noothan', '4PS18IS035','noothan@gmail.com', '8834567890', '1234', 1, '2021-01-21 18:08:45', '2020-01-23 18:14:45'),
(4, '1004', 'Nanda', '4PS18IS032','nanda@gmail.com', '9987654321', '1234', 1, '2021-01-21 18:08:45', '2020-01-23 18:14:45'),
(5, '1005', 'Shreyas', '4PS18IS030','shreyas@gmail.com', '7765432100', '1234', 1, '2021-01-21 18:08:45', '2020-01-23 18:14:45'),
(6, '1006', 'Vyshak', '4PS18IS055','vyshak@gmail.com', '8901234567', '1234', 1, '2021-01-21 18:08:45', '2020-01-23 18:14:45');


ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblauthors`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblbooks`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblissuedbookdetails`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StudentId` (`StudentId`);


ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `tblauthors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


ALTER TABLE `tblbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;


ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `tblissuedbookdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


ALTER TABLE `tblstudents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

