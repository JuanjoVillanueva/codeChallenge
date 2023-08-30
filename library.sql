/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 29/08/2023 18:27:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id_book` int NOT NULL AUTO_INCREMENT,
  `name` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_date` date NOT NULL,
  `id_user` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_book`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'The History of Tom Jones', 'Henry Fielding', '1749-01-01', 21);
INSERT INTO `book` VALUES (2, 'Pride and Prejudice', 'Jane Austen', '1813-01-01', 20);
INSERT INTO `book` VALUES (3, 'The Red and the Black', 'Stendhal', '1830-01-01', 14);
INSERT INTO `book` VALUES (4, 'Le Père Goriot', 'Honoré de Balzac', '1835-01-01', 6);
INSERT INTO `book` VALUES (5, 'David Copperfield', 'Charles Dickens', '1849-01-01', 10);
INSERT INTO `book` VALUES (6, 'Madame Bovar', 'Gustave Flau', '1856-01-01', NULL);
INSERT INTO `book` VALUES (7, 'Moby-Dick', 'Herman Melville', '1851-01-01', NULL);
INSERT INTO `book` VALUES (8, 'Wuthering Heights', 'EmilBrontë', '1847-01-01', NULL);
INSERT INTO `book` VALUES (9, 'The Brothers Karamazov', 'Dostoevsk', '1880-01-01', NULL);
INSERT INTO `book` VALUES (10, 'War and Peace', 'Tolsto', '1869-01-01', NULL);

-- ----------------------------
-- Table structure for book_category
-- ----------------------------
DROP TABLE IF EXISTS `book_category`;
CREATE TABLE `book_category`  (
  `id_book` int NULL DEFAULT NULL,
  `id_cat` int NULL DEFAULT NULL,
  `priority` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_category
-- ----------------------------
INSERT INTO `book_category` VALUES (2, 1, 0);
INSERT INTO `book_category` VALUES (1, 4, 0);
INSERT INTO `book_category` VALUES (3, 1, 0);
INSERT INTO `book_category` VALUES (4, 3, 0);
INSERT INTO `book_category` VALUES (5, 2, 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id_cat` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_cat`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Science Fiction', '<p>\r\n	Also known as Sci-Fi, science fiction deals with the imagined future in terms of science or technology advances. This genre includes things like time travel, outer space, and intelligent life.&nbsp;<em>The Time Machine</em>&nbsp;by H.G. Wells is a classic example of science fiction.</p>\r\n');
INSERT INTO `category` VALUES (2, 'Crime Thriller', '<p>Thrillers are suspenseful stories, which makes a crime thriller a book that has a crime as its main subject while keeping readers on edge. The main characters are often fighting for justice. John Grisham is a well-known crime thriller author.</p>\r\n');
INSERT INTO `category` VALUES (3, 'Literary Fiction', '<p>\r\n	If a work of fiction doesn&rsquo;t fit into any of the other available genres, it can be labeled as literary fiction. These books are usually character-driven and introspective. They are sometimes called serious fiction because of their tone. Stephen Crane&rsquo;s&nbsp;<em>The Open Boa</em>t is an example of literary fiction.</p>\r\n');
INSERT INTO `category` VALUES (4, 'History', '<p>\r\n	Nonfiction history books include any books that lay out the known facts about a particular, time, culture, or event in history.&nbsp;<em>Killing England</em>&nbsp;by Bill O&rsquo;Reilly and Martin Dugard is an example of a popular history book.</p>\r\n');
INSERT INTO `category` VALUES (5, 'Children’s Books', '<p>\r\n	Children&rsquo;s fiction is often called children&rsquo;s literature or juvenile fiction. Books in this genre are written with readers under the age of 12 in mind. Types of children&rsquo;s books include picture books and chapter books. Classic Dr. Seuss books like&nbsp;<em>Green Eggs and Ham</em>&nbsp;are examples of children&rsquo;s fiction.</p>\r\n');
INSERT INTO `category` VALUES (6, 'Young Adult', '<p>\r\n	Young adult fiction is written for readers ages 12 to 18. They incorporate the typical reading level and worldview of tweens and teens in this age group.&nbsp;<em>The Hunger Games</em>&nbsp;series by Suzanne Collins is an example of popular young adult fiction.</p>\r\n');
INSERT INTO `category` VALUES (7, 'Self-Help', '<p>\r\n	Self-help books aim to aid the reader in improving some part of her life. Common topics covered by self-help books include relationships, finances, and mental health.&nbsp;<em>The 7 Habits of Highly Effective People</em>&nbsp;by Stephen R. Covey is a classic example of a popular self-help book.</p>\r\n');
INSERT INTO `category` VALUES (8, 'Food', '<p>\r\n	Nonfiction food books include cookbooks, but more modern food books encompass everything from specific cooking elements and ingredients to specialized diets. You&rsquo;ll find classic cookbooks with recipes and books that are part memoir/autobiography and part cookbook.&nbsp;<em>Mastering the Art of French Cooking</em>&nbsp;by Julia Child is an example of a popular food book.</p>\r\n');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Harrietta', 'hhabble0@sphinn.com');
INSERT INTO `user` VALUES (2, 'Gunner', 'gbitchener1@pcworld.com');
INSERT INTO `user` VALUES (3, 'Horatius', 'hshepley2@disqus.com');
INSERT INTO `user` VALUES (4, 'Hartley', 'hroja3@vk.com');
INSERT INTO `user` VALUES (5, 'Bronson', 'bitzcovichch4@uol.com.br');
INSERT INTO `user` VALUES (6, 'Gwendolin', 'gbrissenden5@auda.org.au');
INSERT INTO `user` VALUES (7, 'Tisha', 'tdescroix6@ox.ac.uk');
INSERT INTO `user` VALUES (8, 'Woodie', 'wmulvaney7@purevolume.com');
INSERT INTO `user` VALUES (9, 'Mag', 'mstreather8@sourceforge.net');
INSERT INTO `user` VALUES (10, 'Creigh', 'cmarini9@biblegateway.com');
INSERT INTO `user` VALUES (11, 'Artair', 'amenichia@ox.ac.uk');
INSERT INTO `user` VALUES (12, 'Tomaso', 'tcozinsb@printfriendly.com');
INSERT INTO `user` VALUES (13, 'Marietta', 'mcannamc@pagesperso-orange.fr');
INSERT INTO `user` VALUES (14, 'Gun', 'gnivend@shutterfly.com');
INSERT INTO `user` VALUES (15, 'Sherwynd', 'smcmillane@etsy.com');
INSERT INTO `user` VALUES (16, 'Tamarah', 'tchsteneyf@blogspot.com');
INSERT INTO `user` VALUES (17, 'Laurella', 'lbeavingtong@baidu.com');
INSERT INTO `user` VALUES (18, 'Lorelei', 'lpickavanth@state.gov');
INSERT INTO `user` VALUES (19, 'Virgie', 'vpetrollii@yellowbook.com');
INSERT INTO `user` VALUES (20, 'Berrie', 'bbickerdickej@cbsnews.com');
INSERT INTO `user` VALUES (21, 'Banner', 'villanuevajuanjo@gmail.com');

SET FOREIGN_KEY_CHECKS = 1;
