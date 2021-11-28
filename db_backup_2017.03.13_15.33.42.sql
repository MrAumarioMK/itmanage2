-- -------------------------------------------
SET AUTOCOMMIT=0;
START TRANSACTION;
SET SQL_QUOTE_SHOW_CREATE = 1;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- -------------------------------------------
-- -------------------------------------------
-- START BACKUP
-- -------------------------------------------
-- -------------------------------------------
-- TABLE `department`
-- -------------------------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) DEFAULT NULL COMMENT 'ชื่อหน่วยงาน',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `device`
-- -------------------------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE IF NOT EXISTS `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` varchar(50) DEFAULT NULL,
  `serial_no` varchar(50) DEFAULT NULL,
  `device_brand` varchar(255) DEFAULT NULL,
  `device_model` varchar(255) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL COMMENT 'ชื่อเครื่อง',
  `memory` varchar(50) DEFAULT NULL,
  `cpu` varchar(100) DEFAULT NULL,
  `harddisk` varchar(100) DEFAULT NULL,
  `monitor` varchar(100) DEFAULT NULL,
  `other_detail` varchar(255) DEFAULT NULL,
  `device_ip` varchar(100) DEFAULT NULL,
  `date_use` date DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `device_price` double(22,2) DEFAULT NULL,
  `device_docs` varchar(50) DEFAULT NULL,
  `vender` varchar(255) DEFAULT NULL,
  `warranty` varchar(255) DEFAULT NULL,
  `device_status` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `device_type_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `device_type`
-- -------------------------------------------
DROP TABLE IF EXISTS `device_type`;
CREATE TABLE IF NOT EXISTS `device_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_type` varchar(45) DEFAULT NULL COMMENT 'หมวดหมู่อุปกรณ์',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `employee`
-- -------------------------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fullname` varchar(45) DEFAULT NULL,
  `user_position` varchar(100) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `job`
-- -------------------------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_date` datetime DEFAULT NULL COMMENT 'วันที่แจ้ง',
  `job_detail` varchar(1000) DEFAULT NULL COMMENT 'ปัญหา/อาการเสีย',
  `job_start_date` datetime DEFAULT NULL COMMENT 'วันที่ดำเนินการซ่อม',
  `job_success_date` datetime DEFAULT NULL COMMENT 'วันที่เสร็จ',
  `job_how_to_fix` varchar(1000) DEFAULT NULL COMMENT 'สาเหตุ/วิธีการซ่อม',
  `price` int(11) DEFAULT NULL,
  `job_status` varchar(45) DEFAULT NULL COMMENT 'สถานะการซ่อม',
  `job_employee_id` int(11) NOT NULL,
  `job_type_id` int(11) NOT NULL,
  `device_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `job_type`
-- -------------------------------------------
DROP TABLE IF EXISTS `job_type`;
CREATE TABLE IF NOT EXISTS `job_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_type_name` varchar(45) DEFAULT NULL COMMENT 'ประเภทงานซ่อม',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `migration`
-- -------------------------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `user`
-- -------------------------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `password_hash` varchar(60) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `role` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE DATA department
-- -------------------------------------------
INSERT INTO `department` (`id`,`department_name`) VALUES
('1','Sales');
INSERT INTO `department` (`id`,`department_name`) VALUES
('2','Account');
INSERT INTO `department` (`id`,`department_name`) VALUES
('3','Marketing');
INSERT INTO `department` (`id`,`department_name`) VALUES
('4','CS&Document(FFW)');
INSERT INTO `department` (`id`,`department_name`) VALUES
('5','NVOCC');
INSERT INTO `department` (`id`,`department_name`) VALUES
('6','Management');
INSERT INTO `department` (`id`,`department_name`) VALUES
('7','IT&ADMIN');
INSERT INTO `department` (`id`,`department_name`) VALUES
('8','Other');
INSERT INTO `department` (`id`,`department_name`) VALUES
('9','Document');



-- -------------------------------------------
-- TABLE DATA device
-- -------------------------------------------
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('1','','SJMX1834Z01D','Cisco ','ASA05505 Firewall Edition Security',' firewall','','','','','Endrian firewall
','203.144.221.34','','','','','Open System','','enable','10','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('2','','CN742607MK','HP','DL360E GEN8 E5-2407V2 SFF BASE AP SVR','Server Database (Progress)','DDR3 RDIMM PCL-12800E (1600MHz)','Intel Xeon E5-2407 (2.4 Ghz/4-core/10MB/80W,HT)','HP 300 GB 6G SAS 10K 2.5in SC ENT HDD x4','','','10.16.20.20','','','','','','','enable','3','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('3','','CN742607MK','HP','DL360E GEN8 E5-2407V2 SFF BASE AP SVR','Server Mail','DDR3 RDIMM PCL-12800E (1600MHz)','Intel Xeon E5-2407 (2.4 Ghz/4-core/10MB/80W,HT)','HP 300 GB 6G SAS 10K 2.5in SC ENT HDD x4','','Server MAIL','10.16.20.5','','','','','','','enable','3','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('4','','6CR4237284','HP','HP ProDesk 400 G1 MT','MD	Prattrix','4096MB RAM','Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz (4 CPUs), ~3.4GHz','ST500DM002-1BD142','SAMSUNG	19.5 Inch	MR3MHYCF502914Z','Windows 8.1 pro 64bit
','','','','','','','','enable','1','4');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('5','','6CR4237282','HP','HP ProDesk 400 G1 MT','MD	kraisorn','4096MB RAM','Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz (4 CPUs), ~3.4GHz','ST500DM002','SAMSUNG	19.5 Inch	MR3MHYCF502924Y','','','','','','','','','enable','1','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('6','','6CR4237286','HP','HP Prodesk 400 G1 MT','Manager	Manuel','4096MB RAM','Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz (4 CPUs), ~3.4GHz','ST500DM002','SAMSUNG	19.5 Inch	MR3MHYCF603554V','','','','','','','','','enable','1','6');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('7','','','TOSHIBA','','Manager	Valika','','','','SAMSUNG	19.5 Inch	MR3MHYCF502925Y','notebookส่วนตัว','','','','','','','','enable','2','6');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('8','','6CR42372B6','HP','Prodesk 400 G1 MT','Account	Molladda','4096MB RAM','Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz (4 CPUs), ~3.4GHz','ST500DM002','SAMSUNG	19.5 Inch	G06YHYCF512981R','','','','','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('9','','6CR423729X','HP','HP ProDesk 400 G1 MT','Account	pornjit','4096MB RAM','Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz (4 CPUs), ~3.4GHz','ST500DM002','SAMSUNG	19.5 Inch	G06YHYCF600787B','','','','','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('10','','PC01UAUS','LENOVO','ThinkCentre E73','Account	Duongkaew','4096 MB PC3-12800 DDR3 SDRAM','Intel(R) Core(TM) i3-4150 CPU @ 3.50GHz','WDC WD10EZEX 1000 GB','Lenovo	18 Inch	ไม่ระบุ','Windows 8.1 pro 64bit','','','','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('11','','6CR42372B2','HP','HP ProDesk 400 G1 MT','Tele marketing	TeleSale','4096MB RAM','Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz (4 CPUs)','ST500DM002','SAMSUNG	19.5 Inch	G06YHYCF600789T','','','','','','','','','enable','1','3');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('12','','6CR42372B8','HP','HP ProDesk 400 G1 MT','Customer Service	nanthaporn','4096MB RAM','Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz (4 CPUs)','ST500DM002','SAMSUNG	19.5 Inch	G06YHYCF504150D','Windows 8.1 pro 64bit','','','','','','','','enable','1','4');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('13','','6CR423729T','HP','HP ProDesk 400 G1 MT','Customer Service	jintana','4096MB RAM','Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz (4 CPUs)','ST500DM002','SAMSUNG	19.5 Inch	G06YHYCF600063E','Windows 8.1 Pro 64-bit (6.3, Build 9600)','','','','','','','','enable','1','4');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('14','','6CR4237292','HP','HP ProDesk 400 G1 MT','Customer Service	Onnicha','4096MB RAM','Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz (4 CPUs)','ST500DM002','SAMSUNG	19.5 Inch	G06YHYCF504113N','Windows 8.1 Pro 64-bit (6.3, Build 9600)','','','','','','','','enable','1','4');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('15','','6CR423729W','HP','HP ProDesk 400 G1 MT','Customer Service	pannee','4096MB RAM','Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz (4 CPUs)','ST500DM002','SAMSUNG	19.5 Inch	G06YHYCF501113N','Windows 8.1 Pro 64-bit (6.3, Build 9600)','','','','','','','','enable','1','4');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('16','','6CR423729S','HP','HP ProDesk 400 G1 MT','Document	Keangkam','4096MB RAM','Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz (4 CPUs)','ST500DM002','SAMSUNG	19.5 Inch	G06YHYCF402639W','Windows 8.1 Pro 64-bit (6.3, Build 9600)','','','','','','','','enable','1','9');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('17','','6CR42372B0','HP ','HP ProDesk 400 G1 MT','Customer Service	sataporn','4096MB RAM','Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz (4 CPUs)','ST500DM002','SAMSUNG	19.5 Inch	G06YHYCF501103N','Windows 8.1 Pro 64-bit (6.3, Build 9600)','','','','','','','','enable','1','4');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('18','','PB02AQXM','LENOVO ','ThinkCentre E73','Document	NEW Staff','DDR3 SDRAM 4096 MBytes 1600 MHz','Intel(R) Core(TM) i3-4150 CPU @ 3.50GHz','WDC WD10EZEX-08M2NA0','Lenovo	18 Inch	ไม่ระบุ','Windows 7 pro 64bit
','','','','','','','','enable','1','9');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('19','','PB02AQWP','LENOVO','ThinkCentre E73','Document	Achara','DDR3 SDRAM 4096 MBytes 1600 MHz','Intel(R) Core(TM) i3-4150 CPU @ 3.50GHz','WDC WD10EZEX-08M2NA0','Lenovo	18 Inch	ไม่ระบุ','Windows 7 pro 64bit
','','','','','','','','enable','1','9');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('20','','D0TYQ12','Dell','Inspiron 3847','Document	saowapa','4096MB RAM','Intel(R) Core(TM) i3-4150 CPU @ 3.50GHz (4 CPUs)','WDC WD5000AAKX','SAMSUNG	19.5 Inch	G06YHYCF306967Y','Windows 8.1 pro 64bit
','','','','','','','','enable','1','9');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('21','','JZSYQ12','Dell','Inspiron 3847','Document	Thanyakate','4096MB RAM','Intel(R) Core(TM) i3-4150 CPU @ 3.50GHz (4 CPUs)','WDC WD5000AAKX','SAMSUNG	19.5 Inch	G06YHYCF504395Y','Windows 8.1 pro 64bit
','','','','','','','','enable','1','9');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('22','','6CR4237284','HP ','ProDesk 400 G1 MT','Sale	Thitikarn','4096MB RAM','Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz (4 CPUs)','ST500DM002','SAMSUNG	19.5 Inch	G06YHYCF513136B','Windows 8.1 pro 64bit
','','','','','','','','enable','1','1');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('23','','6CR42372BC','HP','ProDesk 400 G1 MT','Sale	Wannipa','4096MB RAM','Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz (4 CPUs)','ST500DM002','SAMSUNG	19.5 Inch	G06YHYCF306962M','Windows 8.1 pro 64bit
','','','','','','','','enable','1','1');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('24','','PC01UAT9','LENOVO','ThinkCentre E73','Sale	Chanon','DDR3 SDRAM 4096 MBytes 1600 MHz','Intel(R) Core(TM) i3-4150 CPU @ 3.50GHz','WDC WD10EZEX-08M2NA0','Lenovo	18 Inch	ไม่ระบุ','Windows 8.1 pro 64bit
','','','','','','','','enable','1','1');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('25','','6CR42372BB','HP','ProDesk 400 G1 MT','Chawalit','4096MB RAM','Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz (4 CPUs)','ST500DM002','SAMSUNG	19 Inch	G06YHYCF402608N','Windows 8.1 pro 64bit
','10.16.20.119','','','','','','','enable','1','7');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('26','','SGH511Q6WG','HP','ProDesk 400 G1 MT','Nanthachat','4096MB RAM','Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz (4 CPUs)','ST500DM002','SAMSUNG	19 Inch	','Windows7 pro 64bit
','','','','','','','','enable','1','7');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('27','','-','Mira','Custom','Sale	Kongkarn','8192MB RAM','AMD A4-6300 APU with Radeon(tm) HD Graphics (2 CPUs)','ST500DM002','SAMSUNG	18.5 Inch	LS19D300HY/XT','Windows 8.1 pro 64bit
','','','','','','Mira','','enable','1','1');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('28','','-','Mira','Custom','Document	SAO','8192MB RAM','AMD A4-6300 APU with Radeon(tm) HD Graphics (2 CPUs)','ST500DM002','SAMSUNG	19.5 Inch	LS19D270HY/XT','Windows 8.1 pro 64bit
','','','','','','Mira','','enable','1','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('29','','-','Mira','Custom','Sale	Puncharat','8192MB RAM','AMD A4-6300 APU with Radeon(tm) HD Graphics(2 CPUs)','','ST500DM002','Windows 8.1 pro 64bit
','','','','','','Mira','','enable','1','1');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('30','','-','Mira','Custom','Account	Nuch','8192MB RAM','AMD A4-6300 APU with Radeon(tm) HD Graphics(2 CPUs)','ST500DM002','SAMSUNG	21.5 Inch	LS19D250HY/XT','Windows 8.1 pro 64bit
','','','','','','Mira','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('31','','','Ricoh ','MP2003','Multifunction','','','','','','10.16.100.99','','','','','','เช่า','enable','5','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('32','','','RICOH','MP2001','Multifunction','','','','','','10.16.100.96','','','','','RICOH','เช่า','enable','5','9');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('33','','FT7Y058681','Epson','LQ2090','SHARED','','','','','CS.NVOCC
','','','','','','','','enable','4','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('34','','FT7Y059267','Epson','LQ2090','','','','','','','','','','','','','','enable','4','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('35','','MK5Y018365','Epson','LQ2190','','','','','','','','','','','','','','enable','4','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('36','','FT7Y059262','Epson','LQ2090','','','','','','CS FREIGHT
','','','','','','','','enable','4','4');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('37','','S31U2F000822','D-LINK','D-LINK 1060','Switch ','','','','','SERVER ROOM
','','','','','','MIRA COMPUTER','','enable','10','8');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('38','','1505010305A1514',' SYNDOME',' ICON 800VA','PORNJIT','','','','','','','','','','','','','enable','9','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('39','','1505010305A1515','SYNDOME',' ICON 800VA','MOLLADDA','','','','','','','','','','','','','enable','9','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('40','','1505010305A1516','SYNDOME ','ICON 800VA','DUANGKEAW','','','','','','','','','','','','','enable','9','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('41','','1505010305A1517',' SYNDOME',' ICON 800VA','NANTHACHAT','','','','','','','','','','','','','enable','9','7');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('42','','SF0C1B09W1XY','Cisco ','Catalyst 2960s 24 GIGE, 4X SFP LAN BASE','Switch ','','','','','','10.16.20.1','','','','','Open System','','enable','10','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('43','','SFD01815R0XA','CISCO ','CASTALYST 3560X 24 PORT DATA IP BASE','Switch ','','','','','','10.16.100.1','','','','','Open System','','enable','10','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('44','','SFCZ1816V045','Cisco ','802.11n Auto 3x4:3ss Mod Int Ant E Reg Domain','AccessPoint','','','','','','10.16.100.13','','','','','Open System','','enable','10','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('45','','SFCZ1816V047','Cisco ','802.11n Auto 3x4:3ss Mod Int Ant E Reg Domain','AccessPoint','','','','','','10.16.100.14','','','','','','','enable','10','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('46','','','Dlink','NAS STORAGE 4XHDD WESTERN 2TB RE','NAS','','','','','','10.16.20.40','','','','','','','enable','10','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('47','','','ATEN','KVM SWITCH 8 PORT USB & PS/2 CS-1716','KVM SWITCH ','','','','','','','','','','','','','enable','10','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('48','','2614059561','BAVO',' FG 20',' FAX SERVER','','','','','','192.168.0.31','','','','','','','enable','10','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('49','','00C8HYCG100230','SAMSUNG ','MODEL : LS19F350HNEXXT','Mornitor','','','','','Mornitor Server
LED MN 18.5\'\' ','','','','','','','','enable','1','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('50','','SGH422J9FM','HP',' PROLIANT DL320E GEN8 V2 HOT PLUG 2LFF CTO SVR','SERVER','4096MB RAM','Intel(R) Xeon(R) CPU E3-1230 v3 @ 3.30GHz (8 CPUs)','','','windows server 2012 r2
','10.16.20.12','','','','','Open System','','enable','3','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('51','','SGH422J9FR','HP ','PROLIANT DL320E GEN8 V2 HOT PLUG 2LFF CTO SVR','SERVER','4096MB RAM','Intel(R) Xeon(R) CPU E3-1230 v3 @ 3.30GHz (8 CPUs)','2 TB','','windows server 2012 r2
','10.16.20.10','','','','','Open System','','enable','3','5');



-- -------------------------------------------
-- TABLE DATA device_type
-- -------------------------------------------
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('1','Computer PC');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('2','Computer Notebook');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('3','Computer Server');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('4','Printer Dotmatrix');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('5','Printer Laser');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('6','Printer Inkjet');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('7','Accesscontrol');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('8','CCTV');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('9','UPS');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('10','NetworkDevice');



-- -------------------------------------------
-- TABLE DATA employee
-- -------------------------------------------
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('1','Kraisorn  Chongcharoenpornsuk (Noom)','Executive Director NVOCC','6');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('2','Patrick Fassnacht','','6');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('3','Valika  Chongcharoenpornsuk (Tui)','General Manager','6');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('4','Manuel  Pfitzer','','6');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('5','Jintana Onpaiboon (Mum)','Customer Service Supervisor','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('6','Pannee Sangram (Nuch)','Customer Service Supervisor','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('7','Nanthaporn Korakotkraingkrai (JU)','Customer Service Supervisor','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('8','Onnicha  Muangklam (Jeab)','Customer Service Supervisor','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('9','Thunyakate Choorat (JUNE)','Shipping Document','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('10','Saowapa Udomlertpiti (EDD)','Shipping Document','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('11','Krongkarn Korakodkriangkai (JIB)','Executive Sale & Marketing','4');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('12','Sataporn Chobsri (MEAW)','Customer Service Supervisor','4');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('13','Kiengcum  Hanchana (AODADD)','Import Customer Service Supervisor','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('14','Monladda  Bumrungsakulchai (PUM)','Acounting Supervisor','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('15','Achara  Dablaam (Nick)','Customer Service','4');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('16','Natthawut  Wiyasing (Mild)','Telemarketing','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('17','Telemarketing (Preaw)','Executive Sale & Marketing','4');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('18','Pornjit  Kampinta (Puy)','Accounting Officer','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('19','Duangkeaw  Thubthong (Pla)','Accounting Officer','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('20','Nanthachat  Narod (NooN)','Office Admin','7');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('21','Warath  Boonyawat (Kwan)','Messenger','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('22','Wachara  Manthongdang (X)','Messenger','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('23','Patteera  Rungakaraviwat (Parn)','Customer Service','4');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('24','Puncharat  Srisathanon (IZE)','Executive Sale & Marketing','4');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('25','Chanon  Kriengkrailert (Jame)','Executive Sale & Marketing','4');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('26','Ariya  Issaard (Nuch)','Accounting Officer','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('27','Chonthicha  Dechsamrong (Sao)','Shipping Document','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('28','Titima  Yingdeecharonekul (May)','Marketig Officer','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('29','Atthaporn  Nopsuwan (PoP)','Messenger','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('30','Jariya  Khemmanee (NA)','Marketig Officer','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('31','Pulida  Saetang (BooM)','Marketig Officer','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('32','Wanwisa  Phumphetraya (SA)','Shipping Document','9');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('33','Wanna  Deepibul (Deaw)','Marketig Officer','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('34','Karin  Pantong (EVE)','Accounting Assisitant','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('35','Chawalit  Triwitwareekul (Tee)','IT Support','7');



-- -------------------------------------------
-- TABLE DATA job
-- -------------------------------------------
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('1','2017-03-06 16:16:00','เปิดไฟล์งานไม่ได้','2017-03-06 16:15:00','2017-03-06 16:30:00','อาจเกิดจากตัวโปรแกรม CALC','0','success','15','1','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('2','2017-03-07 09:00:00','update SCHEDULE WEEKLY','2017-03-07 09:00:00','2017-03-07 09:40:00','นำข้อมูลจากตารางขี้นเวป','0','success','31','1','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('3','2017-03-07 09:00:00','set ระบบแจ้งซ่อม','2017-03-07 09:00:00','2017-03-07 17:14:00','คีย์ข้อมูลเข้าระบบ','0','success','35','1','','2');



-- -------------------------------------------
-- TABLE DATA job_type
-- -------------------------------------------
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('1','แก้ไขปัญหาด้าน Software');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('2','แก้ไขปัญหาด้าน Hardware');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('3','แก้ไขปัญหาด้านระบบเครือข่าย');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('4','ซ่อมบำรุงอุปกรณ์ต่อพ่วง Hardware');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('5','ประชุม/อบรม/สัมนา');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('6','จัดทำเอกสาร');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('7','งานอื่น ๆ ที่ได้รับมอบหมาย');



-- -------------------------------------------
-- TABLE DATA migration
-- -------------------------------------------
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m000000_000000_base','1447299401');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140209_132017_init','1447299406');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140403_174025_create_account_table','1447299407');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140504_113157_update_tables','1447299412');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140504_130429_create_token_table','1447299413');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140830_171933_fix_ip_field','1447299414');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140830_172703_change_account_table_name','1447299414');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m141222_110026_update_ip_field','1447299414');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m141222_135246_alter_username_length','1447299415');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m150614_103145_update_social_account_table','1447299417');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m150623_212711_fix_username_notnull','1447299418');



-- -------------------------------------------
-- TABLE DATA user
-- -------------------------------------------
INSERT INTO `user` (`id`,`fullname`,`username`,`position`,`password_hash`,`created_at`,`updated_at`,`role`) VALUES
('1','ผู้ดูแลระบบ','admin','ผู้ดูแลระบบ','$2y$12$48bdgqNLiSf8cCAwYZFS3uJY1K2mwpKfYnKZ4aiDKqC.1aLbbGWKy','1447299648','1448434717','1');
INSERT INTO `user` (`id`,`fullname`,`username`,`position`,`password_hash`,`created_at`,`updated_at`,`role`) VALUES
('2','Chawalit  Triwitwareekul','tee','IT Support','$2y$12$DLM4rKc7EUxQRGTHLncBFuGNG1DOJjmxGydgQqG8Ld8bwD1Oi4hMa','1488795350','1488795350','0');



-- -------------------------------------------
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
COMMIT;
-- -------------------------------------------
-- -------------------------------------------
-- END BACKUP
-- -------------------------------------------
