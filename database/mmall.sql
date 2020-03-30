/*
 Navicat MySQL Data Transfer

 Source Server         : 192.168.2.12_3306
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : 192.168.2.12:3306
 Source Schema         : mmall

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 30/03/2020 17:52:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mmall_cart
-- ----------------------------
DROP TABLE IF EXISTS `mmall_cart`;
CREATE TABLE `mmall_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '数量',
  `checked` int(11) NULL DEFAULT NULL COMMENT '是否选择,1=已勾选,0=未勾选',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mmall_cart
-- ----------------------------
INSERT INTO `mmall_cart` VALUES (5, 22, 1, 1, 1, '2020-03-29 20:31:49', '2020-03-29 20:31:49');
INSERT INTO `mmall_cart` VALUES (6, 22, 10, 1, 1, '2020-03-29 20:33:45', '2020-03-29 20:33:45');

-- ----------------------------
-- Table structure for mmall_category
-- ----------------------------
DROP TABLE IF EXISTS `mmall_category`;
CREATE TABLE `mmall_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别Id',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父类别id当id=0时说明是根节点,一级类别',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '类别状态1-正常,2-已废弃',
  `sort_order` int(4) NULL DEFAULT NULL COMMENT '排序编号,同类展示顺序,数值相等则自然排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100031 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mmall_category
-- ----------------------------
INSERT INTO `mmall_category` VALUES (100002, 0, '音乐专辑', 1, NULL, '2020-03-25 16:46:21', '2020-03-25 16:46:21');
INSERT INTO `mmall_category` VALUES (100011, 100002, '怀旧', 1, NULL, '2020-03-25 16:53:18', '2020-03-25 16:53:18');
INSERT INTO `mmall_category` VALUES (100012, 100002, '流行', 1, NULL, '2020-03-25 16:53:27', '2020-03-25 16:53:27');
INSERT INTO `mmall_category` VALUES (100013, 100002, '古典', 1, NULL, '2020-03-25 16:53:35', '2020-03-25 16:53:35');
INSERT INTO `mmall_category` VALUES (100014, 100002, '动漫', 1, NULL, '2020-03-25 16:53:56', '2020-03-25 16:53:56');
INSERT INTO `mmall_category` VALUES (100015, 100002, '经典', 1, NULL, '2020-03-25 16:54:07', '2020-03-25 16:54:07');

-- ----------------------------
-- Table structure for mmall_order
-- ----------------------------
DROP TABLE IF EXISTS `mmall_order`;
CREATE TABLE `mmall_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` bigint(20) NULL DEFAULT NULL COMMENT '订单号',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `shipping_id` int(11) NULL DEFAULT NULL,
  `payment` decimal(20, 2) NULL DEFAULT NULL COMMENT '实际付款金额,单位是元,保留两位小数',
  `payment_type` int(4) NULL DEFAULT NULL COMMENT '支付类型,1-在线支付',
  `postage` int(10) NULL DEFAULT NULL COMMENT '运费,单位是元',
  `status` int(10) NULL DEFAULT NULL COMMENT '订单状态:0-已取消-10-未付款，20-已付款，40-已发货，50-交易成功，60-交易关闭',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime NULL DEFAULT NULL COMMENT '交易关闭时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_no_index`(`order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mmall_order
-- ----------------------------
INSERT INTO `mmall_order` VALUES (103, 1491753014256, 22, 25, 299.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-03-26 23:50:14', '2020-03-29 23:50:14');
INSERT INTO `mmall_order` VALUES (118, 1585411554588, 22, 25, 500.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-03-29 00:05:54', '2020-03-29 00:05:54');
INSERT INTO `mmall_order` VALUES (119, 1585415367391, 22, 25, 90.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-03-29 01:09:27', '2020-03-29 01:09:27');
INSERT INTO `mmall_order` VALUES (120, 1585415646146, 22, 25, 90.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-03-29 01:14:06', '2020-03-29 01:14:06');
INSERT INTO `mmall_order` VALUES (121, 1585415997954, 22, 25, 589.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-03-29 01:19:58', '2020-03-29 01:19:58');
INSERT INTO `mmall_order` VALUES (122, 1585417507265, 22, 25, 90.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-03-29 01:45:07', '2020-03-29 01:45:07');
INSERT INTO `mmall_order` VALUES (123, 1585417520194, 22, 25, 69.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-03-29 01:45:20', '2020-03-29 01:45:20');
INSERT INTO `mmall_order` VALUES (124, 1585417528643, 22, 25, 299.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-03-29 01:45:28', '2020-03-29 01:45:28');
INSERT INTO `mmall_order` VALUES (125, 1585417558280, 22, 25, 487.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-03-29 01:45:58', '2020-03-29 01:45:58');
INSERT INTO `mmall_order` VALUES (126, 1585417579436, 22, 25, 100.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-03-29 01:46:19', '2020-03-29 01:46:19');
INSERT INTO `mmall_order` VALUES (127, 1585417586383, 22, 25, 119.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-03-29 01:46:26', '2020-03-29 01:46:26');
INSERT INTO `mmall_order` VALUES (128, 1585417592747, 22, 25, 99.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-03-29 01:46:32', '2020-03-29 01:46:32');
INSERT INTO `mmall_order` VALUES (129, 1585417600039, 22, 25, 199.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-03-29 01:46:39', '2020-03-29 01:46:39');
INSERT INTO `mmall_order` VALUES (130, 1585465636303, 22, 25, 6693.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-03-29 15:07:16', '2020-03-29 15:07:16');
INSERT INTO `mmall_order` VALUES (132, 1585484729616, 22, 25, 100.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-03-29 20:25:29', '2020-03-29 20:25:29');

-- ----------------------------
-- Table structure for mmall_order_item
-- ----------------------------
DROP TABLE IF EXISTS `mmall_order_item`;
CREATE TABLE `mmall_order_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单子表id',
  `user_id` int(11) NULL DEFAULT NULL,
  `order_no` bigint(20) NULL DEFAULT NULL,
  `product_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片地址',
  `current_unit_price` decimal(20, 2) NULL DEFAULT NULL COMMENT '生成订单时的商品单价，单位是元,保留两位小数',
  `quantity` int(10) NULL DEFAULT NULL COMMENT '商品数量',
  `total_price` decimal(20, 2) NULL DEFAULT NULL COMMENT '商品总价,单位是元,保留两位小数',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_no_index`(`order_no`) USING BTREE,
  INDEX `order_no_user_id_index`(`user_id`, `order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mmall_order_item
-- ----------------------------
INSERT INTO `mmall_order_item` VALUES (1, 22, 1491753014256, 9, '唯美音乐合集', 'product10.jpg', 299.00, 1, 299.00, '2020-03-26 23:50:14', '2020-03-29 23:50:14');
INSERT INTO `mmall_order_item` VALUES (135, 22, 1585411554588, 3, '伍佰音乐专辑', 'product03.jpg', 50.00, 10, 500.00, '2020-03-29 00:05:54', '2020-03-29 00:05:54');
INSERT INTO `mmall_order_item` VALUES (136, 22, 1585415367391, 2, '悟空传主题曲', 'product02.jpg', 90.00, 1, 90.00, '2020-03-29 01:09:27', '2020-03-29 01:09:27');
INSERT INTO `mmall_order_item` VALUES (137, 22, 1585415646146, 2, '悟空传主题曲', 'product02.jpg', 90.00, 1, 90.00, '2020-03-29 01:14:06', '2020-03-29 01:14:06');
INSERT INTO `mmall_order_item` VALUES (138, 22, 1585415997954, 2, '悟空传主题曲', 'product02.jpg', 90.00, 1, 90.00, '2020-03-29 01:19:58', '2020-03-29 01:19:58');
INSERT INTO `mmall_order_item` VALUES (139, 22, 1585415997954, 9, '唯美音乐合集', 'product10.jpg', 299.00, 1, 299.00, '2020-03-29 01:19:58', '2020-03-29 01:19:58');
INSERT INTO `mmall_order_item` VALUES (140, 22, 1585415997954, 1, '怀旧经典', 'product01.jpg', 100.00, 1, 100.00, '2020-03-29 01:19:58', '2020-03-29 01:19:58');
INSERT INTO `mmall_order_item` VALUES (141, 22, 1585415997954, 6, '自习室音乐合集', 'product07.jpg', 100.00, 1, 100.00, '2020-03-29 01:19:58', '2020-03-29 01:19:58');
INSERT INTO `mmall_order_item` VALUES (142, 22, 1585417507265, 2, '悟空传主题曲', 'product02.jpg', 90.00, 1, 90.00, '2020-03-29 01:45:07', '2020-03-29 01:45:07');
INSERT INTO `mmall_order_item` VALUES (143, 22, 1585417520194, 7, '龙猫音乐主题', 'product08.jpg', 69.00, 1, 69.00, '2020-03-29 01:45:20', '2020-03-29 01:45:20');
INSERT INTO `mmall_order_item` VALUES (144, 22, 1585417528643, 9, '唯美音乐合集', 'product10.jpg', 299.00, 1, 299.00, '2020-03-29 01:45:28', '2020-03-29 01:45:28');
INSERT INTO `mmall_order_item` VALUES (145, 22, 1585417558280, 6, '自习室音乐合集', 'product07.jpg', 100.00, 1, 100.00, '2020-03-29 01:45:58', '2020-03-29 01:45:58');
INSERT INTO `mmall_order_item` VALUES (146, 22, 1585417558280, 5, '莫扎特K448', 'product05.jpg', 199.00, 1, 199.00, '2020-03-29 01:45:58', '2020-03-29 01:45:58');
INSERT INTO `mmall_order_item` VALUES (147, 22, 1585417558280, 7, '龙猫音乐主题', 'product08.jpg', 69.00, 1, 69.00, '2020-03-29 01:45:58', '2020-03-29 01:45:58');
INSERT INTO `mmall_order_item` VALUES (148, 22, 1585417558280, 4, '毛不易专属', 'product04.jpg', 119.00, 1, 119.00, '2020-03-29 01:45:58', '2020-03-29 01:45:58');
INSERT INTO `mmall_order_item` VALUES (149, 22, 1585417579436, 1, '怀旧经典', 'product01.jpg', 100.00, 1, 100.00, '2020-03-29 01:46:19', '2020-03-29 01:46:19');
INSERT INTO `mmall_order_item` VALUES (150, 22, 1585417586383, 4, '毛不易专属', 'product04.jpg', 119.00, 1, 119.00, '2020-03-29 01:46:26', '2020-03-29 01:46:26');
INSERT INTO `mmall_order_item` VALUES (151, 22, 1585417592747, 8, '天空之城', 'product09.jpg', 99.00, 1, 99.00, '2020-03-29 01:46:32', '2020-03-29 01:46:32');
INSERT INTO `mmall_order_item` VALUES (152, 22, 1585417600039, 5, '莫扎特K448', 'product05.jpg', 199.00, 1, 199.00, '2020-03-29 01:46:39', '2020-03-29 01:46:39');
INSERT INTO `mmall_order_item` VALUES (153, 22, 1585465636303, 7, '龙猫音乐主题', 'product08.jpg', 69.00, 97, 6693.00, '2020-03-29 15:07:16', '2020-03-29 15:07:16');
INSERT INTO `mmall_order_item` VALUES (155, 22, 1585484729616, 1, '怀旧经典', 'product01.jpg', 100.00, 1, 100.00, '2020-03-29 20:25:29', '2020-03-29 20:25:29');

-- ----------------------------
-- Table structure for mmall_pay_info
-- ----------------------------
DROP TABLE IF EXISTS `mmall_pay_info`;
CREATE TABLE `mmall_pay_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `order_no` bigint(20) NULL DEFAULT NULL COMMENT '订单号',
  `pay_platform` int(10) NULL DEFAULT NULL COMMENT '支付平台:1-支付宝,2-微信',
  `platform_number` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝支付流水号',
  `platform_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝支付状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mmall_product
-- ----------------------------
DROP TABLE IF EXISTS `mmall_product`;
CREATE TABLE `mmall_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `category_id` int(11) NOT NULL COMMENT '分类id,对应mmall_category表的主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `subtitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品副标题',
  `main_image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品主图,url相对地址',
  `sub_images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片地址,json格式,扩展用',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情',
  `price` decimal(20, 2) NOT NULL COMMENT '价格,单位-元保留两位小数',
  `stock` int(11) NOT NULL COMMENT '库存数量',
  `status` int(6) NULL DEFAULT 1 COMMENT '商品状态.1-在售 2-下架 3-删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mmall_product
-- ----------------------------
INSERT INTO `mmall_product` VALUES (1, 100011, '怀旧经典', '百听不厌，藏在记忆深处的那些歌', 'product01.jpg', '539c2e27-d763-4bcb-973c-7c818eca2d27.jpg', '539c2e27-d763-4bcb-973c-7c818eca2d27.jpg', 100.00, 997, 1, NULL, '2020-03-30 11:16:13');
INSERT INTO `mmall_product` VALUES (2, 100015, '悟空传主题曲', '我命由我不由天', '277f85db-1373-4dc4-8f24-d8d0ea04734d.jpg', '277f85db-1373-4dc4-8f24-d8d0ea04734d.jpg', '277f85db-1373-4dc4-8f24-d8d0ea04734d.jpg', 90.00, 896, 1, NULL, '2020-03-30 16:36:28');
INSERT INTO `mmall_product` VALUES (3, 100011, '伍佰', '你懂的', '0047cca1-65dc-44fb-af37-39f5c3f409b6.jpg', '0047cca1-65dc-44fb-af37-39f5c3f409b6.jpg', '0047cca1-65dc-44fb-af37-39f5c3f409b6.jpg', 50.00, 500, 1, NULL, '2020-03-30 17:11:54');
INSERT INTO `mmall_product` VALUES (4, 100012, '毛不易专属', '三月天的一束和煦阳光', 'product04.jpg', '', '${pageContext.request.contextPath}/products/product04.jpg', 119.00, 188, 1, '2020-03-20 19:07:47', '2020-03-29 01:46:26');
INSERT INTO `mmall_product` VALUES (5, 100013, '莫扎特K448', '提高智商的神音乐', 'product05.jpg', NULL, '${pageContext.request.contextPath}/products/product05.jpg', 199.00, 997, 1, NULL, NULL);
INSERT INTO `mmall_product` VALUES (6, 100015, '自习室音乐合集', '轻扬的曲调陪着你成长', 'product07.jpg', NULL, '${pageContext.request.contextPath}/products/product07.jpg', 100.00, 98, 1, NULL, NULL);
INSERT INTO `mmall_product` VALUES (7, 100014, '龙猫音乐主题', '暖暖的', 'product08.jpg', NULL, '${pageContext.request.contextPath}/products/product08.jpg', 69.00, 0, 1, NULL, NULL);
INSERT INTO `mmall_product` VALUES (8, 100014, '天空之城', '勇气的守护', 'product09.jpg', NULL, '${pageContext.request.contextPath}/products/product09.jpg', 99.00, 198, 1, NULL, NULL);
INSERT INTO `mmall_product` VALUES (9, 100013, '唯美音乐合集', '距离产生美是对的么', 'product10.jpg', NULL, '${pageContext.request.contextPath}/products/product10.jpg', 299.00, 298, 1, NULL, NULL);
INSERT INTO `mmall_product` VALUES (10, 100013, '久石让', '纯净的世界', 'product11.jpg', NULL, '${pageContext.request.contextPath}/products/product11.jpg', 168.00, 300, 1, NULL, NULL);
INSERT INTO `mmall_product` VALUES (11, 100011, '高甜合集', '相思不过你', 'e04f76bf-9a73-4cab-9ede-f04c0f487748.jpg', 'e04f76bf-9a73-4cab-9ede-f04c0f487748.jpg', 'e04f76bf-9a73-4cab-9ede-f04c0f487748.jpg', 99.00, 1314, 1, '2020-03-30 17:40:02', '2020-03-30 17:40:02');

-- ----------------------------
-- Table structure for mmall_shipping
-- ----------------------------
DROP TABLE IF EXISTS `mmall_shipping`;
CREATE TABLE `mmall_shipping`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `receiver_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货姓名',
  `receiver_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货固定电话',
  `receiver_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货移动电话',
  `receiver_province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_district` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `receiver_zip` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mmall_shipping
-- ----------------------------
INSERT INTO `mmall_shipping` VALUES (25, 22, 'Rosen', '13800138000', '13800138000', '杭州', '杭州', NULL, '滨江区', '100000', '2020-03-20 12:11:01', '2020-03-26 12:11:01');

-- ----------------------------
-- Table structure for mmall_user
-- ----------------------------
DROP TABLE IF EXISTS `mmall_user`;
CREATE TABLE `mmall_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码，MD5加密',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '找回密码问题',
  `answer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '找回密码答案',
  `role` int(4) NOT NULL COMMENT '角色0-管理员,1-普通用户',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mmall_user
-- ----------------------------
INSERT INTO `mmall_user` VALUES (22, 'buyer', '8416B69FCB79952A7F0B6232B3312856', 'buyer@163.com', '61613', '问题', '答案', 0, '2020-03-20 18:14:29', '2020-03-20 18:14:29');
INSERT INTO `mmall_user` VALUES (26, 'seller', '324ED95E30E9E526675BD63D279E86FE', 'seller@163.com', '999999', '问题', '答案', 1, '2020-03-22 18:20:20', '2020-03-22 18:20:20');

SET FOREIGN_KEY_CHECKS = 1;
