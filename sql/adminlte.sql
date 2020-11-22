/*
 Navicat Premium Data Transfer

 Source Server         : centos7_mysql
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : 192.168.234.128:3306
 Source Schema         : adminlte

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 22/11/2020 16:29:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '无意义、主键uuid',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `phoneNum` varbinary(255) NULL DEFAULT NULL COMMENT '电话号码',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('E61D65F673D54F68B0861025C69773DB', '张三', '小三', 0x3138383838383838383838, 'zs@163.com');

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller`  (
  `orderId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `travellerId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`orderId`, `travellerId`) USING BTREE,
  INDEX `fk_order_traveller-travellerId`(`travellerId`) USING BTREE,
  CONSTRAINT `fk_order_traveller-orderId` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_traveller-travellerId` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单与旅客的关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('3081770BC3984EF092D9E99760FDABDE', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('E4DD4C45EED84870ABA83574A801083E', 'EE7A71FB6945483FBF91543DBE851960');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '无意义，主键uuid',
  `orderNum` varbinary(255) NULL DEFAULT NULL COMMENT '订单编号 不为空 唯一',
  `orderTime` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `peopleCount` int(5) NULL DEFAULT NULL COMMENT '出行人数',
  `orderDesc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单描述（其他信息）',
  `payType` tinyint(1) NULL DEFAULT NULL COMMENT '支付方式 0 支付宝 1微信 2其它',
  `orderStatus` tinyint(1) NULL DEFAULT NULL COMMENT '订单状态 0未支付 1已支付',
  `productId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品id 外键',
  `memberId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员（联系人）id外键',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_productId`(`productId`) USING BTREE,
  INDEX `fk_memberId`(`memberId`) USING BTREE,
  CONSTRAINT `fk_memberId` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_productId` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', 0x3132333435, '2020-11-12 19:28:00', 2, '没什么', 0, 1, '0D421BEB24CA11EB9515000C29B64374', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('2FF351C4AC744E2092DCF08CFD314420', 0x3637383930, '2020-11-13 19:28:00', 2, '没什么', 0, 1, 'AEF3E5ABFAC24B4B8E75F1409EEA5ECD', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('3081770BC3984EF092D9E99760FDABDE', 0x3535353535, '2020-11-12 19:30:00', 2, '没什么', 0, 1, 'CE73903424C911EB9515000C29B64374', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', 0x3333333333, '2020-12-12 19:53:00', 2, '没什么', 0, 1, 'CB00E872F2CC479B9C498938DB1259DA', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', 0x3534333231, '2020-11-12 16:28:00', 2, '没什么', 0, 1, 'AEF3E5ABFAC24B4B8E75F1409EEA5ECD', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', 0x3232323232, '2020-11-22 19:28:00', 2, '没什么', 0, 1, 'CB00E872F2CC479B9C498938DB1259DA', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', 0x3938373635, '2020-11-22 19:28:00', 2, '没什么', 0, 1, 'BB39E021C58C4A7BBD597A1040F46536', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', 0x3434343434, '2020-11-12 19:28:00', 2, '没什么', 0, 1, 'CE73903424C911EB9515000C29B64374', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('E4DD4C45EED84870ABA83574A801083E', 0x3131313131, '2020-11-16 19:28:00', 2, '没什么', 0, 1, 'BB39E021C58C4A7BBD597A1040F46536', 'E61D65F673D54F68B0861025C69773DB');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '无意义，主键uuid',
  `permissionName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '资源路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'user findAll', '/user/findAll.do');
INSERT INTO `permission` VALUES ('2', 'user findById', '/user/findById.do');
INSERT INTO `permission` VALUES ('B57E863D90744FD5BAA8E1DCFA3F1802', 'role findAll', '/role/findAll.do');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '无意义，主键uuid',
  `productNum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品编号，唯一，不为空',
  `productName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品名称（路线名称）',
  `cityName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出发城市',
  `departureTime` datetime(0) NULL DEFAULT NULL COMMENT '出发时间',
  `productPrice` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品价格',
  `productDesc` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品描述',
  `productStatus` tinyint(4) NULL DEFAULT NULL COMMENT '状态（0 关闭，1开启）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('0D421BEB24CA11EB9515000C29B64374', 'itcast-003', '上海五日游', '上海', '2020-11-08 07:15:15', 1800.00, '魔都我来了', 0);
INSERT INTO `product` VALUES ('0D42B42124CA11EB9515000C29B64374', 'itcast-001', '北京三日游', '北京', '2020-11-11 15:23:50', 1200.00, '不错的旅行', 1);
INSERT INTO `product` VALUES ('92A5F0B48D81482DAE8776395217FDC2', 'itcast-007', '韩国三日游', '北京', '2020-11-16 20:00:00', 5999.00, '韩国思密达', 1);
INSERT INTO `product` VALUES ('AEF3E5ABFAC24B4B8E75F1409EEA5ECD', 'itcast-004', '上海二日游', '上海', '2020-11-14 14:55:00', 999.00, '上海不错', 1);
INSERT INTO `product` VALUES ('BB39E021C58C4A7BBD597A1040F46536', 'itcast-005', '上海三日游', '上海', '2020-11-27 09:00:00', 1099.00, '你喜欢上海吗', 1);
INSERT INTO `product` VALUES ('CB00E872F2CC479B9C498938DB1259DA', 'itcast-006', '东京三日游', '北京', '2020-11-20 15:00:00', 3699.00, '东京不热吗', 0);
INSERT INTO `product` VALUES ('CE73903424C911EB9515000C29B64374', 'itcast-002', '北京三日游', '北京', '2020-11-11 10:10:10', 1200.00, '不错的旅行', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '无意义，主键uuid',
  `roleName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名',
  `roleDesc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1F90D8C72F6A4AE2B70FD6E2158C530E', 'guest', '测试角色');
INSERT INTO `role` VALUES ('2222', 'USER', 'vip');
INSERT INTO `role` VALUES ('67DE4997B8C345FD8F5E9751F2B7C995', 'ADMIN', '管理员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `permissionId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `roleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`permissionId`, `roleId`) USING BTREE,
  INDEX `fk_role_permission-roleId`(`roleId`) USING BTREE,
  CONSTRAINT `fk_role_permission-permissionId` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role_permission-roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色与权限关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1F90D8C72F6A4AE2B70FD6E2158C530E');
INSERT INTO `role_permission` VALUES ('2', '1F90D8C72F6A4AE2B70FD6E2158C530E');
INSERT INTO `role_permission` VALUES ('B57E863D90744FD5BAA8E1DCFA3F1802', '1F90D8C72F6A4AE2B70FD6E2158C530E');
INSERT INTO `role_permission` VALUES ('2', '2222');
INSERT INTO `role_permission` VALUES ('1', '67DE4997B8C345FD8F5E9751F2B7C995');
INSERT INTO `role_permission` VALUES ('2', '67DE4997B8C345FD8F5E9751F2B7C995');
INSERT INTO `role_permission` VALUES ('B57E863D90744FD5BAA8E1DCFA3F1802', '67DE4997B8C345FD8F5E9751F2B7C995');

-- ----------------------------
-- Table structure for sysLog
-- ----------------------------
DROP TABLE IF EXISTS `sysLog`;
CREATE TABLE `sysLog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增长',
  `visitTime` datetime(3) NULL DEFAULT NULL COMMENT '访问时间',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问url',
  `executionTime` int(11) NULL DEFAULT NULL COMMENT '执行时间',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问方法',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日志记录类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysLog
-- ----------------------------
INSERT INTO `sysLog` VALUES (1, '2020-11-21 21:28:49.000', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 11, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2, '2020-11-21 21:29:54.000', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 32, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3, '2020-11-21 21:33:23.000', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (4, '2020-11-21 21:35:07.000', 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 19, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (5, '2020-11-21 21:35:41.000', 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 12, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (6, '2020-11-21 21:35:42.000', 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 9, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (7, '2020-11-21 22:05:33.000', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 323, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (8, '2020-11-21 22:13:46.784', 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 37, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (9, '2020-11-21 22:16:47.778', 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 19, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (10, '2020-11-21 22:16:56.373', 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 22, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (11, '2020-11-21 22:17:02.067', 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 25, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (12, '2020-11-21 22:17:10.190', 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 13, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (13, '2020-11-21 22:21:02.803', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 139, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (14, '2020-11-21 22:21:11.807', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 33, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (15, '2020-11-21 22:23:04.358', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 249, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (16, '2020-11-21 22:23:27.195', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 55, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (17, '2020-11-21 22:34:40.778', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 152, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (18, '2020-11-21 22:53:17.112', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 34, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (19, '2020-11-21 22:53:33.870', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 34, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (20, '2020-11-21 22:53:37.347', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 21, '[类名] com.zjw.controller.PermissionController[方法名] findAll');
INSERT INTO `sysLog` VALUES (21, '2020-11-21 22:53:59.564', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', 53, '[类名] com.zjw.controller.ProductController[方法名] findAll');
INSERT INTO `sysLog` VALUES (22, '2020-11-21 22:54:25.946', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 48, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (23, '2020-11-21 22:54:39.276', 'tom', '0:0:0:0:0:0:0:1', '/ordersfindById.do', 48, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (24, '2020-11-21 22:54:50.344', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 31, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (25, '2020-11-21 22:57:18.717', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', 22, '[类名] com.zjw.controller.ProductController[方法名] findAll');
INSERT INTO `sysLog` VALUES (26, '2020-11-21 22:57:26.318', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 31, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (27, '2020-11-21 23:01:54.965', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', 18, '[类名] com.zjw.controller.ProductController[方法名] findAll');
INSERT INTO `sysLog` VALUES (28, '2020-11-21 23:02:52.479', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', 26, '[类名] com.zjw.controller.ProductController[方法名] findAll');
INSERT INTO `sysLog` VALUES (29, '2020-11-21 23:02:56.141', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 28, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (30, '2020-11-21 23:05:45.466', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 9, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (31, '2020-11-21 23:05:47.790', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 11, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (32, '2020-11-21 23:05:49.819', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 3, '[类名] com.zjw.controller.PermissionController[方法名] findAll');
INSERT INTO `sysLog` VALUES (33, '2020-11-21 23:05:55.538', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', 21, '[类名] com.zjw.controller.ProductController[方法名] findAll');
INSERT INTO `sysLog` VALUES (34, '2020-11-21 23:05:57.391', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 27, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (35, '2020-11-21 23:06:17.387', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 29, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (36, '2020-11-21 23:08:37.284', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (37, '2020-11-21 23:08:39.303', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 8, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (38, '2020-11-21 23:08:41.120', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 6, '[类名] com.zjw.controller.PermissionController[方法名] findAll');
INSERT INTO `sysLog` VALUES (39, '2020-11-21 23:08:43.312', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 5, '[类名] com.zjw.controller.PermissionController[方法名] findAll');
INSERT INTO `sysLog` VALUES (40, '2020-11-21 23:12:39.074', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 10, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (41, '2020-11-21 23:12:48.001', 'tom', '0:0:0:0:0:0:0:1', '/user/findById.do', 21, '[类名] com.zjw.controller.UserController[方法名] findById');
INSERT INTO `sysLog` VALUES (42, '2020-11-21 23:12:58.974', 'tom', '0:0:0:0:0:0:0:1', '/user/findById.do', 12, '[类名] com.zjw.controller.UserController[方法名] findById');
INSERT INTO `sysLog` VALUES (43, '2020-11-21 23:13:09.011', 'tom', '0:0:0:0:0:0:0:1', '/user/findById.do', 12, '[类名] com.zjw.controller.UserController[方法名] findById');
INSERT INTO `sysLog` VALUES (44, '2020-11-21 23:13:15.933', 'tom', '0:0:0:0:0:0:0:1', '/user/findById.do', 14, '[类名] com.zjw.controller.UserController[方法名] findById');
INSERT INTO `sysLog` VALUES (45, '2020-11-21 23:13:18.324', 'tom', '0:0:0:0:0:0:0:1', '/user/findById.do', 9, '[类名] com.zjw.controller.UserController[方法名] findById');
INSERT INTO `sysLog` VALUES (46, '2020-11-22 01:29:32.216', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 18, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (47, '2020-11-22 01:29:34.246', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 9, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (48, '2020-11-22 01:29:36.144', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 4, '[类名] com.zjw.controller.PermissionController[方法名] findAll');
INSERT INTO `sysLog` VALUES (49, '2020-11-22 01:29:38.236', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 3, '[类名] com.zjw.controller.PermissionController[方法名] findAll');
INSERT INTO `sysLog` VALUES (50, '2020-11-22 01:29:44.119', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', 16, '[类名] com.zjw.controller.ProductController[方法名] findAll');
INSERT INTO `sysLog` VALUES (51, '2020-11-22 01:29:46.310', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 24, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (52, '2020-11-22 01:31:46.282', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (53, '2020-11-22 01:31:48.123', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 9, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (54, '2020-11-22 01:32:05.395', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', 19, '[类名] com.zjw.controller.ProductController[方法名] findAll');
INSERT INTO `sysLog` VALUES (55, '2020-11-22 01:32:11.692', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (56, '2020-11-22 01:32:14.127', 'tom', '0:0:0:0:0:0:0:1', '/user/findById.do', 15, '[类名] com.zjw.controller.UserController[方法名] findById');
INSERT INTO `sysLog` VALUES (57, '2020-11-22 01:32:20.468', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (58, '2020-11-22 01:32:36.685', 'tom', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 23, '[类名] com.zjw.controller.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `sysLog` VALUES (59, '2020-11-22 01:32:40.074', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (60, '2020-11-22 01:32:41.580', 'tom', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 20, '[类名] com.zjw.controller.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `sysLog` VALUES (61, '2020-11-22 01:32:43.382', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 29, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (62, '2020-11-22 01:32:44.992', 'tom', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 32, '[类名] com.zjw.controller.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `sysLog` VALUES (63, '2020-11-22 01:32:47.600', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (64, '2020-11-22 01:32:51.891', 'tom', '0:0:0:0:0:0:0:1', '/user/findById.do', 20, '[类名] com.zjw.controller.UserController[方法名] findById');
INSERT INTO `sysLog` VALUES (65, '2020-11-22 01:33:10.155', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (66, '2020-11-22 01:33:19.039', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (67, '2020-11-22 01:33:20.750', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 9, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (68, '2020-11-22 01:33:24.252', 'tom', '0:0:0:0:0:0:0:1', '/role/findById.do', 10, '[类名] com.zjw.controller.RoleController[方法名] findById');
INSERT INTO `sysLog` VALUES (69, '2020-11-22 01:33:30.209', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (70, '2020-11-22 01:33:32.369', 'tom', '0:0:0:0:0:0:0:1', '/role/deleteRole.do', 14, '[类名] com.zjw.controller.RoleController[方法名] deleteRole');
INSERT INTO `sysLog` VALUES (71, '2020-11-22 01:33:32.443', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 8, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (72, '2020-11-22 01:34:07.136', 'tom', '0:0:0:0:0:0:0:1', '/role/saveRole.do', 11, '[类名] com.zjw.controller.RoleController[方法名] saveRole');
INSERT INTO `sysLog` VALUES (73, '2020-11-22 01:34:07.185', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (74, '2020-11-22 01:34:13.864', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (75, '2020-11-22 01:34:17.245', 'tom', '0:0:0:0:0:0:0:1', '/user/findById.do', 15, '[类名] com.zjw.controller.UserController[方法名] findById');
INSERT INTO `sysLog` VALUES (76, '2020-11-22 01:34:20.763', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (77, '2020-11-22 01:34:21.809', 'tom', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 24, '[类名] com.zjw.controller.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `sysLog` VALUES (78, '2020-11-22 01:34:24.668', 'tom', '0:0:0:0:0:0:0:1', '/user/addRoleToUser.do', 15, '[类名] com.zjw.controller.UserController[方法名] addRoleToUser');
INSERT INTO `sysLog` VALUES (79, '2020-11-22 01:34:24.707', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (80, '2020-11-22 01:34:27.771', 'tom', '0:0:0:0:0:0:0:1', '/user/findById.do', 19, '[类名] com.zjw.controller.UserController[方法名] findById');
INSERT INTO `sysLog` VALUES (81, '2020-11-22 01:34:36.800', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (82, '2020-11-22 01:34:40.043', 'tom', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission.do', 20, '[类名] com.zjw.controller.RoleController[方法名] findRoleByIdAndAllPermission');
INSERT INTO `sysLog` VALUES (83, '2020-11-22 01:34:42.988', 'tom', '0:0:0:0:0:0:0:1', '/role/addPermissionToRole.do', 22, '[类名] com.zjw.controller.RoleController[方法名] addPermissionToRole');
INSERT INTO `sysLog` VALUES (84, '2020-11-22 01:34:43.027', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (85, '2020-11-22 01:34:47.127', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (86, '2020-11-22 01:34:48.949', 'tom', '0:0:0:0:0:0:0:1', '/user/findById.do', 20, '[类名] com.zjw.controller.UserController[方法名] findById');
INSERT INTO `sysLog` VALUES (87, '2020-11-22 01:35:19.505', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (88, '2020-11-22 01:35:29.160', 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (89, '2020-11-22 01:35:32.918', 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 10, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (90, '2020-11-22 01:35:34.741', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 22, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (91, '2020-11-22 01:35:38.661', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 20, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (92, '2020-11-22 01:35:40.040', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 13, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (93, '2020-11-22 01:35:42.121', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 21, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (94, '2020-11-22 01:35:43.601', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 20, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (95, '2020-11-22 01:35:44.648', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 18, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (96, '2020-11-22 01:35:45.511', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 20, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (97, '2020-11-22 01:35:49.883', 'jack', '0:0:0:0:0:0:0:1', '/ordersfindById.do', 13, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (98, '2020-11-22 01:36:00.445', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 19, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (99, '2020-11-22 01:36:07.250', 'jack', '0:0:0:0:0:0:0:1', '/ordersfindById.do', 19, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (100, '2020-11-22 01:36:09.845', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 23, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (101, '2020-11-22 01:36:12.613', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 22, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (102, '2020-11-22 01:39:25.236', 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (103, '2020-11-22 01:39:30.458', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 23, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (104, '2020-11-22 01:39:43.492', 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (105, '2020-11-22 01:39:45.911', 'jack', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 3, '[类名] com.zjw.controller.PermissionController[方法名] findAll');
INSERT INTO `sysLog` VALUES (106, '2020-11-22 02:02:45.835', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 26, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (107, '2020-11-22 02:02:54.324', 'tom', '0:0:0:0:0:0:0:1', '/role/findById.do', 12, '[类名] com.zjw.controller.RoleController[方法名] findById');
INSERT INTO `sysLog` VALUES (108, '2020-11-22 02:02:59.604', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 8, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (109, '2020-11-22 02:03:02.601', 'tom', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission.do', 32, '[类名] com.zjw.controller.RoleController[方法名] findRoleByIdAndAllPermission');
INSERT INTO `sysLog` VALUES (110, '2020-11-22 02:03:06.258', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 11, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (111, '2020-11-22 02:04:05.980', 'jack', '0:0:0:0:0:0:0:1', '/role/findAll.do', 11, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (112, '2020-11-22 02:04:22.902', 'jack', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission.do', 20, '[类名] com.zjw.controller.RoleController[方法名] findRoleByIdAndAllPermission');
INSERT INTO `sysLog` VALUES (113, '2020-11-22 02:04:30.694', 'jack', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission.do', 30, '[类名] com.zjw.controller.RoleController[方法名] findRoleByIdAndAllPermission');
INSERT INTO `sysLog` VALUES (114, '2020-11-22 02:04:33.007', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 51, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (115, '2020-11-22 02:04:38.914', 'jack', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 22, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (116, '2020-11-22 02:05:11.341', 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 33, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (117, '2020-11-22 02:05:18.494', 'jack', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 22, '[类名] com.zjw.controller.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `sysLog` VALUES (118, '2020-11-22 02:05:22.540', 'jack', '0:0:0:0:0:0:0:1', '/user/addRoleToUser.do', 24, '[类名] com.zjw.controller.UserController[方法名] addRoleToUser');
INSERT INTO `sysLog` VALUES (119, '2020-11-22 02:05:22.628', 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 11, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (120, '2020-11-22 02:05:26.561', 'jack', '0:0:0:0:0:0:0:1', '/user/findById.do', 20, '[类名] com.zjw.controller.UserController[方法名] findById');
INSERT INTO `sysLog` VALUES (121, '2020-11-22 02:05:31.671', 'jack', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (122, '2020-11-22 02:05:39.829', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 12, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (123, '2020-11-22 02:05:49.147', 'tom', '0:0:0:0:0:0:0:1', '/user/findById.do', 20, '[类名] com.zjw.controller.UserController[方法名] findById');
INSERT INTO `sysLog` VALUES (124, '2020-11-22 02:05:53.949', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (125, '2020-11-22 02:07:05.978', 'tom', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 30, '[类名] com.zjw.controller.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `sysLog` VALUES (126, '2020-11-22 02:07:07.547', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] com.zjw.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (127, '2020-11-22 02:07:09.177', 'tom', '0:0:0:0:0:0:0:1', '/user/findById.do', 21, '[类名] com.zjw.controller.UserController[方法名] findById');
INSERT INTO `sysLog` VALUES (128, '2020-11-22 02:07:40.332', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 9, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (129, '2020-11-22 02:07:48.165', 'tom', '0:0:0:0:0:0:0:1', '/role/findById.do', 9, '[类名] com.zjw.controller.RoleController[方法名] findById');
INSERT INTO `sysLog` VALUES (130, '2020-11-22 02:07:50.417', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 9, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (131, '2020-11-22 02:07:57.252', 'tom', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission.do', 19, '[类名] com.zjw.controller.RoleController[方法名] findRoleByIdAndAllPermission');
INSERT INTO `sysLog` VALUES (132, '2020-11-22 02:08:00.356', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 8, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (133, '2020-11-22 02:08:01.665', 'tom', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission.do', 18, '[类名] com.zjw.controller.RoleController[方法名] findRoleByIdAndAllPermission');
INSERT INTO `sysLog` VALUES (134, '2020-11-22 02:08:04.004', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 8, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (135, '2020-11-22 02:08:08.547', 'tom', '0:0:0:0:0:0:0:1', '/role/findById.do', 9, '[类名] com.zjw.controller.RoleController[方法名] findById');
INSERT INTO `sysLog` VALUES (136, '2020-11-22 02:09:00.685', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 8, '[类名] com.zjw.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (137, '2020-11-22 02:09:58.741', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 24, '[类名] com.zjw.controller.PermissionController[方法名] findAll');
INSERT INTO `sysLog` VALUES (138, '2020-11-22 02:10:05.940', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 2, '[类名] com.zjw.controller.PermissionController[方法名] findAll');
INSERT INTO `sysLog` VALUES (139, '2020-11-22 02:10:27.265', 'tom', '0:0:0:0:0:0:0:1', '/permission/findById', 8, '[类名] com.zjw.controller.PermissionController[方法名] findById');
INSERT INTO `sysLog` VALUES (140, '2020-11-22 02:10:30.963', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 3, '[类名] com.zjw.controller.PermissionController[方法名] findAll');
INSERT INTO `sysLog` VALUES (141, '2020-11-22 02:12:09.271', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', 36, '[类名] com.zjw.controller.ProductController[方法名] findAll');
INSERT INTO `sysLog` VALUES (142, '2020-11-22 02:13:28.289', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 57, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (143, '2020-11-22 02:13:38.630', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 32, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (144, '2020-11-22 02:13:48.471', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 25, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (145, '2020-11-22 02:13:59.395', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 26, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (146, '2020-11-22 02:14:01.057', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 14, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (147, '2020-11-22 02:14:04.014', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 21, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (148, '2020-11-22 02:14:05.705', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 24, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (149, '2020-11-22 02:14:15.902', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', 15, '[类名] com.zjw.controller.ProductController[方法名] findAll');
INSERT INTO `sysLog` VALUES (150, '2020-11-22 02:15:07.127', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 22, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (151, '2020-11-22 02:15:27.369', 'tom', '0:0:0:0:0:0:0:1', '/ordersfindById.do', 17, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (152, '2020-11-22 02:15:37.800', 'tom', '0:0:0:0:0:0:0:1', '/ordersfindById.do', 14, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (153, '2020-11-22 02:15:52.560', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 20, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');
INSERT INTO `sysLog` VALUES (154, '2020-11-22 02:15:53.631', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAllWithPage.do', 10, '[类名] com.zjw.controller.OrderController[方法名] findAllWithPage');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键，无意义',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `phoneNum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话号码',
  `credentialsType` tinyint(1) NULL DEFAULT NULL COMMENT '证件类型 0身份证 1护照 2军官证',
  `credentialsNum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '证件号码',
  `travellerType` tinyint(1) NULL DEFAULT NULL COMMENT '旅客类型（人群） 0成人 1儿童',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '旅客表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', 0, '123456789009876543', 0);
INSERT INTO `traveller` VALUES ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', 0, '987654321123456789', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '无意义，主键uuid',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '非空，唯一',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码（加密）',
  `phoneNum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态 0未开启 1开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('111-222', 'tom@qq.com', 'tom', '$2a$10$s6w9wKdHMgrD6EpC9QqZVefPouIFMjXbt0V.e2XEwCSd5UoC28YWS', '13333333333', 1);
INSERT INTO `users` VALUES ('111-333', 'jack@qq.com', 'jack', '$2a$10$s6w9wKdHMgrD6EpC9QqZVefPouIFMjXbt0V.e2XEwCSd5UoC28YWS', '15633333333', 1);
INSERT INTO `users` VALUES ('C8B610E3EB6347539308E246111A70B2', '1286630326@qq.com', 'root', '$2a$10$zdAVERudydU3nXXqACyObulfDUMF7r4TgeRbCkV1TNa0QL7Vjk.u.', '18438610557', 1);

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role`  (
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `roleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE,
  INDEX `fk_users_role-roleId`(`roleId`) USING BTREE,
  CONSTRAINT `fk_users_role-roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_users_role-userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('111-222', '1F90D8C72F6A4AE2B70FD6E2158C530E');
INSERT INTO `users_role` VALUES ('C8B610E3EB6347539308E246111A70B2', '1F90D8C72F6A4AE2B70FD6E2158C530E');
INSERT INTO `users_role` VALUES ('111-222', '2222');
INSERT INTO `users_role` VALUES ('111-333', '2222');
INSERT INTO `users_role` VALUES ('C8B610E3EB6347539308E246111A70B2', '2222');
INSERT INTO `users_role` VALUES ('111-222', '67DE4997B8C345FD8F5E9751F2B7C995');
INSERT INTO `users_role` VALUES ('C8B610E3EB6347539308E246111A70B2', '67DE4997B8C345FD8F5E9751F2B7C995');

SET FOREIGN_KEY_CHECKS = 1;
