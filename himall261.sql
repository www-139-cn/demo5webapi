/*
Navicat MySQL Data Transfer

Source Server         : tercel
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : himall262

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-09-04 23:13:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for himall_accountdetails
-- ----------------------------
DROP TABLE IF EXISTS `himall_accountdetails`;
CREATE TABLE `himall_accountdetails` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AccountId` bigint(20) NOT NULL COMMENT '结算记录外键',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ShopName` varchar(100) DEFAULT NULL,
  `Date` datetime NOT NULL COMMENT '完成日期',
  `OrderDate` datetime NOT NULL COMMENT '订单下单日期',
  `OrderFinshDate` datetime NOT NULL,
  `OrderType` int(11) NOT NULL COMMENT '枚举 完成订单1，退订单0',
  `OrderId` bigint(20) NOT NULL COMMENT '订单ID',
  `OrderAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `ProductActualPaidAmount` decimal(18,2) NOT NULL COMMENT '商品实付总额',
  `FreightAmount` decimal(18,2) NOT NULL COMMENT '运费金额',
  `CommissionAmount` decimal(18,2) NOT NULL COMMENT '佣金',
  `RefundTotalAmount` decimal(18,2) NOT NULL COMMENT '退款金额',
  `RefundCommisAmount` decimal(18,2) NOT NULL COMMENT '退还佣金',
  `OrderRefundsDates` varchar(300) NOT NULL COMMENT '退单的日期集合以;分隔',
  `BrokerageAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '分销佣金',
  `ReturnBrokerageAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '退分销佣金',
  `SettlementAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '结算金额',
  `PaymentTypeName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `himall_accountdetails_ibfk_1` (`AccountId`) USING BTREE,
  CONSTRAINT `himall_accountdetails_ibfk_1` FOREIGN KEY (`AccountId`) REFERENCES `himall_accounts` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=543 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_accountdetails
-- ----------------------------

-- ----------------------------
-- Table structure for himall_accountmeta
-- ----------------------------
DROP TABLE IF EXISTS `himall_accountmeta`;
CREATE TABLE `himall_accountmeta` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AccountId` bigint(20) NOT NULL,
  `MetaKey` varchar(100) NOT NULL,
  `MetaValue` text NOT NULL,
  `ServiceStartTime` datetime NOT NULL COMMENT '营销服务开始时间',
  `ServiceEndTime` datetime NOT NULL COMMENT '营销服务结束时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_accountmeta
-- ----------------------------

-- ----------------------------
-- Table structure for himall_accountpurchaseagreement
-- ----------------------------
DROP TABLE IF EXISTS `himall_accountpurchaseagreement`;
CREATE TABLE `himall_accountpurchaseagreement` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AccountId` bigint(20) DEFAULT NULL,
  `ShopId` bigint(20) NOT NULL,
  `Date` datetime NOT NULL COMMENT '日期',
  `PurchaseAgreementId` bigint(20) NOT NULL,
  `AdvancePayment` decimal(18,2) NOT NULL COMMENT '预付款金额',
  `FinishDate` datetime NOT NULL COMMENT '平台审核时间',
  `ApplyDate` datetime DEFAULT NULL COMMENT '申请',
  PRIMARY KEY (`Id`),
  KEY `AccountId` (`AccountId`) USING BTREE,
  CONSTRAINT `himall_accountpurchaseagreement_ibfk_1` FOREIGN KEY (`AccountId`) REFERENCES `himall_accounts` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_accountpurchaseagreement
-- ----------------------------

-- ----------------------------
-- Table structure for himall_accounts
-- ----------------------------
DROP TABLE IF EXISTS `himall_accounts`;
CREATE TABLE `himall_accounts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  `AccountDate` datetime NOT NULL COMMENT '出账日期',
  `StartDate` datetime NOT NULL COMMENT '开始时间',
  `EndDate` datetime NOT NULL COMMENT '结束时间',
  `Status` int(11) NOT NULL COMMENT '枚举 0未结账，1已结账',
  `ProductActualPaidAmount` decimal(18,2) NOT NULL COMMENT '商品实付总额',
  `FreightAmount` decimal(18,2) NOT NULL COMMENT '运费',
  `CommissionAmount` decimal(18,2) NOT NULL COMMENT '佣金',
  `RefundCommissionAmount` decimal(18,2) NOT NULL COMMENT '退还佣金',
  `RefundAmount` decimal(18,2) NOT NULL COMMENT '退款金额',
  `AdvancePaymentAmount` decimal(18,2) NOT NULL COMMENT '预付款总额',
  `PeriodSettlement` decimal(18,2) NOT NULL COMMENT '本期应结',
  `Remark` text,
  `Brokerage` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '分销佣金',
  `ReturnBrokerage` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '退还分销佣金',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_accounts
-- ----------------------------

-- ----------------------------
-- Table structure for himall_active
-- ----------------------------
DROP TABLE IF EXISTS `himall_active`;
CREATE TABLE `himall_active` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺编号',
  `ActiveName` varchar(200) NOT NULL COMMENT '活动名称',
  `StartTime` datetime NOT NULL COMMENT '开始时间',
  `EndTime` datetime NOT NULL COMMENT '结束时间',
  `IsAllProduct` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否全部商品',
  `IsAllStore` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否全部门店',
  `ActiveType` int(11) NOT NULL COMMENT '活动类型',
  `ActiveStatus` int(11) NOT NULL DEFAULT '0' COMMENT '活动状态',
  PRIMARY KEY (`Id`),
  KEY `IDX_Himall_Active_StartTime` (`StartTime`),
  KEY `IDX_Himall_Active_EndTime` (`EndTime`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='营销活动表';

-- ----------------------------
-- Records of himall_active
-- ----------------------------

-- ----------------------------
-- Table structure for himall_activemarketservice
-- ----------------------------
DROP TABLE IF EXISTS `himall_activemarketservice`;
CREATE TABLE `himall_activemarketservice` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `TypeId` int(11) NOT NULL COMMENT '营销服务类型ID',
  `ShopId` bigint(20) NOT NULL,
  `ShopName` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_activemarketservice
-- ----------------------------

-- ----------------------------
-- Table structure for himall_activeproducts
-- ----------------------------
DROP TABLE IF EXISTS `himall_activeproducts`;
CREATE TABLE `himall_activeproducts` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ActiveId` bigint(20) NOT NULL COMMENT '活动编号',
  `ProductId` bigint(20) NOT NULL COMMENT '产品编号 -1表示所有商品',
  PRIMARY KEY (`Id`),
  KEY `IDX_Himall_Accts_ActiveId` (`ActiveId`),
  KEY `IDX_Himall_Accts_ProdcutId` (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=621 DEFAULT CHARSET=utf8 COMMENT='营销活动商品';

-- ----------------------------
-- Records of himall_activeproducts
-- ----------------------------

-- ----------------------------
-- Table structure for himall_agentproducts
-- ----------------------------
DROP TABLE IF EXISTS `himall_agentproducts`;
CREATE TABLE `himall_agentproducts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ProductId` bigint(20) NOT NULL COMMENT '推销商品ID',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺Id',
  `UserId` bigint(20) NOT NULL COMMENT '用户名',
  `AddTime` datetime NOT NULL COMMENT '代理时间',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_AgentProducts_ProductId` (`ProductId`) USING BTREE,
  KEY `FK_Himall_AgentProducts_UserId` (`UserId`) USING BTREE,
  CONSTRAINT `FK_Himall_AgentProducts_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Himall_AgentProducts_UserId` FOREIGN KEY (`UserId`) REFERENCES `himall_members` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_agentproducts
-- ----------------------------

-- ----------------------------
-- Table structure for himall_agreement
-- ----------------------------
DROP TABLE IF EXISTS `himall_agreement`;
CREATE TABLE `himall_agreement` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AgreementType` int(4) NOT NULL COMMENT '协议类型 枚举 AgreementType：0买家注册协议，1卖家入驻协议',
  `AgreementContent` text NOT NULL COMMENT '协议内容',
  `LastUpdateTime` datetime DEFAULT NULL COMMENT '最后修改日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_agreement
-- ----------------------------
INSERT INTO `himall_agreement` VALUES ('1', '0', '<div><p><strong>【审慎阅读】</strong>您在申请注册流程中点击同意前，应当认真阅读以下协议。<strongstyle=\"text-decoration:underline\">请您务必审慎阅读、充分理解协议中相关条款内容，其中包括：</strong></p><p>1、<strongstyle=\"text-decoration:underline\">与您约定免除或限制责任的条款；</strong></p><p>2、<strongstyle=\"text-decoration:underline\">与您约定法律适用和管辖的条款；</strong></p><p>3、<strongstyle=\"text-decoration:underline\">其他以粗体下划线标识的重要条款。</strong></p><p>如您对协议有任何疑问，可向平台客服咨询。</p><p><strong>【特别提示】</strong>当您按照注册页面提示填写信息、阅读并同意协议且完成全部注册程序后，即表示您已充分阅读、理解并接受协议的全部内容。如您因平台服务与Himall发生争议的，适用《Himall平台服务协议》处理。如您在使用平台服务过程中与其他用户发生争议的，依您与其他用户达成的协议处理。</p><p><strongstyle=\"text-decoration:underline\">阅读协议的过程中，如果您不同意相关协议或其中任何条款约定，您应立即停止注册程序。</strong></p><p><a target=\"_blank\">《Himall服务协议》</a></p><p><a target=\"_blank\">《法律声明及隐私权政策》</a></p><p><a target=\"_blank\"></a></p><pstyle=\"text-align:center\"></p></div>', '2015-07-15 16:54:35');
INSERT INTO `himall_agreement` VALUES ('2', '1', '<div class=\"board_content\"><p>	为了更好地开拓市场，更好地为本地客户服务，甲乙双方本着互惠互利的双赢策略，根据乙方崇左商城入驻条件，甲方申请入驻乙方商城，并完全接受乙方的规范，经友好协商，甲乙双方签署以下入驻协议。</p><p>	<br>一、&nbsp;入驻商家基本条件<br>1、&nbsp;有良好的合作意愿，能提供优质的商品，保证合作的顺利进行，并保证提供良好的售后服务；<br>2、&nbsp;甲方必须满足以下条件之一（符合其中一项即可）：<br>⑴授权商，获得国际或者国内知名品牌厂商的授权；<br>⑵拥有自己注册商标的生产型厂商；<br>⑶专业品牌经销商，代理商，B2C网站；<br>⑷专业品牌专卖店。<br>3、&nbsp;甲方应在签订本协议时向乙方提供（经乙方认可的）包括但不限于以下证明材料复印件：<br>⑴营业执照 (包括个体户营业执照)、税务登记证；<br>⑵拥有注册商标或者品牌，或者拥有正规的品牌授权书。<br>4、&nbsp;甲方承诺：<br>⑴所有商品一口价销售（参与打折、促销、秒杀活动除外）；<br>⑵七天无损坏不影响二次销售情况下换货(如商品无质量问题，且包装未破坏不影响二次销售，换货费用由买家承担，每张订单只提供一次换货服务；如属商品质量问题，换货费用由商家承担)；<br>⑶实体店地址变更应及时告知乙方；<br>⑷参加乙方全网积分购物活动；<br>⑸所有商品保证原厂正品，保障商品质量、承诺售后服务，必要时能提供销售发票。</p><p>	<br>二、&nbsp;入驻商铺类型<br>1、&nbsp;展示型商铺；<br>2、&nbsp;销售型商铺。</p><p>	&nbsp;</p><p>	三、入驻商铺等级</p><p>	1、普通商铺</p><p>	2、扶持商铺；</p><p>	3、拓展商铺；</p><p>	4、旗舰商铺。</p><p>	<br>三、&nbsp;商铺入驻开通流程<br>1、&nbsp;甲乙双方签署本协议；<br>2、&nbsp;甲方根据所选择商铺类型，提交相应的证明材料复印件；<br>3、&nbsp;在乙方非常商城注册，获取管理员账号；<br>4、&nbsp;乙方审核通过后，甲方即可发布商品并展示经营活动。</p><p>	<br>四、&nbsp;双方权利义务<br>甲方权利义务：<br>1、&nbsp;在本协议第一条规定范围内，甲方自行开拓市场与发展业务，不得以欺诈、胁迫等不正当手段损害客户或甲方的利益与声誉；<br>2、&nbsp;甲方妥善保管商铺管理员账号，如因甲方保管、设置或使用不当造成的经济损失，由甲方自行承担责任；<br>3、&nbsp;甲方在使用过程中如发现任何非法盗用乙方账号出现安全漏洞等情况，应立即通知乙方<br>4、&nbsp;甲方保证其所有经营活动完全符合中国有关法律、法规、行政规章等的规定。如因甲方违反上述规定给乙方带来任何损害，甲方应承担所有法律责任并赔偿由此给甲方造成的损失；<br>5、&nbsp;在协议有效期内，甲方不得向与乙方构成商业竞争关系的企业、商业机构或者组织提供有关乙方相关信息或者资料，否则对乙方造成损失的，由甲方负责赔偿。<br>乙方权利义务：<br>1、&nbsp;乙方对甲方提供必要的开店技术咨询，并保证商城系统平台能正常稳定运行；<br>2、&nbsp;如甲方是托管商铺，乙方应及时为甲方进行店铺更新并实时进行日常管理；<br>3、&nbsp;在本协议有效期限内，乙方有权根据市场情况对各种商铺入驻条件进行调整。</p><p>	<br>五、&nbsp;协议期限<br>本协议有效期为一年，自签订之日起生效。有效期满后，双方可视合作情况续约。</p><p>	六、&nbsp;协议变更、终止及违约责任<br>1、&nbsp;甲乙双方应本着诚实信用的原则履行本协议。任何一方在履约过程中采用欺诈、胁迫或者暴力的手段，另一方均可以解除本协议并要求对方赔偿由此造成的损失；<br>2、&nbsp;在协议执行期间，如果双方或一方认为需要终止，应提前一个月通知对方，双方在财务结算完毕、各自责任明确履行之后，方可终止协议。某方擅自终止本协议，给对方造成损失的，应赔偿对方损失；<br>3、&nbsp;经双方协商达成一致，可以对本协议有关条款进行变更，但应当以书面形式确认；<br>4、&nbsp;一方变更通讯地址或其它联系方式，应自变更之日起十日内，将变更后的地址、联系方式通知另一方，否则变更方应对此造成的一切后果承担责任；<br>5、&nbsp;如因客观情况发生重大变化，致使本协议无继续法履行的，经甲乙双方协商同意，可以变更或者终止协议的履行。</p><p><br>七、&nbsp;保密条款<br>1、甲、乙双方所提供给对方的一切资料、技术和对项目的策划设计要严保密，并只能在合作双方公司的业务范围内使用；<br>2、甲、乙双方均应对在合作过程中所知悉的对的商业和技术秘密承担保密义务。保密条款不受本协议期限的限制。</p><p>	<br>八、&nbsp;争解决<br>在本协议执行期间如果双方发生争议，双方应友好协商解决。如果协商不成，双方同意提交崇左市仲裁委员会进行仲裁，接受其仲裁规则，并服从该仲裁裁决，仲裁费由败诉方承担。争议的解适用中华人民共和国法律、法规、条例和计算机行业惯例。</p></div>', '2015-07-15 16:54:35');

-- ----------------------------
-- Table structure for himall_appbasesafesetting
-- ----------------------------
DROP TABLE IF EXISTS `himall_appbasesafesetting`;
CREATE TABLE `himall_appbasesafesetting` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AppKey` varchar(50) NOT NULL,
  `AppSecret` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='app数据基础安全设置';

-- ----------------------------
-- Records of himall_appbasesafesetting
-- ----------------------------

-- ----------------------------
-- Table structure for himall_applywithdraw
-- ----------------------------
DROP TABLE IF EXISTS `himall_applywithdraw`;
CREATE TABLE `himall_applywithdraw` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MemId` bigint(20) NOT NULL COMMENT '会员ID',
  `NickName` varchar(50) DEFAULT NULL COMMENT '微信昵称',
  `OpenId` varchar(50) DEFAULT NULL COMMENT 'OpenId',
  `ApplyStatus` int(11) NOT NULL COMMENT '申请状态',
  `ApplyAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `ApplyTime` datetime NOT NULL COMMENT '申请时间',
  `ConfirmTime` datetime DEFAULT NULL COMMENT '处理时间',
  `PayTime` datetime DEFAULT NULL COMMENT '付款时间',
  `PayNo` varchar(50) DEFAULT NULL COMMENT '付款流水号',
  `OpUser` varchar(50) DEFAULT NULL COMMENT '操作人',
  `Remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_applywithdraw
-- ----------------------------

-- ----------------------------
-- Table structure for himall_appmessages
-- ----------------------------
DROP TABLE IF EXISTS `himall_appmessages`;
CREATE TABLE `himall_appmessages` (
  `Id` int(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `ShopBranchId` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `TypeId` int(20) NOT NULL COMMENT '消息类型，对应枚举(1=订单，2=售后)',
  `SourceId` bigint(20) NOT NULL COMMENT '数据来源编号，对应订单ID或者售后ID',
  `Content` varchar(200) NOT NULL COMMENT '消息内容',
  `IsRead` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `sendtime` datetime NOT NULL,
  `Title` varchar(50) NOT NULL,
  `OrderPayDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=utf8 COMMENT='APP消息通知表';

-- ----------------------------
-- Records of himall_appmessages
-- ----------------------------
INSERT INTO `himall_appmessages` VALUES ('497', '347', '0', '1', '2017082972301068', '2017082972301068 等待您发货', '0', '2017-08-29 11:47:17', '您有新的订单', '2017-08-29 11:47:16');
INSERT INTO `himall_appmessages` VALUES ('498', '347', '0', '1', '2017082979383118', '2017082979383118 等待您发货', '0', '2017-08-29 11:48:34', '您有新的订单', '2017-08-29 11:48:33');

-- ----------------------------
-- Table structure for himall_articlecategories
-- ----------------------------
DROP TABLE IF EXISTS `himall_articlecategories`;
CREATE TABLE `himall_articlecategories` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ParentCategoryId` bigint(20) NOT NULL,
  `Name` varchar(100) DEFAULT NULL COMMENT '文章类型名称',
  `DisplaySequence` bigint(20) NOT NULL COMMENT '显示顺序',
  `IsDefault` tinyint(1) NOT NULL COMMENT '是否为默认',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_articlecategories
-- ----------------------------
INSERT INTO `himall_articlecategories` VALUES ('1', '0', '首页服务', '1', '1');
INSERT INTO `himall_articlecategories` VALUES ('2', '0', '系统快报', '2', '1');
INSERT INTO `himall_articlecategories` VALUES ('3', '0', '资讯中心', '3', '1');
INSERT INTO `himall_articlecategories` VALUES ('4', '0', '平台公告', '4', '1');
INSERT INTO `himall_articlecategories` VALUES ('9', '1', '购物指南', '1', '0');
INSERT INTO `himall_articlecategories` VALUES ('10', '1', '店主之家', '1', '0');
INSERT INTO `himall_articlecategories` VALUES ('11', '1', '支付方式', '1', '0');
INSERT INTO `himall_articlecategories` VALUES ('12', '1', '售后服务', '1', '0');
INSERT INTO `himall_articlecategories` VALUES ('13', '1', '关于我们', '1', '0');
INSERT INTO `himall_articlecategories` VALUES ('14', '0', '保障服务', '1', '1');
INSERT INTO `himall_articlecategories` VALUES ('15', '14', '七天无理由', '1', '1');
INSERT INTO `himall_articlecategories` VALUES ('16', '14', '消费者保障', '1', '1');
INSERT INTO `himall_articlecategories` VALUES ('17', '14', '及时发货服', '1', '1');

-- ----------------------------
-- Table structure for himall_articles
-- ----------------------------
DROP TABLE IF EXISTS `himall_articles`;
CREATE TABLE `himall_articles` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CategoryId` bigint(20) NOT NULL DEFAULT '0' COMMENT '文章分类ID',
  `Title` varchar(100) NOT NULL COMMENT '文章标题',
  `IconUrl` varchar(100) DEFAULT NULL,
  `Content` mediumtext NOT NULL COMMENT '文档内容',
  `AddDate` datetime NOT NULL,
  `DisplaySequence` bigint(20) NOT NULL,
  `Meta_Title` text COMMENT 'SEO标题',
  `Meta_Description` text COMMENT 'SEO说明',
  `Meta_Keywords` text COMMENT 'SEO关键字',
  `IsRelease` tinyint(1) NOT NULL COMMENT '是否显示',
  PRIMARY KEY (`Id`),
  KEY `FK_ArticleCategory_Article` (`CategoryId`) USING BTREE,
  CONSTRAINT `himall_articles_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `himall_articlecategories` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_articles
-- ----------------------------

-- ----------------------------
-- Table structure for himall_attributes
-- ----------------------------
DROP TABLE IF EXISTS `himall_attributes`;
CREATE TABLE `himall_attributes` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `TypeId` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL COMMENT '名称',
  `DisplaySequence` bigint(20) NOT NULL,
  `IsMust` tinyint(1) NOT NULL COMMENT '是否为必选',
  `IsMulti` tinyint(1) NOT NULL COMMENT '是否可多选',
  PRIMARY KEY (`Id`),
  KEY `FK_Type_Attribute` (`TypeId`) USING BTREE,
  CONSTRAINT `himall_attributes_ibfk_1` FOREIGN KEY (`TypeId`) REFERENCES `himall_types` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_attributes
-- ----------------------------
INSERT INTO `himall_attributes` VALUES ('199', '96', '适用类型', '0', '0', '0');
INSERT INTO `himall_attributes` VALUES ('200', '96', '药品类型', '0', '0', '0');
INSERT INTO `himall_attributes` VALUES ('201', '96', '适应人群', '0', '0', '0');
INSERT INTO `himall_attributes` VALUES ('202', '96', '剂型', '0', '0', '0');
INSERT INTO `himall_attributes` VALUES ('203', '102', '性别', '0', '0', '0');
INSERT INTO `himall_attributes` VALUES ('204', '102', '功效', '0', '0', '0');
INSERT INTO `himall_attributes` VALUES ('205', '104', '价格', '0', '0', '0');
INSERT INTO `himall_attributes` VALUES ('206', '104', '原产地', '0', '0', '0');
INSERT INTO `himall_attributes` VALUES ('207', '104', '分类', '0', '0', '0');
INSERT INTO `himall_attributes` VALUES ('208', '105', '屏幕尺寸', '0', '0', '0');
INSERT INTO `himall_attributes` VALUES ('209', '106', '女装', '0', '0', '0');
INSERT INTO `himall_attributes` VALUES ('210', '107', '坚果', '0', '0', '0');
INSERT INTO `himall_attributes` VALUES ('211', '107', '大小', '0', '0', '0');

-- ----------------------------
-- Table structure for himall_attributevalues
-- ----------------------------
DROP TABLE IF EXISTS `himall_attributevalues`;
CREATE TABLE `himall_attributevalues` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AttributeId` bigint(20) NOT NULL COMMENT '属性ID',
  `Value` varchar(100) NOT NULL COMMENT '属性值',
  `DisplaySequence` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Attribute_AttributeValue` (`AttributeId`) USING BTREE,
  CONSTRAINT `himall_attributevalues_ibfk_1` FOREIGN KEY (`AttributeId`) REFERENCES `himall_attributes` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=879 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_attributevalues
-- ----------------------------
INSERT INTO `himall_attributevalues` VALUES ('836', '199', '体虚感冒', '1');
INSERT INTO `himall_attributevalues` VALUES ('837', '199', '普通感冒', '1');
INSERT INTO `himall_attributevalues` VALUES ('838', '199', '风热感冒', '1');
INSERT INTO `himall_attributevalues` VALUES ('839', '200', '西药', '1');
INSERT INTO `himall_attributevalues` VALUES ('840', '200', '中药', '1');
INSERT INTO `himall_attributevalues` VALUES ('841', '201', '老人', '1');
INSERT INTO `himall_attributevalues` VALUES ('842', '201', '儿童', '1');
INSERT INTO `himall_attributevalues` VALUES ('843', '201', '承认', '1');
INSERT INTO `himall_attributevalues` VALUES ('844', '201', '不限', '1');
INSERT INTO `himall_attributevalues` VALUES ('845', '202', '颗粒', '1');
INSERT INTO `himall_attributevalues` VALUES ('846', '202', '片剂', '1');
INSERT INTO `himall_attributevalues` VALUES ('847', '202', '胶囊', '1');
INSERT INTO `himall_attributevalues` VALUES ('848', '202', '口服液', '1');
INSERT INTO `himall_attributevalues` VALUES ('849', '203', '男', '1');
INSERT INTO `himall_attributevalues` VALUES ('850', '203', '女', '1');
INSERT INTO `himall_attributevalues` VALUES ('851', '204', '补水', '1');
INSERT INTO `himall_attributevalues` VALUES ('852', '204', '保湿', '1');
INSERT INTO `himall_attributevalues` VALUES ('853', '205', '0-49', '1');
INSERT INTO `himall_attributevalues` VALUES ('854', '205', '50-99', '1');
INSERT INTO `himall_attributevalues` VALUES ('855', '205', '100-149', '1');
INSERT INTO `himall_attributevalues` VALUES ('856', '205', '150-199', '1');
INSERT INTO `himall_attributevalues` VALUES ('857', '206', '加拿大', '1');
INSERT INTO `himall_attributevalues` VALUES ('858', '206', '厄瓜多尔', '1');
INSERT INTO `himall_attributevalues` VALUES ('859', '206', '阿根廷', '1');
INSERT INTO `himall_attributevalues` VALUES ('860', '206', '中国大陆', '1');
INSERT INTO `himall_attributevalues` VALUES ('861', '206', '其它\r\n', '1');
INSERT INTO `himall_attributevalues` VALUES ('862', '207', '甜虾', '1');
INSERT INTO `himall_attributevalues` VALUES ('863', '207', '白虾', '1');
INSERT INTO `himall_attributevalues` VALUES ('864', '208', '12.5英寸', '1');
INSERT INTO `himall_attributevalues` VALUES ('865', '208', '13.3英寸', '1');
INSERT INTO `himall_attributevalues` VALUES ('866', '208', '15.6英寸', '1');
INSERT INTO `himall_attributevalues` VALUES ('867', '208', '其他', '1');
INSERT INTO `himall_attributevalues` VALUES ('868', '209', '衬衣', '1');
INSERT INTO `himall_attributevalues` VALUES ('869', '209', '裙子', '1');
INSERT INTO `himall_attributevalues` VALUES ('870', '209', '连衣裙', '1');
INSERT INTO `himall_attributevalues` VALUES ('871', '209', '外套', '1');
INSERT INTO `himall_attributevalues` VALUES ('872', '209', '大衣', '1');
INSERT INTO `himall_attributevalues` VALUES ('873', '210', '核桃', '1');
INSERT INTO `himall_attributevalues` VALUES ('874', '210', '松子', '1');
INSERT INTO `himall_attributevalues` VALUES ('875', '210', '碧根果', '1');
INSERT INTO `himall_attributevalues` VALUES ('876', '211', '1包装', '1');
INSERT INTO `himall_attributevalues` VALUES ('877', '211', '2包装', '1');
INSERT INTO `himall_attributevalues` VALUES ('878', '211', '5包装', '1');

-- ----------------------------
-- Table structure for himall_autoreply
-- ----------------------------
DROP TABLE IF EXISTS `himall_autoreply`;
CREATE TABLE `himall_autoreply` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RuleName` varchar(50) DEFAULT NULL COMMENT '规则名称',
  `Keyword` varchar(30) DEFAULT NULL COMMENT '关键词',
  `MatchType` int(11) DEFAULT NULL COMMENT '匹配方式(模糊，完全匹配)',
  `TextReply` varchar(100) DEFAULT NULL COMMENT '文字回复内容',
  `IsOpen` int(11) DEFAULT NULL COMMENT '是否开启',
  `ReplyType` int(11) DEFAULT NULL COMMENT '消息回复类型-(关注回复，关键词回复，消息自动回复)',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_autoreply
-- ----------------------------

-- ----------------------------
-- Table structure for himall_banners
-- ----------------------------
DROP TABLE IF EXISTS `himall_banners`;
CREATE TABLE `himall_banners` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL COMMENT '导航名称',
  `Position` int(11) NOT NULL COMMENT '导航显示位置',
  `DisplaySequence` bigint(20) NOT NULL,
  `Url` varchar(1000) NOT NULL COMMENT '跳转URL',
  `Platform` int(11) NOT NULL DEFAULT '0' COMMENT '显示在哪个终端',
  `UrlType` int(11) NOT NULL DEFAULT '0',
  `STATUS` int(11) NOT NULL DEFAULT '1' COMMENT '开启或者关闭',
  `EnableDelete` int(11) NOT NULL DEFAULT '1' COMMENT '能否删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_banners
-- ----------------------------
INSERT INTO `himall_banners` VALUES ('72', '0', '限时购', '0', '-3', '/LimitTimeBuy/home', '0', '0', '1', '0');
INSERT INTO `himall_banners` VALUES ('73', '0', '专题', '0', '-2', '/topic/list', '0', '0', '1', '0');
INSERT INTO `himall_banners` VALUES ('74', '0', '积分商城', '0', '-1', '/IntegralMall', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for himall_bonus
-- ----------------------------
DROP TABLE IF EXISTS `himall_bonus`;
CREATE TABLE `himall_bonus` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Type` int(11) NOT NULL COMMENT '类型，活动红包，关注送红包',
  `Style` int(11) NOT NULL COMMENT '样式，模板一（源生风格），模板二',
  `Name` varchar(100) DEFAULT NULL COMMENT '名称',
  `MerchantsName` varchar(50) DEFAULT NULL COMMENT '商户名称',
  `Remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `Blessing` varchar(100) DEFAULT NULL COMMENT '祝福语',
  `TotalPrice` decimal(18,2) NOT NULL COMMENT '总面额',
  `StartTime` datetime NOT NULL COMMENT '开始日期',
  `EndTime` datetime NOT NULL COMMENT '结束日期',
  `QRPath` varchar(100) DEFAULT NULL COMMENT '二维码',
  `PriceType` int(11) DEFAULT NULL COMMENT '是否固定金额',
  `FixedAmount` decimal(18,2) DEFAULT NULL COMMENT '固定金额',
  `RandomAmountStart` decimal(18,2) DEFAULT NULL COMMENT '随机金额起止范围',
  `RandomAmountEnd` decimal(18,2) DEFAULT NULL COMMENT '随机金额起止范围',
  `ReceiveCount` int(11) NOT NULL,
  `ImagePath` varchar(100) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `IsInvalid` tinyint(1) NOT NULL,
  `ReceivePrice` decimal(18,2) NOT NULL,
  `ReceiveHref` varchar(200) NOT NULL,
  `IsAttention` tinyint(1) NOT NULL,
  `IsGuideShare` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_bonus
-- ----------------------------

-- ----------------------------
-- Table structure for himall_bonusreceive
-- ----------------------------
DROP TABLE IF EXISTS `himall_bonusreceive`;
CREATE TABLE `himall_bonusreceive` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `BonusId` bigint(20) NOT NULL COMMENT '红包Id',
  `OpenId` varchar(100) DEFAULT NULL COMMENT '领取人微信Id',
  `ReceiveTime` datetime DEFAULT NULL COMMENT '领取日期',
  `Price` decimal(18,2) NOT NULL COMMENT '领取金额',
  `IsShare` tinyint(1) DEFAULT NULL,
  `IsTransformedDeposit` tinyint(1) NOT NULL COMMENT '红包金额是否已经转入了预存款',
  `UserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Reference_1` (`BonusId`) USING BTREE,
  KEY `FK_UserId` (`UserId`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`BonusId`) REFERENCES `himall_bonus` (`Id`),
  CONSTRAINT `FK_UserId` FOREIGN KEY (`UserId`) REFERENCES `himall_members` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6464 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_bonusreceive
-- ----------------------------

-- ----------------------------
-- Table structure for himall_brands
-- ----------------------------
DROP TABLE IF EXISTS `himall_brands`;
CREATE TABLE `himall_brands` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL COMMENT '品牌名称',
  `DisplaySequence` bigint(20) NOT NULL COMMENT '顺序',
  `Logo` varchar(1000) DEFAULT NULL COMMENT 'LOGO',
  `RewriteName` varchar(50) DEFAULT NULL COMMENT '未使用',
  `Description` varchar(1000) DEFAULT NULL COMMENT '说明',
  `Meta_Title` varchar(1000) DEFAULT NULL COMMENT 'SEO',
  `Meta_Description` varchar(1000) DEFAULT NULL,
  `Meta_Keywords` varchar(1000) DEFAULT NULL,
  `IsRecommend` tinyint(1) NOT NULL,
  `IsDeleted` bit(1) NOT NULL COMMENT '是否已删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_brands
-- ----------------------------
INSERT INTO `himall_brands` VALUES ('334', '群晖', '0', '/Storage/Plat/Brand/logo_334.jpeg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('335', 'NEW', '0', '/Storage/Plat/Brand/logo_335.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('336', '耐克', '0', '/Storage/Plat/Brand/logo_336.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('337', 'YONEX', '0', '/Storage/Plat/Brand/logo_337.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('338', 'sr', '0', '/Storage/Plat/Brand/logo_338.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('339', '养生堂', '0', '/Storage/Plat/Brand/logo_339.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('340', '良品铺子', '0', '/Storage/Plat/Brand/logo_340.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('341', '善存', '0', '/Storage/Plat/Brand/logo_341.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('342', '探路者', '0', '/Storage/Plat/Brand/logo_342.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('343', '匡威', '0', '/Storage/Plat/Brand/logo_343.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('344', '红蜻蜓', '0', '/Storage/Plat/Brand/logo_344.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('345', '百丽', '0', '/Storage/Plat/Brand/logo_345.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('346', '蓝月亮', '0', '/Storage/Plat/Brand/logo_346.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('347', '花王', '0', '/Storage/Plat/Brand/logo_347.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('348', '百雀羚', '0', '/Storage/Plat/Brand/logo_348.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('349', '威古力', '0', '/Storage/Plat/Brand/logo_349.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('350', '杰克琼斯', '0', '/Storage/Plat/Brand/logo_350.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('351', 'GXG', '0', '/Storage/Plat/Brand/logo_351.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('352', 'Aimer', '0', '/Storage/Plat/Brand/logo_352.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('353', '喜临门', '0', '/Storage/Plat/Brand/logo_353.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('354', '松下', '0', '/Storage/Plat/Brand/logo_354.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('355', '联想', '0', '/Storage/Plat/Brand/logo_355.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('356', '戴尔', '0', '/Storage/Plat/Brand/logo_356.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('357', 'Intel', '0', '/Storage/Plat/Brand/logo_357.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('358', '索尼', '0', '/Storage/Plat/Brand/logo_358.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('359', '魅族', '0', '/Storage/Plat/Brand/logo_359.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('360', '小米', '0', '/Storage/Plat/Brand/logo_360.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('361', '贝德玛', '0', '/Storage/Plat/Brand/logo_361.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('362', '飞利浦', '0', '/Storage/Plat/Brand/logo_362.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('363', '海尔', '0', '/Storage/Plat/Brand/logo_363.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('364', '美的', '0', '/Storage/Plat/Brand/logo_364.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('365', '欧莱雅', '0', '/Storage/Plat/Brand/logo_365.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('366', '大洋世家', '0', '/Storage/Plat/Brand/logo_366.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('367', '苹果', '0', '/Storage/Plat/Brand/logo_367.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('368', 'only', '0', '/Storage/Plat/Brand/logo_368.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('369', '卫龙', '0', '/Storage/Plat/Brand/logo_369.jpg', null, null, null, null, null, '0', '\0');
INSERT INTO `himall_brands` VALUES ('370', '三只松鼠', '0', '/Storage/Plat/Brand/logo_370.jpg', null, null, null, null, null, '0', '\0');

-- ----------------------------
-- Table structure for himall_brokerageincome
-- ----------------------------
DROP TABLE IF EXISTS `himall_brokerageincome`;
CREATE TABLE `himall_brokerageincome` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `OrderId` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `OrderItemId` bigint(20) DEFAULT NULL COMMENT '订单条目编号',
  `SkuID` varchar(100) NOT NULL COMMENT 'SKUID',
  `ProductID` bigint(20) NOT NULL COMMENT '产品ID',
  `ProductName` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `SkuInfo` varchar(100) DEFAULT NULL COMMENT 'SKU信息',
  `Brokerage` decimal(18,2) NOT NULL COMMENT '获得佣金',
  `TotalPrice` decimal(18,2) DEFAULT NULL COMMENT '分销比例',
  `ShopId` bigint(20) DEFAULT NULL COMMENT '店铺ID',
  `CreateTime` datetime DEFAULT NULL COMMENT '时间',
  `OrderTime` datetime NOT NULL COMMENT '订单创建时间',
  `BuyerUserId` bigint(20) NOT NULL COMMENT '消费者ID',
  `Status` int(11) NOT NULL COMMENT '结算状态 -1不可结算 未结算，已结算',
  `SettlementTime` datetime DEFAULT NULL COMMENT '结算时间',
  `UserId` bigint(20) NOT NULL COMMENT '推广会员ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_brokerageincome
-- ----------------------------

-- ----------------------------
-- Table structure for himall_brokeragerefund
-- ----------------------------
DROP TABLE IF EXISTS `himall_brokeragerefund`;
CREATE TABLE `himall_brokeragerefund` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `IncomeId` bigint(20) DEFAULT NULL COMMENT '收入表外键',
  `Brokerage` decimal(18,2) NOT NULL COMMENT '退还佣金',
  `RefundAmount` decimal(18,2) DEFAULT NULL COMMENT '退款金额',
  `RefundTime` datetime DEFAULT NULL COMMENT '退款时间',
  `RefundId` bigint(20) NOT NULL DEFAULT '0' COMMENT '退款Id',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_Brund_IncomeId` (`IncomeId`) USING BTREE,
  CONSTRAINT `FK_Himall_Brund_IncomeId` FOREIGN KEY (`IncomeId`) REFERENCES `himall_brokerageincome` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_brokeragerefund
-- ----------------------------

-- ----------------------------
-- Table structure for himall_browsinghistory
-- ----------------------------
DROP TABLE IF EXISTS `himall_browsinghistory`;
CREATE TABLE `himall_browsinghistory` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MemberId` bigint(20) NOT NULL COMMENT '会员ID',
  `ProductId` bigint(20) NOT NULL,
  `BrowseTime` datetime NOT NULL COMMENT '浏览时间',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_BrowsingHistory_Himall_BrowsingHistory` (`MemberId`) USING BTREE,
  KEY `FK_Himall_BrowsingHistory_Himall_Products` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_browsinghistory_ibfk_1` FOREIGN KEY (`MemberId`) REFERENCES `himall_members` (`Id`),
  CONSTRAINT `himall_browsinghistory_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2844 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_browsinghistory
-- ----------------------------
INSERT INTO `himall_browsinghistory` VALUES ('2834', '638', '1161', '2017-08-29 11:29:23');
INSERT INTO `himall_browsinghistory` VALUES ('2835', '638', '1163', '2017-08-29 11:00:36');
INSERT INTO `himall_browsinghistory` VALUES ('2836', '638', '1164', '2017-08-29 10:59:55');
INSERT INTO `himall_browsinghistory` VALUES ('2837', '638', '1165', '2017-08-29 11:00:05');
INSERT INTO `himall_browsinghistory` VALUES ('2838', '638', '1166', '2017-08-29 11:00:20');
INSERT INTO `himall_browsinghistory` VALUES ('2839', '638', '1170', '2017-08-29 11:24:48');
INSERT INTO `himall_browsinghistory` VALUES ('2840', '638', '1169', '2017-08-29 11:29:38');
INSERT INTO `himall_browsinghistory` VALUES ('2841', '638', '1171', '2017-08-29 11:29:12');
INSERT INTO `himall_browsinghistory` VALUES ('2842', '639', '1168', '2017-08-29 11:42:39');
INSERT INTO `himall_browsinghistory` VALUES ('2843', '639', '1171', '2017-08-29 11:48:40');

-- ----------------------------
-- Table structure for himall_businesscategories
-- ----------------------------
DROP TABLE IF EXISTS `himall_businesscategories`;
CREATE TABLE `himall_businesscategories` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `CategoryId` bigint(20) NOT NULL COMMENT '分类ID',
  `CommisRate` decimal(8,2) NOT NULL COMMENT '分佣比例',
  PRIMARY KEY (`Id`),
  KEY `FK_Category_BusinessCategory` (`CategoryId`) USING BTREE,
  CONSTRAINT `himall_businesscategories_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `himall_categories` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3425 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_businesscategories
-- ----------------------------
INSERT INTO `himall_businesscategories` VALUES ('3387', '347', '21', '1.00');
INSERT INTO `himall_businesscategories` VALUES ('3388', '347', '31', '3.00');
INSERT INTO `himall_businesscategories` VALUES ('3389', '347', '32', '2.00');
INSERT INTO `himall_businesscategories` VALUES ('3390', '347', '33', '3.00');
INSERT INTO `himall_businesscategories` VALUES ('3391', '347', '38', '2.00');
INSERT INTO `himall_businesscategories` VALUES ('3392', '347', '39', '2.00');
INSERT INTO `himall_businesscategories` VALUES ('3393', '347', '40', '4.00');
INSERT INTO `himall_businesscategories` VALUES ('3394', '347', '41', '1.00');
INSERT INTO `himall_businesscategories` VALUES ('3395', '347', '42', '3.00');
INSERT INTO `himall_businesscategories` VALUES ('3396', '347', '43', '5.00');
INSERT INTO `himall_businesscategories` VALUES ('3397', '347', '44', '5.00');
INSERT INTO `himall_businesscategories` VALUES ('3398', '347', '45', '5.00');
INSERT INTO `himall_businesscategories` VALUES ('3399', '347', '46', '2.00');
INSERT INTO `himall_businesscategories` VALUES ('3400', '347', '47', '2.00');
INSERT INTO `himall_businesscategories` VALUES ('3401', '347', '48', '5.00');
INSERT INTO `himall_businesscategories` VALUES ('3402', '347', '49', '7.00');
INSERT INTO `himall_businesscategories` VALUES ('3403', '347', '50', '3.00');
INSERT INTO `himall_businesscategories` VALUES ('3404', '347', '51', '3.00');
INSERT INTO `himall_businesscategories` VALUES ('3405', '347', '6', '2.00');
INSERT INTO `himall_businesscategories` VALUES ('3406', '347', '7', '1.00');
INSERT INTO `himall_businesscategories` VALUES ('3407', '347', '8', '2.00');
INSERT INTO `himall_businesscategories` VALUES ('3408', '347', '11', '1.00');
INSERT INTO `himall_businesscategories` VALUES ('3409', '347', '12', '1.00');
INSERT INTO `himall_businesscategories` VALUES ('3410', '347', '151', '4.00');
INSERT INTO `himall_businesscategories` VALUES ('3411', '347', '152', '3.00');
INSERT INTO `himall_businesscategories` VALUES ('3412', '347', '153', '4.00');
INSERT INTO `himall_businesscategories` VALUES ('3413', '347', '154', '3.00');
INSERT INTO `himall_businesscategories` VALUES ('3414', '347', '155', '3.00');
INSERT INTO `himall_businesscategories` VALUES ('3415', '347', '156', '4.00');
INSERT INTO `himall_businesscategories` VALUES ('3416', '347', '157', '3.00');
INSERT INTO `himall_businesscategories` VALUES ('3417', '347', '158', '3.00');
INSERT INTO `himall_businesscategories` VALUES ('3418', '347', '163', '2.00');
INSERT INTO `himall_businesscategories` VALUES ('3419', '347', '164', '2.00');
INSERT INTO `himall_businesscategories` VALUES ('3420', '347', '165', '1.00');
INSERT INTO `himall_businesscategories` VALUES ('3421', '347', '167', '1.00');
INSERT INTO `himall_businesscategories` VALUES ('3422', '347', '168', '1.00');
INSERT INTO `himall_businesscategories` VALUES ('3423', '347', '169', '1.00');
INSERT INTO `himall_businesscategories` VALUES ('3424', '347', '18', '2.00');

-- ----------------------------
-- Table structure for himall_businesscategoriesapply
-- ----------------------------
DROP TABLE IF EXISTS `himall_businesscategoriesapply`;
CREATE TABLE `himall_businesscategoriesapply` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ApplyDate` datetime NOT NULL COMMENT '申请日期',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  ` AuditedStatus` int(11) NOT NULL COMMENT '审核状态',
  `AuditedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_businesscategoriesapply
-- ----------------------------

-- ----------------------------
-- Table structure for himall_businesscategoriesapplydetail
-- ----------------------------
DROP TABLE IF EXISTS `himall_businesscategoriesapplydetail`;
CREATE TABLE `himall_businesscategoriesapplydetail` (
  `Id` bigint(11) NOT NULL AUTO_INCREMENT,
  `CommisRate` decimal(8,2) NOT NULL COMMENT '分佣比例',
  `CategoryId` bigint(20) NOT NULL COMMENT '类目ID',
  `ApplyId` bigint(20) NOT NULL COMMENT '申请Id',
  PRIMARY KEY (`Id`),
  KEY `FR_BussinessCateApply` (`ApplyId`),
  KEY `FR_BussinessCateApply_Cid` (`CategoryId`),
  CONSTRAINT `FR_BussinessCateApply` FOREIGN KEY (`ApplyId`) REFERENCES `himall_businesscategoriesapply` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FR_BussinessCateApply_Cid` FOREIGN KEY (`CategoryId`) REFERENCES `himall_categories` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_businesscategoriesapplydetail
-- ----------------------------

-- ----------------------------
-- Table structure for himall_capital
-- ----------------------------
DROP TABLE IF EXISTS `himall_capital`;
CREATE TABLE `himall_capital` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MemId` bigint(20) NOT NULL COMMENT '会员ID',
  `Balance` decimal(18,2) DEFAULT '0.00' COMMENT '可用余额',
  `FreezeAmount` decimal(18,2) DEFAULT '0.00' COMMENT '冻结资金',
  `ChargeAmount` decimal(18,2) DEFAULT '0.00' COMMENT '累计充值总金额',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_capital
-- ----------------------------

-- ----------------------------
-- Table structure for himall_capitaldetail
-- ----------------------------
DROP TABLE IF EXISTS `himall_capitaldetail`;
CREATE TABLE `himall_capitaldetail` (
  `Id` bigint(20) NOT NULL,
  `CapitalID` bigint(20) NOT NULL COMMENT '资产主表ID',
  `SourceType` int(11) NOT NULL COMMENT '资产类型',
  `Amount` decimal(18,2) NOT NULL COMMENT '金额',
  `SourceData` varchar(100) DEFAULT NULL COMMENT '来源数据',
  `CreateTime` datetime DEFAULT NULL COMMENT '交易时间',
  `Remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`),
  KEY `FK_Reference_Himall_CapitalDetail` (`CapitalID`) USING BTREE,
  CONSTRAINT `FK_Reference_Himall_CapitalDetail` FOREIGN KEY (`CapitalID`) REFERENCES `himall_capital` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_capitaldetail
-- ----------------------------

-- ----------------------------
-- Table structure for himall_cashdeposit
-- ----------------------------
DROP TABLE IF EXISTS `himall_cashdeposit`;
CREATE TABLE `himall_cashdeposit` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ShopId` bigint(20) NOT NULL COMMENT 'Shop表外键',
  `CurrentBalance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可用金额',
  `TotalBalance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已缴纳金额',
  `Date` datetime NOT NULL COMMENT '最后一次缴纳时间',
  `EnableLabels` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示标志，只有保证金欠费该字段才有用，默认显示',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_CashDeposit_Himall_Shops` (`ShopId`) USING BTREE,
  CONSTRAINT `himall_cashdeposit_ibfk_1` FOREIGN KEY (`ShopId`) REFERENCES `himall_shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_cashdeposit
-- ----------------------------

-- ----------------------------
-- Table structure for himall_cashdepositdetail
-- ----------------------------
DROP TABLE IF EXISTS `himall_cashdepositdetail`;
CREATE TABLE `himall_cashdepositdetail` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CashDepositId` bigint(20) NOT NULL DEFAULT '0',
  `AddDate` datetime NOT NULL,
  `Balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Operator` varchar(50) NOT NULL COMMENT '操作类型',
  `Description` varchar(1000) DEFAULT NULL COMMENT '说明',
  `RechargeWay` int(11) DEFAULT NULL COMMENT '充值类型（银联、支付宝之类的）',
  PRIMARY KEY (`Id`),
  KEY `KF_Himall_CashDeposit_Himall_CashDepositDetail` (`CashDepositId`) USING BTREE,
  CONSTRAINT `himall_cashdepositdetail_ibfk_1` FOREIGN KEY (`CashDepositId`) REFERENCES `himall_cashdeposit` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_cashdepositdetail
-- ----------------------------

-- ----------------------------
-- Table structure for himall_categories
-- ----------------------------
DROP TABLE IF EXISTS `himall_categories`;
CREATE TABLE `himall_categories` (
  `Id` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL COMMENT '分类名称',
  `Icon` varchar(1000) DEFAULT NULL COMMENT '分类图标',
  `DisplaySequence` bigint(20) NOT NULL,
  `ParentCategoryId` bigint(20) NOT NULL,
  `Depth` int(11) NOT NULL COMMENT '分类的深度',
  `Path` varchar(100) NOT NULL COMMENT '分类的路径（以|分离）',
  `RewriteName` varchar(50) DEFAULT NULL COMMENT '未使用',
  `HasChildren` tinyint(1) NOT NULL COMMENT '是否有子分类',
  `TypeId` bigint(20) NOT NULL DEFAULT '0',
  `CommisRate` decimal(8,2) NOT NULL COMMENT '分佣比例',
  `Meta_Title` varchar(1000) DEFAULT NULL,
  `Meta_Description` varchar(1000) DEFAULT NULL,
  `Meta_Keywords` varchar(1000) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL COMMENT '是否已删除',
  PRIMARY KEY (`Id`),
  KEY `FK_Type_Category` (`TypeId`) USING BTREE,
  CONSTRAINT `himall_categories_ibfk_1` FOREIGN KEY (`TypeId`) REFERENCES `himall_types` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_categories
-- ----------------------------
INSERT INTO `himall_categories` VALUES ('1', '家用电器', null, '1', '0', '1', '1', null, '0', '90', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('2', '大家电', null, '1', '1', '2', '1|2', null, '0', '90', '100.00', null, null, null, '');
INSERT INTO `himall_categories` VALUES ('3', '冰箱', null, '1', '2', '3', '1|2|3', null, '0', '90', '1.00', null, null, null, '');
INSERT INTO `himall_categories` VALUES ('4', '食品、酒类、特产', null, '2', '0', '1', '4', null, '0', '107', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('5', '坚果', null, '1', '4', '2', '4|5', null, '0', '107', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('6', '松子', null, '1', '5', '3', '4|5|6', null, '0', '107', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('7', '核桃', null, '2', '5', '3', '4|5|7', null, '0', '107', '1.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('8', '碧根果', null, '3', '5', '3', '4|5|8', null, '0', '107', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('9', '拉条', null, '2', '4', '2', '4|9', null, '0', '107', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('10', '水果', null, '3', '4', '2', '4|10', null, '0', '107', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('11', '卫龙', null, '1', '9', '3', '4|9|11', null, '0', '107', '1.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('12', '水果', null, '1', '10', '3', '4|10|12', null, '0', '107', '1.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('13', '男装、女装、童装', null, '3', '0', '1', '13', null, '0', '106', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('14', '女装', null, '1', '13', '2', '13|14', null, '0', '106', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('15', '外套', null, '1', '14', '3', '13|14|15', null, '0', '106', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('16', '裙子', null, '2', '14', '3', '13|14|16', null, '0', '106', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('17', '衬衣', null, '3', '14', '3', '13|14|17', null, '0', '106', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('18', '针织衫', null, '4', '14', '3', '13|14|18', null, '0', '106', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('19', '电脑办公', null, '4', '0', '1', '19', null, '0', '105', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('20', '电脑整机', null, '1', '19', '2', '19|20', null, '0', '105', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('21', '笔记本', null, '1', '20', '3', '19|20|21', null, '0', '105', '1.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('22', '生鲜', null, '5', '0', '1', '22', null, '0', '104', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('23', '海鲜水产', null, '1', '22', '2', '22|23', null, '0', '104', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('24', '虾类', null, '1', '23', '3', '22|23|24', null, '0', '104', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('25', '个护化妆、清洁用品', null, '6', '0', '1', '25', null, '0', '102', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('26', '面部护肤', null, '1', '25', '2', '25|26', null, '0', '102', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('27', '洁面', null, '1', '26', '3', '25|26|27', null, '0', '102', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('28', '卸妆', null, '2', '26', '3', '25|26|28', null, '0', '102', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('29', '面部护理', null, '3', '26', '3', '25|26|29', null, '0', '102', '5.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('30', '电视', null, '1', '1', '2', '1|30', null, '0', '103', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('31', '合资品牌', null, '1', '30', '3', '1|30|31', null, '0', '103', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('32', '国产品牌', null, '2', '30', '3', '1|30|32', null, '0', '103', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('33', '互联网品牌', null, '3', '30', '3', '1|30|33', null, '0', '103', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('34', '空调', null, '2', '1', '2', '1|34', null, '0', '103', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('35', '洗衣机', null, '3', '1', '2', '1|35', null, '0', '103', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('36', '厨卫大电', null, '4', '1', '2', '1|36', null, '0', '103', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('37', '生活电器', null, '5', '1', '2', '1|37', null, '0', '103', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('38', '壁挂式空调', null, '1', '34', '3', '1|34|38', null, '0', '103', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('39', '柜式空调', null, '2', '34', '3', '1|34|39', null, '0', '103', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('40', '中央空调', null, '3', '34', '3', '1|34|40', null, '0', '103', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('41', '空调配件', null, '4', '34', '3', '1|34|41', null, '0', '103', '1.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('42', '滚筒洗衣机', null, '1', '35', '3', '1|35|42', null, '0', '103', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('43', '机烘洗衣机', null, '2', '35', '3', '1|35|43', null, '0', '103', '5.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('44', '波轮洗衣机', null, '3', '35', '3', '1|35|44', null, '0', '103', '5.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('45', '迷你洗衣机', null, '4', '35', '3', '1|35|45', null, '0', '103', '5.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('46', '洗衣机配件', null, '5', '35', '3', '1|35|46', null, '0', '103', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('47', '油烟机', null, '1', '36', '3', '1|36|47', null, '0', '103', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('48', '燃气灶', null, '2', '36', '3', '1|36|48', null, '0', '103', '5.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('49', '吸尘器', null, '1', '37', '3', '1|37|49', null, '0', '103', '7.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('50', '进化器', null, '2', '37', '3', '1|37|50', null, '0', '103', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('51', '加湿器', null, '3', '37', '3', '1|37|51', null, '0', '103', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('52', '家居、家具、家装', null, '7', '0', '1', '52', null, '0', '101', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('53', '厨具', null, '1', '52', '2', '52|53', null, '0', '101', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('54', '家纺', null, '2', '52', '2', '52|54', null, '0', '101', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('55', '家装软式', null, '3', '52', '2', '52|55', null, '0', '101', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('56', '烹饪锅具', null, '1', '53', '3', '52|53|56', null, '0', '101', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('57', '厨房配件', null, '2', '53', '3', '52|53|57', null, '0', '101', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('58', '餐具', null, '3', '53', '3', '52|53|58', null, '0', '101', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('59', '床品套件', null, '1', '54', '3', '52|54|59', null, '0', '101', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('60', '被子', null, '2', '54', '3', '52|54|60', null, '0', '101', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('61', '枕头', null, '3', '54', '3', '52|54|61', null, '0', '101', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('62', '装饰字画', null, '1', '55', '3', '52|55|62', null, '0', '101', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('63', '装饰摆件', null, '2', '55', '3', '52|55|63', null, '0', '101', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('64', '窗帘隔断', null, '3', '55', '3', '52|55|64', null, '0', '101', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('65', '鞋靴、箱包', null, '8', '0', '1', '65', null, '0', '100', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('66', '时尚女鞋', null, '1', '65', '2', '65|66', null, '0', '100', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('67', '流行男鞋', null, '2', '65', '2', '65|67', null, '0', '100', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('68', '潮流女包', null, '3', '65', '2', '65|68', null, '0', '100', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('69', '精品男包', null, '4', '65', '2', '65|69', null, '0', '100', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('70', '女靴', null, '1', '66', '3', '65|66|70', null, '0', '100', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('71', '单鞋', null, '2', '66', '3', '65|66|71', null, '0', '100', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('72', '布鞋', null, '3', '66', '3', '65|66|72', null, '0', '100', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('73', '凉鞋', null, '4', '66', '3', '65|66|73', null, '0', '100', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('74', '休闲鞋', null, '1', '67', '3', '65|67|74', null, '0', '100', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('75', '正装鞋', null, '2', '67', '3', '65|67|75', null, '0', '100', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('76', '运动鞋', null, '3', '67', '3', '65|67|76', null, '0', '100', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('77', '男鞋', null, '4', '67', '3', '65|67|77', null, '0', '100', '5.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('78', '凉鞋', null, '5', '67', '3', '65|67|78', null, '0', '100', '5.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('79', '真皮包', null, '1', '68', '3', '65|68|79', null, '0', '100', '5.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('80', '水桶包', null, '2', '68', '3', '65|68|80', null, '0', '100', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('81', '斜挎包', null, '3', '68', '3', '65|68|81', null, '0', '100', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('82', '手提包', null, '4', '68', '3', '65|68|82', null, '0', '100', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('83', '帆布包', null, '5', '68', '3', '65|68|83', null, '0', '100', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('84', '商务包', null, '1', '69', '3', '65|69|84', null, '0', '100', '5.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('85', '双肩背包', null, '2', '69', '3', '65|69|85', null, '0', '100', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('86', '男士手包', null, '3', '69', '3', '65|69|86', null, '0', '100', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('87', '运动、户外', null, '9', '0', '1', '87', null, '0', '99', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('88', '运动鞋包', null, '1', '87', '2', '87|88', null, '0', '99', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('89', '运动服饰', null, '2', '87', '2', '87|89', null, '0', '99', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('90', '骑行运动', null, '3', '87', '2', '87|90', null, '0', '99', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('91', '体育用品', null, '4', '87', '2', '87|91', null, '0', '99', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('92', '跑步鞋', null, '1', '88', '3', '87|88|92', null, '0', '99', '5.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('93', '篮球鞋', null, '2', '88', '3', '87|88|93', null, '0', '99', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('94', '帆布鞋', null, '3', '88', '3', '87|88|94', null, '0', '99', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('95', '登山鞋', null, '4', '88', '3', '87|88|95', null, '0', '99', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('96', '足球鞋', null, '5', '88', '3', '87|88|96', null, '0', '99', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('97', 'T恤', null, '1', '89', '3', '87|89|97', null, '0', '99', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('98', '运动裤', null, '2', '89', '3', '87|89|98', null, '0', '99', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('99', '汗巾', null, '3', '89', '3', '87|89|99', null, '0', '99', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('100', '护腕', null, '4', '89', '3', '87|89|100', null, '0', '99', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('101', '山地车', null, '1', '90', '3', '87|90|101', null, '0', '99', '5.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('102', '自行车', null, '2', '90', '3', '87|90|102', null, '0', '99', '6.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('103', '折叠车', null, '3', '90', '3', '87|90|103', null, '0', '99', '5.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('104', '骑行装备', null, '4', '90', '3', '87|90|104', null, '0', '99', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('105', '羽毛球', null, '1', '91', '3', '87|91|105', null, '0', '99', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('106', '篮球', null, '2', '91', '3', '87|91|106', null, '0', '99', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('107', '足球', null, '3', '91', '3', '87|91|107', null, '0', '99', '5.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('108', '棒球', null, '4', '91', '3', '87|91|108', null, '0', '99', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('109', '网球', null, '5', '91', '3', '87|91|109', null, '0', '99', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('110', '高尔夫', null, '6', '91', '3', '87|91|110', null, '0', '99', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('111', '兵乓球', null, '7', '91', '3', '87|91|111', null, '0', '99', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('112', '母婴、玩具乐器', null, '10', '0', '1', '112', null, '0', '97', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('113', '奶粉', null, '1', '112', '2', '112|113', null, '0', '97', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('114', '营养辅食', null, '2', '112', '2', '112|114', null, '0', '97', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('115', '尿裤湿巾', null, '3', '112', '2', '112|115', null, '0', '97', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('116', '1段', null, '1', '113', '3', '112|113|116', null, '0', '97', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('117', '2段', null, '2', '113', '3', '112|113|117', null, '0', '97', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('118', '3段', null, '3', '113', '3', '112|113|118', null, '0', '97', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('119', '4段', null, '4', '113', '3', '112|113|119', null, '0', '97', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('120', '孕妈奶粉', null, '5', '113', '3', '112|113|120', null, '0', '97', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('121', '米粉、菜粉', null, '1', '114', '3', '112|114|121', null, '0', '97', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('122', 'DHA', null, '2', '114', '3', '112|114|122', null, '0', '97', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('123', '拉拉裤', null, '1', '115', '3', '112|115|123', null, '0', '97', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('124', '婴儿湿巾', null, '2', '115', '3', '112|115|124', null, '0', '97', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('125', '医药保健', null, '11', '0', '1', '125', null, '0', '96', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('126', '中西药品', null, '1', '125', '2', '125|126', null, '0', '96', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('127', '营养健康', null, '2', '125', '2', '125|127', null, '0', '96', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('128', '感冒咳嗽', null, '1', '126', '3', '125|126|128', null, '0', '96', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('129', '补气养血', null, '2', '126', '3', '125|126|129', null, '0', '96', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('130', '调节免疫', null, '1', '127', '3', '125|127|130', null, '0', '96', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('131', '调节三高', null, '2', '127', '3', '125|127|131', null, '0', '96', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('132', '图书、影像、电子书', null, '12', '0', '1', '132', null, '0', '95', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('133', '手机、 数码', null, '13', '0', '1', '133', null, '0', '105', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('134', '手机通讯', null, '1', '133', '2', '133|134', null, '0', '105', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('135', '手机配件', null, '2', '133', '2', '133|135', null, '0', '105', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('136', '数码产品', null, '3', '133', '2', '133|136', null, '0', '105', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('137', '手机', null, '1', '134', '3', '133|134|137', null, '0', '105', '5.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('138', '对讲机', null, '2', '134', '3', '133|134|138', null, '0', '105', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('139', '手机壳', null, '1', '135', '3', '133|135|139', null, '0', '105', '5.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('140', '贴膜', null, '2', '135', '3', '133|135|140', null, '0', '105', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('141', '数据线', null, '3', '135', '3', '133|135|141', null, '0', '105', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('142', '充电器', null, '4', '135', '3', '133|135|142', null, '0', '105', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('143', '耳机', null, '5', '135', '3', '133|135|143', null, '0', '105', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('144', '视频类用品', null, '1', '136', '3', '133|136|144', null, '0', '105', '5.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('145', '钟表', null, '14', '0', '1', '145', null, '0', '94', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('146', '手表', null, '1', '145', '2', '145|146', null, '0', '94', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('147', '男表', null, '1', '146', '3', '145|146|147', null, '0', '94', '8.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('148', '汽车、汽车用品', null, '15', '0', '1', '148', null, '0', '98', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('149', '汽车装饰', null, '1', '148', '2', '148|149', null, '0', '98', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('150', '美容清洗', null, '2', '148', '2', '148|150', null, '0', '98', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('151', '脚垫', null, '1', '149', '3', '148|149|151', null, '0', '98', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('152', '座套', null, '2', '149', '3', '148|149|152', null, '0', '98', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('153', '方向盘套', null, '3', '149', '3', '148|149|153', null, '0', '98', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('154', '后备箱垫', null, '4', '149', '3', '148|149|154', null, '0', '98', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('155', '车蜡', null, '1', '150', '3', '148|150|155', null, '0', '98', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('156', '补漆笔', null, '2', '150', '3', '148|150|156', null, '0', '98', '4.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('157', '玻璃水', null, '3', '150', '3', '148|150|157', null, '0', '98', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('158', '清洁剂', null, '4', '150', '3', '148|150|158', null, '0', '98', '3.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('159', '珠宝', null, '16', '0', '1', '159', null, '0', '90', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('160', 'vmall', null, '17', '0', '1', '160', null, '0', '95', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('161', '群晖', null, '18', '0', '1', '161', null, '0', '91', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('162', '酒水', null, '4', '4', '2', '4|162', null, '0', '107', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('163', '白酒', null, '1', '162', '3', '4|162|163', null, '0', '107', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('164', '啤酒', null, '2', '162', '3', '4|162|164', null, '0', '107', '2.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('165', '红酒', null, '3', '162', '3', '4|162|165', null, '0', '107', '1.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('166', '男装', null, '2', '13', '2', '13|166', null, '0', '106', '100.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('167', '男裤', null, '1', '166', '3', '13|166|167', null, '0', '106', '1.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('168', '外套', null, '2', '166', '3', '13|166|168', null, '0', '106', '1.00', null, null, null, '\0');
INSERT INTO `himall_categories` VALUES ('169', '毛衣', null, '3', '166', '3', '13|166|169', null, '0', '106', '1.00', null, null, null, '\0');

-- ----------------------------
-- Table structure for himall_categorycashdeposit
-- ----------------------------
DROP TABLE IF EXISTS `himall_categorycashdeposit`;
CREATE TABLE `himall_categorycashdeposit` (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `CategoryId` bigint(20) NOT NULL COMMENT '分类Id',
  `NeedPayCashDeposit` decimal(10,2) DEFAULT '0.00' COMMENT '需要缴纳保证金',
  `EnableNoReasonReturn` tinyint(1) DEFAULT '0' COMMENT '允许七天无理由退货',
  PRIMARY KEY (`CategoryId`),
  KEY `FK_Himall_CategoriesObligation_Categories` (`CategoryId`) USING BTREE,
  CONSTRAINT `FK_Himall_CategoriesObligation_Categories` FOREIGN KEY (`CategoryId`) REFERENCES `himall_categories` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_categorycashdeposit
-- ----------------------------
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '1', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '4', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '13', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '19', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '22', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '25', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '52', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '65', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '87', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '112', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '125', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '132', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '133', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '145', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '148', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '159', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '160', '0.00', '0');
INSERT INTO `himall_categorycashdeposit` VALUES ('0', '161', '0.00', '0');

-- ----------------------------
-- Table structure for himall_chargedetail
-- ----------------------------
DROP TABLE IF EXISTS `himall_chargedetail`;
CREATE TABLE `himall_chargedetail` (
  `Id` bigint(20) NOT NULL,
  `MemId` bigint(20) NOT NULL COMMENT '会员ID',
  `ChargeTime` datetime DEFAULT NULL COMMENT '充值时间',
  `ChargeAmount` decimal(18,2) NOT NULL COMMENT '充值金额',
  `ChargeWay` varchar(50) DEFAULT NULL COMMENT '充值方式',
  `ChargeStatus` int(11) NOT NULL COMMENT '充值状态',
  `CreateTime` datetime DEFAULT NULL COMMENT '提交充值时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_chargedetail
-- ----------------------------
INSERT INTO `himall_chargedetail` VALUES ('17082911454720087', '639', null, '200.00', null, '1', '2017-08-29 11:45:48');

-- ----------------------------
-- Table structure for himall_chargedetailshop
-- ----------------------------
DROP TABLE IF EXISTS `himall_chargedetailshop`;
CREATE TABLE `himall_chargedetailshop` (
  `Id` bigint(20) NOT NULL,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ChargeTime` datetime DEFAULT NULL COMMENT '充值时间',
  `ChargeAmount` decimal(18,2) NOT NULL COMMENT '充值金额',
  `ChargeWay` varchar(50) DEFAULT NULL COMMENT '充值方式',
  `ChargeStatus` int(11) NOT NULL COMMENT '充值状态',
  `CreateTime` datetime DEFAULT NULL COMMENT '提交充值时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_chargedetailshop
-- ----------------------------

-- ----------------------------
-- Table structure for himall_collocation
-- ----------------------------
DROP TABLE IF EXISTS `himall_collocation`;
CREATE TABLE `himall_collocation` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID自增',
  `Title` varchar(100) NOT NULL COMMENT '组合购标题',
  `StartTime` datetime NOT NULL COMMENT '开始日期',
  `EndTime` datetime NOT NULL COMMENT '结束日期',
  `ShortDesc` varchar(1000) DEFAULT NULL COMMENT '组合描述',
  `ShopId` bigint(20) NOT NULL COMMENT '组合购店铺ID',
  `CreateTime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_collocation
-- ----------------------------

-- ----------------------------
-- Table structure for himall_collocationporuducts
-- ----------------------------
DROP TABLE IF EXISTS `himall_collocationporuducts`;
CREATE TABLE `himall_collocationporuducts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID自增',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `ColloId` bigint(20) NOT NULL COMMENT '组合购ID',
  `IsMain` tinyint(1) NOT NULL COMMENT '是否主商品',
  `DisplaySequence` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`Id`),
  KEY `FK_Collocation_CollPoruducts` (`ColloId`) USING BTREE,
  KEY `FK_Product_CollPoruducts` (`ProductId`) USING BTREE,
  CONSTRAINT `FK_Collocation_CollPoruducts` FOREIGN KEY (`ColloId`) REFERENCES `himall_collocation` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Product_CollPoruducts` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_collocationporuducts
-- ----------------------------

-- ----------------------------
-- Table structure for himall_collocationskus
-- ----------------------------
DROP TABLE IF EXISTS `himall_collocationskus`;
CREATE TABLE `himall_collocationskus` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID自增',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `SkuID` varchar(100) NOT NULL COMMENT '商品SkuId',
  `ColloProductId` bigint(20) NOT NULL COMMENT '组合商品表ID',
  `Price` decimal(18,2) NOT NULL COMMENT '组合购价格',
  `SkuPirce` decimal(18,2) DEFAULT NULL COMMENT '原始价格',
  PRIMARY KEY (`Id`),
  KEY `FK_Product_CollSkus` (`ProductId`) USING BTREE,
  KEY `FK_ColloPoruducts_CollSkus` (`ColloProductId`) USING BTREE,
  CONSTRAINT `FK_ColloProuducts_Skus` FOREIGN KEY (`ColloProductId`) REFERENCES `himall_collocationporuducts` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Product_ColloSkus` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=754 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_collocationskus
-- ----------------------------

-- ----------------------------
-- Table structure for himall_coupon
-- ----------------------------
DROP TABLE IF EXISTS `himall_coupon`;
CREATE TABLE `himall_coupon` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `ShopName` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `Price` decimal(18,0) NOT NULL COMMENT '价格',
  `PerMax` int(11) NOT NULL COMMENT '最大可领取张数',
  `OrderAmount` decimal(18,0) NOT NULL COMMENT '订单金额（满足多少钱才能使用）',
  `Num` int(11) NOT NULL COMMENT '发行张数',
  `StartTime` datetime NOT NULL COMMENT '开始时间',
  `EndTime` datetime NOT NULL,
  `CouponName` varchar(100) NOT NULL COMMENT '优惠券名称',
  `CreateTime` datetime NOT NULL,
  `ReceiveType` int(11) NOT NULL DEFAULT '0' COMMENT '领取方式 0 店铺首页 1 积分兑换 2 主动发放',
  `NeedIntegral` int(11) NOT NULL COMMENT '所需积分',
  `EndIntegralExchange` datetime DEFAULT NULL COMMENT '兑换截止时间',
  `IntegralCover` varchar(200) DEFAULT NULL COMMENT '积分商城封面',
  `IsSyncWeiXin` int(11) NOT NULL DEFAULT '0' COMMENT '是否同步到微信',
  `WXAuditStatus` int(11) NOT NULL DEFAULT '0' COMMENT '微信状态',
  `CardLogId` bigint(20) DEFAULT NULL COMMENT '微信卡券记录号 与微信卡券记录关联',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_Coupon_Himall_Shops` (`ShopId`) USING BTREE,
  CONSTRAINT `himall_coupon_ibfk_1` FOREIGN KEY (`ShopId`) REFERENCES `himall_shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for himall_couponrecord
-- ----------------------------
DROP TABLE IF EXISTS `himall_couponrecord`;
CREATE TABLE `himall_couponrecord` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CouponId` bigint(20) NOT NULL,
  `CounponSN` varchar(50) NOT NULL COMMENT '优惠券的SN标示',
  `CounponTime` datetime NOT NULL,
  `UserName` varchar(100) NOT NULL COMMENT '用户名称',
  `UserId` bigint(20) NOT NULL,
  `UsedTime` datetime DEFAULT NULL,
  `OrderId` bigint(20) DEFAULT NULL COMMENT '使用的订单ID',
  `ShopId` bigint(20) NOT NULL,
  `ShopName` varchar(100) NOT NULL,
  `CounponStatus` int(11) NOT NULL COMMENT '优惠券状态',
  `WXCodeId` bigint(20) DEFAULT NULL COMMENT '微信Code记录号 与微信卡券投放记录关联',
  PRIMARY KEY (`Id`),
  KEY `fk_couponrecord_couponid` (`CouponId`) USING BTREE,
  KEY `FK_couponrecord_shopid` (`ShopId`) USING BTREE,
  CONSTRAINT `himall_couponrecord_ibfk_1` FOREIGN KEY (`ShopId`) REFERENCES `himall_shops` (`Id`),
  CONSTRAINT `himall_couponrecord_ibfk_2` FOREIGN KEY (`CouponId`) REFERENCES `himall_coupon` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1369 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_couponrecord
-- ----------------------------

-- ----------------------------
-- Table structure for himall_couponsendbyregister
-- ----------------------------
DROP TABLE IF EXISTS `himall_couponsendbyregister`;
CREATE TABLE `himall_couponsendbyregister` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `Status` int(11) NOT NULL COMMENT '0、关闭；1、开启',
  `Link` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='注册赠送优惠券';

-- ----------------------------
-- Records of himall_couponsendbyregister
-- ----------------------------

-- ----------------------------
-- Table structure for himall_couponsendbyregisterdetailed
-- ----------------------------
DROP TABLE IF EXISTS `himall_couponsendbyregisterdetailed`;
CREATE TABLE `himall_couponsendbyregisterdetailed` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `CouponRegisterId` bigint(20) NOT NULL COMMENT '注册活动ID',
  `CouponId` bigint(20) NOT NULL COMMENT '优惠券ID',
  PRIMARY KEY (`Id`),
  KEY `FK_Reference_z` (`CouponRegisterId`),
  KEY `FK_Reference_coupon` (`CouponId`),
  CONSTRAINT `FK_Reference_coupon` FOREIGN KEY (`CouponId`) REFERENCES `himall_coupon` (`Id`),
  CONSTRAINT `FK_Reference_z` FOREIGN KEY (`CouponRegisterId`) REFERENCES `himall_couponsendbyregister` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='注册送优惠券关联优惠券';

-- ----------------------------
-- Records of himall_couponsendbyregisterdetailed
-- ----------------------------

-- ----------------------------
-- Table structure for himall_couponsetting
-- ----------------------------
DROP TABLE IF EXISTS `himall_couponsetting`;
CREATE TABLE `himall_couponsetting` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PlatForm` int(11) NOT NULL COMMENT '优惠券的发行平台',
  `CouponID` bigint(20) NOT NULL,
  `Display` int(11) DEFAULT NULL COMMENT '是否显示',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_couponsetting
-- ----------------------------

-- ----------------------------
-- Table structure for himall_customerservices
-- ----------------------------
DROP TABLE IF EXISTS `himall_customerservices`;
CREATE TABLE `himall_customerservices` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `Tool` int(11) NOT NULL COMMENT '工具类型（QQ、旺旺）',
  `Type` int(11) NOT NULL,
  `Name` varchar(1000) NOT NULL COMMENT '客服名称',
  `AccountCode` varchar(1000) NOT NULL COMMENT '通信账号',
  `TerminalType` int(11) NOT NULL DEFAULT '0' COMMENT '终端类型',
  `ServerStatus` int(11) NOT NULL DEFAULT '1' COMMENT '客服状态',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_customerservices
-- ----------------------------

-- ----------------------------
-- Table structure for himall_deliveryscope
-- ----------------------------
DROP TABLE IF EXISTS `himall_deliveryscope`;
CREATE TABLE `himall_deliveryscope` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopBranchId` bigint(20) NOT NULL COMMENT '门店表ID',
  `RegionId` int(11) NOT NULL COMMENT '区域标识',
  `RegionName` varchar(200) DEFAULT NULL COMMENT '区域名称',
  `FullRegionPath` varchar(200) DEFAULT NULL COMMENT '全路径',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COMMENT='门店配送范围表';

-- ----------------------------
-- Records of himall_deliveryscope
-- ----------------------------

-- ----------------------------
-- Table structure for himall_distributionproducts
-- ----------------------------
DROP TABLE IF EXISTS `himall_distributionproducts`;
CREATE TABLE `himall_distributionproducts` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductbrokerageId` bigint(20) NOT NULL,
  `Sequence` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_DistributionProducts_z` (`ProductbrokerageId`),
  CONSTRAINT `FK_DistributionProducts_z` FOREIGN KEY (`ProductbrokerageId`) REFERENCES `himall_productbrokerage` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='分销首页显示商品';

-- ----------------------------
-- Records of himall_distributionproducts
-- ----------------------------

-- ----------------------------
-- Table structure for himall_distributionsharesetting
-- ----------------------------
DROP TABLE IF EXISTS `himall_distributionsharesetting`;
CREATE TABLE `himall_distributionsharesetting` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProShareLogo` varchar(150) DEFAULT NULL,
  `ShopShareLogo` varchar(150) DEFAULT NULL,
  `ProShareTitle` varchar(200) DEFAULT NULL,
  `ShopShareTitle` varchar(200) DEFAULT NULL,
  `ProShareDesc` varchar(2000) DEFAULT NULL,
  `ShopShareDesc` varchar(2000) DEFAULT NULL,
  `DisShareLogo` varchar(150) DEFAULT NULL,
  `RecruitShareLogo` varchar(150) DEFAULT NULL,
  `DisShareTitle` varchar(200) DEFAULT NULL,
  `RecruitShareTitle` varchar(200) DEFAULT NULL,
  `DisShareDesc` varchar(2000) DEFAULT NULL,
  `RecruitShareDesc` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_distributionsharesetting
-- ----------------------------

-- ----------------------------
-- Table structure for himall_distributionuserlink
-- ----------------------------
DROP TABLE IF EXISTS `himall_distributionuserlink`;
CREATE TABLE `himall_distributionuserlink` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PartnerId` bigint(20) NOT NULL COMMENT '销售员',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺',
  `LinkTime` datetime DEFAULT NULL,
  `BuyUserId` bigint(20) NOT NULL DEFAULT '0' COMMENT '买家',
  PRIMARY KEY (`Id`),
  KEY `himall_DistributionUserLink_FK_User` (`PartnerId`),
  CONSTRAINT `himall_DistributionUserLink_FK_User` FOREIGN KEY (`PartnerId`) REFERENCES `himall_members` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='分销用户与店铺关联表';

-- ----------------------------
-- Records of himall_distributionuserlink
-- ----------------------------

-- ----------------------------
-- Table structure for himall_distributorsetting
-- ----------------------------
DROP TABLE IF EXISTS `himall_distributorsetting`;
CREATE TABLE `himall_distributorsetting` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Enable` tinyint(1) NOT NULL COMMENT '模块开关',
  `SellerRule` varchar(2000) DEFAULT NULL COMMENT '商家规则',
  `PromoterRule` varchar(2000) DEFAULT NULL COMMENT '推广员规则',
  `DisBanner` varchar(2000) DEFAULT NULL COMMENT '分销市场banner',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_distributorsetting
-- ----------------------------
INSERT INTO `himall_distributorsetting` VALUES ('1', '0', '', '', '');

-- ----------------------------
-- Table structure for himall_favorites
-- ----------------------------
DROP TABLE IF EXISTS `himall_favorites`;
CREATE TABLE `himall_favorites` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `ProductId` bigint(20) NOT NULL,
  `Tags` varchar(100) DEFAULT NULL COMMENT '分类标签',
  `Date` datetime NOT NULL COMMENT '收藏日期',
  PRIMARY KEY (`Id`),
  KEY `FK_Member_Favorite` (`UserId`) USING BTREE,
  KEY `FK_Product_Favorite` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_favorites_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `himall_members` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_favorites_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for himall_favoriteshops
-- ----------------------------
DROP TABLE IF EXISTS `himall_favoriteshops`;
CREATE TABLE `himall_favoriteshops` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `ShopId` bigint(20) NOT NULL,
  `Tags` varchar(100) DEFAULT NULL COMMENT '分类标签',
  `Date` datetime NOT NULL COMMENT '收藏日期',
  PRIMARY KEY (`Id`),
  KEY `Himall_FavoriteShop_fk_1` (`ShopId`),
  CONSTRAINT `Himall_FavoriteShop_fk_1` FOREIGN KEY (`ShopId`) REFERENCES `himall_shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_favoriteshops
-- ----------------------------

-- ----------------------------
-- Table structure for himall_fightgroupactive
-- ----------------------------
DROP TABLE IF EXISTS `himall_fightgroupactive`;
CREATE TABLE `himall_fightgroupactive` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺编号',
  `ProductId` bigint(20) NOT NULL COMMENT '商品编号',
  `ProductName` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `IconUrl` varchar(100) DEFAULT NULL COMMENT '图片',
  `StartTime` datetime DEFAULT NULL COMMENT '开始时间',
  `EndTime` datetime DEFAULT NULL COMMENT '结束时间',
  `LimitedNumber` int(11) DEFAULT NULL COMMENT '参团人数限制',
  `LimitedHour` decimal(18,2) DEFAULT NULL COMMENT '成团时限',
  `LimitQuantity` int(11) DEFAULT NULL COMMENT '数量限制',
  `GroupCount` int(11) DEFAULT NULL COMMENT '成团数量',
  `OkGroupCount` int(11) DEFAULT NULL COMMENT '成功成团数量',
  `AddTime` datetime DEFAULT NULL COMMENT '活动添加时间',
  `ManageAuditStatus` int(11) DEFAULT '0' COMMENT '平台操作状态',
  `ManageRemark` varchar(1000) DEFAULT NULL COMMENT '平台操作说明',
  `ManageDate` datetime DEFAULT NULL COMMENT '平台操作时间',
  `ManagerId` bigint(20) DEFAULT NULL COMMENT '平台操作人',
  `ActiveTimeStatus` int(11) DEFAULT '0' COMMENT '活动当前状态',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='拼团活动';

-- ----------------------------
-- Records of himall_fightgroupactive
-- ----------------------------

-- ----------------------------
-- Table structure for himall_fightgroupactiveitem
-- ----------------------------
DROP TABLE IF EXISTS `himall_fightgroupactiveitem`;
CREATE TABLE `himall_fightgroupactiveitem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ActiveId` bigint(20) DEFAULT NULL COMMENT '所属活动',
  `ProductId` bigint(20) DEFAULT NULL COMMENT '商品编号',
  `SkuId` varchar(100) DEFAULT NULL COMMENT '商品SKU',
  `ActivePrice` decimal(18,2) NOT NULL COMMENT '活动售价',
  `ActiveStock` bigint(20) DEFAULT NULL COMMENT '活动库存',
  `BuyCount` int(11) DEFAULT NULL COMMENT '己售',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8 COMMENT='拼团活动项';

-- ----------------------------
-- Records of himall_fightgroupactiveitem
-- ----------------------------

-- ----------------------------
-- Table structure for himall_fightgrouporder
-- ----------------------------
DROP TABLE IF EXISTS `himall_fightgrouporder`;
CREATE TABLE `himall_fightgrouporder` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ActiveId` bigint(20) DEFAULT NULL COMMENT '对应活动',
  `ProductId` bigint(20) DEFAULT NULL COMMENT '对应商品',
  `SkuId` varchar(100) DEFAULT NULL COMMENT '商品SKU',
  `GroupId` bigint(20) DEFAULT NULL COMMENT '所属拼团',
  `OrderId` bigint(20) DEFAULT NULL COMMENT '订单时间',
  `OrderUserId` bigint(20) DEFAULT NULL COMMENT '订单用户编号',
  `IsFirstOrder` bit(1) DEFAULT NULL COMMENT '是否团首订单',
  `JoinTime` datetime DEFAULT NULL COMMENT '参团时间',
  `JoinStatus` int(11) DEFAULT NULL COMMENT '参团状态 参团中  成功  失败',
  `OverTime` datetime DEFAULT NULL COMMENT '结束时间 成功或失败的时间',
  `Quantity` bigint(20) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `SalePrice` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '销售价',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COMMENT='拼团订单';

-- ----------------------------
-- Records of himall_fightgrouporder
-- ----------------------------

-- ----------------------------
-- Table structure for himall_fightgroups
-- ----------------------------
DROP TABLE IF EXISTS `himall_fightgroups`;
CREATE TABLE `himall_fightgroups` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `HeadUserId` bigint(20) DEFAULT NULL COMMENT '团长用户编号',
  `ActiveId` bigint(20) DEFAULT NULL COMMENT '对应活动',
  `LimitedNumber` int(11) DEFAULT NULL COMMENT '参团人数限制',
  `LimitedHour` decimal(18,2) DEFAULT NULL COMMENT '时间限制',
  `JoinedNumber` int(11) DEFAULT NULL COMMENT '己参团人数',
  `IsException` bit(1) DEFAULT NULL COMMENT '是否异常',
  `GroupStatus` int(11) DEFAULT NULL COMMENT '数据状态 初始中  成团中  成功   失败',
  `AddGroupTime` datetime DEFAULT NULL COMMENT '开团时间',
  `OverTime` datetime DEFAULT NULL COMMENT '结束时间 成功或失败的时间',
  `ProductId` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `ShopId` bigint(20) NOT NULL DEFAULT '0' COMMENT '店铺编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COMMENT='拼团组团详情';

-- ----------------------------
-- Records of himall_fightgroups
-- ----------------------------

-- ----------------------------
-- Table structure for himall_flashsale
-- ----------------------------
DROP TABLE IF EXISTS `himall_flashsale`;
CREATE TABLE `himall_flashsale` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Title` varchar(30) NOT NULL,
  `ShopId` bigint(20) NOT NULL,
  `ProductId` bigint(20) NOT NULL,
  `Status` int(11) NOT NULL COMMENT '待审核,进行中,已结束,审核未通过,管理员取消',
  `BeginDate` datetime NOT NULL COMMENT '活动开始日期',
  `EndDate` datetime NOT NULL COMMENT '活动结束日期',
  `LimitCountOfThePeople` int(11) NOT NULL COMMENT '限制每人购买的数量',
  `SaleCount` int(11) NOT NULL COMMENT '仅仅只计算在限时购里的销售数',
  `CategoryName` varchar(255) NOT NULL,
  `ImagePath` varchar(255) NOT NULL,
  `MinPrice` decimal(18,2) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_FSShopId3` (`ShopId`),
  KEY `FK_FSProductId3` (`ProductId`),
  KEY `IX_ProductId_Status_BeginDate_EndDate` (`ProductId`,`Status`,`BeginDate`,`EndDate`) USING BTREE,
  CONSTRAINT `FK_FSProductId` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`),
  CONSTRAINT `FK_FSProductId3` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`),
  CONSTRAINT `FK_FSShopId` FOREIGN KEY (`ShopId`) REFERENCES `himall_shops` (`Id`),
  CONSTRAINT `FK_FSShopId3` FOREIGN KEY (`ShopId`) REFERENCES `himall_shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_flashsale
-- ----------------------------

-- ----------------------------
-- Table structure for himall_flashsaleconfig
-- ----------------------------
DROP TABLE IF EXISTS `himall_flashsaleconfig`;
CREATE TABLE `himall_flashsaleconfig` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Preheat` int(11) NOT NULL COMMENT '预热时间',
  `IsNormalPurchase` tinyint(1) NOT NULL COMMENT '是否允许正常购买',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_flashsaleconfig
-- ----------------------------
INSERT INTO `himall_flashsaleconfig` VALUES ('2', '24', '1');

-- ----------------------------
-- Table structure for himall_flashsaledetail
-- ----------------------------
DROP TABLE IF EXISTS `himall_flashsaledetail`;
CREATE TABLE `himall_flashsaledetail` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductId` bigint(20) NOT NULL,
  `SkuId` varchar(100) NOT NULL,
  `Price` decimal(18,2) DEFAULT NULL COMMENT '限时购时金额',
  `FlashSaleId` bigint(20) NOT NULL COMMENT '对应FlashSale表主键',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_flashsaledetail
-- ----------------------------

-- ----------------------------
-- Table structure for himall_flashsaleremind
-- ----------------------------
DROP TABLE IF EXISTS `himall_flashsaleremind`;
CREATE TABLE `himall_flashsaleremind` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `OpenId` varchar(200) NOT NULL,
  `RecordDate` datetime NOT NULL,
  `FlashSaleId` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_flashsaleremind
-- ----------------------------

-- ----------------------------
-- Table structure for himall_floorbrands
-- ----------------------------
DROP TABLE IF EXISTS `himall_floorbrands`;
CREATE TABLE `himall_floorbrands` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `FloorId` bigint(20) NOT NULL COMMENT '楼层ID',
  `BrandId` bigint(20) NOT NULL COMMENT '品牌ID',
  PRIMARY KEY (`Id`),
  KEY `FK_Brand_FloorBrand` (`BrandId`) USING BTREE,
  KEY `FK_HomeFloor_FloorBrand` (`FloorId`) USING BTREE,
  CONSTRAINT `himall_floorbrands_ibfk_1` FOREIGN KEY (`BrandId`) REFERENCES `himall_brands` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_floorbrands_ibfk_2` FOREIGN KEY (`FloorId`) REFERENCES `himall_homefloors` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_floorbrands
-- ----------------------------
INSERT INTO `himall_floorbrands` VALUES ('1', '86', '363');
INSERT INTO `himall_floorbrands` VALUES ('2', '86', '364');
INSERT INTO `himall_floorbrands` VALUES ('3', '86', '354');
INSERT INTO `himall_floorbrands` VALUES ('4', '86', '353');
INSERT INTO `himall_floorbrands` VALUES ('5', '87', '348');
INSERT INTO `himall_floorbrands` VALUES ('6', '87', '361');
INSERT INTO `himall_floorbrands` VALUES ('7', '87', '345');
INSERT INTO `himall_floorbrands` VALUES ('8', '87', '364');
INSERT INTO `himall_floorbrands` VALUES ('9', '87', '359');
INSERT INTO `himall_floorbrands` VALUES ('10', '88', '355');
INSERT INTO `himall_floorbrands` VALUES ('11', '88', '346');
INSERT INTO `himall_floorbrands` VALUES ('12', '88', '340');
INSERT INTO `himall_floorbrands` VALUES ('13', '88', '342');
INSERT INTO `himall_floorbrands` VALUES ('14', '88', '360');
INSERT INTO `himall_floorbrands` VALUES ('15', '88', '353');

-- ----------------------------
-- Table structure for himall_floorcategories
-- ----------------------------
DROP TABLE IF EXISTS `himall_floorcategories`;
CREATE TABLE `himall_floorcategories` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `FloorId` bigint(20) NOT NULL,
  `CategoryId` bigint(20) NOT NULL,
  `Depth` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Category_FloorCategory` (`CategoryId`) USING BTREE,
  KEY `FK_HomeFloor_FloorCategory` (`FloorId`) USING BTREE,
  CONSTRAINT `himall_floorcategories_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `himall_categories` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_floorcategories_ibfk_2` FOREIGN KEY (`FloorId`) REFERENCES `himall_homefloors` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_floorcategories
-- ----------------------------

-- ----------------------------
-- Table structure for himall_floorproducts
-- ----------------------------
DROP TABLE IF EXISTS `himall_floorproducts`;
CREATE TABLE `himall_floorproducts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `FloorId` bigint(20) NOT NULL COMMENT '楼层ID',
  `Tab` int(11) NOT NULL COMMENT '楼层标签',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`Id`),
  KEY `FK_HomeFloor_FloorProduct` (`FloorId`) USING BTREE,
  KEY `FK_Product_FloorProduct` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_floorproducts_ibfk_1` FOREIGN KEY (`FloorId`) REFERENCES `himall_homefloors` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_floorproducts_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_floorproducts
-- ----------------------------

-- ----------------------------
-- Table structure for himall_floortabldetails
-- ----------------------------
DROP TABLE IF EXISTS `himall_floortabldetails`;
CREATE TABLE `himall_floortabldetails` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `TabId` bigint(20) NOT NULL COMMENT 'TabID',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`Id`),
  KEY `TabIdFK` (`TabId`) USING BTREE,
  KEY `ProductIdFK` (`ProductId`) USING BTREE,
  CONSTRAINT `TabIdFK` FOREIGN KEY (`TabId`) REFERENCES `himall_floortabls` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_floortabldetails
-- ----------------------------
INSERT INTO `himall_floortabldetails` VALUES ('349', '55', '1167');
INSERT INTO `himall_floortabldetails` VALUES ('350', '55', '1166');
INSERT INTO `himall_floortabldetails` VALUES ('351', '55', '1165');
INSERT INTO `himall_floortabldetails` VALUES ('352', '56', '1164');
INSERT INTO `himall_floortabldetails` VALUES ('353', '56', '1163');
INSERT INTO `himall_floortabldetails` VALUES ('354', '56', '1161');
INSERT INTO `himall_floortabldetails` VALUES ('355', '57', '1167');
INSERT INTO `himall_floortabldetails` VALUES ('356', '57', '1166');
INSERT INTO `himall_floortabldetails` VALUES ('357', '58', '1161');
INSERT INTO `himall_floortabldetails` VALUES ('358', '58', '1164');
INSERT INTO `himall_floortabldetails` VALUES ('359', '59', '1166');
INSERT INTO `himall_floortabldetails` VALUES ('360', '59', '1167');
INSERT INTO `himall_floortabldetails` VALUES ('361', '60', '1165');
INSERT INTO `himall_floortabldetails` VALUES ('362', '60', '1164');

-- ----------------------------
-- Table structure for himall_floortabls
-- ----------------------------
DROP TABLE IF EXISTS `himall_floortabls`;
CREATE TABLE `himall_floortabls` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `FloorId` bigint(20) NOT NULL COMMENT '楼层ID',
  `Name` varchar(50) NOT NULL COMMENT '楼层名称',
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`) USING BTREE,
  KEY `FloorIdFK` (`FloorId`) USING BTREE,
  CONSTRAINT `FloorIdFK` FOREIGN KEY (`FloorId`) REFERENCES `himall_homefloors` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_floortabls
-- ----------------------------
INSERT INTO `himall_floortabls` VALUES ('55', '86', '苹果');
INSERT INTO `himall_floortabls` VALUES ('56', '86', '联想');
INSERT INTO `himall_floortabls` VALUES ('57', '87', '零食');
INSERT INTO `himall_floortabls` VALUES ('58', '87', '坚果');
INSERT INTO `himall_floortabls` VALUES ('59', '88', '进口');
INSERT INTO `himall_floortabls` VALUES ('60', '88', '国产');

-- ----------------------------
-- Table structure for himall_floortopics
-- ----------------------------
DROP TABLE IF EXISTS `himall_floortopics`;
CREATE TABLE `himall_floortopics` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `FloorId` bigint(20) NOT NULL COMMENT '楼层ID',
  `TopicType` int(11) NOT NULL COMMENT '专题类型',
  `TopicImage` varchar(100) NOT NULL COMMENT '专题封面图片',
  `TopicName` varchar(100) NOT NULL COMMENT '专题名称',
  `Url` varchar(1000) NOT NULL COMMENT '专题跳转URL',
  PRIMARY KEY (`Id`),
  KEY `FK_HomeFloor_FloorTopic` (`FloorId`) USING BTREE,
  CONSTRAINT `himall_floortopics_ibfk_1` FOREIGN KEY (`FloorId`) REFERENCES `himall_homefloors` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5377 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_floortopics
-- ----------------------------
INSERT INTO `himall_floortopics` VALUES ('5331', '86', '11', '', '厨具', '/');
INSERT INTO `himall_floortopics` VALUES ('5332', '86', '11', '', '家纺', '/');
INSERT INTO `himall_floortopics` VALUES ('5333', '86', '11', '', '生活用品', '/');
INSERT INTO `himall_floortopics` VALUES ('5334', '86', '11', '', '家装软饰', '/');
INSERT INTO `himall_floortopics` VALUES ('5335', '86', '11', '', '灯具', '/');
INSERT INTO `himall_floortopics` VALUES ('5336', '86', '11', '', '家具', '/');
INSERT INTO `himall_floortopics` VALUES ('5337', '86', '11', '', '家装主材', '/');
INSERT INTO `himall_floortopics` VALUES ('5338', '86', '21', '/Storage/Plat/PageSettings/HomeFloor/0/floor_ROne_20170829104708034186.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5339', '86', '22', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RTwo_20170829104708046865.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5340', '86', '23', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RThree_20170829104708051817.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5341', '86', '24', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RFour_20170829104708058852.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5342', '86', '25', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RFive_20170829104708060538.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5343', '86', '26', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RSix_20170829104708062504.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5344', '86', '27', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RSeven_20170829104708064458.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5345', '86', '28', '/Storage/Plat/PageSettings/HomeFloor/0/floor_REight_20170829104708066423.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5346', '86', '29', '/Storage/Plat/PageSettings/HomeFloor/0/floor_ScrollOne_20170829104708068363.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5347', '86', '30', '/Storage/Plat/PageSettings/HomeFloor/0/floor_ScrollTwo_20170829104708070311.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5348', '87', '11', '', '海鲜水产', '/');
INSERT INTO `himall_floortopics` VALUES ('5349', '87', '11', '', '进口食品', '/');
INSERT INTO `himall_floortopics` VALUES ('5350', '87', '11', '', '休闲食品', '/');
INSERT INTO `himall_floortopics` VALUES ('5351', '87', '11', '', '地方特产', '/');
INSERT INTO `himall_floortopics` VALUES ('5352', '87', '21', '/Storage/Plat/PageSettings/HomeFloor/0/floor_ROne_20170829105254388773.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5353', '87', '22', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RTwo_20170829105254390760.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5354', '87', '23', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RThree_20170829105254392600.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5355', '87', '24', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RFour_20170829105254393754.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5356', '87', '25', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RFive_20170829105254394758.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5357', '87', '26', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RSix_20170829105254395515.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5358', '87', '27', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RSeven_20170829105254396483.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5359', '87', '28', '/Storage/Plat/PageSettings/HomeFloor/0/floor_REight_20170829105254397462.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5360', '87', '29', '/Storage/Plat/PageSettings/HomeFloor/0/floor_ScrollOne_20170829105254398464.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5361', '87', '30', '/Storage/Plat/PageSettings/HomeFloor/0/floor_ScrollTwo_20170829105254405292.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5362', '88', '11', '', '时令水果', '/');
INSERT INTO `himall_floortopics` VALUES ('5363', '88', '11', '', '休闲零食', '/');
INSERT INTO `himall_floortopics` VALUES ('5364', '88', '11', '', '坚果炒货', '/');
INSERT INTO `himall_floortopics` VALUES ('5365', '88', '11', '', '牛奶乳品', '/');
INSERT INTO `himall_floortopics` VALUES ('5366', '88', '11', '', '有机食品', '/');
INSERT INTO `himall_floortopics` VALUES ('5367', '88', '21', '/Storage/Plat/PageSettings/HomeFloor/0/floor_ROne_20170829105824676829.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5368', '88', '22', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RTwo_20170829105824677864.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5369', '88', '23', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RThree_20170829105824681772.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5370', '88', '24', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RFour_20170829105824682785.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5371', '88', '25', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RFive_20170829105824683801.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5372', '88', '26', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RSix_20170829105824684558.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5373', '88', '27', '/Storage/Plat/PageSettings/HomeFloor/0/floor_RSeven_20170829105824686508.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5374', '88', '28', '/Storage/Plat/PageSettings/HomeFloor/0/floor_REight_20170829105824686508.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5375', '88', '29', '/Storage/Plat/PageSettings/HomeFloor/0/floor_ScrollOne_20170829105824688466.jpg', '', '/');
INSERT INTO `himall_floortopics` VALUES ('5376', '88', '30', '/Storage/Plat/PageSettings/HomeFloor/0/floor_ScrollTwo_20170829105824689450.jpg', '', '/');

-- ----------------------------
-- Table structure for himall_freightareacontent
-- ----------------------------
DROP TABLE IF EXISTS `himall_freightareacontent`;
CREATE TABLE `himall_freightareacontent` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `FreightTemplateId` bigint(20) NOT NULL COMMENT '运费模板ID',
  `AreaContent` varchar(4000) DEFAULT NULL COMMENT '地区选择',
  `FirstUnit` int(11) DEFAULT NULL COMMENT '首笔单元计量',
  `FirstUnitMonry` float DEFAULT NULL COMMENT '首笔单元费用',
  `AccumulationUnit` int(11) DEFAULT NULL COMMENT '递增单元计量',
  `AccumulationUnitMoney` float DEFAULT NULL COMMENT '递增单元费用',
  `IsDefault` tinyint(4) DEFAULT NULL COMMENT '是否为默认',
  PRIMARY KEY (`Id`),
  KEY `FK_Freighttemalate_FreightAreaContent` (`FreightTemplateId`) USING BTREE,
  CONSTRAINT `himall_freightareacontent_ibfk_1` FOREIGN KEY (`FreightTemplateId`) REFERENCES `himall_freighttemplate` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_freightareacontent
-- ----------------------------
INSERT INTO `himall_freightareacontent` VALUES ('449', '216', null, '1', '0', '1', '0', '1');

-- ----------------------------
-- Table structure for himall_freightareadetail
-- ----------------------------
DROP TABLE IF EXISTS `himall_freightareadetail`;
CREATE TABLE `himall_freightareadetail` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `FreightTemplateId` bigint(20) NOT NULL COMMENT '运费模板ID',
  `FreightAreaId` bigint(20) NOT NULL COMMENT '模板地区Id',
  `ProvinceId` int(20) NOT NULL COMMENT '省份ID',
  `CityId` int(20) DEFAULT NULL COMMENT '城市ID',
  `CountyId` int(20) DEFAULT NULL COMMENT '区ID',
  `TownIds` varchar(2000) DEFAULT '' COMMENT '乡镇的ID用逗号隔开',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=518 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_freightareadetail
-- ----------------------------

-- ----------------------------
-- Table structure for himall_freighttemplate
-- ----------------------------
DROP TABLE IF EXISTS `himall_freighttemplate`;
CREATE TABLE `himall_freighttemplate` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL COMMENT '运费模板名称',
  `SourceAddress` int(11) DEFAULT NULL COMMENT '宝贝发货地',
  `SendTime` varchar(100) DEFAULT NULL COMMENT '发送时间',
  `IsFree` int(11) NOT NULL COMMENT '是否商家负责运费',
  `ValuationMethod` int(11) NOT NULL COMMENT '定价方法(按体积、重量计算）',
  `ShippingMethod` int(11) DEFAULT NULL COMMENT '运送类型（物流、快递）',
  `ShopID` bigint(20) NOT NULL COMMENT '店铺ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_freighttemplate
-- ----------------------------
INSERT INTO `himall_freighttemplate` VALUES ('216', '全国包邮', '3984', '24', '0', '0', null, '347');

-- ----------------------------
-- Table structure for himall_fulldiscountrules
-- ----------------------------
DROP TABLE IF EXISTS `himall_fulldiscountrules`;
CREATE TABLE `himall_fulldiscountrules` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ActiveId` bigint(20) NOT NULL COMMENT '活动编号',
  `Quota` decimal(18,2) NOT NULL COMMENT '条件',
  `Discount` decimal(18,2) NOT NULL COMMENT '优惠',
  PRIMARY KEY (`Id`),
  KEY `IDX_Himall_Fules_ActiveId` (`ActiveId`)
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8 COMMENT='满减规则';

-- ----------------------------
-- Records of himall_fulldiscountrules
-- ----------------------------

-- ----------------------------
-- Table structure for himall_giftorderitem
-- ----------------------------
DROP TABLE IF EXISTS `himall_giftorderitem`;
CREATE TABLE `himall_giftorderitem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `OrderId` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `GiftId` bigint(20) NOT NULL COMMENT '礼品编号',
  `Quantity` int(11) NOT NULL COMMENT '数量',
  `SaleIntegral` int(11) DEFAULT NULL COMMENT '积分单价',
  `GiftName` varchar(100) DEFAULT NULL COMMENT '礼品名称',
  `GiftValue` decimal(8,3) DEFAULT NULL COMMENT '礼品价值',
  `ImagePath` varchar(100) DEFAULT NULL COMMENT '图片存放地址',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_Gitem_OrderId` (`OrderId`) USING BTREE,
  CONSTRAINT `FK_Himall_Gitem_OrderId` FOREIGN KEY (`OrderId`) REFERENCES `himall_giftsorder` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_giftorderitem
-- ----------------------------

-- ----------------------------
-- Table structure for himall_gifts
-- ----------------------------
DROP TABLE IF EXISTS `himall_gifts`;
CREATE TABLE `himall_gifts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `GiftName` varchar(100) NOT NULL COMMENT '名称',
  `NeedIntegral` int(11) NOT NULL COMMENT '需要积分',
  `LimtQuantity` int(11) NOT NULL COMMENT '限制兑换数量 0表示不限兑换数量',
  `StockQuantity` int(11) NOT NULL COMMENT '库存数量',
  `EndDate` datetime NOT NULL COMMENT '兑换结束时间',
  `NeedGrade` int(11) NOT NULL DEFAULT '0' COMMENT '等级要求 0表示不限定',
  `VirtualSales` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟销量',
  `RealSales` int(11) NOT NULL DEFAULT '0' COMMENT '实际销量',
  `SalesStatus` int(11) NOT NULL COMMENT '状态',
  `ImagePath` varchar(100) DEFAULT NULL COMMENT '图片存放地址',
  `Sequence` int(11) NOT NULL DEFAULT '100' COMMENT '顺序 默认100 数字越小越靠前',
  `GiftValue` decimal(8,2) DEFAULT NULL COMMENT '礼品价值',
  `Description` longtext COMMENT '描述',
  `AddDate` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_gifts
-- ----------------------------

-- ----------------------------
-- Table structure for himall_giftsorder
-- ----------------------------
DROP TABLE IF EXISTS `himall_giftsorder`;
CREATE TABLE `himall_giftsorder` (
  `Id` bigint(20) NOT NULL COMMENT '编号',
  `OrderStatus` int(11) NOT NULL COMMENT '订单状态',
  `UserId` bigint(20) NOT NULL COMMENT '用户编号',
  `UserRemark` varchar(200) DEFAULT NULL COMMENT '会员留言',
  `ShipTo` varchar(100) DEFAULT NULL COMMENT '收货人',
  `CellPhone` varchar(100) DEFAULT NULL COMMENT '收货人电话',
  `TopRegionId` int(11) DEFAULT NULL COMMENT '一级地区',
  `RegionId` int(11) DEFAULT NULL COMMENT '地区编号',
  `RegionFullName` varchar(100) DEFAULT NULL COMMENT '地区全称',
  `Address` varchar(100) DEFAULT NULL COMMENT '地址',
  `ExpressCompanyName` varchar(4000) DEFAULT NULL COMMENT '快递公司',
  `ShipOrderNumber` varchar(4000) DEFAULT NULL COMMENT '快递单号',
  `ShippingDate` datetime DEFAULT NULL COMMENT '发货时间',
  `OrderDate` datetime NOT NULL COMMENT '下单时间',
  `FinishDate` datetime DEFAULT NULL COMMENT '完成时间',
  `TotalIntegral` int(11) DEFAULT NULL COMMENT '积分总价',
  `CloseReason` varchar(200) DEFAULT NULL COMMENT '关闭原因',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_giftsorder
-- ----------------------------

-- ----------------------------
-- Table structure for himall_handslideads
-- ----------------------------
DROP TABLE IF EXISTS `himall_handslideads`;
CREATE TABLE `himall_handslideads` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ImageUrl` varchar(100) NOT NULL COMMENT '图片URL',
  `Url` varchar(1000) NOT NULL COMMENT '图片跳转URL',
  `DisplaySequence` bigint(20) NOT NULL COMMENT '排序',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_handslideads
-- ----------------------------

-- ----------------------------
-- Table structure for himall_homecategories
-- ----------------------------
DROP TABLE IF EXISTS `himall_homecategories`;
CREATE TABLE `himall_homecategories` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `RowId` int(11) NOT NULL COMMENT '分类所属行数',
  `CategoryId` bigint(20) NOT NULL COMMENT '分类ID',
  `Depth` int(11) NOT NULL COMMENT '分类深度(最深3）',
  PRIMARY KEY (`Id`),
  KEY `FK_Category_HomeCategory` (`CategoryId`) USING BTREE,
  CONSTRAINT `himall_homecategories_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `himall_categories` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2345 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_homecategories
-- ----------------------------
INSERT INTO `himall_homecategories` VALUES ('2331', '1', '1', '1');
INSERT INTO `himall_homecategories` VALUES ('2332', '2', '4', '1');
INSERT INTO `himall_homecategories` VALUES ('2333', '3', '13', '1');
INSERT INTO `himall_homecategories` VALUES ('2334', '4', '19', '1');
INSERT INTO `himall_homecategories` VALUES ('2335', '5', '22', '1');
INSERT INTO `himall_homecategories` VALUES ('2336', '6', '25', '1');
INSERT INTO `himall_homecategories` VALUES ('2337', '7', '52', '1');
INSERT INTO `himall_homecategories` VALUES ('2338', '8', '65', '1');
INSERT INTO `himall_homecategories` VALUES ('2339', '9', '87', '1');
INSERT INTO `himall_homecategories` VALUES ('2340', '10', '112', '1');
INSERT INTO `himall_homecategories` VALUES ('2341', '11', '125', '1');
INSERT INTO `himall_homecategories` VALUES ('2342', '12', '132', '1');
INSERT INTO `himall_homecategories` VALUES ('2343', '13', '133', '1');
INSERT INTO `himall_homecategories` VALUES ('2344', '14', '145', '1');

-- ----------------------------
-- Table structure for himall_homecategoryrows
-- ----------------------------
DROP TABLE IF EXISTS `himall_homecategoryrows`;
CREATE TABLE `himall_homecategoryrows` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `RowId` int(11) NOT NULL COMMENT '行ID',
  `Image1` varchar(100) NOT NULL COMMENT '所属行推荐图片1',
  `Url1` varchar(100) NOT NULL COMMENT '所属行推荐图片1的URL',
  `Image2` varchar(100) NOT NULL COMMENT '所属行推荐图片2',
  `Url2` varchar(100) NOT NULL COMMENT '所属行推荐图片2的URL',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_homecategoryrows
-- ----------------------------

-- ----------------------------
-- Table structure for himall_homefloors
-- ----------------------------
DROP TABLE IF EXISTS `himall_homefloors`;
CREATE TABLE `himall_homefloors` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `FloorName` varchar(100) NOT NULL COMMENT '楼层名称',
  `SubName` varchar(100) DEFAULT NULL COMMENT '楼层小标题',
  `DisplaySequence` bigint(20) NOT NULL COMMENT '显示顺序',
  `IsShow` tinyint(1) NOT NULL COMMENT '是否显示的首页',
  `StyleLevel` int(10) unsigned NOT NULL COMMENT '楼层所属样式（目前支持2套）',
  `DefaultTabName` varchar(50) DEFAULT NULL COMMENT '楼层的默认tab标题',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_homefloors
-- ----------------------------
INSERT INTO `himall_homefloors` VALUES ('86', '品质生活', null, '1', '1', '4', '默认');
INSERT INTO `himall_homefloors` VALUES ('87', '进口食品', null, '2', '1', '4', '默认');
INSERT INTO `himall_homefloors` VALUES ('88', '水果生鲜', null, '3', '1', '4', '默认');

-- ----------------------------
-- Table structure for himall_imageads
-- ----------------------------
DROP TABLE IF EXISTS `himall_imageads`;
CREATE TABLE `himall_imageads` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `ImageUrl` varchar(100) NOT NULL COMMENT '图片的存放URL',
  `Url` varchar(1000) NOT NULL COMMENT '图片的调整地址',
  `IsTransverseAD` tinyint(1) NOT NULL COMMENT '是否是横向长广告',
  `TypeId` int(11) NOT NULL DEFAULT '0' COMMENT '微信头像',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3275 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_imageads
-- ----------------------------
INSERT INTO `himall_imageads` VALUES ('1', '0', '/Storage/Plat/ImageAd/201708290833092839810.jpg', '/', '0', '4');
INSERT INTO `himall_imageads` VALUES ('2', '0', '/Storage/Plat/ImageAd/201708290833324998570.jpg', '/', '0', '4');
INSERT INTO `himall_imageads` VALUES ('3', '0', '/Storage/Plat/ImageAd/201708290833523533130.jpg', '/', '0', '4');
INSERT INTO `himall_imageads` VALUES ('4', '0', '/Storage/Plat/ImageAd/201708290837249862190.jpg', '/', '0', '4');
INSERT INTO `himall_imageads` VALUES ('5', '0', '/Storage/Plat/ImageAd/201708290837509305970.jpg', '/', '0', '4');
INSERT INTO `himall_imageads` VALUES ('6', '0', '/Storage/Plat/ImageAd/201708290838060642930.jpg', '/', '0', '4');
INSERT INTO `himall_imageads` VALUES ('7', '0', '/Storage/Plat/ImageAd/201708290838199756060.jpg', '/', '0', '4');
INSERT INTO `himall_imageads` VALUES ('8', '0', '/Storage/Plat/ImageAd/201708290838345545980.jpg', '/', '0', '4');
INSERT INTO `himall_imageads` VALUES ('9', '0', '/Storage/Plat/ImageAd/201411271925179346361.png', '/', '0', '0');
INSERT INTO `himall_imageads` VALUES ('10', '0', '/Storage/Plat/ImageAd/201708290812183271290.jpg', 'http://119.29.164.13:7001/Product/Detail/1163', '0', '2');
INSERT INTO `himall_imageads` VALUES ('11', '0', '/Storage/Plat/ImageAd/201708290828250789070.jpg', 'http://119.29.164.13:7001/product/detail/1169', '0', '3');
INSERT INTO `himall_imageads` VALUES ('12', '0', '/Storage/Plat/ImageAd/201708290830152557360.jpg', 'http://119.29.164.13:7001/product/detail/1170', '0', '3');
INSERT INTO `himall_imageads` VALUES ('13', '0', '/Storage/Plat/ImageAd/201708290830402419820.jpg', 'http://119.29.164.13:7001/product/detail/1171', '0', '3');
INSERT INTO `himall_imageads` VALUES ('14', '0', '/Storage/Plat/ImageAd/201708290825336853430.jpg', 'http://119.29.164.13:7001/Product/Detail/1166', '0', '1');
INSERT INTO `himall_imageads` VALUES ('15', '0', '/Storage/Plat/ImageAd/201708290826009519520.jpg', 'http://119.29.164.13:7001/Product/Detail/1163', '0', '1');
INSERT INTO `himall_imageads` VALUES ('16', '0', '/Storage/Plat/ImageAd/201509171117596463730.jpg', '', '0', '6');
INSERT INTO `himall_imageads` VALUES ('17', '0', '/Storage/Plat/ImageAd/201509171118078648430.jpg', '', '0', '6');
INSERT INTO `himall_imageads` VALUES ('18', '0', '/Storage/Plat/ImageAd/201509171118158693010.jpg', '', '0', '6');
INSERT INTO `himall_imageads` VALUES ('19', '0', '/Storage/Plat/ImageAd/201509171118225416830.jpg', '', '0', '6');
INSERT INTO `himall_imageads` VALUES ('20', '0', '/Storage/Plat/ImageAd/201509171118295840850.jpg', '', '0', '6');
INSERT INTO `himall_imageads` VALUES ('21', '0', '/Storage/Plat/ImageAd/201708290839193915800.jpg', '/', '0', '5');
INSERT INTO `himall_imageads` VALUES ('22', '0', '/Storage/Plat/ImageAd/201708290839423095910.jpg', '/', '0', '5');
INSERT INTO `himall_imageads` VALUES ('3269', '0', '', '', '1', '0');
INSERT INTO `himall_imageads` VALUES ('3270', '347', '', '', '0', '0');
INSERT INTO `himall_imageads` VALUES ('3271', '347', '', '', '0', '0');
INSERT INTO `himall_imageads` VALUES ('3272', '347', '', '', '0', '0');
INSERT INTO `himall_imageads` VALUES ('3273', '347', '', '', '0', '0');
INSERT INTO `himall_imageads` VALUES ('3274', '347', '', '', '1', '0');

-- ----------------------------
-- Table structure for himall_integralmallads
-- ----------------------------
DROP TABLE IF EXISTS `himall_integralmallads`;
CREATE TABLE `himall_integralmallads` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ActivityType` int(11) NOT NULL COMMENT '活动类型',
  `ActivityId` bigint(20) NOT NULL COMMENT '活动编号',
  `Cover` varchar(255) DEFAULT NULL COMMENT '显示图片',
  `ShowStatus` int(11) DEFAULT NULL COMMENT '显示状态',
  `ShowPlatform` int(11) DEFAULT NULL COMMENT '显示平台',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_integralmallads
-- ----------------------------

-- ----------------------------
-- Table structure for himall_inviterecord
-- ----------------------------
DROP TABLE IF EXISTS `himall_inviterecord`;
CREATE TABLE `himall_inviterecord` (
  `Id` bigint(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL COMMENT '用户名',
  `RegName` varchar(100) NOT NULL COMMENT '邀请的用户',
  `InviteIntegral` int(11) NOT NULL COMMENT '邀请获得的积分',
  `RegIntegral` int(11) DEFAULT NULL COMMENT '被邀请获得的积分',
  `RegTime` datetime DEFAULT NULL COMMENT '注册时间',
  `UserId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `RegUserId` bigint(20) DEFAULT NULL COMMENT '被邀请的用户ID',
  `RecordTime` datetime DEFAULT NULL COMMENT '获得积分时间',
  PRIMARY KEY (`Id`),
  KEY `InviteMember` (`UserId`) USING BTREE,
  KEY `RegMember` (`RegUserId`) USING BTREE,
  CONSTRAINT `InviteMember` FOREIGN KEY (`UserId`) REFERENCES `himall_members` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `RegMember` FOREIGN KEY (`RegUserId`) REFERENCES `himall_members` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_inviterecord
-- ----------------------------

-- ----------------------------
-- Table structure for himall_inviterule
-- ----------------------------
DROP TABLE IF EXISTS `himall_inviterule`;
CREATE TABLE `himall_inviterule` (
  `Id` bigint(11) NOT NULL AUTO_INCREMENT,
  `InviteIntegral` int(11) DEFAULT NULL COMMENT '邀请能获得的积分',
  `RegIntegral` int(11) DEFAULT NULL COMMENT '被邀请能获得的积分',
  `ShareTitle` varchar(100) DEFAULT NULL COMMENT '分享标题',
  `ShareDesc` varchar(1000) DEFAULT NULL COMMENT '分享详细',
  `ShareIcon` varchar(200) DEFAULT NULL COMMENT '分享图标',
  `ShareRule` varchar(1000) DEFAULT NULL COMMENT '分享规则',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_inviterule
-- ----------------------------

-- ----------------------------
-- Table structure for himall_invoicecontext
-- ----------------------------
DROP TABLE IF EXISTS `himall_invoicecontext`;
CREATE TABLE `himall_invoicecontext` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL COMMENT '发票名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_invoicecontext
-- ----------------------------
INSERT INTO `himall_invoicecontext` VALUES ('36', '个人');

-- ----------------------------
-- Table structure for himall_invoicetitle
-- ----------------------------
DROP TABLE IF EXISTS `himall_invoicetitle`;
CREATE TABLE `himall_invoicetitle` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `Name` varchar(200) DEFAULT NULL COMMENT '抬头名称',
  `IsDefault` tinyint(4) NOT NULL COMMENT '是否默认',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_invoicetitle
-- ----------------------------

-- ----------------------------
-- Table structure for himall_label
-- ----------------------------
DROP TABLE IF EXISTS `himall_label`;
CREATE TABLE `himall_label` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `LabelName` varchar(50) NOT NULL COMMENT '标签名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_label
-- ----------------------------

-- ----------------------------
-- Table structure for himall_limittimemarket
-- ----------------------------
DROP TABLE IF EXISTS `himall_limittimemarket`;
CREATE TABLE `himall_limittimemarket` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL COMMENT '标题',
  `ProductId` bigint(20) NOT NULL,
  `ProductName` varchar(100) NOT NULL COMMENT '商品名称',
  `CategoryName` varchar(100) NOT NULL COMMENT '分类名称',
  `AuditStatus` smallint(6) NOT NULL COMMENT '审核状态',
  `AuditTime` datetime NOT NULL COMMENT '审核时间',
  `ShopId` bigint(20) NOT NULL,
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  `Price` decimal(18,2) NOT NULL COMMENT '价格',
  `RecentMonthPrice` decimal(18,2) NOT NULL COMMENT '最近一个月的价格',
  `StartTime` datetime NOT NULL COMMENT '开始日期',
  `EndTime` datetime NOT NULL COMMENT '结束日期',
  `Stock` int(11) NOT NULL COMMENT '库存',
  `SaleCount` int(11) NOT NULL COMMENT '销售数量',
  `CancelReson` text NOT NULL COMMENT '取消原因',
  `MaxSaleCount` int(11) NOT NULL COMMENT '限量购买',
  `ProductAd` varchar(100) NOT NULL COMMENT '商品广告',
  `MinPrice` decimal(18,2) NOT NULL COMMENT '最小价格',
  `ImagePath` varchar(100) NOT NULL COMMENT '图片Path',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_limittimemarket
-- ----------------------------

-- ----------------------------
-- Table structure for himall_logs
-- ----------------------------
DROP TABLE IF EXISTS `himall_logs`;
CREATE TABLE `himall_logs` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `PageUrl` varchar(1000) NOT NULL,
  `Date` datetime NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `IPAddress` varchar(100) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5990 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_logs
-- ----------------------------
INSERT INTO `himall_logs` VALUES ('5755', '0', 'ProductType/SaveModel', '2017-07-27 12:15:47', 'admin', '127.0.0.1', '修改平台类目,操作记录:id:0 ');
INSERT INTO `himall_logs` VALUES ('5756', '0', 'Category/Add', '2017-07-27 12:15:57', 'admin', '127.0.0.1', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5757', '0', 'Category/Add', '2017-07-27 12:16:33', 'admin', '127.0.0.1', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5758', '0', 'Category/Add', '2017-07-27 12:16:43', 'admin', '127.0.0.1', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5759', '0', '/Shop/Auditing/346', '2017-07-27 12:17:10', 'admin', '127.0.0.1', '开店审核页面，店铺Id=346,状态为：Open, 说明是：');
INSERT INTO `himall_logs` VALUES ('5760', '0', '/Shop/Edit/346', '2017-07-27 12:17:25', 'admin', '127.0.0.1', '修改店铺信息，Id=346');
INSERT INTO `himall_logs` VALUES ('5761', '346', '/ShopBranch/Setting', '2017-07-27 12:18:03', 'love1001', '127.0.0.1', '开启:订单自动分配到门店');
INSERT INTO `himall_logs` VALUES ('5762', '0', 'ProductType/SaveModel', '2017-08-28 15:35:25', 'admin', '123.4.39.143', '??????,????:id:0 ');
INSERT INTO `himall_logs` VALUES ('5763', '0', 'ProductType/SaveModel', '2017-08-28 15:35:37', 'admin', '123.4.39.143', '??????,????:id:0 ');
INSERT INTO `himall_logs` VALUES ('5764', '0', 'ProductType/SaveModel', '2017-08-28 15:35:49', 'admin', '123.4.39.143', '??????,????:id:92 ');
INSERT INTO `himall_logs` VALUES ('5765', '0', 'ProductType/SaveModel', '2017-08-28 15:36:13', 'admin', '123.4.39.143', '??????,????:id:0 ');
INSERT INTO `himall_logs` VALUES ('5766', '0', 'ProductType/DeleteType', '2017-08-28 16:08:48', 'admin', '183.205.6.123', '删除平台类目,操作记录:id:90 ');
INSERT INTO `himall_logs` VALUES ('5767', '0', 'category/DeleteCategoryById', '2017-08-28 16:08:58', 'admin', '183.205.6.123', '删除平台分类,操作记录:Id:3 ');
INSERT INTO `himall_logs` VALUES ('5768', '0', 'category/DeleteCategoryById', '2017-08-28 16:09:01', 'admin', '183.205.6.123', '删除平台分类,操作记录:Id:2 ');
INSERT INTO `himall_logs` VALUES ('5769', '0', 'ProductType/DeleteType', '2017-08-28 16:09:04', 'admin', '183.205.6.123', '删除平台类目,操作记录:id:90 ');
INSERT INTO `himall_logs` VALUES ('5770', '0', 'ProductType/DeleteType', '2017-08-28 16:09:08', 'admin', '183.205.6.123', '删除平台类目,操作记录:id:90 ');
INSERT INTO `himall_logs` VALUES ('5771', '0', 'ProductType/SaveModel', '2017-08-28 16:10:48', 'admin', '183.205.6.123', '修改平台类目,操作记录:id:90 ');
INSERT INTO `himall_logs` VALUES ('5772', '0', 'ProductType/DeleteType', '2017-08-28 16:11:14', 'admin', '183.205.6.123', '删除平台类目,操作记录:id:92 ');
INSERT INTO `himall_logs` VALUES ('5773', '0', 'ProductType/DeleteType', '2017-08-28 16:11:16', 'admin', '183.205.6.123', '删除平台类目,操作记录:id:93 ');
INSERT INTO `himall_logs` VALUES ('5774', '0', 'Brand/Edit', '2017-08-28 16:12:02', 'admin', '123.4.39.143', '编辑品牌,操作记录:');
INSERT INTO `himall_logs` VALUES ('5775', '0', 'ProductType/SaveModel', '2017-08-28 16:12:32', 'admin', '123.4.39.143', '修改平台类目,操作记录:id:0 ');
INSERT INTO `himall_logs` VALUES ('5776', '0', 'ProductType/SaveModel', '2017-08-28 16:12:40', 'admin', '123.4.39.143', '修改平台类目,操作记录:id:0 ');
INSERT INTO `himall_logs` VALUES ('5777', '0', 'ProductType/SaveModel', '2017-08-28 16:12:51', 'admin', '123.4.39.143', '修改平台类目,操作记录:id:0 ');
INSERT INTO `himall_logs` VALUES ('5778', '0', 'Brand/Edit', '2017-08-28 16:28:55', 'admin', '123.4.39.143', '编辑品牌,操作记录:');
INSERT INTO `himall_logs` VALUES ('5779', '0', 'ProductType/SaveModel', '2017-08-28 16:36:04', 'admin', '123.4.39.143', '修改平台类目,操作记录:id:96 ');
INSERT INTO `himall_logs` VALUES ('5780', '0', 'ProductType/SaveModel', '2017-08-28 16:36:20', 'admin', '123.4.39.143', '修改平台类目,操作记录:id:0 ');
INSERT INTO `himall_logs` VALUES ('5781', '0', 'ProductType/SaveModel', '2017-08-28 16:36:31', 'admin', '123.4.39.143', '修改平台类目,操作记录:id:0 ');
INSERT INTO `himall_logs` VALUES ('5782', '0', 'ProductType/SaveModel', '2017-08-28 16:36:53', 'admin', '123.4.39.143', '修改平台类目,操作记录:id:0 ');
INSERT INTO `himall_logs` VALUES ('5783', '0', 'ProductType/SaveModel', '2017-08-28 16:37:09', 'admin', '123.4.39.143', '修改平台类目,操作记录:id:0 ');
INSERT INTO `himall_logs` VALUES ('5784', '0', 'ProductType/SaveModel', '2017-08-28 16:37:34', 'admin', '123.4.39.143', '修改平台类目,操作记录:id:0 ');
INSERT INTO `himall_logs` VALUES ('5785', '0', 'ProductType/SaveModel', '2017-08-28 16:38:22', 'admin', '123.4.39.143', '修改平台类目,操作记录:id:0 ');
INSERT INTO `himall_logs` VALUES ('5786', '0', 'ProductType/SaveModel', '2017-08-28 16:38:33', 'admin', '123.4.39.143', '修改平台类目,操作记录:id:0 ');
INSERT INTO `himall_logs` VALUES ('5787', '0', 'ProductType/SaveModel', '2017-08-28 16:39:28', 'admin', '123.4.39.143', '修改平台类目,操作记录:id:0 ');
INSERT INTO `himall_logs` VALUES ('5788', '0', 'ProductType/SaveModel', '2017-08-28 16:39:54', 'admin', '123.4.39.143', '修改平台类目,操作记录:id:0 ');
INSERT INTO `himall_logs` VALUES ('5789', '0', 'ProductType/SaveModel', '2017-08-28 16:40:05', 'admin', '123.4.39.143', '修改平台类目,操作记录:id:105 ');
INSERT INTO `himall_logs` VALUES ('5790', '0', 'ProductType/SaveModel', '2017-08-28 16:41:00', 'admin', '123.4.39.143', '修改平台类目,操作记录:id:0 ');
INSERT INTO `himall_logs` VALUES ('5791', '0', 'ProductType/SaveModel', '2017-08-28 16:41:54', 'admin', '123.4.39.143', '修改平台类目,操作记录:id:0 ');
INSERT INTO `himall_logs` VALUES ('5792', '0', 'Category/Add', '2017-08-28 16:42:48', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5793', '0', 'Category/Add', '2017-08-28 16:43:12', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5794', '0', 'Category/Add', '2017-08-28 16:43:32', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5795', '0', 'Category/Add', '2017-08-28 16:43:43', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5796', '0', 'Category/Add', '2017-08-28 16:43:58', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5797', '0', 'Category/Add', '2017-08-28 16:44:08', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5798', '0', 'Category/Add', '2017-08-28 16:44:19', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5799', '0', 'Category/Add', '2017-08-28 16:44:41', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5800', '0', 'Category/Add', '2017-08-28 16:44:53', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5801', '0', 'Category/Add', '2017-08-28 16:46:08', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5802', '0', 'Category/Add', '2017-08-28 16:46:22', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5803', '0', 'Category/Add', '2017-08-28 16:53:28', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5804', '0', 'Category/Add', '2017-08-28 16:53:37', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5805', '0', 'Category/Add', '2017-08-28 16:53:45', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5806', '0', 'Category/Add', '2017-08-28 16:53:54', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5807', '0', 'Category/Add', '2017-08-28 16:54:23', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5808', '0', 'Category/Add', '2017-08-28 16:54:33', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5809', '0', 'Category/Add', '2017-08-28 16:54:48', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5810', '0', 'Category/Add', '2017-08-28 16:55:01', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5811', '0', 'Category/Add', '2017-08-28 16:55:12', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5812', '0', 'Category/Edit', '2017-08-28 16:55:25', 'admin', '123.4.39.143', '修改平台分类,操作记录:Id:23 ');
INSERT INTO `himall_logs` VALUES ('5813', '0', 'Category/Edit', '2017-08-28 16:55:32', 'admin', '123.4.39.143', '修改平台分类,操作记录:Id:23 ');
INSERT INTO `himall_logs` VALUES ('5814', '0', 'Category/Add', '2017-08-28 16:55:52', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5815', '0', 'Category/Add', '2017-08-28 16:56:14', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5816', '0', 'Category/Add', '2017-08-28 16:56:26', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5817', '0', 'Category/Add', '2017-08-28 16:56:42', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5818', '0', 'Category/Add', '2017-08-28 16:56:47', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5819', '0', 'Category/Add', '2017-08-28 16:56:56', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5820', '0', 'Category/Add', '2017-08-28 16:57:36', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5821', '0', 'Category/Add', '2017-08-28 16:57:55', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5822', '0', 'Category/Add', '2017-08-28 16:58:04', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5823', '0', 'Category/Add', '2017-08-28 16:58:15', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5824', '0', 'Category/Add', '2017-08-28 16:58:33', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5825', '0', 'Category/Add', '2017-08-28 16:58:43', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5826', '0', 'Category/Add', '2017-08-28 16:59:05', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5827', '0', 'Category/Add', '2017-08-28 16:59:21', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5828', '0', 'Category/Add', '2017-08-28 16:59:37', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5829', '0', 'Category/Add', '2017-08-28 16:59:52', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5830', '0', 'Category/Add', '2017-08-28 17:00:06', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5831', '0', 'Category/Add', '2017-08-28 17:00:19', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5832', '0', 'Category/Add', '2017-08-28 17:00:38', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5833', '0', 'Category/Add', '2017-08-28 17:00:55', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5834', '0', 'Category/Add', '2017-08-28 17:01:09', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5835', '0', 'Category/Add', '2017-08-28 17:01:22', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5836', '0', 'Category/Add', '2017-08-28 17:01:32', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5837', '0', 'Category/Add', '2017-08-28 17:01:50', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5838', '0', 'Category/Add', '2017-08-28 17:02:00', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5839', '0', 'Category/Add', '2017-08-28 17:02:17', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5840', '0', 'Category/Add', '2017-08-28 17:02:32', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5841', '0', 'Category/Add', '2017-08-28 17:02:38', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5842', '0', 'Category/Add', '2017-08-28 17:03:30', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5843', '0', 'Category/Add', '2017-08-28 17:03:56', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5844', '0', 'Category/Add', '2017-08-28 17:04:04', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5845', '0', 'Category/Add', '2017-08-28 17:04:16', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5846', '0', 'Category/Add', '2017-08-28 17:04:36', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5847', '0', 'Category/Add', '2017-08-28 17:04:48', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5848', '0', 'Category/Add', '2017-08-28 17:04:58', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5849', '0', 'Category/Add', '2017-08-28 17:05:24', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5850', '0', 'Category/Add', '2017-08-28 17:05:34', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5851', '0', 'Category/Add', '2017-08-28 17:05:47', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5852', '0', 'Category/Add', '2017-08-28 17:06:06', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5853', '0', 'Category/Add', '2017-08-28 17:06:18', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5854', '0', 'Category/Add', '2017-08-28 17:06:31', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5855', '0', 'Category/Add', '2017-08-28 17:07:05', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5856', '0', 'Category/Add', '2017-08-28 17:07:28', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5857', '0', 'Category/Add', '2017-08-28 17:07:35', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5858', '0', 'Category/Add', '2017-08-28 17:07:48', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5859', '0', 'Category/Add', '2017-08-28 17:07:56', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5860', '0', 'Category/Add', '2017-08-28 17:08:14', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5861', '0', 'Category/Add', '2017-08-28 17:08:33', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5862', '0', 'Category/Add', '2017-08-28 17:08:47', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5863', '0', 'Category/Add', '2017-08-28 17:08:52', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5864', '0', 'Category/Add', '2017-08-28 17:09:05', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5865', '0', 'Category/Add', '2017-08-28 17:09:12', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5866', '0', 'Category/Add', '2017-08-28 17:09:22', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5867', '0', 'Category/Add', '2017-08-28 17:09:29', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5868', '0', 'Category/Add', '2017-08-28 17:09:35', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5869', '0', 'Category/Add', '2017-08-28 17:10:15', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5870', '0', 'Category/Add', '2017-08-28 17:10:22', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5871', '0', 'Category/Add', '2017-08-28 17:10:32', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5872', '0', 'Category/Add', '2017-08-28 17:10:37', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5873', '0', 'Category/Add', '2017-08-28 17:10:44', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5874', '0', 'Category/Add', '2017-08-28 17:11:26', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5875', '0', 'Category/Add', '2017-08-28 17:11:33', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5876', '0', 'Category/Add', '2017-08-28 17:11:45', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5877', '0', 'Category/Add', '2017-08-28 17:12:19', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5878', '0', 'Category/Add', '2017-08-28 17:12:36', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5879', '0', 'Category/Add', '2017-08-28 17:12:44', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5880', '0', 'Category/Add', '2017-08-28 17:12:56', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5881', '0', 'Category/Add', '2017-08-28 17:13:07', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5882', '0', 'Category/Add', '2017-08-28 17:13:22', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5883', '0', 'Category/Add', '2017-08-28 17:13:29', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5884', '0', 'Category/Add', '2017-08-28 17:13:34', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5885', '0', 'Category/Add', '2017-08-28 17:13:45', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5886', '0', 'Category/Add', '2017-08-28 17:13:52', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5887', '0', 'Category/Add', '2017-08-28 17:14:07', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5888', '0', 'Category/Add', '2017-08-28 17:14:13', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5889', '0', 'Category/Add', '2017-08-28 17:14:27', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5890', '0', 'Category/Add', '2017-08-28 17:14:33', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5891', '0', 'Category/Add', '2017-08-28 17:15:02', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5892', '0', 'Category/Add', '2017-08-28 17:15:08', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5893', '0', 'Category/Add', '2017-08-28 17:15:14', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5894', '0', 'Category/Add', '2017-08-28 17:15:23', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5895', '0', 'Category/Add', '2017-08-28 17:15:56', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5896', '0', 'Category/Add', '2017-08-28 17:16:05', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5897', '0', 'Category/Add', '2017-08-28 17:16:15', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5898', '0', 'Category/Add', '2017-08-28 17:16:29', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5899', '0', 'Category/Add', '2017-08-28 17:16:40', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5900', '0', 'Category/Add', '2017-08-28 17:16:47', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5901', '0', 'Category/Add', '2017-08-28 17:17:45', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5902', '0', 'Category/Add', '2017-08-28 17:23:42', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5903', '0', 'Category/Add', '2017-08-28 17:24:01', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5904', '0', 'Category/Add', '2017-08-28 17:24:12', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5905', '0', 'Category/Add', '2017-08-28 17:24:24', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5906', '0', 'Category/Add', '2017-08-28 17:24:41', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5907', '0', 'Category/Add', '2017-08-28 17:24:51', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5908', '0', 'Category/Add', '2017-08-28 17:24:57', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5909', '0', 'Category/Add', '2017-08-28 17:25:07', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5910', '0', 'Category/Add', '2017-08-28 17:25:18', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5911', '0', 'Category/Add', '2017-08-28 17:28:47', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5912', '0', 'Category/Add', '2017-08-28 17:28:56', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5913', '0', 'Category/Add', '2017-08-28 17:29:11', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5914', '0', 'Category/Add', '2017-08-28 17:29:19', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5915', '0', 'Category/Add', '2017-08-28 17:29:39', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5916', '0', 'Category/Add', '2017-08-28 17:30:00', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5917', '0', 'Category/Add', '2017-08-28 17:30:34', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5918', '0', 'Category/Add', '2017-08-28 17:30:46', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5919', '0', 'Category/Add', '2017-08-28 17:31:02', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5920', '0', 'Category/Add', '2017-08-28 17:31:20', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5921', '0', 'Category/Add', '2017-08-28 17:31:33', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5922', '0', 'Category/Add', '2017-08-28 17:32:01', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5923', '0', 'Category/Add', '2017-08-28 17:32:21', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5924', '0', 'Category/Add', '2017-08-28 17:32:48', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5925', '0', 'Category/Add', '2017-08-28 17:32:58', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5926', '0', 'Category/Add', '2017-08-28 17:33:08', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5927', '0', 'Category/Add', '2017-08-28 17:33:20', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5928', '0', 'Category/Add', '2017-08-28 17:33:26', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5929', '0', 'Category/Add', '2017-08-28 17:33:36', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5930', '0', 'Category/Add', '2017-08-28 17:33:44', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5931', '0', 'Category/Add', '2017-08-28 17:33:59', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5932', '0', 'Category/Add', '2017-08-28 17:34:04', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5933', '0', 'Category/Add', '2017-08-28 17:34:10', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5934', '0', 'Category/Add', '2017-08-28 17:34:26', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5935', '0', 'Category/Add', '2017-08-28 17:34:39', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5936', '0', 'Category/Add', '2017-08-28 17:34:48', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5937', '0', 'Category/Add', '2017-08-28 17:34:57', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5938', '0', 'Category/Add', '2017-08-28 17:35:12', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5939', '0', 'Category/Add', '2017-08-28 17:35:27', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5940', '0', 'Category/Add', '2017-08-28 17:35:33', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5941', '0', 'Category/Add', '2017-08-28 17:35:48', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5942', '0', 'Category/Add', '2017-08-28 17:35:53', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5943', '0', 'Category/Add', '2017-08-28 17:36:04', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5944', '0', 'Category/Add', '2017-08-28 17:36:12', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5945', '0', 'Category/Add', '2017-08-28 17:36:25', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5946', '0', 'Category/Add', '2017-08-28 17:36:31', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5947', '0', 'Category/Add', '2017-08-28 17:36:42', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5948', '0', 'Category/Add', '2017-08-28 17:36:50', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5949', '0', 'Category/Add', '2017-08-28 17:37:08', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5950', '0', 'Category/Add', '2017-08-28 17:37:28', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5951', '0', 'Category/Add', '2017-08-28 17:37:41', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5952', '0', '/Shop/Auditing/347', '2017-08-29 09:32:24', 'admin', '123.4.39.143', '开店审核页面，店铺Id=347,状态为：Open, 说明是：');
INSERT INTO `himall_logs` VALUES ('5953', '0', '/Shop/Edit/347', '2017-08-29 09:35:31', 'admin', '123.4.39.143', '修改店铺信息，Id=347');
INSERT INTO `himall_logs` VALUES ('5954', '0', '/Shop/Edit/347', '2017-08-29 09:38:07', 'admin', '183.205.6.123', '修改店铺信息，Id=347');
INSERT INTO `himall_logs` VALUES ('5955', '0', '/Shop/Edit/347', '2017-08-29 09:38:28', 'admin', '183.205.6.123', '修改店铺信息，Id=347');
INSERT INTO `himall_logs` VALUES ('5956', '347', '/Product/Create', '2017-08-29 09:44:20', '御风飞自营店', '123.4.39.143', '商家发布商品，Id=0, 名称=【新天地】湘岳香辣鱼仔85g 毛毛鱼 湖南特产小鱼休闲下饭菜即食 [失败]');
INSERT INTO `himall_logs` VALUES ('5957', '347', '/Product/Create', '2017-08-29 09:44:36', '御风飞自营店', '123.4.39.143', '商家发布商品，Id=0, 名称=【新天地】湘岳香辣鱼仔85g 毛毛鱼 湖南特产小鱼休闲下饭菜即食 [失败]');
INSERT INTO `himall_logs` VALUES ('5958', '347', '/Product/Create', '2017-08-29 09:44:42', '御风飞自营店', '123.4.39.143', '商家发布商品，Id=0, 名称=【新天地】湘岳香辣鱼仔85g 毛毛鱼 湖南特产小鱼休闲下饭菜即食 [失败]');
INSERT INTO `himall_logs` VALUES ('5959', '0', 'product/BatchAudit', '2017-08-29 09:45:52', 'admin', '123.4.39.143', '批量审核商品状态,操作记录:');
INSERT INTO `himall_logs` VALUES ('5960', '347', '/Product/Delete', '2017-08-29 10:11:09', '御风飞自营店', '123.4.39.143', '商家删除商品，Ids=1160');
INSERT INTO `himall_logs` VALUES ('5961', '347', '/Product/Delete', '2017-08-29 10:11:58', '御风飞自营店', '123.4.39.143', '商家删除商品，Ids=1159,1158');
INSERT INTO `himall_logs` VALUES ('5962', '347', '/Product/Create', '2017-08-29 10:14:00', '御风飞自营店', '123.4.39.143', '商家发布商品，Id=0, 名称=【新天地】湘岳香辣鱼仔85g 毛毛鱼 湖南特产小鱼休闲下饭菜即食 [失败]');
INSERT INTO `himall_logs` VALUES ('5963', '0', 'product/BatchAudit', '2017-08-29 10:14:30', 'admin', '123.4.39.143', '批量审核商品状态,操作记录:');
INSERT INTO `himall_logs` VALUES ('5964', '347', '/Product/Create', '2017-08-29 10:17:01', '御风飞自营店', '123.4.39.143', '商家发布商品，Id=0, 名称=1111 [成功]');
INSERT INTO `himall_logs` VALUES ('5965', '347', '/Product/Delete', '2017-08-29 10:17:19', '御风飞自营店', '123.4.39.143', '商家删除商品，Ids=1162');
INSERT INTO `himall_logs` VALUES ('5966', '347', '/Product/Create', '2017-08-29 10:20:57', '御风飞自营店', '123.4.39.143', '商家发布商品，Id=0, 名称=【巴黎贝尔】三明治 [成功]');
INSERT INTO `himall_logs` VALUES ('5967', '0', 'product/BatchAudit', '2017-08-29 10:21:09', 'admin', '123.4.39.143', '批量审核商品状态,操作记录:');
INSERT INTO `himall_logs` VALUES ('5968', '347', '/Product/Create', '2017-08-29 10:25:12', '御风飞自营店', '123.4.39.143', '商家发布商品，Id=0, 名称=【惠农专区】正宗农家花生 500g/袋 [成功]');
INSERT INTO `himall_logs` VALUES ('5969', '0', 'Category/Add', '2017-08-29 10:26:21', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5970', '0', 'Category/Add', '2017-08-29 10:27:41', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5971', '0', 'Category/Add', '2017-08-29 10:28:19', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5972', '0', 'Category/Add', '2017-08-29 10:28:50', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5973', '0', '/Shop/SaveBusinessCategory?shopId=347&bcategory=21|1,31|3,32|2,33|3,38|2,39|2,40|4,41|1,42|3,43|5,44|5,45|5,46|2,47|2,48|5,49|7,50|3,51|3,6|2,7|1,8|2,11|1,12|1,151|4,152|3,153|4,154|3,155|3,156|4,157|3,158|3,163|2,164|2,165|1', '2017-08-29 10:30:38', 'admin', '123.4.39.143', '修改店铺经营类目，店铺Id=347');
INSERT INTO `himall_logs` VALUES ('5974', '347', '/Product/Create', '2017-08-29 10:39:38', '御风飞自营店', '123.4.39.143', '商家发布商品，Id=0, 名称=【新天地】北京红星二锅头53度蓝瓶八年陈酿500ml [成功]');
INSERT INTO `himall_logs` VALUES ('5975', '347', '/Product/Create', '2017-08-29 10:42:55', '御风飞自营店', '123.4.39.143', '商家发布商品，Id=0, 名称=【新天地】通化野生原汁葡萄酒1000ml [成功]');
INSERT INTO `himall_logs` VALUES ('5976', '347', '/Product/Create', '2017-08-29 10:46:18', '御风飞自营店', '123.4.39.143', '商家发布商品，Id=0, 名称=【自营】青岛崂山啤酒600ml *9瓶 膜装 [成功]');
INSERT INTO `himall_logs` VALUES ('5977', '0', 'product/BatchAudit', '2017-08-29 10:46:44', 'admin', '123.4.39.143', '批量审核商品状态,操作记录:');
INSERT INTO `himall_logs` VALUES ('5978', '0', 'Category/Add', '2017-08-29 11:02:31', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5979', '0', 'Category/Add', '2017-08-29 11:02:52', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5980', '0', 'Category/Add', '2017-08-29 11:03:02', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5981', '0', 'Category/Add', '2017-08-29 11:03:13', 'admin', '123.4.39.143', '添加平台分类,操作记录:');
INSERT INTO `himall_logs` VALUES ('5982', '0', '/Shop/SaveBusinessCategory?shopId=347&bcategory=21|1,31|3,32|2,33|3,38|2,39|2,40|4,41|1,42|3,43|5,44|5,45|5,46|2,47|2,48|5,49|7,50|3,51|3,6|2,7|1,8|2,11|1,12|1,151|4,152|3,153|4,154|3,155|3,156|4,157|3,158|3,163|2,164|2,165|1,167|1,168|1,169|1', '2017-08-29 11:04:01', 'admin', '123.4.39.143', '修改店铺经营类目，店铺Id=347');
INSERT INTO `himall_logs` VALUES ('5983', '347', '/Product/Create', '2017-08-29 11:15:06', '御风飞自营店', '123.4.39.143', '商家发布商品，Id=0, 名称=男士2017秋季新款韩版修身长袖T恤青少年潮流帅气个性打底衫衣服 [成功]');
INSERT INTO `himall_logs` VALUES ('5984', '347', '/Product/Create', '2017-08-29 11:20:59', '御风飞自营店', '123.4.39.143', '商家发布商品，Id=0, 名称=毛衣男春秋季韩版男士潮流长袖针织衫开衫毛线衣男青年休闲外套男 [成功]');
INSERT INTO `himall_logs` VALUES ('5985', '347', '/Product/Create', '2017-08-29 11:24:08', '御风飞自营店', '123.4.39.143', '商家发布商品，Id=0, 名称=思莱德夏季新款休闲男士棉质锥形版牛仔裤C|417232508 [成功]');
INSERT INTO `himall_logs` VALUES ('5986', '0', 'product/BatchAudit', '2017-08-29 11:24:35', 'admin', '123.4.39.143', '批量审核商品状态,操作记录:');
INSERT INTO `himall_logs` VALUES ('5987', '0', '/Shop/SaveBusinessCategory?shopId=347&bcategory=21|1,31|3,32|2,33|3,38|2,39|2,40|4,41|1,42|3,43|5,44|5,45|5,46|2,47|2,48|5,49|7,50|3,51|3,6|2,7|1,8|2,11|1,12|1,151|4,152|3,153|4,154|3,155|3,156|4,157|3,158|3,163|2,164|2,165|1,167|1,168|1,169|1,18|2', '2017-08-29 11:26:04', 'admin', '123.4.39.143', '修改店铺经营类目，店铺Id=347');
INSERT INTO `himall_logs` VALUES ('5988', '347', '/Product/Create', '2017-08-29 11:29:00', '御风飞自营店', '123.4.39.143', '商家发布商品，Id=0, 名称=毛衣女秋冬中长款半高领宽松打底衫韩版套头长袖针织衫新款潮外套 [成功]');
INSERT INTO `himall_logs` VALUES ('5989', '0', 'product/BatchAudit', '2017-08-29 11:29:05', 'admin', '123.4.39.143', '批量审核商品状态,操作记录:');

-- ----------------------------
-- Table structure for himall_managers
-- ----------------------------
DROP TABLE IF EXISTS `himall_managers`;
CREATE TABLE `himall_managers` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `RoleId` bigint(20) NOT NULL COMMENT '角色ID',
  `UserName` varchar(100) NOT NULL COMMENT '用户名称',
  `Password` varchar(100) NOT NULL COMMENT '密码',
  `PasswordSalt` varchar(100) NOT NULL COMMENT '密码加盐',
  `CreateDate` datetime NOT NULL COMMENT '创建日期',
  `Remark` varchar(1000) DEFAULT NULL,
  `RealName` varchar(1000) DEFAULT NULL COMMENT '真实名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_managers
-- ----------------------------
INSERT INTO `himall_managers` VALUES ('419', '1', '0', 'selleradmin', '7eab927eb13130ed1cc554cc50763695', '15d86e2e-b4b5-45bf-8b3c-c5b187638df1', '2017-07-27 00:00:00', null, null);
INSERT INTO `himall_managers` VALUES ('420', '0', '0', 'admin', 'b379a558afb2d95392194bf189b97e29', '15d86e2e-b4b5-45bf-8b3c-c5b187638df1', '2017-07-27 00:00:00', null, null);
INSERT INTO `himall_managers` VALUES ('421', '346', '0', 'love1001', 'ac21bdd82041800ca12121062e4af7d7', '47119fc62477a669e8c1', '2017-07-27 11:57:51', null, null);
INSERT INTO `himall_managers` VALUES ('422', '347', '0', '御风飞自营店', '35a940f7b147f5f90d660d06a56ffc0a', '48898f07e2f69a61d832', '2017-08-29 08:59:00', null, null);

-- ----------------------------
-- Table structure for himall_marketservicerecord
-- ----------------------------
DROP TABLE IF EXISTS `himall_marketservicerecord`;
CREATE TABLE `himall_marketservicerecord` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MarketServiceId` bigint(20) NOT NULL,
  `StartTime` datetime NOT NULL COMMENT '开始时间',
  `EndTime` datetime NOT NULL COMMENT '结束时间',
  `BuyTime` datetime NOT NULL COMMENT '购买时间',
  `SettlementFlag` int(16) unsigned zerofill NOT NULL,
  `Price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '服务购买价格',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_MarketServiceRecord_Himall_ActiveMarketService` (`MarketServiceId`) USING BTREE,
  CONSTRAINT `himall_marketservicerecord_ibfk_1` FOREIGN KEY (`MarketServiceId`) REFERENCES `himall_activemarketservice` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_marketservicerecord
-- ----------------------------

-- ----------------------------
-- Table structure for himall_marketsetting
-- ----------------------------
DROP TABLE IF EXISTS `himall_marketsetting`;
CREATE TABLE `himall_marketsetting` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TypeId` int(11) NOT NULL COMMENT '营销类型ID',
  `Price` decimal(18,2) NOT NULL COMMENT '营销使用价格（/月）',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_marketsetting
-- ----------------------------

-- ----------------------------
-- Table structure for himall_marketsettingmeta
-- ----------------------------
DROP TABLE IF EXISTS `himall_marketsettingmeta`;
CREATE TABLE `himall_marketsettingmeta` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MarketId` int(11) NOT NULL,
  `MetaKey` varchar(100) NOT NULL,
  `MetaValue` text,
  PRIMARY KEY (`Id`),
  KEY `FK_Hiamll_MarketSettingMeta_ToSetting` (`MarketId`) USING BTREE,
  CONSTRAINT `himall_marketsettingmeta_ibfk_1` FOREIGN KEY (`MarketId`) REFERENCES `himall_marketsetting` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_marketsettingmeta
-- ----------------------------

-- ----------------------------
-- Table structure for himall_memberactivitydegree
-- ----------------------------
DROP TABLE IF EXISTS `himall_memberactivitydegree`;
CREATE TABLE `himall_memberactivitydegree` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL DEFAULT '0' COMMENT '会员编号',
  `OneMonth` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否为一个月活跃用户',
  `ThreeMonth` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否为三个月活跃用户',
  `SixMonth` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否为六个月活跃用户',
  `OneMonthEffectiveTime` datetime DEFAULT NULL COMMENT '一个月活跃会员有效时间',
  `ThreeMonthEffectiveTime` datetime DEFAULT NULL COMMENT '三个月活跃会员有效时间',
  `SixMonthEffectiveTime` datetime DEFAULT NULL COMMENT '六个月活跃会员有效时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_memberactivitydegree
-- ----------------------------

-- ----------------------------
-- Table structure for himall_memberbuycategory
-- ----------------------------
DROP TABLE IF EXISTS `himall_memberbuycategory`;
CREATE TABLE `himall_memberbuycategory` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '会员ID',
  `CategoryId` bigint(20) NOT NULL COMMENT '类别ID',
  `OrdersCount` int(11) NOT NULL DEFAULT '0' COMMENT '购买次数',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_memberbuycategory
-- ----------------------------
INSERT INTO `himall_memberbuycategory` VALUES ('70', '639', '13', '2');

-- ----------------------------
-- Table structure for himall_memberconsumestatistics
-- ----------------------------
DROP TABLE IF EXISTS `himall_memberconsumestatistics`;
CREATE TABLE `himall_memberconsumestatistics` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL,
  `ShopId` bigint(20) NOT NULL COMMENT '门店Id',
  `NetAmount` decimal(10,2) NOT NULL COMMENT '净消费金额(退款需要维护)',
  `OrderNumber` bigint(20) NOT NULL COMMENT '消费次数(退款不维护)',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_memberconsumestatistics
-- ----------------------------

-- ----------------------------
-- Table structure for himall_membercontacts
-- ----------------------------
DROP TABLE IF EXISTS `himall_membercontacts`;
CREATE TABLE `himall_membercontacts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `UserType` int(11) NOT NULL COMMENT '用户类型(0 Email  1 SMS)',
  `ServiceProvider` varchar(100) NOT NULL COMMENT '插件名称',
  `Contact` varchar(100) NOT NULL COMMENT '联系号码',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_membercontacts
-- ----------------------------
INSERT INTO `himall_membercontacts` VALUES ('345', '638', '0', 'Himall.Plugin.Message.Email', '513260905@qq.com');

-- ----------------------------
-- Table structure for himall_membergrade
-- ----------------------------
DROP TABLE IF EXISTS `himall_membergrade`;
CREATE TABLE `himall_membergrade` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `GradeName` varchar(100) NOT NULL COMMENT '会员等级名称',
  `Integral` int(11) NOT NULL COMMENT '该等级所需积分',
  `Remark` varchar(1000) DEFAULT NULL COMMENT '描述',
  `Discount` decimal(8,2) NOT NULL DEFAULT '10.00',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_membergrade
-- ----------------------------

-- ----------------------------
-- Table structure for himall_membergroup
-- ----------------------------
DROP TABLE IF EXISTS `himall_membergroup`;
CREATE TABLE `himall_membergroup` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `ShopId` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店编号',
  `StatisticsType` int(11) NOT NULL COMMENT '统计类型',
  `Total` int(11) NOT NULL COMMENT '统计数量',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_membergroup
-- ----------------------------

-- ----------------------------
-- Table structure for himall_memberintegral
-- ----------------------------
DROP TABLE IF EXISTS `himall_memberintegral`;
CREATE TABLE `himall_memberintegral` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MemberId` bigint(20) DEFAULT NULL COMMENT '会员ID',
  `UserName` varchar(100) NOT NULL COMMENT '用户名称',
  `HistoryIntegrals` int(11) NOT NULL COMMENT '用户历史积分',
  `AvailableIntegrals` int(11) NOT NULL COMMENT '用户可用积分',
  PRIMARY KEY (`Id`),
  KEY `FK_Member_MemberIntegral` (`MemberId`) USING BTREE,
  CONSTRAINT `himall_memberintegral_ibfk_1` FOREIGN KEY (`MemberId`) REFERENCES `himall_members` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_memberintegral
-- ----------------------------

-- ----------------------------
-- Table structure for himall_memberintegralexchangerules
-- ----------------------------
DROP TABLE IF EXISTS `himall_memberintegralexchangerules`;
CREATE TABLE `himall_memberintegralexchangerules` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IntegralPerMoney` int(11) NOT NULL COMMENT '一块钱对应多少积分',
  `MoneyPerIntegral` int(11) NOT NULL COMMENT '一个积分对应多少钱',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_memberintegralexchangerules
-- ----------------------------

-- ----------------------------
-- Table structure for himall_memberintegralrecord
-- ----------------------------
DROP TABLE IF EXISTS `himall_memberintegralrecord`;
CREATE TABLE `himall_memberintegralrecord` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MemberId` bigint(20) NOT NULL,
  `UserName` varchar(100) NOT NULL COMMENT '用户名称',
  `TypeId` int(11) NOT NULL COMMENT '兑换类型（登录、下单等）',
  `Integral` int(11) NOT NULL COMMENT '积分数量',
  `RecordDate` datetime DEFAULT NULL COMMENT '记录日期',
  `ReMark` varchar(100) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`Id`),
  KEY `fk_MemberId_Members` (`MemberId`) USING BTREE,
  CONSTRAINT `himall_memberintegralrecord_ibfk_1` FOREIGN KEY (`MemberId`) REFERENCES `himall_members` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2148 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_memberintegralrecord
-- ----------------------------

-- ----------------------------
-- Table structure for himall_memberintegralrecordaction
-- ----------------------------
DROP TABLE IF EXISTS `himall_memberintegralrecordaction`;
CREATE TABLE `himall_memberintegralrecordaction` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IntegralRecordId` bigint(20) NOT NULL COMMENT '积分兑换ID',
  `VirtualItemTypeId` int(11) DEFAULT NULL COMMENT '兑换虚拟物l类型ID',
  `VirtualItemId` bigint(20) NOT NULL COMMENT '虚拟物ID',
  PRIMARY KEY (`Id`),
  KEY `fk_IntegralRecordId_MemberIntegralRecord` (`IntegralRecordId`) USING BTREE,
  CONSTRAINT `himall_memberintegralrecordaction_ibfk_1` FOREIGN KEY (`IntegralRecordId`) REFERENCES `himall_memberintegralrecord` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=533 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_memberintegralrecordaction
-- ----------------------------

-- ----------------------------
-- Table structure for himall_memberintegralrule
-- ----------------------------
DROP TABLE IF EXISTS `himall_memberintegralrule`;
CREATE TABLE `himall_memberintegralrule` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `TypeId` int(11) NOT NULL COMMENT '积分规则类型ID',
  `Integral` int(11) NOT NULL COMMENT '规则对应的积分数量',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_memberintegralrule
-- ----------------------------
INSERT INTO `himall_memberintegralrule` VALUES ('1', '5', '0');
INSERT INTO `himall_memberintegralrule` VALUES ('2', '6', '0');
INSERT INTO `himall_memberintegralrule` VALUES ('3', '7', '0');
INSERT INTO `himall_memberintegralrule` VALUES ('4', '9', '0');

-- ----------------------------
-- Table structure for himall_memberlabel
-- ----------------------------
DROP TABLE IF EXISTS `himall_memberlabel`;
CREATE TABLE `himall_memberlabel` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `MemId` bigint(20) NOT NULL COMMENT '会员ID',
  `LabelId` bigint(20) NOT NULL COMMENT '标签Id',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=397 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_memberlabel
-- ----------------------------

-- ----------------------------
-- Table structure for himall_memberopenids
-- ----------------------------
DROP TABLE IF EXISTS `himall_memberopenids`;
CREATE TABLE `himall_memberopenids` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `OpenId` varchar(100) DEFAULT NULL COMMENT '微信OpenID',
  `UnionOpenId` varchar(100) DEFAULT NULL COMMENT '开发平台Openid',
  `UnionId` varchar(100) DEFAULT NULL COMMENT '开发平台Unionid',
  `ServiceProvider` varchar(100) NOT NULL COMMENT '插件名称（Himall.Plugin.OAuth.WeiXin）',
  `AppIdType` int(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Member_MemberOpenId` (`UserId`) USING BTREE,
  CONSTRAINT `himall_memberopenids_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `himall_members` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_memberopenids
-- ----------------------------

-- ----------------------------
-- Table structure for himall_members
-- ----------------------------
DROP TABLE IF EXISTS `himall_members`;
CREATE TABLE `himall_members` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL COMMENT '名称',
  `Password` varchar(100) NOT NULL COMMENT '密码',
  `PasswordSalt` varchar(100) NOT NULL COMMENT '密码加盐',
  `Nick` varchar(50) DEFAULT NULL COMMENT '昵称',
  `Sex` int(11) DEFAULT NULL COMMENT '性别',
  `Email` varchar(100) DEFAULT NULL COMMENT '邮件',
  `CreateDate` datetime NOT NULL COMMENT '创建日期',
  `TopRegionId` int(11) NOT NULL COMMENT '省份ID',
  `RegionId` int(11) NOT NULL COMMENT '省市区ID',
  `RealName` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `CellPhone` varchar(100) DEFAULT NULL COMMENT '电话',
  `QQ` varchar(100) DEFAULT NULL COMMENT 'QQ',
  `Address` varchar(100) DEFAULT NULL COMMENT '街道地址',
  `Disabled` tinyint(1) NOT NULL COMMENT '是否禁用',
  `LastLoginDate` datetime NOT NULL COMMENT '最后登录日期',
  `OrderNumber` int(11) NOT NULL COMMENT '下单次数',
  `TotalAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '总消费金额（不排除退款）',
  `Expenditure` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '总消费金额（不排除退款）',
  `Points` int(11) NOT NULL,
  `Photo` varchar(100) DEFAULT NULL COMMENT '头像',
  `ParentSellerId` bigint(20) NOT NULL DEFAULT '0' COMMENT '商家父账号ID',
  `Remark` varchar(1000) DEFAULT NULL,
  `PayPwd` varchar(100) DEFAULT NULL COMMENT '支付密码',
  `PayPwdSalt` varchar(100) DEFAULT NULL COMMENT '支付密码加密字符',
  `InviteUserId` bigint(20) DEFAULT NULL,
  `ShareUserId` bigint(20) DEFAULT NULL COMMENT '分销员Id',
  `BirthDay` date DEFAULT NULL COMMENT '会员生日',
  `Occupation` varchar(15) DEFAULT NULL COMMENT '职业',
  `NetAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '净消费金额（排除退款）',
  `LastConsumptionTime` datetime DEFAULT NULL COMMENT '最后消费时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_UserName` (`UserName`) USING BTREE,
  KEY `IX_Email` (`Email`) USING BTREE,
  KEY `IX_CellPhone` (`CellPhone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=640 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_members
-- ----------------------------
INSERT INTO `himall_members` VALUES ('636', 'selleradmin', '7eab927eb13130ed1cc554cc50763695', '7eab927eb13130ed1cc554cc50763695', null, null, null, '2017-07-27 00:00:00', '0', '0', null, null, null, null, '0', '2017-07-27 00:00:00', '0', '0.00', '0.00', '0', null, '0', null, null, '', null, null, null, null, '0.00', null);
INSERT INTO `himall_members` VALUES ('637', 'love1001', 'ac21bdd82041800ca12121062e4af7d7', '47119fc62477a669e8c1', 'love1001', null, null, '2017-07-27 11:57:33', '0', '0', 'love1001', null, null, null, '0', '2017-07-27 11:57:33', '0', '0.00', '0.00', '0', null, '0', null, null, null, null, null, null, null, '0.00', null);
INSERT INTO `himall_members` VALUES ('638', '御风飞自营店', '35a940f7b147f5f90d660d06a56ffc0a', '48898f07e2f69a61d832', '御风飞自营店', null, '513260905@qq.com', '2017-08-29 08:58:23', '0', '0', '御风飞自营店', null, null, null, '0', '2017-08-29 09:24:10', '0', '0.00', '0.00', '0', null, '0', null, null, null, null, null, null, null, '0.00', null);
INSERT INTO `himall_members` VALUES ('639', '我要买呀', 'b36bb523e01ea2d5e250244e022208b6', '4ad7a361613020d625bc', '我要买呀', null, null, '2017-08-29 11:41:47', '0', '0', '我要买呀', null, null, null, '0', '2017-08-29 11:41:47', '2', '0.00', '0.00', '0', null, '0', null, null, null, null, null, null, null, '197.00', '2017-08-29 11:48:34');

-- ----------------------------
-- Table structure for himall_membersignin
-- ----------------------------
DROP TABLE IF EXISTS `himall_membersignin`;
CREATE TABLE `himall_membersignin` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `LastSignTime` datetime DEFAULT NULL COMMENT '最近签到时间',
  `DurationDay` int(11) NOT NULL DEFAULT '0' COMMENT '持续签到天数 每周期后清零',
  `DurationDaySum` int(11) NOT NULL DEFAULT '0' COMMENT '持续签到天数总数 非连续周期清零',
  `SignDaySum` bigint(20) NOT NULL DEFAULT '0' COMMENT '签到总天数',
  PRIMARY KEY (`Id`),
  KEY `IDX_Himall_MenIn_UserId` (`UserId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_membersignin
-- ----------------------------

-- ----------------------------
-- Table structure for himall_menus
-- ----------------------------
DROP TABLE IF EXISTS `himall_menus`;
CREATE TABLE `himall_menus` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ParentId` bigint(20) NOT NULL COMMENT '上级ID',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `Title` varchar(10) NOT NULL COMMENT '标题',
  `Url` varchar(200) DEFAULT NULL COMMENT '链接地址',
  `Depth` smallint(6) NOT NULL COMMENT '深度',
  `Sequence` smallint(6) NOT NULL,
  `FullIdPath` varchar(100) NOT NULL COMMENT '全路径',
  `Platform` int(11) NOT NULL COMMENT '终端',
  `UrlType` int(11) DEFAULT NULL COMMENT 'url类型',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_menus
-- ----------------------------

-- ----------------------------
-- Table structure for himall_messagelog
-- ----------------------------
DROP TABLE IF EXISTS `himall_messagelog`;
CREATE TABLE `himall_messagelog` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) DEFAULT NULL,
  `TypeId` varchar(100) DEFAULT NULL,
  `MessageContent` char(1) DEFAULT NULL,
  `SendTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1668 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_messagelog
-- ----------------------------
INSERT INTO `himall_messagelog` VALUES ('1662', '0', '短信', '尊', '2017-07-27 12:17:09');
INSERT INTO `himall_messagelog` VALUES ('1663', '0', '短信', '尊', '2017-08-29 09:10:13');
INSERT INTO `himall_messagelog` VALUES ('1664', '0', '短信', '尊', '2017-08-29 09:12:24');
INSERT INTO `himall_messagelog` VALUES ('1665', '0', '短信', '尊', '2017-08-29 09:32:24');
INSERT INTO `himall_messagelog` VALUES ('1666', '347', '短信', '尊', '2017-08-29 11:43:41');
INSERT INTO `himall_messagelog` VALUES ('1667', '347', '短信', '尊', '2017-08-29 11:47:48');

-- ----------------------------
-- Table structure for himall_mobilehomeproducts
-- ----------------------------
DROP TABLE IF EXISTS `himall_mobilehomeproducts`;
CREATE TABLE `himall_mobilehomeproducts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `PlatFormType` int(11) NOT NULL COMMENT '终端类型(微信、WAP）',
  `Sequence` smallint(6) NOT NULL COMMENT '顺序',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_MobileHomeProducts_Himall_Products` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_mobilehomeproducts_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_mobilehomeproducts
-- ----------------------------

-- ----------------------------
-- Table structure for himall_mobilehometopics
-- ----------------------------
DROP TABLE IF EXISTS `himall_mobilehometopics`;
CREATE TABLE `himall_mobilehometopics` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `Platform` int(11) NOT NULL COMMENT '终端',
  `TopicId` bigint(20) NOT NULL COMMENT '专题ID',
  `Sequence` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `FK__Himall_Mo__Topic__02C769E9` (`TopicId`) USING BTREE,
  CONSTRAINT `himall_mobilehometopics_ibfk_1` FOREIGN KEY (`TopicId`) REFERENCES `himall_topics` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_mobilehometopics
-- ----------------------------

-- ----------------------------
-- Table structure for himall_moduleproducts
-- ----------------------------
DROP TABLE IF EXISTS `himall_moduleproducts`;
CREATE TABLE `himall_moduleproducts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ModuleId` bigint(20) NOT NULL COMMENT '模块ID',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `DisplaySequence` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Product_ModuleProduct` (`ProductId`) USING BTREE,
  KEY `FK_TopicModule_ModuleProduct` (`ModuleId`) USING BTREE,
  CONSTRAINT `himall_moduleproducts_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_moduleproducts_ibfk_2` FOREIGN KEY (`ModuleId`) REFERENCES `himall_topicmodules` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=708 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_moduleproducts
-- ----------------------------

-- ----------------------------
-- Table structure for himall_openids
-- ----------------------------
DROP TABLE IF EXISTS `himall_openids`;
CREATE TABLE `himall_openids` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `OpenId` varchar(100) NOT NULL,
  `SubscribeTime` date NOT NULL COMMENT '关注时间',
  `IsSubscribe` tinyint(1) NOT NULL COMMENT '是否关注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_openids
-- ----------------------------

-- ----------------------------
-- Table structure for himall_ordercomments
-- ----------------------------
DROP TABLE IF EXISTS `himall_ordercomments`;
CREATE TABLE `himall_ordercomments` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `OrderId` bigint(20) NOT NULL COMMENT '订单ID',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `UserName` varchar(100) NOT NULL COMMENT '用户名称',
  `CommentDate` datetime NOT NULL COMMENT '评价日期',
  `PackMark` int(11) NOT NULL COMMENT '包装评分',
  `DeliveryMark` int(11) NOT NULL COMMENT '物流评分',
  `ServiceMark` int(11) NOT NULL COMMENT '服务评分',
  PRIMARY KEY (`Id`),
  KEY `FK_Order_OrderComment` (`OrderId`) USING BTREE,
  CONSTRAINT `himall_ordercomments_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `himall_orders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_ordercomments
-- ----------------------------

-- ----------------------------
-- Table structure for himall_ordercomplaints
-- ----------------------------
DROP TABLE IF EXISTS `himall_ordercomplaints`;
CREATE TABLE `himall_ordercomplaints` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `OrderId` bigint(20) NOT NULL COMMENT '订单ID',
  `Status` int(11) NOT NULL COMMENT '审核状态',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  `ShopPhone` varchar(100) NOT NULL COMMENT '店铺联系方式',
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `UserName` varchar(100) NOT NULL COMMENT '用户名称',
  `UserPhone` varchar(100) DEFAULT NULL COMMENT '用户联系方式',
  `ComplaintDate` datetime NOT NULL COMMENT '投诉日期',
  `ComplaintReason` varchar(1000) NOT NULL COMMENT '投诉原因',
  `SellerReply` varchar(1000) DEFAULT NULL COMMENT '商家反馈信息',
  PRIMARY KEY (`Id`),
  KEY `FK_Order_OrderComplaint` (`OrderId`) USING BTREE,
  CONSTRAINT `himall_ordercomplaints_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `himall_orders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_ordercomplaints
-- ----------------------------

-- ----------------------------
-- Table structure for himall_orderexpressdata
-- ----------------------------
DROP TABLE IF EXISTS `himall_orderexpressdata`;
CREATE TABLE `himall_orderexpressdata` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CompanyCode` varchar(50) NOT NULL,
  `ExpressNumber` varchar(50) NOT NULL,
  `DataContent` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_orderexpressdata
-- ----------------------------

-- ----------------------------
-- Table structure for himall_orderitems
-- ----------------------------
DROP TABLE IF EXISTS `himall_orderitems`;
CREATE TABLE `himall_orderitems` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `OrderId` bigint(20) NOT NULL COMMENT '订单ID',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `SkuId` varchar(100) DEFAULT NULL COMMENT 'SKUId',
  `SKU` varchar(100) DEFAULT NULL COMMENT 'SKU表SKU字段',
  `Quantity` bigint(20) NOT NULL COMMENT '购买数量',
  `ReturnQuantity` bigint(20) NOT NULL COMMENT '退货数量',
  `CostPrice` decimal(18,2) NOT NULL COMMENT '成本价',
  `SalePrice` decimal(18,2) NOT NULL COMMENT '销售价',
  `DiscountAmount` decimal(18,2) NOT NULL COMMENT '优惠金额',
  `RealTotalPrice` decimal(18,2) NOT NULL COMMENT '实际应付金额',
  `RefundPrice` decimal(18,2) NOT NULL COMMENT '退款价格',
  `ProductName` varchar(100) NOT NULL COMMENT '商品名称',
  `Color` varchar(100) DEFAULT NULL COMMENT 'SKU颜色',
  `Size` varchar(100) DEFAULT NULL COMMENT 'SKU尺寸',
  `Version` varchar(100) DEFAULT NULL COMMENT 'SKU版本',
  `ThumbnailsUrl` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `CommisRate` decimal(18,2) NOT NULL COMMENT '分佣比例',
  `EnabledRefundAmount` decimal(18,2) DEFAULT NULL COMMENT '可退金额',
  `IsLimitBuy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为限时购商品',
  `DistributionRate` decimal(6,2) DEFAULT NULL COMMENT '分销比例',
  `EnabledRefundIntegral` decimal(18,2) DEFAULT NULL COMMENT '可退积分抵扣金额',
  `CouponDiscount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券抵扣金额',
  `FullDiscount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '满额减平摊到订单项的金额',
  PRIMARY KEY (`Id`),
  KEY `FK_Order_OrderItem` (`OrderId`) USING BTREE,
  CONSTRAINT `himall_orderitems_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `himall_orders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1957 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_orderitems
-- ----------------------------
INSERT INTO `himall_orderitems` VALUES ('1955', '2017082972301068', '347', '1168', '1168_831_843_0', null, '1', '0', '0.00', '59.00', '0.00', '59.00', '0.00', '男士2017秋季新款韩版修身长袖T恤青少年潮流帅气个性打底衫衣服', '蓝色', '170/88(M)', null, '/Storage/Shop/347/Products/1168', '0.01', '59.00', '0', null, '0.00', '0.00', '0.00');
INSERT INTO `himall_orderitems` VALUES ('1956', '2017082979383118', '347', '1171', '1171_828_844_0', null, '2', '0', '0.00', '69.00', '0.00', '138.00', '0.00', '毛衣女秋冬中长款半高领宽松打底衫韩版套头长袖针织衫新款潮外套', '红色', '175/92(L)', null, '/Storage/Shop/347/Products/1171', '0.02', '138.00', '0', null, '0.00', '0.00', '0.00');

-- ----------------------------
-- Table structure for himall_orderoperationlogs
-- ----------------------------
DROP TABLE IF EXISTS `himall_orderoperationlogs`;
CREATE TABLE `himall_orderoperationlogs` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `OrderId` bigint(20) NOT NULL COMMENT '订单ID',
  `Operator` varchar(100) NOT NULL COMMENT '操作者',
  `OperateDate` datetime NOT NULL COMMENT '操作日期',
  `OperateContent` varchar(1000) DEFAULT NULL COMMENT '操作内容',
  PRIMARY KEY (`Id`),
  KEY `FK_Order_OrderOperationLog` (`OrderId`) USING BTREE,
  CONSTRAINT `himall_orderoperationlogs_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `himall_orders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1473 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_orderoperationlogs
-- ----------------------------
INSERT INTO `himall_orderoperationlogs` VALUES ('1471', '2017082972301068', 'admin', '2017-08-29 11:47:16', '平台确认收到订单货款');
INSERT INTO `himall_orderoperationlogs` VALUES ('1472', '2017082979383118', 'admin', '2017-08-29 11:48:33', '平台确认收到订单货款');

-- ----------------------------
-- Table structure for himall_orderpay
-- ----------------------------
DROP TABLE IF EXISTS `himall_orderpay`;
CREATE TABLE `himall_orderpay` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PayId` bigint(20) NOT NULL,
  `OrderId` bigint(20) NOT NULL,
  `PayState` tinyint(1) unsigned zerofill NOT NULL COMMENT '支付状态',
  `PayTime` datetime DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1096 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_orderpay
-- ----------------------------

-- ----------------------------
-- Table structure for himall_orderrefundlogs
-- ----------------------------
DROP TABLE IF EXISTS `himall_orderrefundlogs`;
CREATE TABLE `himall_orderrefundlogs` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `RefundId` bigint(20) NOT NULL COMMENT '售后编号',
  `Operator` varchar(100) NOT NULL COMMENT '操作者',
  `OperateDate` datetime NOT NULL COMMENT '操作日期',
  `OperateContent` varchar(1000) DEFAULT NULL COMMENT '操作内容',
  `ApplyNumber` int(11) DEFAULT NULL COMMENT '申请次数',
  `Step` smallint(6) NOT NULL COMMENT '退款步聚(枚举:CommonModel.Enum.OrderRefundStep)',
  `Remark` varchar(255) DEFAULT NULL COMMENT '备注(买家留言/商家留言/商家拒绝原因/平台退款备注)',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8 COMMENT='订单售后日志表';

-- ----------------------------
-- Records of himall_orderrefundlogs
-- ----------------------------

-- ----------------------------
-- Table structure for himall_orderrefunds
-- ----------------------------
DROP TABLE IF EXISTS `himall_orderrefunds`;
CREATE TABLE `himall_orderrefunds` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `OrderId` bigint(20) NOT NULL COMMENT '订单ID',
  `OrderItemId` bigint(20) NOT NULL COMMENT '订单详情ID',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `Applicant` varchar(100) NOT NULL COMMENT '申请内容',
  `ContactPerson` varchar(100) DEFAULT NULL COMMENT '联系人',
  `ContactCellPhone` varchar(100) DEFAULT NULL COMMENT '联系电话',
  `RefundAccount` varchar(100) DEFAULT NULL COMMENT '退款金额',
  `ApplyDate` datetime NOT NULL COMMENT '申请时间',
  `Amount` decimal(18,2) NOT NULL COMMENT '金额',
  `Reason` varchar(1000) NOT NULL COMMENT '退款原因',
  `ReasonDetail` varchar(1000) DEFAULT NULL COMMENT '退款详情',
  `SellerAuditStatus` int(11) NOT NULL COMMENT '商家审核状态',
  `SellerAuditDate` datetime NOT NULL COMMENT '商家审核时间',
  `SellerRemark` varchar(1000) DEFAULT NULL COMMENT '商家注释',
  `ManagerConfirmStatus` int(11) NOT NULL COMMENT '平台审核状态',
  `ManagerConfirmDate` datetime NOT NULL COMMENT '平台审核时间',
  `ManagerRemark` varchar(1000) DEFAULT NULL COMMENT '平台注释',
  `IsReturn` tinyint(1) NOT NULL COMMENT '是否已经退款',
  `ExpressCompanyName` varchar(100) DEFAULT NULL COMMENT '快递公司',
  `ShipOrderNumber` varchar(100) DEFAULT NULL COMMENT '快递单号',
  `Payee` varchar(200) DEFAULT NULL COMMENT '收款人',
  `PayeeAccount` varchar(200) DEFAULT NULL COMMENT '收款人账户',
  `RefundMode` int(11) NOT NULL COMMENT '退款方式',
  `RefundPayStatus` int(11) DEFAULT NULL COMMENT '退款支付状态',
  `RefundPayType` int(11) DEFAULT NULL COMMENT '退款支付类型',
  `BuyerDeliverDate` datetime DEFAULT NULL COMMENT '买家发货时间',
  `SellerConfirmArrivalDate` datetime DEFAULT NULL COMMENT '卖家确认到货时间',
  `RefundBatchNo` varchar(30) DEFAULT NULL COMMENT '退款批次号',
  `RefundPostTime` datetime DEFAULT NULL COMMENT '退款异步提交时间',
  `ReturnQuantity` bigint(20) DEFAULT '0' COMMENT '退货数量',
  `ReturnPlatCommission` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '平台佣金退还',
  `ReturnBrokerage` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '退还分销佣金',
  `ApplyNumber` int(11) DEFAULT NULL COMMENT '申请次数',
  `CertPic1` varchar(200) DEFAULT NULL COMMENT '凭证图片1',
  `CertPic2` varchar(200) DEFAULT NULL COMMENT '凭证图片2',
  `CertPic3` varchar(200) DEFAULT NULL COMMENT '凭证图片3',
  PRIMARY KEY (`Id`),
  KEY `FK_OrderItem_OrderRefund` (`OrderItemId`) USING BTREE,
  CONSTRAINT `himall_orderrefunds_ibfk_1` FOREIGN KEY (`OrderItemId`) REFERENCES `himall_orderitems` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_orderrefunds
-- ----------------------------

-- ----------------------------
-- Table structure for himall_orders
-- ----------------------------
DROP TABLE IF EXISTS `himall_orders`;
CREATE TABLE `himall_orders` (
  `Id` bigint(20) NOT NULL,
  `OrderStatus` int(11) NOT NULL COMMENT '订单状态 [Description("待付款")]WaitPay = 1,[Description("待发货")]WaitDelivery,[Description("待收货")]WaitReceiving,[Description("已关闭")]Close,[Description("已完成")]Finish',
  `OrderDate` datetime NOT NULL COMMENT '订单创建日期',
  `CloseReason` varchar(1000) DEFAULT NULL COMMENT '关闭原因',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  `SellerPhone` varchar(100) DEFAULT NULL COMMENT '商家电话',
  `SellerAddress` varchar(100) DEFAULT NULL COMMENT '商家发货地址',
  `SellerRemark` varchar(1000) DEFAULT NULL COMMENT '商家说明',
  `SellerRemarkFlag` int(11) DEFAULT NULL,
  `UserId` bigint(20) NOT NULL COMMENT '会员ID',
  `UserName` varchar(100) NOT NULL COMMENT '会员名称',
  `UserRemark` varchar(1000) DEFAULT NULL COMMENT '会员留言',
  `ShipTo` varchar(100) NOT NULL COMMENT '收货人',
  `CellPhone` varchar(100) DEFAULT NULL COMMENT '收货人电话',
  `TopRegionId` int(11) NOT NULL COMMENT '收货人地址省份ID',
  `RegionId` int(11) NOT NULL COMMENT '收货人区域ID',
  `RegionFullName` varchar(100) NOT NULL COMMENT '全名的收货地址',
  `Address` varchar(100) NOT NULL COMMENT '收货具体街道信息',
  `ExpressCompanyName` varchar(100) DEFAULT NULL COMMENT '快递公司',
  `Freight` decimal(8,2) NOT NULL COMMENT '运费',
  `ShipOrderNumber` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '物流订单号',
  `ShippingDate` datetime DEFAULT NULL COMMENT '发货日期',
  `IsPrinted` tinyint(1) NOT NULL COMMENT '是否打印快递单',
  `PaymentTypeName` varchar(100) DEFAULT NULL COMMENT '付款类型名称',
  `PaymentTypeGateway` varchar(100) DEFAULT NULL COMMENT '付款类型使用 插件名称',
  `PaymentType` int(11) NOT NULL,
  `GatewayOrderId` varchar(100) DEFAULT NULL COMMENT '支付接口返回的ID',
  `PayRemark` varchar(1000) DEFAULT NULL COMMENT '付款注释',
  `PayDate` datetime DEFAULT NULL COMMENT '付款日期',
  `InvoiceType` int(11) NOT NULL COMMENT '发票类型',
  `InvoiceTitle` varchar(100) DEFAULT NULL COMMENT '发票抬头',
  `Tax` decimal(8,2) NOT NULL COMMENT '税钱，但是未使用',
  `FinishDate` datetime DEFAULT NULL COMMENT '完成订单日期',
  `ProductTotalAmount` decimal(18,2) NOT NULL COMMENT '商品总金额',
  `RefundTotalAmount` decimal(18,2) NOT NULL COMMENT '退款金额',
  `CommisTotalAmount` decimal(18,2) NOT NULL COMMENT '佣金总金额',
  `RefundCommisAmount` decimal(18,2) NOT NULL COMMENT '退还佣金总金额',
  `ActiveType` int(11) NOT NULL DEFAULT '0' COMMENT '未使用',
  `Platform` int(11) NOT NULL DEFAULT '0' COMMENT '来自哪个终端的订单',
  `DiscountAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '针对该订单的优惠金额（用于优惠券）',
  `IntegralDiscount` decimal(18,2) NOT NULL COMMENT '积分优惠金额',
  `InvoiceContext` varchar(50) DEFAULT NULL COMMENT '发票明细',
  `OrderType` int(11) DEFAULT NULL,
  `ShareUserId` bigint(20) DEFAULT NULL COMMENT '分销员Id',
  `OrderRemarks` varchar(200) DEFAULT NULL COMMENT '订单备注(买家留言)',
  `LastModifyTime` datetime DEFAULT NULL COMMENT '最后操作时间',
  `DeliveryType` int(11) NOT NULL COMMENT '发货类型(快递配送,到店自提)',
  `ShopBranchId` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `PickupCode` varchar(20) DEFAULT NULL COMMENT '提货码',
  `TotalAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '订单实付金额',
  `ActualPayAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '订单实收金额',
  `FullDiscount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '满额减金额',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_orders
-- ----------------------------
INSERT INTO `himall_orders` VALUES ('2017082972301068', '2', '2017-08-29 11:43:41', null, '347', '御风飞自营店', null, null, null, null, '639', '我要买呀', null, '贼啦帅', '18889898787', '1', '3670', '北京 北京市 西城区 西长安街街道', '贼拉地儿', null, '0.00', null, null, '0', '平台线下收款', null, '2', null, '1', '2017-08-29 11:47:16', '0', null, '0.00', null, '59.00', '0.00', '0.00', '0.00', '0', '0', '0.00', '0.00', null, null, null, '速速发货', '2017-08-29 11:47:16', '0', '0', null, '59.00', '59.00', '0.00');
INSERT INTO `himall_orders` VALUES ('2017082979383118', '2', '2017-08-29 11:47:48', null, '347', '御风飞自营店', null, null, null, null, '639', '我要买呀', null, '贼啦帅', '18889898787', '1', '3670', '北京 北京市 西城区 西长安街街道', '贼拉地儿', null, '0.00', null, null, '0', '平台线下收款', null, '2', null, '1', '2017-08-29 11:48:33', '0', null, '0.00', null, '138.00', '0.00', '0.00', '0.00', '0', '0', '0.00', '0.00', null, null, null, null, '2017-08-29 11:48:33', '0', '0', null, '138.00', '138.00', '0.00');

-- ----------------------------
-- Table structure for himall_paymentconfig
-- ----------------------------
DROP TABLE IF EXISTS `himall_paymentconfig`;
CREATE TABLE `himall_paymentconfig` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IsCashOnDelivery` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_paymentconfig
-- ----------------------------
INSERT INTO `himall_paymentconfig` VALUES ('1', '0');

-- ----------------------------
-- Table structure for himall_pendingsettlementorders
-- ----------------------------
DROP TABLE IF EXISTS `himall_pendingsettlementorders`;
CREATE TABLE `himall_pendingsettlementorders` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ShopName` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `OrderId` bigint(20) NOT NULL COMMENT '订单号',
  `OrderAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `ProductsAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '商品实付金额',
  `FreightAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `PlatCommission` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '平台佣金',
  `DistributorCommission` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '分销佣金',
  `RefundAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `PlatCommissionReturn` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '平台佣金退还',
  `DistributorCommissionReturn` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '分销佣金退还',
  `SettlementAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '结算金额',
  `OrderFinshTime` datetime NOT NULL COMMENT '订单完成时间',
  `PaymentTypeName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='待结算订单表';

-- ----------------------------
-- Records of himall_pendingsettlementorders
-- ----------------------------

-- ----------------------------
-- Table structure for himall_photospace
-- ----------------------------
DROP TABLE IF EXISTS `himall_photospace`;
CREATE TABLE `himall_photospace` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PhotoCategoryId` bigint(20) NOT NULL COMMENT '图片分组ID',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `PhotoName` varchar(2000) DEFAULT NULL COMMENT '图片名称',
  `PhotoPath` varchar(2000) DEFAULT NULL COMMENT '图片路径',
  `FileSize` bigint(20) DEFAULT NULL COMMENT '图片大小',
  `UploadTime` datetime DEFAULT NULL COMMENT '图片上传时间',
  `LastUpdateTime` datetime DEFAULT NULL COMMENT '图片最后更新时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_photospace
-- ----------------------------
INSERT INTO `himall_photospace` VALUES ('352', '0', '0', 'TB2r0Icn3RkpuFjy1zeXXc.6FXa_!!1731693795.jpg', '/temp/image/20170829/6363959662873724406865748.jpg', '192314', '2017-08-29 09:43:49', '2017-08-29 09:43:49');
INSERT INTO `himall_photospace` VALUES ('353', '0', '0', 'TB2XifiqHBnpuFjSZFGXXX51pXa_!!1731693795.jpg', '/temp/image/20170829/6363959662917759705266336.jpg', '154589', '2017-08-29 09:43:49', '2017-08-29 09:43:49');
INSERT INTO `himall_photospace` VALUES ('354', '0', '0', 'TB2r0Icn3RkpuFjy1zeXXc.6FXa_!!1731693795.jpg', '/temp/image/20170829/6363959842115377103504334.jpg', '192314', '2017-08-29 10:13:41', '2017-08-29 10:13:41');
INSERT INTO `himall_photospace` VALUES ('355', '0', '0', 'TB2XifiqHBnpuFjSZFGXXX51pXa_!!1731693795.jpg', '/temp/image/20170829/6363959842259424201030922.jpg', '154589', '2017-08-29 10:13:43', '2017-08-29 10:13:43');
INSERT INTO `himall_photospace` VALUES ('356', '0', '0', 'timg.jpg', '/temp/image/20170829/6363959860282288109740203.jpg', '12278', '2017-08-29 10:16:43', '2017-08-29 10:16:43');
INSERT INTO `himall_photospace` VALUES ('357', '0', '0', '6363864937504097837696770.JPG', '/temp/image/20170829/6363959883253153879926954.JPG', '636013', '2017-08-29 10:20:33', '2017-08-29 10:20:33');
INSERT INTO `himall_photospace` VALUES ('358', '0', '0', '2.png', '/temp/image/20170829/6363959909182818493777194.png', '174210', '2017-08-29 10:24:52', '2017-08-29 10:24:52');
INSERT INTO `himall_photospace` VALUES ('359', '0', '0', '3.jpg', '/temp/image/20170829/6363959909221484022962630.jpg', '340328', '2017-08-29 10:24:52', '2017-08-29 10:24:52');
INSERT INTO `himall_photospace` VALUES ('360', '0', '0', '6363168626114887896220022.jpg', '/temp/image/20170829/6363959909276271809862451.jpg', '346308', '2017-08-29 10:24:53', '2017-08-29 10:24:53');
INSERT INTO `himall_photospace` VALUES ('361', '0', '0', '2.png', '/temp/image/20170829/6363959995319745621493036.png', '181828', '2017-08-29 10:39:13', '2017-08-29 10:39:13');
INSERT INTO `himall_photospace` VALUES ('362', '0', '0', '3.png', '/temp/image/20170829/6363959995357442419678471.png', '341022', '2017-08-29 10:39:14', '2017-08-29 10:39:14');
INSERT INTO `himall_photospace` VALUES ('363', '0', '0', '4.png', '/temp/image/20170829/6363959995381658736135428.png', '181023', '2017-08-29 10:39:14', '2017-08-29 10:39:14');
INSERT INTO `himall_photospace` VALUES ('364', '0', '0', '2.png', '/temp/image/20170829/6363960014128323692096460.png', '228425', '2017-08-29 10:42:21', '2017-08-29 10:42:21');
INSERT INTO `himall_photospace` VALUES ('365', '0', '0', '4.png', '/temp/image/20170829/6363960014262309193353060.png', '781701', '2017-08-29 10:42:23', '2017-08-29 10:42:23');
INSERT INTO `himall_photospace` VALUES ('366', '0', '0', '3.png', '/temp/image/20170829/6363960014369823541694213.png', '771665', '2017-08-29 10:42:24', '2017-08-29 10:42:24');
INSERT INTO `himall_photospace` VALUES ('367', '0', '0', '2.png', '/temp/image/20170829/6363960036013976536433003.png', '196762', '2017-08-29 10:46:00', '2017-08-29 10:46:00');
INSERT INTO `himall_photospace` VALUES ('368', '0', '0', '3.png', '/temp/image/20170829/6363960036059197533361009.png', '217975', '2017-08-29 10:46:01', '2017-08-29 10:46:01');
INSERT INTO `himall_photospace` VALUES ('369', '0', '0', '4.png', '/temp/image/20170829/6363960036116902394490076.png', '215955', '2017-08-29 10:46:01', '2017-08-29 10:46:01');
INSERT INTO `himall_photospace` VALUES ('370', '0', '0', '2.png', '/temp/image/20170829/6363960204240448706296155.png', '1047505', '2017-08-29 11:14:02', '2017-08-29 11:14:02');
INSERT INTO `himall_photospace` VALUES ('371', '0', '0', '4.png', '/temp/image/20170829/6363960204330401634853995.png', '441667', '2017-08-29 11:14:03', '2017-08-29 11:14:03');
INSERT INTO `himall_photospace` VALUES ('372', '0', '0', '3.png', '/temp/image/20170829/6363960207286270634288237.png', '442534', '2017-08-29 11:14:33', '2017-08-29 11:14:33');
INSERT INTO `himall_photospace` VALUES ('373', '0', '0', '1.png', '/temp/image/20170829/6363960240429845976470550.png', '536585', '2017-08-29 11:20:04', '2017-08-29 11:20:04');
INSERT INTO `himall_photospace` VALUES ('374', '0', '0', '3.png', '/temp/image/20170829/6363960240508457629827328.png', '474374', '2017-08-29 11:20:05', '2017-08-29 11:20:05');
INSERT INTO `himall_photospace` VALUES ('375', '0', '0', '4.png', '/temp/image/20170829/6363960240595564861926678.png', '522785', '2017-08-29 11:20:06', '2017-08-29 11:20:06');
INSERT INTO `himall_photospace` VALUES ('376', '0', '0', '2.png', '/temp/image/20170829/6363960240703474393497076.png', '583382', '2017-08-29 11:20:07', '2017-08-29 11:20:07');
INSERT INTO `himall_photospace` VALUES ('377', '0', '0', '1.png', '/temp/image/20170829/6363960262878962661817869.png', '182072', '2017-08-29 11:23:49', '2017-08-29 11:23:49');
INSERT INTO `himall_photospace` VALUES ('378', '0', '0', '4.png', '/temp/image/20170829/6363960262910134261788151.png', '84489', '2017-08-29 11:23:49', '2017-08-29 11:23:49');
INSERT INTO `himall_photospace` VALUES ('379', '0', '0', '2.png', '/temp/image/20170829/6363960262932966788717691.png', '103866', '2017-08-29 11:23:49', '2017-08-29 11:23:49');
INSERT INTO `himall_photospace` VALUES ('380', '0', '0', '3.png', '/temp/image/20170829/6363960262993608601130838.png', '216294', '2017-08-29 11:23:50', '2017-08-29 11:23:50');
INSERT INTO `himall_photospace` VALUES ('381', '0', '0', '1.png', '/temp/image/20170829/6363960291635112647831659.png', '219031', '2017-08-29 11:28:36', '2017-08-29 11:28:36');
INSERT INTO `himall_photospace` VALUES ('382', '0', '0', '4.png', '/temp/image/20170829/6363960291688934425731480.png', '171100', '2017-08-29 11:28:37', '2017-08-29 11:28:37');
INSERT INTO `himall_photospace` VALUES ('383', '0', '0', '2.png', '/temp/image/20170829/6363960291712555373661020.png', '184907', '2017-08-29 11:28:37', '2017-08-29 11:28:37');
INSERT INTO `himall_photospace` VALUES ('384', '0', '0', '3.png', '/temp/image/20170829/6363960291761480462345689.png', '170749', '2017-08-29 11:28:38', '2017-08-29 11:28:38');

-- ----------------------------
-- Table structure for himall_photospacecategory
-- ----------------------------
DROP TABLE IF EXISTS `himall_photospacecategory`;
CREATE TABLE `himall_photospacecategory` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `PhotoSpaceCatrgoryName` varchar(255) DEFAULT NULL COMMENT '图片空间分类名称',
  `DisplaySequence` bigint(20) DEFAULT NULL COMMENT '显示顺序',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_photospacecategory
-- ----------------------------

-- ----------------------------
-- Table structure for himall_plataccount
-- ----------------------------
DROP TABLE IF EXISTS `himall_plataccount`;
CREATE TABLE `himall_plataccount` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Balance` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '帐户余额',
  `PendingSettlement` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '待结算',
  `Settled` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '已结算',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='平台资金表';

-- ----------------------------
-- Records of himall_plataccount
-- ----------------------------
INSERT INTO `himall_plataccount` VALUES ('1', '0.00', '0.00', '0.00');

-- ----------------------------
-- Table structure for himall_plataccountitem
-- ----------------------------
DROP TABLE IF EXISTS `himall_plataccountitem`;
CREATE TABLE `himall_plataccountitem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `AccountNo` varchar(50) NOT NULL COMMENT '交易流水号',
  `AccoutID` bigint(20) NOT NULL COMMENT '关联资金编号',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `Amount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `Balance` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '帐户剩余',
  `TradeType` int(4) NOT NULL DEFAULT '0' COMMENT '交易类型',
  `IsIncome` bit(1) NOT NULL COMMENT '是否收入',
  `ReMark` varchar(1000) DEFAULT NULL COMMENT '交易备注',
  `DetailId` varchar(100) DEFAULT NULL COMMENT '详情ID',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_Pltem_AccoutID` (`AccoutID`),
  CONSTRAINT `FK_Himall_Pltem_AccoutID` FOREIGN KEY (`AccoutID`) REFERENCES `himall_plataccount` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8 COMMENT='平台资金流水表';

-- ----------------------------
-- Records of himall_plataccountitem
-- ----------------------------

-- ----------------------------
-- Table structure for himall_platvisits
-- ----------------------------
DROP TABLE IF EXISTS `himall_platvisits`;
CREATE TABLE `himall_platvisits` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Date` datetime NOT NULL COMMENT '统计日期',
  `VisitCounts` bigint(20) NOT NULL COMMENT '平台浏览数',
  `OrderUserCount` bigint(20) NOT NULL COMMENT '下单人数',
  `OrderCount` bigint(20) NOT NULL COMMENT '订单数',
  `OrderProductCount` bigint(20) NOT NULL COMMENT '下单件数',
  `OrderAmount` decimal(18,2) NOT NULL COMMENT '下单金额',
  `OrderPayUserCount` bigint(20) NOT NULL COMMENT '下单付款人数',
  `OrderPayCount` bigint(20) NOT NULL COMMENT '付款订单数',
  `SaleCounts` bigint(20) NOT NULL COMMENT '付款下单件数',
  `SaleAmounts` decimal(18,2) NOT NULL COMMENT '付款金额',
  `StatisticFlag` bit(1) NOT NULL COMMENT '是否已经统计(0：未统计,1已统计)',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_platvisits
-- ----------------------------
INSERT INTO `himall_platvisits` VALUES ('5120', '2017-07-27 00:00:00', '1', '0', '0', '0', '0.00', '0', '0', '0', '0.00', '\0');
INSERT INTO `himall_platvisits` VALUES ('5121', '2017-08-28 00:00:00', '1', '0', '0', '0', '0.00', '0', '0', '0', '0.00', '\0');
INSERT INTO `himall_platvisits` VALUES ('5122', '2017-08-29 00:00:00', '27', '0', '0', '0', '0.00', '0', '0', '0', '0.00', '\0');
INSERT INTO `himall_platvisits` VALUES ('5123', '2017-08-30 00:00:00', '7', '0', '0', '0', '0.00', '0', '0', '0', '0.00', '\0');
INSERT INTO `himall_platvisits` VALUES ('5124', '2017-08-31 00:00:00', '7', '0', '0', '0', '0.00', '0', '0', '0', '0.00', '\0');
INSERT INTO `himall_platvisits` VALUES ('5125', '2017-09-01 00:00:00', '7', '0', '0', '0', '0.00', '0', '0', '0', '0.00', '\0');
INSERT INTO `himall_platvisits` VALUES ('5126', '2017-09-02 00:00:00', '7', '0', '0', '0', '0.00', '0', '0', '0', '0.00', '\0');
INSERT INTO `himall_platvisits` VALUES ('5127', '2017-09-03 00:00:00', '9', '0', '0', '0', '0.00', '0', '0', '0', '0.00', '\0');
INSERT INTO `himall_platvisits` VALUES ('5128', '2017-09-04 00:00:00', '17', '0', '0', '0', '0.00', '0', '0', '0', '0.00', '\0');

-- ----------------------------
-- Table structure for himall_productattributes
-- ----------------------------
DROP TABLE IF EXISTS `himall_productattributes`;
CREATE TABLE `himall_productattributes` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `AttributeId` bigint(20) NOT NULL COMMENT '属性ID',
  `ValueId` bigint(20) NOT NULL COMMENT '属性值ID',
  PRIMARY KEY (`Id`),
  KEY `FK_Attribute_ProductAttribute` (`AttributeId`) USING BTREE,
  KEY `FK_Product_ProductAttribute` (`ProductId`) USING BTREE,
  KEY `IX_ValueId` (`ValueId`) USING BTREE,
  CONSTRAINT `himall_productattributes_ibfk_1` FOREIGN KEY (`AttributeId`) REFERENCES `himall_attributes` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_productattributes_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6213 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_productattributes
-- ----------------------------

-- ----------------------------
-- Table structure for himall_productbrokerage
-- ----------------------------
DROP TABLE IF EXISTS `himall_productbrokerage`;
CREATE TABLE `himall_productbrokerage` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ProductId` bigint(20) DEFAULT NULL COMMENT '商品Id',
  `rate` decimal(6,2) NOT NULL COMMENT '百分比',
  `ShopId` bigint(20) DEFAULT NULL COMMENT '店铺Id',
  `CreateTime` datetime DEFAULT NULL COMMENT '添加时间',
  `SaleNum` int(11) DEFAULT NULL COMMENT '成交数 *是卖出的数量，还是成交订单数，退货时是否需要维护',
  `AgentNum` int(11) DEFAULT NULL COMMENT '代理数 *清退的时候是否需要维护此字段',
  `ForwardNum` int(11) DEFAULT NULL COMMENT '转发数',
  `Status` int(11) NOT NULL COMMENT '状态 上架、下架、移除',
  `Sort` int(11) DEFAULT NULL COMMENT '排序',
  `saleAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '销售额',
  `BrokerageAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '商品已结佣金',
  `BrokerageTotal` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '商品佣金(包含已结未结)',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_ProductBrokerage_ProductId` (`ProductId`),
  KEY `FK_Himall_ProductBrokerage_ShopId` (`ShopId`),
  CONSTRAINT `FK_Himall_ProductBrokerage_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Himall_ProductBrokerage_ShopId` FOREIGN KEY (`ShopId`) REFERENCES `himall_shops` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_productbrokerage
-- ----------------------------

-- ----------------------------
-- Table structure for himall_productcomments
-- ----------------------------
DROP TABLE IF EXISTS `himall_productcomments`;
CREATE TABLE `himall_productcomments` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `SubOrderId` bigint(20) DEFAULT NULL COMMENT '订单详细ID',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ShopName` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `UserName` varchar(100) DEFAULT NULL COMMENT '用户名称',
  `Email` varchar(1000) DEFAULT NULL COMMENT 'Email',
  `ReviewContent` varchar(1000) DEFAULT NULL COMMENT '评价内容',
  `ReviewDate` datetime NOT NULL COMMENT '评价日期',
  `ReviewMark` int(11) NOT NULL COMMENT '评价说明',
  `ReplyContent` varchar(1000) DEFAULT NULL,
  `ReplyDate` datetime DEFAULT NULL,
  `AppendContent` varchar(1000) DEFAULT NULL COMMENT '追加内容',
  `AppendDate` datetime DEFAULT NULL COMMENT '追加时间',
  `ReplyAppendContent` varchar(1000) DEFAULT NULL COMMENT '追加评论回复',
  `ReplyAppendDate` datetime DEFAULT NULL COMMENT '追加评论回复时间',
  `IsHidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `FK_Product_ProductComment` (`ProductId`) USING BTREE,
  KEY `SubOrderId` (`SubOrderId`) USING BTREE,
  KEY `ShopId` (`ShopId`) USING BTREE,
  KEY `UserId` (`UserId`) USING BTREE,
  CONSTRAINT `himall_productcomments_ibfk_1` FOREIGN KEY (`SubOrderId`) REFERENCES `himall_orderitems` (`Id`),
  CONSTRAINT `himall_productcomments_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`),
  CONSTRAINT `himall_productcomments_ibfk_3` FOREIGN KEY (`ShopId`) REFERENCES `himall_shops` (`Id`),
  CONSTRAINT `himall_productcomments_ibfk_4` FOREIGN KEY (`UserId`) REFERENCES `himall_members` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_productcomments
-- ----------------------------

-- ----------------------------
-- Table structure for himall_productcommentsimages
-- ----------------------------
DROP TABLE IF EXISTS `himall_productcommentsimages`;
CREATE TABLE `himall_productcommentsimages` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增物理主键',
  `CommentImage` varchar(200) NOT NULL COMMENT '评论图片',
  `CommentId` bigint(20) NOT NULL COMMENT '评论ID',
  `CommentType` int(11) NOT NULL COMMENT '评论类型（首次评论/追加评论）',
  PRIMARY KEY (`Id`),
  KEY `FR_CommentImages` (`CommentId`),
  CONSTRAINT `FR_CommentImages` FOREIGN KEY (`CommentId`) REFERENCES `himall_productcomments` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_productcommentsimages
-- ----------------------------

-- ----------------------------
-- Table structure for himall_productconsultations
-- ----------------------------
DROP TABLE IF EXISTS `himall_productconsultations`;
CREATE TABLE `himall_productconsultations` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductId` bigint(20) NOT NULL,
  `ShopId` bigint(20) NOT NULL,
  `ShopName` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `UserId` bigint(20) NOT NULL,
  `UserName` varchar(100) DEFAULT NULL COMMENT '用户名称',
  `Email` varchar(1000) DEFAULT NULL,
  `ConsultationContent` varchar(1000) DEFAULT NULL COMMENT '咨询内容',
  `ConsultationDate` datetime NOT NULL COMMENT '咨询时间',
  `ReplyContent` varchar(1000) DEFAULT NULL COMMENT '回复内容',
  `ReplyDate` datetime DEFAULT NULL COMMENT '回复日期',
  PRIMARY KEY (`Id`),
  KEY `FK_Product_ProductConsultation` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_productconsultations_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_productconsultations
-- ----------------------------

-- ----------------------------
-- Table structure for himall_productdescriptions
-- ----------------------------
DROP TABLE IF EXISTS `himall_productdescriptions`;
CREATE TABLE `himall_productdescriptions` (
  `Id` bigint(20) NOT NULL,
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `AuditReason` varchar(1000) DEFAULT NULL COMMENT '审核原因',
  `Description` text COMMENT '详情',
  `DescriptionPrefixId` bigint(20) NOT NULL COMMENT '关联版式',
  `DescriptiondSuffixId` bigint(20) NOT NULL,
  `Meta_Title` varchar(1000) DEFAULT NULL COMMENT 'SEO',
  `Meta_Description` varchar(1000) DEFAULT NULL,
  `Meta_Keywords` varchar(1000) DEFAULT NULL,
  `MobileDescription` text COMMENT '移动端描述',
  PRIMARY KEY (`ProductId`),
  KEY `FK_Product_ProductDescription` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_productdescriptions_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_productdescriptions
-- ----------------------------
INSERT INTO `himall_productdescriptions` VALUES ('0', '1158', null, '<p><img src=\"/Storage/Shop/347/Products/1158/remark/382d58220d3141f9ac3eeeb61ddc89a0.jpg\" style=\"\" title=\"TB2r0Icn3RkpuFjy1zeXXc.6FXa_!!1731693795.jpg\"/></p><p><img src=\"/Storage/Shop/347/Products/1158/remark/0aa364af15d041c680880582d2a5fa29.jpg\" style=\"\" title=\"TB2XifiqHBnpuFjSZFGXXX51pXa_!!1731693795.jpg\"/></p><p><br/></p>', '0', '0', null, null, null, '<p><br/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1158/remark/9fe8996048f745ce96f13cff6dfeb2c2.jpg\" title=\"TB2r0Icn3RkpuFjy1zeXXc.6FXa_!!1731693795.jpg\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1158/remark/d67ef76c06bc421582282c3cb884c511.jpg\" title=\"TB2XifiqHBnpuFjSZFGXXX51pXa_!!1731693795.jpg\"/></p><p style=\"white-space: normal;\"><br/></p><p><br/></p>');
INSERT INTO `himall_productdescriptions` VALUES ('0', '1159', null, '<p><img src=\"/Storage/Shop/347/Products/1159/remark/5ba44c6c38d84af08675b74a51225d5e.jpg\" style=\"\" title=\"TB2r0Icn3RkpuFjy1zeXXc.6FXa_!!1731693795.jpg\"/></p><p><img src=\"/Storage/Shop/347/Products/1159/remark/d17a243b219e4ba3ad7ffc031964936c.jpg\" style=\"\" title=\"TB2XifiqHBnpuFjSZFGXXX51pXa_!!1731693795.jpg\"/></p><p><br/></p>', '0', '0', null, null, null, '<p><br/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1159/remark/aacb9e3bc588488ba17cc566ad690a67.jpg\" title=\"TB2r0Icn3RkpuFjy1zeXXc.6FXa_!!1731693795.jpg\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1159/remark/04ca85e4cb7b411cae84ed5655ecc9a2.jpg\" title=\"TB2XifiqHBnpuFjSZFGXXX51pXa_!!1731693795.jpg\"/></p><p style=\"white-space: normal;\"><br/></p><p><br/></p>');
INSERT INTO `himall_productdescriptions` VALUES ('0', '1160', null, '<p><img src=\"/Storage/Shop/347/Products/1160/remark/1cb3b6a891814f6cb7b3709e3768d975.jpg\" style=\"\" title=\"TB2r0Icn3RkpuFjy1zeXXc.6FXa_!!1731693795.jpg\"/></p><p><img src=\"/Storage/Shop/347/Products/1160/remark/f8908f54968145a0835f0fde59c0766d.jpg\" style=\"\" title=\"TB2XifiqHBnpuFjSZFGXXX51pXa_!!1731693795.jpg\"/></p><p><br/></p>', '0', '0', null, null, null, '<p><br/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1160/remark/92080c2444594fbbac53d3b7f2f6244a.jpg\" title=\"TB2r0Icn3RkpuFjy1zeXXc.6FXa_!!1731693795.jpg\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1160/remark/76eea6e26e7745d989535a2767e2eb53.jpg\" title=\"TB2XifiqHBnpuFjSZFGXXX51pXa_!!1731693795.jpg\"/></p><p style=\"white-space: normal;\"><br/></p><p><br/></p>');
INSERT INTO `himall_productdescriptions` VALUES ('0', '1161', null, '<p><img src=\"/Storage/Shop/347/Products/1161/remark/5d5f8253c96048e592cb03328611c623.jpg\" style=\"\" title=\"TB2r0Icn3RkpuFjy1zeXXc.6FXa_!!1731693795.jpg\"/></p><p><img src=\"/Storage/Shop/347/Products/1161/remark/f038943a7aec4fea8eb3b46e2ccb6a9f.jpg\" style=\"\" title=\"TB2XifiqHBnpuFjSZFGXXX51pXa_!!1731693795.jpg\"/></p><p><br/></p>', '0', '0', null, null, null, '<p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1161/remark/55e17b97309f4227b2426a5277aa417f.jpg\" title=\"TB2r0Icn3RkpuFjy1zeXXc.6FXa_!!1731693795.jpg\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1161/remark/8e8283177c4541f6a4ac0a57fd2aa363.jpg\" title=\"TB2XifiqHBnpuFjSZFGXXX51pXa_!!1731693795.jpg\"/></p><p style=\"white-space: normal;\"><br/></p><p><br/></p>');
INSERT INTO `himall_productdescriptions` VALUES ('0', '1162', null, '<p><img src=\"/Storage/Shop/347/Products/1162/remark/35391ef31bbc4b42a486d9225ca6cd73.jpg\" title=\"timg.jpg\" alt=\"timg.jpg\"/></p>', '0', '0', null, null, null, '<p><img src=\"/Storage/Shop/347/Products/1162/remark/11f320f2916a405b9d31f4cf5ed0cf71.jpg\" title=\"timg.jpg\" alt=\"timg.jpg\" style=\"font-family: &#39;microsoft yahei&#39;; font-size: 12px; white-space: normal;\"/></p>');
INSERT INTO `himall_productdescriptions` VALUES ('0', '1163', null, '<p><img src=\"/Storage/Shop/347/Products/1163/remark/5553638916f240fa8243e62e9a64f8b6.JPG\" title=\"6363864937504097837696770.JPG\" alt=\"6363864937504097837696770.JPG\"/></p>', '0', '0', null, null, null, '<p><span style=\"font-family: &#39;microsoft yahei&#39;; font-size: 12px;\"></span><img src=\"/Storage/Shop/347/Products/1163/remark/63206e26052a48759158c4a9d9630252.JPG\" title=\"6363864937504097837696770.JPG\" alt=\"6363864937504097837696770.JPG\" style=\"font-family: &#39;microsoft yahei&#39;; font-size: 12px; white-space: normal;\"/></p>');
INSERT INTO `himall_productdescriptions` VALUES ('0', '1164', null, '<p><img src=\"/Storage/Shop/347/Products/1164/remark/2d0122de2aa8402fa4f2d06a4437c868.png\" style=\"\" title=\"2.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1164/remark/b3914b7fccc04adfaaeebf84cd43d845.jpg\" style=\"\" title=\"3.jpg\"/></p><p><img src=\"/Storage/Shop/347/Products/1164/remark/95e0f55f464b48189bc62dddac59b0eb.jpg\" style=\"\" title=\"6363168626114887896220022.jpg\"/></p><p><br/></p>', '0', '0', null, null, null, '<p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1164/remark/2fc4b7244d8e49bb90fa390751584e5a.png\" title=\"2.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1164/remark/1987ef68e6f94736bbb5febe92723e0e.jpg\" title=\"3.jpg\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1164/remark/7b1897d5ff6a4a578dbb9ebcc7ba09c4.jpg\" title=\"6363168626114887896220022.jpg\"/></p><p style=\"white-space: normal;\"><br/></p><p><br/></p>');
INSERT INTO `himall_productdescriptions` VALUES ('0', '1165', null, '<p><img src=\"/Storage/Shop/347/Products/1165/remark/49caf138ca9f4d40867b281a81dcd2d1.png\" style=\"\" title=\"2.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1165/remark/52902be9dc164a26a2d3d44dbddb04d3.png\" style=\"\" title=\"3.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1165/remark/991b34ff0b0b413db91e8c6db19321f9.png\" style=\"\" title=\"4.png\"/></p><p><br/></p>', '0', '0', null, null, null, '<p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1165/remark/3ceb084e24304f8fbdabd1a5a02a1c58.png\" title=\"2.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1165/remark/f4a52bd9d47c40c98b2062f0e2a7f289.png\" title=\"3.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1165/remark/544591798a4e42d29c319b039ac84531.png\" title=\"4.png\"/></p><p style=\"white-space: normal;\"><br/></p><p><br/></p>');
INSERT INTO `himall_productdescriptions` VALUES ('0', '1166', null, '<p><img src=\"/Storage/Shop/347/Products/1166/remark/447413c1245a49fa80e2fa328366f6dc.png\" style=\"\" title=\"2.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1166/remark/e2578e0163d94f70a89c2ffef2874d6a.png\" style=\"\" title=\"3.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1166/remark/50095a7b84d84435ae4a6e5f0cea1619.png\" style=\"\" title=\"4.png\"/></p><p><br/></p>', '0', '0', null, null, null, '<p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1166/remark/7ed6ffb94bd14fe69c784c4226738c2a.png\" title=\"2.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1166/remark/0d06133d20b3487aa0d42b1cd792e039.png\" title=\"3.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1166/remark/5945dedd357742fa9a8a06bbdb5b8ec0.png\" title=\"4.png\"/></p><p style=\"white-space: normal;\"><br/></p><p><br/></p>');
INSERT INTO `himall_productdescriptions` VALUES ('0', '1167', null, '<p><img src=\"/Storage/Shop/347/Products/1167/remark/8e9c1e323ebb4c898614c6f555dc1afd.png\" style=\"\" title=\"2.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1167/remark/1f808f9dc5964e8eb67056e7b495773a.png\" style=\"\" title=\"3.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1167/remark/b0cfb2bc84d54f27ac267d8abd9b7924.png\" style=\"\" title=\"4.png\"/></p><p><br/></p>', '0', '0', null, null, null, '<p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1167/remark/210d51b2ced9461f802bb6696dca61c1.png\" title=\"2.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1167/remark/df53dafdf1624223b9505a7aff76504f.png\" title=\"3.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1167/remark/21392461851341a3ab7cf1871f03fd02.png\" title=\"4.png\"/></p><p style=\"white-space: normal;\"><br/></p><p><br/></p>');
INSERT INTO `himall_productdescriptions` VALUES ('0', '1168', null, '<p><img src=\"/Storage/Shop/347/Products/1168/remark/81eea250b6c542eb866307a6c971d606.png\" style=\"\" title=\"2.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1168/remark/855ffbd1e6bb477283a9531e90e3eadb.png\" style=\"\" title=\"4.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1168/remark/aa19fe0213fb4e91a290709a960becc6.png\" title=\"3.png\" alt=\"3.png\"/></p>', '0', '0', null, null, null, '<p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1168/remark/0fa1091fa99644ad8606357c1786c0f4.png\" title=\"2.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1168/remark/802cbc10ef7e4b2b9238300faf650c71.png\" title=\"4.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1168/remark/c42a0c89718a4a83a88eb11227232455.png\" title=\"3.png\" alt=\"3.png\"/></p><p><br/></p>');
INSERT INTO `himall_productdescriptions` VALUES ('0', '1169', null, '<p><img src=\"/Storage/Shop/347/Products/1169/remark/0926b23ac5f54b8faa6ba137a5a78641.png\" style=\"\" title=\"1.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1169/remark/026136fcd2774df79f3d9f71ad41ab56.png\" style=\"\" title=\"2.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1169/remark/b1d2e9450dc2458ba4352267c64bf5d1.png\" style=\"\" title=\"3.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1169/remark/85577e5569964b24971e498616480cec.png\" style=\"\" title=\"4.png\"/></p><p><br/></p>', '0', '0', null, null, null, '<p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1169/remark/a96c053ebe544607831185ce537e2304.png\" title=\"1.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1169/remark/d31f5549c81a4a6a9506f05b64e9fd8f.png\" title=\"2.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1169/remark/d67e21459c394e44a28c20be4e62348d.png\" title=\"3.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1169/remark/18b53a295d284e7d82897d3c882c8fbd.png\" title=\"4.png\"/></p><p style=\"white-space: normal;\"><br/></p><p><br/></p>');
INSERT INTO `himall_productdescriptions` VALUES ('0', '1170', null, '<p><img src=\"/Storage/Shop/347/Products/1170/remark/92315f806cd44dafb3d0f82d40467a44.png\" style=\"\" title=\"1.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1170/remark/68814beac82240d298c03e3c6b3f94e7.png\" style=\"\" title=\"2.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1170/remark/76b7e35a59d546c39ea801ec7af6e6b7.png\" style=\"\" title=\"3.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1170/remark/7d5dc421d4804dc6b42cf14e5060fdb4.png\" style=\"\" title=\"4.png\"/></p><p><br/></p>', '0', '0', null, null, null, '<p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1170/remark/58790d69f11b42979cbb402c34bf5b3e.png\" title=\"1.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1170/remark/a9a327f9309547a581c42ca6cd206994.png\" title=\"2.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1170/remark/b72cd43e70b34d0fb9bd1ee44360bbf7.png\" title=\"3.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1170/remark/f4fcac24e8164de68d373ef1e3fe3851.png\" title=\"4.png\"/></p><p style=\"white-space: normal;\"><br/></p><p><br/></p>');
INSERT INTO `himall_productdescriptions` VALUES ('0', '1171', null, '<p><img src=\"/Storage/Shop/347/Products/1171/remark/02343901d3e649caa5126992d85f17de.png\" style=\"\" title=\"1.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1171/remark/394b51fd45ac4ae386a100c41a48895e.png\" style=\"\" title=\"2.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1171/remark/8183b4adcc774ee49de63ac50decf729.png\" style=\"\" title=\"3.png\"/></p><p><img src=\"/Storage/Shop/347/Products/1171/remark/adba5503d4c94b259178ecf8c2ae0535.png\" style=\"\" title=\"4.png\"/></p><p><br/></p>', '0', '0', null, null, null, '<p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1171/remark/aaed4360af134353b1e44c4136c3a7f8.png\" title=\"1.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1171/remark/826e38b5e6fc41f3a18676982e3d694f.png\" title=\"2.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1171/remark/0d26bbd0d86448a590fe516e842dca1f.png\" title=\"3.png\"/></p><p style=\"white-space: normal;\"><img src=\"/Storage/Shop/347/Products/1171/remark/23125caf95194fc48fb170f53b870616.png\" title=\"4.png\"/></p><p><br/></p>');

-- ----------------------------
-- Table structure for himall_productdescriptiontemplates
-- ----------------------------
DROP TABLE IF EXISTS `himall_productdescriptiontemplates`;
CREATE TABLE `himall_productdescriptiontemplates` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `Name` varchar(100) NOT NULL COMMENT '板式名称',
  `Position` int(11) NOT NULL COMMENT '位置（上、下）',
  `Content` varchar(4000) NOT NULL COMMENT 'PC端版式',
  `MobileContent` varchar(4000) DEFAULT NULL COMMENT '移动端版式',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_productdescriptiontemplates
-- ----------------------------

-- ----------------------------
-- Table structure for himall_productrelationproducts
-- ----------------------------
DROP TABLE IF EXISTS `himall_productrelationproducts`;
CREATE TABLE `himall_productrelationproducts` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` bigint(20) NOT NULL COMMENT '商品id',
  `Relation` varchar(255) NOT NULL COMMENT '推荐的商品id列表，以‘，’分隔',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='推荐商品';

-- ----------------------------
-- Records of himall_productrelationproducts
-- ----------------------------

-- ----------------------------
-- Table structure for himall_products
-- ----------------------------
DROP TABLE IF EXISTS `himall_products`;
CREATE TABLE `himall_products` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `CategoryId` bigint(20) NOT NULL COMMENT '分类ID',
  `CategoryPath` varchar(100) NOT NULL COMMENT '分类路径',
  `TypeId` bigint(20) NOT NULL COMMENT '类型ID',
  `BrandId` bigint(20) NOT NULL COMMENT '品牌ID',
  `ProductName` varchar(100) NOT NULL COMMENT '商品名称',
  `ProductCode` varchar(100) DEFAULT NULL COMMENT '商品编号',
  `ShortDescription` varchar(4000) DEFAULT NULL COMMENT '广告词',
  `SaleStatus` int(11) NOT NULL COMMENT '销售状态',
  `AuditStatus` int(11) NOT NULL COMMENT '审核状态',
  `AddedDate` datetime NOT NULL COMMENT '添加日期',
  `DisplaySequence` bigint(20) NOT NULL COMMENT '显示顺序',
  `ImagePath` varchar(100) DEFAULT NULL COMMENT '存放图片的目录',
  `MarketPrice` decimal(18,2) NOT NULL COMMENT '市场价',
  `MinSalePrice` decimal(18,2) NOT NULL COMMENT '最小销售价',
  `HasSKU` tinyint(1) NOT NULL COMMENT '是否有SKU',
  `VistiCounts` bigint(20) NOT NULL COMMENT '浏览次数',
  `SaleCounts` bigint(20) NOT NULL COMMENT '销售量',
  `FreightTemplateId` bigint(20) NOT NULL COMMENT '运费模板ID',
  `Weight` decimal(18,2) DEFAULT NULL COMMENT '重量',
  `Volume` decimal(18,2) DEFAULT NULL COMMENT '体积',
  `Quantity` int(11) DEFAULT NULL COMMENT '数量',
  `MeasureUnit` varchar(20) DEFAULT NULL COMMENT '计量单位',
  `EditStatus` int(11) NOT NULL DEFAULT '0' COMMENT '修改状态 0 正常 1己修改 2待审核 3 己修改并待审核',
  `IsDeleted` bit(1) NOT NULL COMMENT '是否已删除',
  `MaxBuyCount` int(11) NOT NULL COMMENT '最大购买数',
  PRIMARY KEY (`Id`),
  KEY `FK_SHOPID` (`ShopId`) USING BTREE,
  KEY `FK_CategoryId` (`CategoryId`) USING BTREE,
  KEY `IX_SaleStatus` (`SaleStatus`) USING BTREE,
  KEY `IX_AuditStatus` (`AuditStatus`) USING BTREE,
  KEY `IX_ShopId` (`ShopId`) USING BTREE,
  KEY `IX_IsDeleted` (`IsDeleted`) USING BTREE,
  CONSTRAINT `FK_CategoryId` FOREIGN KEY (`CategoryId`) REFERENCES `himall_categories` (`Id`),
  CONSTRAINT `FK_SHOPID` FOREIGN KEY (`ShopId`) REFERENCES `himall_shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1172 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_products
-- ----------------------------
INSERT INTO `himall_products` VALUES ('1158', '347', '11', '4|9|11', '107', '0', '【新天地】湘岳香辣鱼仔85g 毛毛鱼 湖南特产小鱼休闲下饭菜即食', '1', null, '1', '1', '2017-08-29 09:44:17', '1', '/Storage/Shop/347/Products/1158', '5.00', '4.50', '0', '0', '0', '216', '0.00', '0.00', null, '袋', '4', '', '0');
INSERT INTO `himall_products` VALUES ('1159', '347', '11', '4|9|11', '107', '0', '【新天地】湘岳香辣鱼仔85g 毛毛鱼 湖南特产小鱼休闲下饭菜即食', '1', null, '1', '1', '2017-08-29 09:44:33', '1', '/Storage/Shop/347/Products/1159', '5.00', '4.50', '0', '0', '0', '216', '0.00', '0.00', null, '袋', '4', '', '0');
INSERT INTO `himall_products` VALUES ('1160', '347', '11', '4|9|11', '107', '0', '【新天地】湘岳香辣鱼仔85g 毛毛鱼 湖南特产小鱼休闲下饭菜即食', '1', null, '1', '2', '2017-08-29 09:44:39', '1', '/Storage/Shop/347/Products/1160', '5.00', '4.50', '0', '0', '0', '216', '0.00', '0.00', null, '袋', '4', '', '0');
INSERT INTO `himall_products` VALUES ('1161', '347', '11', '4|9|11', '107', '0', '【新天地】湘岳香辣鱼仔85g 毛毛鱼 湖南特产小鱼休闲下饭菜即食', '1', null, '1', '2', '2017-08-29 10:13:56', '1', '/Storage/Shop/347/Products/1161', '5.00', '4.50', '0', '0', '0', '216', '0.00', '0.00', null, '件', '0', '\0', '0');
INSERT INTO `himall_products` VALUES ('1162', '347', '11', '4|9|11', '107', '0', '1111', '1', '11111', '1', '1', '2017-08-29 10:16:50', '1', '/Storage/Shop/347/Products/1162', '11.00', '11.00', '0', '0', '0', '216', '0.00', '0.00', null, '件', '4', '', '0');
INSERT INTO `himall_products` VALUES ('1163', '347', '11', '4|9|11', '107', '0', '【巴黎贝尔】三明治', '2', '【巴黎贝尔】三明治', '1', '2', '2017-08-29 10:20:49', '1', '/Storage/Shop/347/Products/1163', '6.00', '5.00', '0', '0', '0', '216', '0.00', '0.00', null, '包', '0', '\0', '0');
INSERT INTO `himall_products` VALUES ('1164', '347', '6', '4|5|6', '107', '0', '【惠农专区】正宗农家花生 500g/袋', '3', '【惠农专区】正宗农家花生 500g/袋', '1', '2', '2017-08-29 10:25:04', '1', '/Storage/Shop/347/Products/1164', '8.00', '6.00', '0', '0', '0', '216', '0.00', '0.00', null, '件', '0', '\0', '0');
INSERT INTO `himall_products` VALUES ('1165', '347', '163', '4|162|163', '107', '0', '【新天地】北京红星二锅头53度蓝瓶八年陈酿500ml', '111', null, '1', '2', '2017-08-29 10:39:30', '1', '/Storage/Shop/347/Products/1165', '30.00', '29.00', '0', '0', '0', '216', '0.00', '0.00', null, '瓶', '0', '\0', '0');
INSERT INTO `himall_products` VALUES ('1166', '347', '165', '4|162|165', '107', '0', '【新天地】通化野生原汁葡萄酒1000ml', '22', null, '1', '2', '2017-08-29 10:42:40', '1', '/Storage/Shop/347/Products/1166', '15.00', '12.00', '0', '0', '0', '216', '0.00', '0.00', null, '瓶', '0', '\0', '0');
INSERT INTO `himall_products` VALUES ('1167', '347', '164', '4|162|164', '107', '0', '【自营】青岛崂山啤酒600ml *9瓶 膜装', '5343', null, '1', '2', '2017-08-29 10:46:13', '1', '/Storage/Shop/347/Products/1167', '20.00', '19.00', '0', '0', '0', '216', '0.00', '0.00', null, '件', '0', '\0', '0');
INSERT INTO `himall_products` VALUES ('1168', '347', '168', '13|166|168', '106', '0', '男士2017秋季新款韩版修身长袖T恤青少年潮流帅气个性打底衫衣服', '111', null, '1', '2', '2017-08-29 11:14:47', '1', '/Storage/Shop/347/Products/1168', '88.00', '59.00', '1', '0', '1', '216', '0.00', '0.00', null, '件', '0', '\0', '0');
INSERT INTO `himall_products` VALUES ('1169', '347', '169', '13|166|169', '106', '0', '毛衣男春秋季韩版男士潮流长袖针织衫开衫毛线衣男青年休闲外套男', '11', null, '1', '2', '2017-08-29 11:20:40', '1', '/Storage/Shop/347/Products/1169', '188.00', '118.00', '1', '0', '0', '216', '0.00', '0.00', null, '件', '0', '\0', '0');
INSERT INTO `himall_products` VALUES ('1170', '347', '167', '13|166|167', '106', '0', '思莱德夏季新款休闲男士棉质锥形版牛仔裤C|417232508', '11', null, '1', '2', '2017-08-29 11:24:01', '1', '/Storage/Shop/347/Products/1170', '288.00', '268.00', '1', '0', '0', '216', '0.00', '0.00', null, '件', '0', '\0', '0');
INSERT INTO `himall_products` VALUES ('1171', '347', '18', '13|14|18', '106', '0', '毛衣女秋冬中长款半高领宽松打底衫韩版套头长袖针织衫新款潮外套', '11', null, '1', '2', '2017-08-29 11:28:54', '1', '/Storage/Shop/347/Products/1171', '109.00', '69.00', '1', '0', '2', '216', '0.00', '0.00', null, '件', '0', '\0', '0');

-- ----------------------------
-- Table structure for himall_productshopcategories
-- ----------------------------
DROP TABLE IF EXISTS `himall_productshopcategories`;
CREATE TABLE `himall_productshopcategories` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductId` bigint(20) NOT NULL,
  `ShopCategoryId` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Product_ProductShopCategory` (`ProductId`) USING BTREE,
  KEY `FK_ShopCategory_ProductShopCategory` (`ShopCategoryId`) USING BTREE,
  CONSTRAINT `himall_productshopcategories_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_productshopcategories_ibfk_2` FOREIGN KEY (`ShopCategoryId`) REFERENCES `himall_shopcategories` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2084 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_productshopcategories
-- ----------------------------

-- ----------------------------
-- Table structure for himall_productvistis
-- ----------------------------
DROP TABLE IF EXISTS `himall_productvistis`;
CREATE TABLE `himall_productvistis` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ProductId` bigint(20) NOT NULL,
  `Date` datetime NOT NULL,
  `VistiCounts` bigint(20) NOT NULL COMMENT '浏览次数',
  `VisitUserCounts` bigint(20) NOT NULL COMMENT '浏览人数',
  `PayUserCounts` bigint(20) NOT NULL COMMENT '付款人数',
  `SaleCounts` bigint(20) NOT NULL COMMENT '商品销售数量',
  `SaleAmounts` decimal(18,2) NOT NULL COMMENT '商品销售额',
  `OrderCounts` bigint(20) unsigned DEFAULT '0' COMMENT '订单总数',
  `StatisticFlag` bit(1) NOT NULL COMMENT '是否已经统计(0：未统计,1已统计)',
  PRIMARY KEY (`Id`),
  KEY `FK_Product_ProductVisti` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_productvistis_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3302 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_productvistis
-- ----------------------------
INSERT INTO `himall_productvistis` VALUES ('3290', '347', '1162', '2017-08-29 00:00:00', '2', '2', '0', '0', '0.00', null, '\0');
INSERT INTO `himall_productvistis` VALUES ('3291', '347', '1161', '2017-08-29 00:00:00', '2', '2', '0', '0', '0.00', null, '\0');
INSERT INTO `himall_productvistis` VALUES ('3292', '347', '1163', '2017-08-29 00:00:00', '10', '8', '0', '0', '0.00', null, '\0');
INSERT INTO `himall_productvistis` VALUES ('3293', '347', '1164', '2017-08-29 00:00:00', '2', '2', '0', '0', '0.00', null, '\0');
INSERT INTO `himall_productvistis` VALUES ('3294', '347', '1165', '2017-08-29 00:00:00', '2', '2', '0', '0', '0.00', null, '\0');
INSERT INTO `himall_productvistis` VALUES ('3295', '347', '1166', '2017-08-29 00:00:00', '2', '2', '0', '0', '0.00', null, '\0');
INSERT INTO `himall_productvistis` VALUES ('3296', '347', '1167', '2017-08-29 00:00:00', '2', '2', '0', '0', '0.00', null, '\0');
INSERT INTO `himall_productvistis` VALUES ('3297', '347', '1168', '2017-08-29 00:00:00', '2', '2', '0', '1', '59.00', null, '\0');
INSERT INTO `himall_productvistis` VALUES ('3298', '347', '1169', '2017-08-29 00:00:00', '4', '2', '0', '0', '0.00', null, '\0');
INSERT INTO `himall_productvistis` VALUES ('3299', '347', '1170', '2017-08-29 00:00:00', '4', '2', '0', '0', '0.00', null, '\0');
INSERT INTO `himall_productvistis` VALUES ('3300', '347', '1171', '2017-08-29 00:00:00', '4', '2', '0', '2', '138.00', null, '\0');
INSERT INTO `himall_productvistis` VALUES ('3301', '347', '1163', '2017-09-04 00:00:00', '2', '2', '0', '0', '0.00', null, '\0');

-- ----------------------------
-- Table structure for himall_productwords
-- ----------------------------
DROP TABLE IF EXISTS `himall_productwords`;
CREATE TABLE `himall_productwords` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `WordId` bigint(20) DEFAULT NULL COMMENT '分词Id',
  `ProductId` bigint(20) DEFAULT NULL COMMENT '商品Id',
  PRIMARY KEY (`Id`),
  KEY `IX_WordId` (`WordId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_productwords
-- ----------------------------

-- ----------------------------
-- Table structure for himall_promoter
-- ----------------------------
DROP TABLE IF EXISTS `himall_promoter`;
CREATE TABLE `himall_promoter` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `UserId` bigint(20) DEFAULT NULL COMMENT '会员编号',
  `ShopName` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `Status` int(11) NOT NULL COMMENT '推销员状态 0审核 1通过 2注销',
  `ApplyTime` datetime DEFAULT NULL COMMENT '申请时间',
  `PassTime` datetime DEFAULT NULL COMMENT '通过时间',
  `Remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_Promoter_UserId` (`UserId`) USING BTREE,
  CONSTRAINT `FK_Himall_Promoter_UserId` FOREIGN KEY (`UserId`) REFERENCES `himall_members` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_promoter
-- ----------------------------

-- ----------------------------
-- Table structure for himall_receivingaddressconfig
-- ----------------------------
DROP TABLE IF EXISTS `himall_receivingaddressconfig`;
CREATE TABLE `himall_receivingaddressconfig` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AddressId_City` text,
  `AddressId` text NOT NULL COMMENT '逗号分隔',
  `ShopId` bigint(20) NOT NULL COMMENT '预留字段，防止将来其他商家一并支持货到付款',
  PRIMARY KEY (`Id`),
  KEY `FK_RACShopId` (`ShopId`) USING BTREE,
  CONSTRAINT `FK_RACShopId` FOREIGN KEY (`ShopId`) REFERENCES `himall_shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_receivingaddressconfig
-- ----------------------------
INSERT INTO `himall_receivingaddressconfig` VALUES ('1', '101,116,129,142,151,158,166,177,185,191,202,214,237,252,263,276,285,300,311,320,330,341,351,359,367,375,386,395,404,412,418,424,430,443,452,462,472,479,486,495,501,507,517,531,537,544,558,562,567,588,603,615,628,643,664,685,710,726,736,757,778,806,825,838,856,870,884,896,909,916,932,940,948,961,976,992,1011,1027,1038,1049,1054,1068,1078,1088,1103,1112,1125,1133,1147,1153,1165,1180,1190,1198,1207,1221,1236,1250,1258,1264,1270,1274,1288,1302,1312,1321,1333,1349,1361,1379,1391,1402,1409,1423,1435,1436,1444,1452,1459,1467,1482,1493,1505,1517,1530,1545,1553,1564,1581,1592,1597,1604,1613,1623,1635,1644,1648,1658,1659,1660,1661,1663,1674,1685,1692,1706,1720,1731,1742,1748,1756,1769,1782,1796,1803,1814,1820,1821,1822,1823,1824,1825,1826,1827,1828,1829,1830,1831,1832,1833,1834,1835,1836,1837,1838,1839,1841,1856,1864,1871,1885,1899,1912,1924,1933,1945,1960,1972,1980,1987,1996,2003,2012,2023,2031,2041,2048,2058,2064,2072,2078,2088,2089,2090,2096,2104,2112,2126,2138,2157,2166,2172,2178,2184,2191,2199,2213,2219,2232,2240,2250,2268,2282,2292,2301,2309,2317,2326,2334,2343,2352,2358,2367,2376,2385,2401,2412,2420,2426,2435,2443,2450,2457,2468,2489,2507,2518,2528,2538,2549,2568,2581,2587,2599,2607,2619,2626,2636,2642,2647,2652,2662,2667,2678,2689,2695,2709,2719,2731,2740,2749,2750,2751,2752,2754,2769,2775,2789,2805,2818,2833,2846,2860,2872,2882,2892,2893,2897,2904,2913,2919,2927,2936,2945,2955,2964,2975,2985,2996,3005,3013,3019,3025,3032,3040,3048,3056,3064,3069,3075,3082,3088,3131,3152,3160,3167,3176,3184,3196,3205,3212,3219,3232,3243,3251,3263,3271,3280,3290,3296,3302,3317,3337,3357,3370,3376,3392,3400,3412,3422,3432,3450,3465,3481,3492,3503,3510,3523,3530,3542,3552,3564,3579,3589,3594,3608,3615,3621,3627,3637,3650,3664,3684,3696,3705,3715,3729,3742,3750,3760,3761,3762,3771,3776,3780,3781,3782,3783,3784,3785,3786,3787,3788,3789,3790,3791,3792,3793,3794,3796,3797,3798,3800,3801', '102,103,104,105,106,107,108,109,110,111,112,113,114,115,117,118,119,120,121,122,123,124,125,126,127,128,130,131,132,133,134,135,136,137,138,139,140,141,143,144,145,146,147,148,149,150,152,153,154,155,156,157,159,160,161,162,163,164,165,167,168,169,170,171,172,173,174,175,176,178,179,180,181,182,183,184,186,187,188,189,190,192,193,194,195,196,197,198,199,200,201,203,204,205,206,207,208,209,210,211,212,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,238,239,240,241,242,243,244,245,246,247,248,249,250,251,253,254,255,256,257,258,259,260,261,262,264,265,266,267,268,269,270,271,272,273,274,275,277,278,279,280,281,282,283,284,286,287,288,289,290,291,292,293,294,295,296,297,298,299,301,302,303,304,305,306,307,308,309,310,312,313,314,315,316,317,318,319,321,322,323,324,325,326,327,328,329,331,332,333,334,335,336,337,338,339,340,342,343,344,345,346,347,348,349,350,352,353,354,355,356,357,358,360,361,362,363,364,365,366,368,369,370,371,372,373,376,377,378,379,380,381,382,383,384,385,387,388,389,390,391,392,393,394,396,397,398,399,400,401,402,403,405,406,407,408,409,410,411,413,414,415,416,417,419,420,421,422,423,425,426,427,428,429,431,432,433,434,435,436,437,438,439,440,441,442,444,445,446,447,448,449,450,451,453,454,455,456,457,458,459,460,461,463,464,465,466,467,468,469,470,471,473,474,475,476,477,478,480,481,482,483,484,485,487,488,489,490,491,492,493,494,496,497,498,499,500,502,503,504,505,506,508,509,510,511,512,513,514,515,518,519,520,521,522,523,524,525,526,527,528,529,530,532,533,534,535,536,538,539,540,541,542,543,545,546,547,548,549,550,551,552,553,554,555,556,557,559,560,561,563,564,565,566,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,589,590,591,592,593,594,595,596,597,598,599,600,601,602,604,605,606,607,608,609,610,611,612,613,614,616,617,618,619,620,621,622,623,624,625,626,627,629,630,631,632,633,634,635,636,637,638,639,640,641,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,711,712,713,714,715,716,717,718,719,720,721,722,723,724,725,727,728,729,730,731,732,733,734,735,737,738,739,740,741,742,743,744,745,746,747,748,749,750,751,752,753,754,755,756,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,773,774,775,776,777,779,780,781,782,783,784,785,786,787,788,789,790,791,792,793,794,795,796,797,798,799,800,801,802,803,804,805,807,808,809,810,811,812,813,814,815,816,817,818,819,820,821,822,823,824,826,827,828,829,830,831,832,833,834,835,836,837,839,840,841,842,843,844,845,846,847,848,849,850,851,852,853,854,855,857,858,859,860,861,862,863,864,865,866,867,868,869,871,872,873,874,875,876,877,878,879,880,881,882,885,886,887,888,889,890,891,892,893,894,895,897,898,899,900,901,902,903,904,905,906,907,908,910,911,912,913,914,915,917,918,919,920,921,922,923,924,925,926,927,928,929,930,931,933,934,935,936,937,938,939,941,942,943,944,945,946,947,949,950,951,952,953,954,955,956,957,958,959,960,962,963,964,965,966,967,968,969,970,971,972,973,974,975,977,978,979,980,981,982,983,984,985,986,987,988,989,990,991,993,994,995,996,997,998,999,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1039,1040,1041,1042,1043,1044,1045,1046,1047,1048,1050,1051,1052,1053,1055,1056,1057,1058,1059,1060,1061,1062,1063,1064,1065,1066,1067,1069,1070,1071,1072,1073,1074,1075,1076,1077,1079,1080,1081,1082,1083,1084,1085,1086,1087,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1104,1105,1106,1107,1108,1109,1110,1111,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1126,1127,1128,1129,1130,1131,1132,1134,1135,1136,1137,1138,1139,1140,1141,1142,1143,1144,1145,1146,1148,1149,1150,1151,1154,1155,1156,1157,1158,1159,1160,1161,1162,1163,1164,1166,1167,1168,1169,1170,1171,1172,1173,1174,1175,1176,1177,1178,1179,1181,1182,1183,1184,1185,1186,1187,1188,1189,1191,1192,1193,1194,1195,1196,1197,1199,1200,1201,1202,1203,1204,1205,1206,1208,1209,1210,1211,1212,1213,1214,1215,1216,1217,1218,1219,1220,1222,1223,1224,1225,1226,1227,1228,1229,1230,1231,1232,1233,1234,1235,1237,1238,1239,1240,1241,1242,1243,1244,1245,1246,1247,1248,1249,1251,1252,1253,1254,1255,1256,1257,1259,1260,1261,1262,1263,1265,1266,1267,1268,1269,1271,1272,1273,1275,1276,1277,1278,1279,1280,1281,1282,1283,1284,1285,1286,1287,1289,1290,1291,1292,1293,1294,1295,1296,1297,1298,1299,1300,1301,1303,1304,1305,1306,1307,1308,1309,1310,1311,1313,1314,1315,1316,1317,1318,1319,1320,1322,1323,1324,1325,1326,1327,1328,1329,1330,1331,1334,1335,1336,1337,1338,1339,1340,1341,1342,1343,1344,1345,1346,1347,1348,1350,1351,1352,1353,1354,1355,1356,1357,1358,1359,1360,1362,1363,1364,1365,1366,1367,1368,1369,1370,1371,1372,1373,1374,1375,1376,1377,1378,1380,1381,1382,1383,1384,1385,1386,1387,1388,1389,1390,1392,1393,1394,1395,1396,1397,1398,1399,1400,1401,1403,1404,1405,1406,1407,1408,1410,1411,1412,1413,1414,1415,1416,1417,1418,1419,1420,1421,1422,1424,1425,1426,1427,1428,1429,1430,1431,1432,1433,1434,1437,1438,1439,1440,1441,1442,1443,1445,1446,1447,1448,1449,1450,1451,1453,1454,1455,1456,1457,1458,1460,1461,1462,1463,1464,1465,1466,1468,1469,1470,1471,1472,1473,1474,1475,1476,1477,1478,1479,1480,1481,1483,1484,1485,1486,1487,1488,1489,1490,1491,1492,1494,1495,1496,1497,1498,1499,1500,1501,1502,1503,1504,1506,1507,1508,1509,1510,1511,1512,1513,1514,1515,1516,1518,1519,1520,1521,1522,1523,1524,1525,1526,1527,1528,1531,1532,1533,1534,1535,1536,1537,1538,1539,1540,1541,1542,1543,1544,1546,1547,1548,1549,1550,1551,1552,1554,1555,1556,1557,1558,1559,1560,1561,1562,1563,1565,1566,1567,1568,1569,1570,1571,1572,1573,1574,1575,1576,1577,1578,1579,1580,1582,1583,1584,1585,1586,1587,1588,1589,1590,1591,1593,1594,1595,1596,1598,1599,1600,1601,1602,1603,1605,1606,1607,1608,1609,1610,1611,1612,1614,1615,1616,1617,1618,1619,1620,1621,1622,1624,1625,1626,1627,1628,1629,1630,1631,1632,1633,1634,1636,1637,1638,1639,1640,1641,1642,1643,1645,1646,1647,1649,1650,1651,1652,1653,1654,1655,1656,1657,1664,1665,1666,1667,1668,1669,1670,1671,1672,1673,1675,1676,1677,1678,1679,1680,1681,1682,1683,1684,1686,1687,1688,1689,1690,1691,1693,1694,1695,1696,1697,1698,1699,1700,1701,1702,1703,1704,1705,1707,1708,1709,1710,1711,1712,1713,1714,1715,1716,1717,1718,1719,1721,1722,1723,1724,1725,1726,1727,1728,1729,1730,1732,1733,1734,1735,1736,1737,1738,1739,1740,1741,1743,1744,1745,1746,1747,1749,1750,1751,1752,1753,1754,1755,1757,1758,1759,1760,1761,1762,1763,1764,1765,1766,1767,1768,1770,1771,1772,1773,1774,1775,1776,1777,1778,1779,1780,1781,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1797,1798,1799,1800,1801,1802,1804,1805,1806,1807,1808,1809,1810,1811,1812,1815,1816,1817,1818,1819,1842,1843,1844,1845,1846,1847,1848,1849,1850,1851,1852,1853,1854,1855,1857,1858,1859,1860,1861,1862,1863,1865,1866,1867,1868,1869,1870,1872,1873,1874,1875,1876,1877,1878,1879,1880,1881,1882,1883,1884,1886,1887,1888,1889,1890,1891,1892,1893,1894,1895,1896,1897,1898,1900,1901,1902,1903,1904,1905,1906,1907,1908,1909,1910,1911,1913,1914,1915,1916,1917,1918,1919,1920,1921,1922,1923,1925,1926,1927,1928,1929,1930,1931,1932,1934,1935,1936,1937,1938,1939,1940,1941,1942,1943,1946,1947,1948,1949,1950,1951,1952,1953,1954,1955,1956,1957,1958,1959,1961,1962,1963,1964,1965,1966,1967,1968,1969,1970,1971,1973,1974,1975,1976,1977,1978,1979,1981,1982,1983,1984,1985,1986,1988,1989,1990,1991,1992,1993,1994,1995,1997,1998,1999,2000,2001,2002,2004,2005,2006,2007,2008,2009,2010,2011,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2024,2025,2026,2027,2028,2029,2030,2032,2033,2034,2035,2036,2037,2038,2039,2040,2042,2043,2044,2045,2046,2047,2049,2050,2051,2052,2053,2054,2055,2056,2057,2059,2060,2061,2062,2063,2065,2066,2067,2068,2069,2070,2071,2073,2074,2075,2076,2077,2079,2080,2081,2082,2083,2084,2085,2086,2087,2091,2092,2093,2094,2095,2097,2098,2099,2100,2101,2102,2103,2105,2106,2107,2108,2109,2110,2113,2114,2115,2116,2117,2118,2119,2120,2121,2122,2123,2124,2125,2127,2128,2129,2130,2131,2132,2133,2134,2135,2136,2137,2139,2140,2141,2142,2143,2144,2145,2146,2147,2148,2149,2150,2151,2152,2153,2154,2155,2156,2158,2159,2160,2161,2162,2163,2164,2165,2167,2168,2169,2170,2171,2173,2174,2175,2176,2177,2179,2180,2181,2182,2183,2185,2186,2187,2188,2189,2190,2192,2193,2194,2195,2196,2197,2198,2200,2201,2202,2203,2204,2205,2206,2207,2208,2209,2210,2211,2212,2214,2215,2216,2217,2218,2220,2221,2222,2223,2224,2225,2226,2227,2228,2229,2230,2231,2233,2234,2235,2236,2237,2238,2239,2241,2242,2243,2244,2245,2246,2247,2248,2251,2252,2253,2254,2255,2256,2257,2258,2259,2260,2261,2262,2263,2264,2265,2266,2267,2269,2270,2271,2272,2273,2274,2275,2276,2277,2278,2279,2280,2281,2283,2284,2285,2286,2287,2288,2289,2290,2291,2293,2294,2295,2296,2297,2298,2299,2300,2302,2303,2304,2305,2306,2307,2308,2310,2311,2312,2313,2314,2315,2316,2318,2319,2320,2321,2322,2323,2324,2325,2327,2328,2329,2330,2331,2332,2333,2335,2336,2337,2338,2339,2340,2341,2342,2344,2345,2346,2347,2348,2349,2350,2351,2353,2354,2355,2356,2357,2359,2360,2361,2362,2363,2364,2365,2366,2368,2369,2370,2371,2372,2373,2374,2375,2377,2378,2379,2380,2381,2382,2383,2386,2387,2388,2389,2390,2391,2392,2393,2394,2395,2396,2397,2398,2399,2400,2402,2403,2404,2405,2406,2407,2408,2409,2410,2411,2413,2414,2415,2416,2417,2418,2419,2421,2422,2423,2424,2425,2427,2428,2429,2430,2431,2432,2433,2434,2436,2437,2438,2439,2440,2441,2442,2444,2445,2446,2447,2448,2449,2451,2452,2453,2454,2455,2456,2458,2459,2460,2461,2462,2463,2464,2465,2466,2469,2470,2471,2472,2473,2474,2475,2476,2477,2478,2479,2480,2481,2482,2483,2484,2485,2486,2487,2488,2490,2491,2492,2493,2494,2495,2496,2497,2498,2499,2500,2501,2502,2503,2504,2505,2506,2508,2509,2510,2511,2512,2513,2514,2515,2516,2517,2519,2520,2521,2522,2523,2524,2525,2526,2527,2529,2530,2531,2532,2533,2534,2535,2536,2537,2539,2540,2541,2542,2543,2544,2545,2546,2547,2548,2550,2551,2552,2553,2554,2555,2556,2557,2558,2559,2560,2561,2562,2563,2564,2565,2566,2567,2569,2570,2571,2572,2573,2574,2575,2576,2577,2578,2579,2580,2582,2583,2584,2585,2586,2588,2589,2590,2591,2592,2593,2594,2595,2596,2597,2598,2600,2601,2602,2603,2604,2605,2606,2608,2609,2610,2611,2612,2613,2614,2615,2616,2617,2618,2620,2621,2622,2623,2624,2627,2628,2629,2630,2631,2632,2633,2634,2635,2637,2638,2639,2640,2641,2643,2644,2645,2646,2648,2649,2650,2651,2653,2654,2655,2656,2657,2658,2659,2660,2661,2663,2664,2665,2666,2668,2669,2670,2671,2672,2673,2674,2675,2676,2677,2679,2680,2681,2682,2683,2684,2685,2686,2687,2688,2690,2691,2692,2693,2694,2696,2697,2698,2699,2700,2701,2702,2703,2704,2705,2706,2707,2708,2710,2711,2712,2713,2714,2715,2716,2717,2718,2720,2721,2722,2723,2724,2725,2726,2727,2728,2729,2730,2732,2733,2734,2735,2736,2737,2738,2739,2741,2742,2743,2744,2745,2746,2747,2748,2755,2756,2757,2758,2759,2760,2761,2762,2763,2764,2765,2766,2767,2768,2770,2771,2772,2773,2774,2776,2777,2778,2779,2780,2781,2782,2783,2784,2785,2786,2787,2788,2790,2791,2792,2793,2794,2795,2796,2797,2798,2799,2800,2801,2802,2803,2804,2806,2807,2808,2809,2810,2811,2812,2813,2814,2815,2816,2817,2819,2820,2821,2822,2823,2824,2825,2826,2827,2828,2829,2830,2831,2832,2834,2835,2836,2837,2838,2839,2840,2841,2842,2843,2844,2845,2847,2848,2849,2850,2851,2852,2853,2854,2855,2856,2857,2858,2859,2861,2862,2863,2864,2865,2866,2867,2868,2869,2870,2871,2873,2874,2875,2876,2877,2878,2879,2880,2883,2884,2885,2886,2887,2888,2889,2890,2891,2894,2895,2896,2898,2899,2900,2901,2902,2903,2905,2906,2907,2908,2909,2910,2911,2912,2914,2915,2916,2917,2918,2920,2921,2922,2923,2924,2925,2926,2928,2929,2930,2931,2932,2933,2934,2935,2937,2938,2939,2940,2941,2942,2943,2944,2946,2947,2948,2949,2950,2951,2952,2953,2954,2956,2957,2958,2959,2960,2961,2962,2963,2965,2966,2967,2968,2969,2970,2971,2972,2973,2974,2976,2977,2978,2979,2980,2981,2982,2983,2984,2986,2987,2988,2989,2990,2991,2992,2993,2994,2997,2998,2999,3000,3001,3002,3003,3004,3006,3007,3008,3009,3010,3011,3012,3014,3015,3016,3017,3018,3020,3021,3022,3023,3024,3026,3027,3028,3029,3030,3031,3033,3034,3035,3036,3037,3038,3039,3041,3042,3043,3044,3045,3046,3047,3049,3050,3051,3052,3053,3054,3057,3058,3059,3060,3061,3062,3063,3065,3066,3067,3068,3070,3071,3072,3073,3074,3076,3077,3078,3079,3080,3081,3083,3084,3085,3086,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100,3101,3102,3103,3104,3105,3106,3107,3108,3109,3110,3111,3112,3113,3114,3115,3116,3117,3118,3119,3120,3121,3122,3123,3124,3125,3126,3127,3128,3129,3132,3133,3134,3135,3136,3137,3138,3139,3140,3141,3142,3143,3144,3145,3146,3147,3148,3149,3150,3151,3153,3154,3155,3156,3157,3158,3159,3161,3162,3163,3164,3165,3166,3168,3169,3170,3171,3172,3173,3174,3175,3177,3178,3179,3180,3181,3182,3183,3185,3186,3187,3188,3189,3190,3191,3192,3193,3194,3195,3197,3198,3199,3200,3201,3202,3203,3204,3206,3207,3208,3209,3210,3211,3213,3214,3215,3216,3217,3218,3220,3221,3222,3223,3224,3225,3226,3227,3228,3229,3230,3231,3233,3234,3235,3236,3237,3238,3239,3240,3241,3242,3244,3245,3246,3247,3248,3249,3250,3252,3253,3254,3255,3256,3257,3258,3259,3260,3261,3262,3264,3265,3266,3267,3268,3269,3270,3272,3273,3274,3275,3276,3277,3278,3279,3281,3282,3283,3284,3285,3286,3287,3288,3289,3291,3292,3293,3294,3295,3297,3298,3299,3300,3301,3303,3304,3305,3306,3307,3308,3309,3310,3311,3312,3313,3314,3315,3316,3318,3319,3320,3321,3322,3323,3324,3325,3326,3327,3328,3329,3330,3331,3332,3333,3334,3335,3336,3338,3339,3340,3341,3342,3343,3344,3345,3346,3347,3348,3349,3350,3351,3352,3353,3354,3355,3358,3359,3360,3361,3362,3363,3364,3365,3366,3367,3368,3369,3371,3372,3373,3374,3375,3377,3378,3379,3380,3381,3382,3383,3384,3385,3386,3387,3388,3389,3390,3391,3393,3394,3395,3396,3397,3398,3399,3401,3402,3403,3404,3405,3406,3407,3408,3409,3410,3411,3413,3414,3415,3416,3417,3418,3419,3420,3421,3423,3424,3425,3426,3427,3428,3429,3430,3431,3433,3434,3435,3436,3437,3438,3439,3440,3441,3442,3443,3444,3445,3446,3447,3448,3449,3451,3452,3453,3454,3455,3456,3457,3458,3459,3460,3461,3462,3463,3466,3467,3468,3469,3470,3471,3472,3473,3474,3475,3476,3477,3478,3479,3480,3482,3483,3484,3485,3486,3487,3488,3489,3490,3491,3493,3494,3495,3496,3497,3498,3499,3500,3501,3502,3504,3505,3506,3507,3508,3509,3511,3512,3513,3514,3515,3516,3517,3518,3519,3520,3521,3522,3524,3525,3526,3527,3528,3529,3531,3532,3533,3534,3535,3536,3537,3538,3539,3540,3541,3543,3544,3545,3546,3547,3548,3549,3550,3551,3553,3554,3555,3556,3557,3558,3559,3560,3561,3562,3563,3565,3566,3567,3568,3569,3570,3571,3572,3573,3574,3575,3576,3577,3578,3580,3581,3582,3583,3584,3585,3586,3587,3588,3590,3591,3592,3593,3595,3596,3597,3598,3599,3600,3601,3602,3603,3604,3605,3606,3607,3609,3610,3611,3612,3613,3614,3616,3617,3618,3619,3620,3622,3623,3624,3625,3628,3629,3630,3631,3632,3633,3634,3635,3636,3638,3639,3640,3641,3642,3643,3644,3645,3646,3647,3648,3649,3651,3652,3653,3654,3655,3656,3657,3658,3659,3660,3661,3662,3663,3665,3666,3667,3668,3669,3670,3671,3672,3673,3674,3675,3676,3677,3678,3679,3680,3681,3682,3683,3685,3686,3687,3688,3689,3690,3691,3692,3693,3694,3695,3697,3698,3699,3700,3701,3702,3703,3704,3706,3707,3708,3709,3710,3711,3712,3713,3716,3717,3718,3719,3720,3721,3722,3723,3724,3725,3726,3727,3728,3730,3731,3732,3733,3734,3735,3736,3737,3738,3739,3740,3741,3743,3744,3745,3746,3747,3748,3749,3751,3752,3753,3754,3755,3756,3757,3758,3759,3763,3764,3765,3766,3767,3768,3769,3770,3772,3773,3774,3775,3777,3778,3779', '1');

-- ----------------------------
-- Table structure for himall_recruitplan
-- ----------------------------
DROP TABLE IF EXISTS `himall_recruitplan`;
CREATE TABLE `himall_recruitplan` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Title` varchar(300) DEFAULT NULL COMMENT '招募标题',
  `Content` varchar(20000) DEFAULT NULL COMMENT '招募内容',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_recruitplan
-- ----------------------------

-- ----------------------------
-- Table structure for himall_recruitsetting
-- ----------------------------
DROP TABLE IF EXISTS `himall_recruitsetting`;
CREATE TABLE `himall_recruitsetting` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Enable` tinyint(1) NOT NULL COMMENT '招募开关',
  `MustMobile` tinyint(1) NOT NULL COMMENT '手机是否必填',
  `MustAddress` tinyint(1) NOT NULL COMMENT '地址必填',
  `MustRealName` tinyint(1) NOT NULL COMMENT '姓名必填',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_recruitsetting
-- ----------------------------
INSERT INTO `himall_recruitsetting` VALUES ('1', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for himall_refundreason
-- ----------------------------
DROP TABLE IF EXISTS `himall_refundreason`;
CREATE TABLE `himall_refundreason` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AfterSalesText` varchar(100) DEFAULT NULL COMMENT '售后原因',
  `Sequence` int(11) DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='售后原因';

-- ----------------------------
-- Records of himall_refundreason
-- ----------------------------

-- ----------------------------
-- Table structure for himall_roleprivileges
-- ----------------------------
DROP TABLE IF EXISTS `himall_roleprivileges`;
CREATE TABLE `himall_roleprivileges` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Privilege` int(11) NOT NULL COMMENT '权限ID',
  `RoleId` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`Id`),
  KEY `FK_Role_RolePrivilege` (`RoleId`) USING BTREE,
  CONSTRAINT `himall_roleprivileges_ibfk_1` FOREIGN KEY (`RoleId`) REFERENCES `himall_roles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1610 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_roleprivileges
-- ----------------------------

-- ----------------------------
-- Table structure for himall_roles
-- ----------------------------
DROP TABLE IF EXISTS `himall_roles`;
CREATE TABLE `himall_roles` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `RoleName` varchar(100) NOT NULL COMMENT '角色名称',
  `Description` varchar(1000) NOT NULL COMMENT '说明',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_roles
-- ----------------------------

-- ----------------------------
-- Table structure for himall_searchproducts
-- ----------------------------
DROP TABLE IF EXISTS `himall_searchproducts`;
CREATE TABLE `himall_searchproducts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductId` bigint(20) NOT NULL COMMENT '商品Id',
  `ProductName` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `ShopId` bigint(20) NOT NULL DEFAULT '0' COMMENT '店铺Id',
  `ShopName` varchar(100) DEFAULT '' COMMENT '店铺名称',
  `BrandId` bigint(20) DEFAULT '0' COMMENT '品牌Id',
  `BrandName` varchar(100) DEFAULT '' COMMENT '品牌名称',
  `BrandLogo` varchar(1000) DEFAULT '' COMMENT '品牌Logo',
  `FirstCateId` bigint(20) NOT NULL DEFAULT '0' COMMENT '一级分类Id',
  `FirstCateName` varchar(100) NOT NULL DEFAULT '' COMMENT '一级分类名称',
  `SecondCateId` bigint(20) NOT NULL COMMENT '二级分类Id',
  `SecondCateName` varchar(100) NOT NULL DEFAULT '' COMMENT '二级分类名称',
  `ThirdCateId` bigint(20) NOT NULL COMMENT '三级分类Id',
  `ThirdCateName` varchar(100) NOT NULL DEFAULT '' COMMENT '三级分类名称',
  `AttrValues` text COMMENT '属性值Id用英文逗号分隔',
  `Comments` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `SaleCount` int(11) NOT NULL DEFAULT '0' COMMENT '成交量',
  `SalePrice` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `OnSaleTime` datetime DEFAULT NULL COMMENT '上架时间',
  `ImagePath` varchar(100) NOT NULL DEFAULT '' COMMENT '商品图片地址',
  `CanSearch` bit(1) NOT NULL DEFAULT b'0' COMMENT '可以搜索',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_ProductId` (`ProductId`) USING BTREE,
  KEY `IX_ShopId` (`ShopId`),
  KEY `IX_BrandId` (`BrandId`),
  KEY `IX_FirstCateId` (`FirstCateId`),
  KEY `IX_SecondCateId` (`SecondCateId`),
  KEY `IX_ThirdCateId` (`ThirdCateId`),
  KEY `IX_Comments` (`Comments`),
  KEY `IX_SaleCount` (`SaleCount`),
  KEY `IX_OnSaleTime` (`OnSaleTime`),
  KEY `IX_CanSearch` (`CanSearch`),
  KEY `IX_SalePrice` (`SalePrice`) USING BTREE,
  FULLTEXT KEY `ProductName` (`ProductName`) /*!50100 WITH PARSER `ngram` */ 
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_searchproducts
-- ----------------------------
INSERT INTO `himall_searchproducts` VALUES ('71', '1162', '1111', '347', '御风飞自营店', '0', null, null, '4', '食品、酒类、特产', '9', '拉条', '11', '卫龙', null, '0', '0', '11.00', '2017-08-29 10:16:50', '/Storage/Shop/347/Products/1162', '\0');
INSERT INTO `himall_searchproducts` VALUES ('72', '1163', '【巴黎贝尔】三明治', '347', '御风飞自营店', '0', null, null, '4', '食品、酒类、特产', '9', '拉条', '11', '卫龙', null, '0', '0', '5.00', '2017-08-29 10:20:49', '/Storage/Shop/347/Products/1163', '');
INSERT INTO `himall_searchproducts` VALUES ('73', '1164', '【惠农专区】正宗农家花生 500g/袋', '347', '御风飞自营店', '0', null, null, '4', '食品、酒类、特产', '5', '坚果', '6', '松子', null, '0', '0', '6.00', '2017-08-29 10:25:04', '/Storage/Shop/347/Products/1164', '');
INSERT INTO `himall_searchproducts` VALUES ('74', '1165', '【新天地】北京红星二锅头53度蓝瓶八年陈酿500ml', '347', '御风飞自营店', '0', null, null, '4', '食品、酒类、特产', '162', '酒水', '163', '白酒', null, '0', '0', '29.00', '2017-08-29 10:39:30', '/Storage/Shop/347/Products/1165', '');
INSERT INTO `himall_searchproducts` VALUES ('75', '1166', '【新天地】通化野生原汁葡萄酒1000ml', '347', '御风飞自营店', '0', null, null, '4', '食品、酒类、特产', '162', '酒水', '165', '红酒', null, '0', '0', '12.00', '2017-08-29 10:42:40', '/Storage/Shop/347/Products/1166', '');
INSERT INTO `himall_searchproducts` VALUES ('76', '1167', '【自营】青岛崂山啤酒600ml *9瓶 膜装', '347', '御风飞自营店', '0', null, null, '4', '食品、酒类、特产', '162', '酒水', '164', '啤酒', null, '0', '0', '19.00', '2017-08-29 10:46:13', '/Storage/Shop/347/Products/1167', '');
INSERT INTO `himall_searchproducts` VALUES ('77', '1168', '男士2017秋季新款韩版修身长袖T恤青少年潮流帅气个性打底衫衣服', '347', '御风飞自营店', '0', null, null, '13', '男装、女装、童装', '166', '男装', '168', '外套', null, '0', '1', '59.00', '2017-08-29 11:14:47', '/Storage/Shop/347/Products/1168', '');
INSERT INTO `himall_searchproducts` VALUES ('78', '1169', '毛衣男春秋季韩版男士潮流长袖针织衫开衫毛线衣男青年休闲外套男', '347', '御风飞自营店', '0', null, null, '13', '男装、女装、童装', '166', '男装', '169', '毛衣', null, '0', '0', '118.00', '2017-08-29 11:20:40', '/Storage/Shop/347/Products/1169', '');
INSERT INTO `himall_searchproducts` VALUES ('79', '1170', '思莱德夏季新款休闲男士棉质锥形版牛仔裤C|417232508', '347', '御风飞自营店', '0', null, null, '13', '男装、女装、童装', '166', '男装', '167', '男裤', null, '0', '0', '268.00', '2017-08-29 11:24:01', '/Storage/Shop/347/Products/1170', '');
INSERT INTO `himall_searchproducts` VALUES ('80', '1171', '毛衣女秋冬中长款半高领宽松打底衫韩版套头长袖针织衫新款潮外套', '347', '御风飞自营店', '0', null, null, '13', '男装、女装、童装', '14', '女装', '18', '针织衫', null, '0', '2', '69.00', '2017-08-29 11:28:54', '/Storage/Shop/347/Products/1171', '');

-- ----------------------------
-- Table structure for himall_segmentwords
-- ----------------------------
DROP TABLE IF EXISTS `himall_segmentwords`;
CREATE TABLE `himall_segmentwords` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Word` varchar(50) NOT NULL COMMENT '分词',
  PRIMARY KEY (`Id`),
  KEY `IX_Word` (`Word`) USING BTREE,
  FULLTEXT KEY `IX_FT_Word` (`Word`) /*!50100 WITH PARSER `ngram` */ 
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_segmentwords
-- ----------------------------

-- ----------------------------
-- Table structure for himall_sellerspecificationvalues
-- ----------------------------
DROP TABLE IF EXISTS `himall_sellerspecificationvalues`;
CREATE TABLE `himall_sellerspecificationvalues` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ValueId` bigint(20) NOT NULL COMMENT '规格值ID',
  `Specification` int(11) NOT NULL COMMENT '规格（颜色、尺寸、版本）',
  `TypeId` bigint(20) NOT NULL COMMENT '类型ID',
  `Value` varchar(100) NOT NULL COMMENT '商家的规格值',
  PRIMARY KEY (`Id`),
  KEY `FK_SpecificationValue_SellerSpecificationValue` (`ValueId`) USING BTREE,
  CONSTRAINT `himall_sellerspecificationvalues_ibfk_1` FOREIGN KEY (`ValueId`) REFERENCES `himall_specificationvalues` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_sellerspecificationvalues
-- ----------------------------

-- ----------------------------
-- Table structure for himall_sendmessagerecord
-- ----------------------------
DROP TABLE IF EXISTS `himall_sendmessagerecord`;
CREATE TABLE `himall_sendmessagerecord` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MessageType` int(11) NOT NULL COMMENT '消息类别',
  `ContentType` int(11) NOT NULL COMMENT '内容类型',
  `SendContent` varchar(600) NOT NULL COMMENT '发送内容',
  `ToUserLabel` varchar(200) DEFAULT NULL COMMENT '发送对象',
  `SendState` int(11) DEFAULT NULL COMMENT '发送状态',
  `SendTime` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_sendmessagerecord
-- ----------------------------

-- ----------------------------
-- Table structure for himall_sendmessagerecordcoupon
-- ----------------------------
DROP TABLE IF EXISTS `himall_sendmessagerecordcoupon`;
CREATE TABLE `himall_sendmessagerecordcoupon` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MessageId` bigint(20) NOT NULL,
  `CouponId` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Reference_message` (`MessageId`),
  KEY `FK_Reference_messageCoupon` (`CouponId`),
  CONSTRAINT `FK_Reference_message` FOREIGN KEY (`MessageId`) REFERENCES `himall_sendmessagerecord` (`Id`),
  CONSTRAINT `FK_Reference_messageCoupon` FOREIGN KEY (`CouponId`) REFERENCES `himall_coupon` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='发送优惠券详细';

-- ----------------------------
-- Records of himall_sendmessagerecordcoupon
-- ----------------------------

-- ----------------------------
-- Table structure for himall_sendmessagerecordcouponsn
-- ----------------------------
DROP TABLE IF EXISTS `himall_sendmessagerecordcouponsn`;
CREATE TABLE `himall_sendmessagerecordcouponsn` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MessageId` bigint(20) NOT NULL,
  `CouponSN` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_sendmessagerecordcouponsn
-- ----------------------------

-- ----------------------------
-- Table structure for himall_sensitivewords
-- ----------------------------
DROP TABLE IF EXISTS `himall_sensitivewords`;
CREATE TABLE `himall_sensitivewords` (
  `Id` int(4) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `SensitiveWord` varchar(100) DEFAULT NULL COMMENT '敏感词',
  `CategoryName` varchar(100) DEFAULT NULL COMMENT '敏感词类别',
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_sensitivewords
-- ----------------------------

-- ----------------------------
-- Table structure for himall_settled
-- ----------------------------
DROP TABLE IF EXISTS `himall_settled`;
CREATE TABLE `himall_settled` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BusinessType` int(11) NOT NULL COMMENT '商家类型 0、仅企业可入驻；1、仅个人可入驻；2、企业和个人均可',
  `SettlementAccountType` int(11) NOT NULL COMMENT '商家结算类型 0、仅银行账户；1、仅微信账户；2、银行账户及微信账户均可',
  `TrialDays` int(11) NOT NULL COMMENT '试用天数',
  `IsCity` int(11) NOT NULL COMMENT '地址必填 0、非必填；1、必填',
  `IsPeopleNumber` int(11) NOT NULL COMMENT '人数必填 0、非必填；1、必填',
  `IsAddress` int(11) NOT NULL COMMENT '详细地址必填 0、非必填；1、必填',
  `IsBusinessLicenseCode` int(11) NOT NULL COMMENT '营业执照号必填 0、非必填；1、必填',
  `IsBusinessScope` int(11) NOT NULL COMMENT '经营范围必填 0、非必填；1、必填',
  `IsBusinessLicense` int(11) NOT NULL COMMENT '营业执照必填 0、非必填；1、必填',
  `IsAgencyCode` int(11) NOT NULL COMMENT '机构代码必填 0、非必填；1、必填',
  `IsAgencyCodeLicense` int(11) NOT NULL COMMENT '机构代码证必填 0、非必填；1、必填',
  `IsTaxpayerToProve` int(11) NOT NULL COMMENT '纳税人证明必填 0、非必填；1、必填',
  `CompanyVerificationType` int(11) NOT NULL COMMENT '验证类型 0、验证手机；1、验证邮箱；2、均需验证',
  `IsSName` int(11) NOT NULL COMMENT '个人姓名必填 0、非必填；1、必填',
  `IsSCity` int(11) NOT NULL COMMENT '个人地址必填 0、非必填；1、必填',
  `IsSAddress` int(11) NOT NULL COMMENT '个人详细地址必填 0、非必填；1、必填',
  `IsSIDCard` int(11) NOT NULL COMMENT '个人身份证必填 0、非必填；1、必填',
  `IsSIdCardUrl` int(11) NOT NULL COMMENT '个人身份证上传 0、非必填；1、必填',
  `SelfVerificationType` int(11) NOT NULL COMMENT '个人验证类型 0、验证手机；1、验证邮箱；2、均需验证',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='入驻设置';

-- ----------------------------
-- Records of himall_settled
-- ----------------------------
INSERT INTO `himall_settled` VALUES ('2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for himall_shippingaddresses
-- ----------------------------
DROP TABLE IF EXISTS `himall_shippingaddresses`;
CREATE TABLE `himall_shippingaddresses` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `RegionId` int(11) NOT NULL COMMENT '区域ID',
  `ShipTo` varchar(100) NOT NULL COMMENT '收货人',
  `Address` varchar(100) NOT NULL COMMENT '收货具体街道信息',
  `Phone` varchar(100) NOT NULL COMMENT '收货人电话',
  `IsDefault` tinyint(1) NOT NULL COMMENT '是否为默认',
  `IsQuick` tinyint(1) NOT NULL COMMENT '是否为轻松购地址',
  `Longitude` float DEFAULT NULL COMMENT '经度',
  `Latitude` float DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`Id`),
  KEY `FK_Member_ShippingAddress` (`UserId`) USING BTREE,
  CONSTRAINT `himall_shippingaddresses_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `himall_members` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_shippingaddresses
-- ----------------------------
INSERT INTO `himall_shippingaddresses` VALUES ('252', '639', '3670', '贼啦帅', '贼拉地儿', '18889898787', '0', '0', null, null);

-- ----------------------------
-- Table structure for himall_shopaccount
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopaccount`;
CREATE TABLE `himall_shopaccount` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺Id',
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  `Balance` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '帐户余额',
  `PendingSettlement` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '待结算',
  `Settled` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '已结算',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='店铺资金表';

-- ----------------------------
-- Records of himall_shopaccount
-- ----------------------------
INSERT INTO `himall_shopaccount` VALUES ('1', '1', '官方旗舰店', '0.00', '0.00', '0.00');
INSERT INTO `himall_shopaccount` VALUES ('37', '346', '京东小超市', '0.00', '0.00', '0.00');
INSERT INTO `himall_shopaccount` VALUES ('38', '347', '御风飞自营店', '0.00', '0.00', '0.00');

-- ----------------------------
-- Table structure for himall_shopaccountitem
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopaccountitem`;
CREATE TABLE `himall_shopaccountitem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  `AccountNo` varchar(50) NOT NULL COMMENT '交易流水号',
  `AccoutID` bigint(20) NOT NULL COMMENT '关联资金编号',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `Amount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `Balance` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '帐户剩余',
  `TradeType` int(4) NOT NULL DEFAULT '0' COMMENT '交易类型',
  `IsIncome` bit(1) NOT NULL COMMENT '是否收入',
  `ReMark` varchar(1000) DEFAULT NULL COMMENT '交易备注',
  `DetailId` varchar(100) DEFAULT NULL COMMENT '详情ID',
  `SettlementCycle` int(11) NOT NULL COMMENT '结算周期(以天为单位)(冗余字段)',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_Shtem_AccoutID` (`AccoutID`),
  CONSTRAINT `FK_Himall_Shtem_AccoutID` FOREIGN KEY (`AccoutID`) REFERENCES `himall_shopaccount` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COMMENT='店铺资金流水表';

-- ----------------------------
-- Records of himall_shopaccountitem
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shopbonus
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopbonus`;
CREATE TABLE `himall_shopbonus` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Count` int(11) NOT NULL COMMENT '红包数量',
  `RandomAmountStart` decimal(18,2) NOT NULL COMMENT '随机范围Start',
  `RandomAmountEnd` decimal(18,2) NOT NULL COMMENT '随机范围End',
  `UseState` int(11) NOT NULL COMMENT '1:满X元使用  2：没有限制',
  `UsrStatePrice` decimal(18,2) NOT NULL COMMENT '满多少元',
  `GrantPrice` decimal(18,2) NOT NULL COMMENT '满多少元才发放红包',
  `DateStart` datetime NOT NULL,
  `DateEnd` datetime NOT NULL,
  `BonusDateStart` datetime NOT NULL,
  `BonusDateEnd` datetime NOT NULL,
  `ShareTitle` varchar(30) NOT NULL COMMENT '分享',
  `ShareDetail` varchar(150) NOT NULL COMMENT '分享',
  `ShareImg` varchar(200) NOT NULL COMMENT '分享',
  `SynchronizeCard` tinyint(1) NOT NULL COMMENT '是否同步到微信卡包，是的话才出现微信卡卷相关UI',
  `CardTitle` varchar(30) DEFAULT NULL COMMENT '微信卡卷相关',
  `CardColor` varchar(20) DEFAULT NULL COMMENT '微信卡卷相关',
  `CardSubtitle` varchar(30) DEFAULT NULL COMMENT '微信卡卷相关',
  `IsInvalid` tinyint(1) NOT NULL COMMENT '是否失效',
  `ReceiveCount` int(11) DEFAULT NULL COMMENT '领取数量',
  `QRPath` varchar(80) NOT NULL COMMENT '二维码路径',
  `WXCardState` int(255) NOT NULL COMMENT '微信卡卷审核状态',
  PRIMARY KEY (`Id`),
  KEY `FK_zzzShopId` (`ShopId`) USING BTREE,
  CONSTRAINT `FK_zzzShopId` FOREIGN KEY (`ShopId`) REFERENCES `himall_shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_shopbonus
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shopbonusgrant
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopbonusgrant`;
CREATE TABLE `himall_shopbonusgrant` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopBonusId` bigint(20) NOT NULL COMMENT '红包Id',
  `UserId` bigint(20) NOT NULL COMMENT '发放人',
  `OrderId` bigint(20) NOT NULL,
  `BonusQR` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ShopBonusId` (`ShopBonusId`) USING BTREE,
  KEY `FK_zzzUserID` (`UserId`) USING BTREE,
  CONSTRAINT `FK_ShopBonusId` FOREIGN KEY (`ShopBonusId`) REFERENCES `himall_shopbonus` (`Id`),
  CONSTRAINT `FK_zzzUserID` FOREIGN KEY (`UserId`) REFERENCES `himall_members` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_shopbonusgrant
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shopbonusreceive
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopbonusreceive`;
CREATE TABLE `himall_shopbonusreceive` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `BonusGrantId` bigint(20) NOT NULL COMMENT '红包Id',
  `OpenId` varchar(100) DEFAULT NULL,
  `Price` decimal(18,2) DEFAULT NULL COMMENT '面额',
  `State` int(11) NOT NULL COMMENT '1.未使用  2.已使用  3.已过期',
  `ReceiveTime` datetime DEFAULT NULL COMMENT '领取时间',
  `UsedTime` datetime DEFAULT NULL COMMENT '使用时间',
  `UserId` bigint(20) DEFAULT NULL COMMENT 'UserID',
  `UsedOrderId` bigint(20) DEFAULT NULL COMMENT '使用的订单号',
  `WXName` varchar(30) DEFAULT NULL,
  `WXHead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_BonusGrantId` (`BonusGrantId`) USING BTREE,
  KEY `FK_useUserID` (`UserId`) USING BTREE,
  CONSTRAINT `FK_BonusGrantId` FOREIGN KEY (`BonusGrantId`) REFERENCES `himall_shopbonusgrant` (`Id`),
  CONSTRAINT `FK_useUserID` FOREIGN KEY (`UserId`) REFERENCES `himall_members` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19686 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_shopbonusreceive
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shopbranch
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopbranch`;
CREATE TABLE `himall_shopbranch` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ShopId` bigint(20) NOT NULL COMMENT '商家店铺ID',
  `ShopBranchName` varchar(30) NOT NULL COMMENT '门店名称',
  `AddressId` int(11) NOT NULL COMMENT '门店地址ID',
  `AddressPath` varchar(50) DEFAULT NULL COMMENT '所在区域全路径编号(省，市，区)',
  `AddressDetail` varchar(40) NOT NULL COMMENT '门店详细地址',
  `ContactUser` varchar(50) NOT NULL COMMENT '联系人',
  `ContactPhone` varchar(50) NOT NULL COMMENT '联系地址',
  `Status` int(11) NOT NULL COMMENT '门店状态(0:正常，1:冻结)',
  `CreateDate` datetime NOT NULL COMMENT '创建时间',
  `ServeRadius` int(11) DEFAULT NULL COMMENT '服务半径',
  `Longitude` float DEFAULT NULL COMMENT '经度',
  `Latitude` float DEFAULT NULL COMMENT '维度',
  `ShopImages` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='门店信息表';

-- ----------------------------
-- Records of himall_shopbranch
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shopbranchmanagers
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopbranchmanagers`;
CREATE TABLE `himall_shopbranchmanagers` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopBranchId` bigint(20) NOT NULL COMMENT '门店表ID',
  `UserName` varchar(100) NOT NULL COMMENT '用户名称',
  `Password` varchar(100) NOT NULL COMMENT '密码',
  `PasswordSalt` varchar(100) NOT NULL COMMENT '密码加盐',
  `CreateDate` datetime NOT NULL COMMENT '创建日期',
  `Remark` varchar(1000) DEFAULT NULL,
  `RealName` varchar(1000) DEFAULT NULL COMMENT '真实名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='门店管理员表';

-- ----------------------------
-- Records of himall_shopbranchmanagers
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shopbranchskus
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopbranchskus`;
CREATE TABLE `himall_shopbranchskus` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` bigint(20) NOT NULL COMMENT '商品id(冗余字段)',
  `SkuId` varchar(100) NOT NULL COMMENT 'SKU表Id',
  `ShopId` bigint(20) NOT NULL COMMENT '商家id(冗余字段)',
  `ShopBranchId` bigint(20) NOT NULL COMMENT '门店id',
  `Stock` int(11) NOT NULL COMMENT '库存',
  `Status` int(11) NOT NULL COMMENT '门店SKU状态',
  `CreateDate` datetime NOT NULL COMMENT 'SKU添加时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8 COMMENT='商家分店SKU信息';

-- ----------------------------
-- Records of himall_shopbranchskus
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shopbrandapplys
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopbrandapplys`;
CREATE TABLE `himall_shopbrandapplys` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ShopId` bigint(20) NOT NULL COMMENT '商家Id',
  `BrandId` bigint(20) DEFAULT NULL COMMENT '品牌Id',
  `BrandName` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `Logo` varchar(1000) DEFAULT NULL COMMENT '品牌Logo',
  `Description` varchar(1000) DEFAULT NULL COMMENT '描述',
  `AuthCertificate` varchar(4000) DEFAULT NULL COMMENT '品牌授权证书',
  `ApplyMode` int(11) NOT NULL COMMENT '申请类型 枚举 BrandApplyMode',
  `Remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `AuditStatus` int(11) NOT NULL COMMENT '审核状态 枚举 BrandAuditStatus',
  `ApplyTime` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`Id`),
  KEY `FK_ShopId` (`ShopId`) USING BTREE,
  KEY `FK_BrandId` (`BrandId`) USING BTREE,
  KEY `Id` (`Id`) USING BTREE,
  CONSTRAINT `himall_shopbrandapplys_ibfk_1` FOREIGN KEY (`BrandId`) REFERENCES `himall_brands` (`Id`),
  CONSTRAINT `himall_shopbrandapplys_ibfk_2` FOREIGN KEY (`ShopId`) REFERENCES `himall_shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_shopbrandapplys
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shopbrands
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopbrands`;
CREATE TABLE `himall_shopbrands` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ShopId` bigint(20) NOT NULL COMMENT '商家Id',
  `BrandId` bigint(20) NOT NULL COMMENT '品牌Id',
  PRIMARY KEY (`Id`),
  KEY `ShopId` (`ShopId`) USING BTREE,
  KEY `BrandId` (`BrandId`) USING BTREE,
  KEY `Id` (`Id`) USING BTREE,
  CONSTRAINT `himall_shopbrands_ibfk_1` FOREIGN KEY (`BrandId`) REFERENCES `himall_brands` (`Id`),
  CONSTRAINT `himall_shopbrands_ibfk_2` FOREIGN KEY (`ShopId`) REFERENCES `himall_shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_shopbrands
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shopcategories
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopcategories`;
CREATE TABLE `himall_shopcategories` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ParentCategoryId` bigint(20) NOT NULL COMMENT '上级分类ID',
  `Name` varchar(100) DEFAULT NULL COMMENT '分类名称',
  `DisplaySequence` bigint(20) NOT NULL,
  `IsShow` tinyint(1) NOT NULL COMMENT '是否显示',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_shopcategories
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shopdistributorsetting
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopdistributorsetting`;
CREATE TABLE `himall_shopdistributorsetting` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `DistributorDefaultRate` decimal(6,2) NOT NULL COMMENT '分销默认分佣比',
  `DistributorShareName` varchar(100) DEFAULT NULL COMMENT '分销分享名称',
  `DistributorShareContent` varchar(1000) DEFAULT NULL COMMENT '分销分享说明',
  `DistributorShareLogo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_shopdistributorsetting
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shopfooter
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopfooter`;
CREATE TABLE `himall_shopfooter` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `Footer` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_shopfooter
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shopgrades
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopgrades`;
CREATE TABLE `himall_shopgrades` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL COMMENT '店铺等级名称',
  `ProductLimit` int(11) NOT NULL COMMENT '最大上传商品数量',
  `ImageLimit` int(11) NOT NULL COMMENT '最大图片可使用空间数量',
  `TemplateLimit` int(11) NOT NULL,
  `ChargeStandard` decimal(8,2) NOT NULL,
  `Remark` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_shopgrades
-- ----------------------------
INSERT INTO `himall_shopgrades` VALUES ('1', '白金店铺', '500', '500', '500', '500.00', null);
INSERT INTO `himall_shopgrades` VALUES ('2', '钻石店铺', '1000', '1000', '1000', '1000.00', null);

-- ----------------------------
-- Table structure for himall_shophomemoduleproducts
-- ----------------------------
DROP TABLE IF EXISTS `himall_shophomemoduleproducts`;
CREATE TABLE `himall_shophomemoduleproducts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `HomeModuleId` bigint(20) NOT NULL,
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `DisplaySequence` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`Id`),
  KEY `FK_Product_ShopHomeModuleProduct` (`ProductId`) USING BTREE,
  KEY `FK_ShopHomeModule_ShopHomeModuleProduct` (`HomeModuleId`) USING BTREE,
  CONSTRAINT `himall_shophomemoduleproducts_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_shophomemoduleproducts_ibfk_2` FOREIGN KEY (`HomeModuleId`) REFERENCES `himall_shophomemodules` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_shophomemoduleproducts
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shophomemodules
-- ----------------------------
DROP TABLE IF EXISTS `himall_shophomemodules`;
CREATE TABLE `himall_shophomemodules` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `Name` varchar(20) NOT NULL COMMENT '模块名称',
  `IsEnable` tinyint(1) NOT NULL COMMENT '是否启用',
  `DisplaySequence` int(11) NOT NULL COMMENT '排序',
  `Url` varchar(200) DEFAULT NULL COMMENT '楼层链接',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_shophomemodules
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shophomemodulestopimg
-- ----------------------------
DROP TABLE IF EXISTS `himall_shophomemodulestopimg`;
CREATE TABLE `himall_shophomemodulestopimg` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ImgPath` varchar(200) NOT NULL,
  `Url` varchar(200) DEFAULT NULL,
  `HomeModuleId` bigint(20) NOT NULL,
  `DisplaySequence` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_SFTHomeModuleId` (`HomeModuleId`),
  CONSTRAINT `FK_SFTHomeModuleId` FOREIGN KEY (`HomeModuleId`) REFERENCES `himall_shophomemodules` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_shophomemodulestopimg
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shopopenapisetting
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopopenapisetting`;
CREATE TABLE `himall_shopopenapisetting` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺编号',
  `AppKey` varchar(100) NOT NULL COMMENT 'app_key',
  `AppSecreat` varchar(100) NOT NULL COMMENT 'app_secreat',
  `AddDate` datetime DEFAULT NULL COMMENT '增加时间',
  `LastEditDate` datetime DEFAULT NULL COMMENT '最后重置时间',
  `IsEnable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启',
  `IsRegistered` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否己注册',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_shopopenapisetting
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shoppingcarts
-- ----------------------------
DROP TABLE IF EXISTS `himall_shoppingcarts`;
CREATE TABLE `himall_shoppingcarts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `SkuId` varchar(100) DEFAULT NULL COMMENT 'SKUID',
  `Quantity` bigint(20) NOT NULL COMMENT '购买数量',
  `AddTime` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`Id`),
  KEY `FK_Member_ShoppingCart` (`UserId`) USING BTREE,
  KEY `FK_Product_ShoppingCart` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_shoppingcarts_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `himall_members` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_shoppingcarts_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_shoppingcarts
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shoprenewrecord
-- ----------------------------
DROP TABLE IF EXISTS `himall_shoprenewrecord`;
CREATE TABLE `himall_shoprenewrecord` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `Operator` varchar(100) NOT NULL COMMENT '操作者',
  `OperateDate` datetime NOT NULL COMMENT '操作日期',
  `OperateContent` varchar(1000) DEFAULT NULL COMMENT '操作明细',
  `OperateType` int(1) NOT NULL COMMENT '类型',
  `Amount` decimal(10,2) NOT NULL COMMENT '支付金额',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='店铺续费记录表';

-- ----------------------------
-- Records of himall_shoprenewrecord
-- ----------------------------

-- ----------------------------
-- Table structure for himall_shops
-- ----------------------------
DROP TABLE IF EXISTS `himall_shops`;
CREATE TABLE `himall_shops` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `GradeId` bigint(20) NOT NULL COMMENT '店铺等级',
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  `Logo` varchar(100) DEFAULT NULL COMMENT '店铺LOGO路径',
  `SubDomains` varchar(100) DEFAULT NULL COMMENT '预留子域名，未使用',
  `Theme` varchar(100) DEFAULT NULL COMMENT '预留主题，未使用',
  `IsSelf` tinyint(1) NOT NULL COMMENT '是否是官方自营店',
  `ShopStatus` int(11) NOT NULL COMMENT '店铺状态',
  `RefuseReason` varchar(1000) DEFAULT NULL COMMENT '审核拒绝原因',
  `CreateDate` datetime NOT NULL COMMENT '店铺创建日期',
  `EndDate` datetime DEFAULT NULL COMMENT '店铺过期日期',
  `CompanyName` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `CompanyRegionId` int(11) NOT NULL COMMENT '公司省市区',
  `CompanyAddress` varchar(100) DEFAULT NULL COMMENT '公司地址',
  `CompanyPhone` varchar(100) DEFAULT NULL COMMENT '公司电话',
  `CompanyEmployeeCount` int(11) NOT NULL COMMENT '公司员工数量',
  `CompanyRegisteredCapital` decimal(18,2) NOT NULL COMMENT '公司注册资金',
  `ContactsName` varchar(100) DEFAULT NULL COMMENT '联系人姓名',
  `ContactsPhone` varchar(100) DEFAULT NULL COMMENT '联系电话',
  `ContactsEmail` varchar(100) DEFAULT NULL COMMENT '联系Email',
  `BusinessLicenceNumber` varchar(100) DEFAULT NULL COMMENT '营业执照号',
  `BusinessLicenceNumberPhoto` varchar(100) NOT NULL COMMENT '营业执照',
  `BusinessLicenceRegionId` int(11) NOT NULL COMMENT '营业执照所在地',
  `BusinessLicenceStart` datetime DEFAULT NULL COMMENT '营业执照有效期开始',
  `BusinessLicenceEnd` datetime DEFAULT NULL COMMENT '营业执照有效期',
  `BusinessSphere` varchar(100) DEFAULT NULL COMMENT '法定经营范围',
  `OrganizationCode` varchar(100) DEFAULT NULL COMMENT '组织机构代码',
  `OrganizationCodePhoto` varchar(100) DEFAULT NULL COMMENT '组织机构执照',
  `GeneralTaxpayerPhot` varchar(100) DEFAULT NULL COMMENT '一般纳税人证明',
  `BankAccountName` varchar(100) DEFAULT NULL COMMENT '银行开户名',
  `BankAccountNumber` varchar(100) DEFAULT NULL COMMENT '公司银行账号',
  `BankName` varchar(100) DEFAULT NULL COMMENT '开户银行支行名称',
  `BankCode` varchar(100) DEFAULT NULL COMMENT '支行联行号',
  `BankRegionId` int(11) NOT NULL COMMENT '开户银行所在地',
  `BankPhoto` varchar(100) DEFAULT NULL,
  `TaxRegistrationCertificate` varchar(100) DEFAULT NULL COMMENT '税务登记证',
  `TaxpayerId` varchar(100) DEFAULT NULL COMMENT '税务登记证号',
  `TaxRegistrationCertificatePhoto` varchar(100) DEFAULT NULL COMMENT '纳税人识别号',
  `PayPhoto` varchar(100) DEFAULT NULL COMMENT '支付凭证',
  `PayRemark` varchar(1000) DEFAULT NULL COMMENT '支付注释',
  `SenderName` varchar(100) DEFAULT NULL COMMENT '商家发货人名称',
  `SenderAddress` varchar(100) DEFAULT NULL COMMENT '商家发货人地址',
  `SenderPhone` varchar(100) DEFAULT NULL COMMENT '商家发货人电话',
  `Freight` decimal(18,2) NOT NULL COMMENT '运费',
  `FreeFreight` decimal(18,2) NOT NULL COMMENT '多少钱开始免运费',
  `Stage` int(11) DEFAULT '0' COMMENT '注册步骤',
  `SenderRegionId` int(11) DEFAULT NULL COMMENT '商家发货人省市区',
  `BusinessLicenseCert` varchar(120) DEFAULT NULL COMMENT '营业执照证书',
  `ProductCert` varchar(120) DEFAULT NULL COMMENT '商品证书',
  `OtherCert` varchar(120) DEFAULT NULL COMMENT '其他证书',
  `legalPerson` varchar(50) DEFAULT NULL COMMENT '法人代表',
  `CompanyFoundingDate` datetime DEFAULT NULL COMMENT '公司成立日期',
  `BusinessType` int(11) DEFAULT '0' COMMENT '0、企业；1、个人',
  `IDCard` varchar(50) DEFAULT '' COMMENT '身份证号',
  `IDCardUrl` varchar(200) DEFAULT '' COMMENT '身份证URL',
  `IDCardUrl2` varchar(200) DEFAULT NULL COMMENT '身份证照片URL2',
  `WeiXinNickName` varchar(200) DEFAULT '' COMMENT '微信昵称',
  `WeiXinSex` int(11) DEFAULT '0' COMMENT '微信性别;0、男；1、女',
  `WeiXinAddress` varchar(200) DEFAULT '' COMMENT '微信地区',
  `WeiXinTrueName` varchar(200) DEFAULT '' COMMENT '微信真实姓名',
  `WeiXinOpenId` varchar(200) DEFAULT '' COMMENT '微信标识符',
  `WeiXinImg` varchar(200) DEFAULT NULL,
  `AutoAllotOrder` tinyint(1) DEFAULT NULL COMMENT '商家是否开启自动分配订单',
  PRIMARY KEY (`Id`),
  KEY `IX_ShopIsSelf` (`IsSelf`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_shops
-- ----------------------------
INSERT INTO `himall_shops` VALUES ('1', '1', '官方自营店', null, null, null, '1', '7', null, '2014-10-30 00:00:00', '2117-07-27 11:48:15', '海商网络科技', '102', '文化大厦', '876588888', '1000', '1.00', '杨先生', '13988887748', 'Yang@hishop.com', '966587458', '1', '102', '2014-05-05 00:00:00', '2014-12-12 00:00:00', '1', '66548726', '1', '1', '杨先生', '6228445888796651200', '中国银行', '44698', '101', '1', '1', '33695', '1', '1', '1', '1', '1', '1', '11.00', '11.00', '5', '102', null, null, null, null, null, '0', '', '', null, '', '0', '', '', '', null, null);
INSERT INTO `himall_shops` VALUES ('346', '2', '京东小超市', null, null, null, '0', '7', null, '2017-07-27 12:17:10', '2018-01-01 00:00:00', '京东小超市', '0', null, null, '1', '0.00', null, null, null, null, '', '0', '0001-01-01 00:00:00', '0001-01-01 00:00:00', null, null, null, null, '京东', '622848', '北京市', null, '3653', null, null, null, null, null, null, null, null, null, '0.00', '0.00', '5', null, '/Storage/Shop/346/Cert/BusinessLicenseCert', '/Storage/Shop/346/Cert/ProductCert', '/Storage/Shop/346/Cert/OtherCert', null, '0001-01-01 00:00:00', '0', null, null, null, null, '0', null, null, null, null, '1');
INSERT INTO `himall_shops` VALUES ('347', '2', '御风飞自营店', null, null, null, '0', '7', null, '2017-08-29 09:32:24', '2019-03-01 00:00:00', '米拉科技公司', '3984', '米拉', null, '1', '0.00', null, null, null, '9665874588', '', '0', '0001-01-01 00:00:00', '0001-01-01 00:00:00', null, '966587458888', null, null, '建设银行', '1111', '米拉路', '111', '4586', null, null, null, null, null, null, null, null, null, '0.00', '0.00', '5', null, '/Storage/Shop/347/Cert/BusinessLicenseCert', '/Storage/Shop/347/Cert/ProductCert', '/Storage/Shop/347/Cert/OtherCert', null, '0001-01-01 00:00:00', '0', null, null, null, null, '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for himall_shopvistis
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopvistis`;
CREATE TABLE `himall_shopvistis` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `Date` datetime NOT NULL COMMENT '日期',
  `VistiCounts` bigint(20) NOT NULL COMMENT '浏览人数',
  `OrderUserCount` bigint(20) NOT NULL COMMENT '下单人数',
  `OrderCount` bigint(20) NOT NULL COMMENT '订单数',
  `OrderProductCount` bigint(20) NOT NULL COMMENT '下单件数',
  `OrderAmount` decimal(18,2) NOT NULL COMMENT '下单金额',
  `OrderPayUserCount` bigint(20) NOT NULL COMMENT '下单付款人数',
  `OrderPayCount` bigint(20) NOT NULL COMMENT '付款订单数',
  `SaleCounts` bigint(20) NOT NULL COMMENT '付款下单件数',
  `SaleAmounts` decimal(18,2) NOT NULL COMMENT '付款金额',
  `StatisticFlag` bit(1) NOT NULL COMMENT '是否已经统计(0：未统计,1已统计)',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3029 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_shopvistis
-- ----------------------------
INSERT INTO `himall_shopvistis` VALUES ('3027', '347', '2017-08-29 00:00:00', '25', '0', '0', '0', '0.00', '0', '0', '0', '0.00', '\0');
INSERT INTO `himall_shopvistis` VALUES ('3028', '347', '2017-09-04 00:00:00', '1', '0', '0', '0', '0.00', '0', '0', '0', '0.00', '\0');

-- ----------------------------
-- Table structure for himall_shopwithdraw
-- ----------------------------
DROP TABLE IF EXISTS `himall_shopwithdraw`;
CREATE TABLE `himall_shopwithdraw` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `CashNo` varchar(100) NOT NULL COMMENT '提现流水号',
  `ApplyTime` datetime NOT NULL COMMENT '申请时间',
  `Status` int(11) NOT NULL COMMENT '提现状态',
  `CashType` int(11) NOT NULL COMMENT '提现方式',
  `CashAmount` decimal(18,2) NOT NULL COMMENT '提现金额',
  `Account` varchar(100) NOT NULL COMMENT '提现帐号',
  `AccountName` varchar(100) NOT NULL COMMENT '提现人',
  `SellerId` bigint(20) DEFAULT NULL,
  `SellerName` varchar(100) NOT NULL COMMENT '申请商家用户名',
  `DealTime` datetime DEFAULT NULL COMMENT '处理时间',
  `ShopRemark` varchar(1000) DEFAULT NULL COMMENT '商家备注',
  `PlatRemark` varchar(1000) DEFAULT NULL COMMENT '平台备注',
  `ShopName` varchar(200) DEFAULT '' COMMENT '商店名称',
  `SerialNo` varchar(200) DEFAULT '' COMMENT '支付商流水号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='店铺提现表';

-- ----------------------------
-- Records of himall_shopwithdraw
-- ----------------------------

-- ----------------------------
-- Table structure for himall_sitesettings
-- ----------------------------
DROP TABLE IF EXISTS `himall_sitesettings`;
CREATE TABLE `himall_sitesettings` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Key` varchar(100) NOT NULL,
  `Value` varchar(4000) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_sitesettings
-- ----------------------------
INSERT INTO `himall_sitesettings` VALUES ('1', 'Logo', '/Storage/Plat/Site/logo.png');
INSERT INTO `himall_sitesettings` VALUES ('2', 'SiteName', '新天地商城');
INSERT INTO `himall_sitesettings` VALUES ('3', 'ICPNubmer', ' ');
INSERT INTO `himall_sitesettings` VALUES ('4', 'CustomerTel', ' ');
INSERT INTO `himall_sitesettings` VALUES ('6', 'Keyword', '手机');
INSERT INTO `himall_sitesettings` VALUES ('7', 'Hotkeywords', '男装,海飞丝,女装,ABC,手机,Nikon,包包,鞋子');
INSERT INTO `himall_sitesettings` VALUES ('8', 'PageFoot', ' ');
INSERT INTO `himall_sitesettings` VALUES ('10', 'MemberLogo', '/Storage/Plat/Site/memberLogo.png');
INSERT INTO `himall_sitesettings` VALUES ('11', 'QRCode', '/Storage/Plat/Site/qrCode.png');
INSERT INTO `himall_sitesettings` VALUES ('12', 'FlowScript', '新天地商城系统售后请联系旺旺');
INSERT INTO `himall_sitesettings` VALUES ('13', 'Site_SEOTitle', '新天地商城');
INSERT INTO `himall_sitesettings` VALUES ('14', 'Site_SEOKeywords', '新天地商城系统售后请联系旺旺');
INSERT INTO `himall_sitesettings` VALUES ('15', 'Site_SEODescription', '新天地商城系统售后请联系旺旺');
INSERT INTO `himall_sitesettings` VALUES ('16', 'ProdutAuditOnOff', '1');
INSERT INTO `himall_sitesettings` VALUES ('17', 'WithDrawMinimum', '1');
INSERT INTO `himall_sitesettings` VALUES ('18', 'WithDrawMaximum', '2000');
INSERT INTO `himall_sitesettings` VALUES ('19', 'WeekSettlement', '1');
INSERT INTO `himall_sitesettings` VALUES ('20', 'IsOpenStore', 'False');
INSERT INTO `himall_sitesettings` VALUES ('21', 'IsOpenShopApp', 'False');
INSERT INTO `himall_sitesettings` VALUES ('104', 'UserCookieKey', 'aef892a3910dc6eeb5ce0289c13f7b13');
INSERT INTO `himall_sitesettings` VALUES ('105', 'SiteIsClose', 'False');
INSERT INTO `himall_sitesettings` VALUES ('106', 'RegisterType', '0');
INSERT INTO `himall_sitesettings` VALUES ('107', 'MobileVerifOpen', 'False');
INSERT INTO `himall_sitesettings` VALUES ('108', 'RegisterEmailRequired', 'False');
INSERT INTO `himall_sitesettings` VALUES ('109', 'EmailVerifOpen', 'False');
INSERT INTO `himall_sitesettings` VALUES ('110', 'WXLogo', '/Storage/Plat/Site/wxlogo.png');
INSERT INTO `himall_sitesettings` VALUES ('111', 'PCLoginPic', '/Storage/Plat/Site/pcloginpic.png');
INSERT INTO `himall_sitesettings` VALUES ('112', 'PCBottomPic', '/Storage/Plat/ImageAd/PCBottomPic.jpg');
INSERT INTO `himall_sitesettings` VALUES ('113', 'WeixinAppId', '');
INSERT INTO `himall_sitesettings` VALUES ('114', 'WeixinAppSecret', '');
INSERT INTO `himall_sitesettings` VALUES ('115', 'WeixinToken', '');
INSERT INTO `himall_sitesettings` VALUES ('116', 'WeixinPartnerID', '');
INSERT INTO `himall_sitesettings` VALUES ('117', 'WeixinPartnerKey', '');
INSERT INTO `himall_sitesettings` VALUES ('118', 'WeixinLoginUrl', '');
INSERT INTO `himall_sitesettings` VALUES ('119', 'WeixinIsValidationService', 'False');
INSERT INTO `himall_sitesettings` VALUES ('120', 'SellerAdminAgreement', '');
INSERT INTO `himall_sitesettings` VALUES ('121', 'AdvancePaymentPercent', '0');
INSERT INTO `himall_sitesettings` VALUES ('122', 'AdvancePaymentLimit', '0');
INSERT INTO `himall_sitesettings` VALUES ('123', 'UnpaidTimeout', '0');
INSERT INTO `himall_sitesettings` VALUES ('124', 'NoReceivingTimeout', '0');
INSERT INTO `himall_sitesettings` VALUES ('125', 'OrderCommentTimeout', '0');
INSERT INTO `himall_sitesettings` VALUES ('126', 'SalesReturnTimeout', '0');
INSERT INTO `himall_sitesettings` VALUES ('127', 'AS_ShopConfirmTimeout', '0');
INSERT INTO `himall_sitesettings` VALUES ('128', 'AS_SendGoodsCloseTimeout', '0');
INSERT INTO `himall_sitesettings` VALUES ('129', 'AS_ShopNoReceivingTimeout', '0');
INSERT INTO `himall_sitesettings` VALUES ('130', 'WX_MSGGetCouponTemplateId', '');
INSERT INTO `himall_sitesettings` VALUES ('131', 'AppUpdateDescription', '新天地商城系统售后请联系旺旺');
INSERT INTO `himall_sitesettings` VALUES ('132', 'AppVersion', '2.61');
INSERT INTO `himall_sitesettings` VALUES ('133', 'AndriodDownLoad', '');
INSERT INTO `himall_sitesettings` VALUES ('134', 'IOSDownLoad', 'https://itunes.apple.com/cn/app/id1058273436');
INSERT INTO `himall_sitesettings` VALUES ('135', 'CanDownload', 'False');
INSERT INTO `himall_sitesettings` VALUES ('136', 'ShopAppVersion', '');
INSERT INTO `himall_sitesettings` VALUES ('137', 'ShopAndriodDownLoad', '');
INSERT INTO `himall_sitesettings` VALUES ('138', 'ShopIOSDownLoad', '');
INSERT INTO `himall_sitesettings` VALUES ('139', 'KuaidiType', '0');
INSERT INTO `himall_sitesettings` VALUES ('140', 'Kuaidi100Key', '');
INSERT INTO `himall_sitesettings` VALUES ('141', 'KuaidiApp_key', '');
INSERT INTO `himall_sitesettings` VALUES ('142', 'KuaidiAppSecret', '');
INSERT INTO `himall_sitesettings` VALUES ('143', 'Limittime', 'True');
INSERT INTO `himall_sitesettings` VALUES ('144', 'AdvertisementImagePath', '');
INSERT INTO `himall_sitesettings` VALUES ('145', 'AdvertisementUrl', '');
INSERT INTO `himall_sitesettings` VALUES ('146', 'AdvertisementState', 'False');
INSERT INTO `himall_sitesettings` VALUES ('147', 'AutoAllotOrder', 'False');

-- ----------------------------
-- Table structure for himall_sitesigninconfig
-- ----------------------------
DROP TABLE IF EXISTS `himall_sitesigninconfig`;
CREATE TABLE `himall_sitesigninconfig` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IsEnable` tinyint(1) NOT NULL COMMENT '开启签到',
  `DayIntegral` int(11) NOT NULL DEFAULT '0' COMMENT '签到获得积分',
  `DurationCycle` int(11) NOT NULL DEFAULT '0' COMMENT '持续周期',
  `DurationReward` int(11) NOT NULL DEFAULT '0' COMMENT '周期额外奖励积分',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_sitesigninconfig
-- ----------------------------

-- ----------------------------
-- Table structure for himall_skus
-- ----------------------------
DROP TABLE IF EXISTS `himall_skus`;
CREATE TABLE `himall_skus` (
  `Id` varchar(100) NOT NULL COMMENT '商品ID_颜色规格ID_颜色规格ID_尺寸规格',
  `AutoId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键Id',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `Color` varchar(100) DEFAULT NULL COMMENT '颜色规格',
  `Size` varchar(100) DEFAULT NULL COMMENT '尺寸规格',
  `Version` varchar(100) DEFAULT NULL COMMENT '版本规格',
  `Sku` varchar(100) DEFAULT NULL COMMENT 'SKU',
  `Stock` bigint(20) NOT NULL COMMENT '库存',
  `CostPrice` decimal(18,2) NOT NULL COMMENT '成本价',
  `SalePrice` decimal(18,2) NOT NULL COMMENT '销售价',
  `ShowPic` varchar(200) DEFAULT NULL COMMENT '显示图片',
  `SafeStock` bigint(20) DEFAULT NULL COMMENT '警戒库存',
  PRIMARY KEY (`AutoId`),
  KEY `FK_Product_Sku` (`ProductId`) USING BTREE,
  KEY `AutoId` (`AutoId`),
  KEY `Id` (`Id`),
  CONSTRAINT `himall_skus_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `himall_products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6270 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_skus
-- ----------------------------
INSERT INTO `himall_skus` VALUES ('1158_0_0_0', '6214', '1158', null, null, null, null, '1000', '0.00', '4.50', null, '100');
INSERT INTO `himall_skus` VALUES ('1159_0_0_0', '6215', '1159', null, null, null, null, '1000', '0.00', '4.50', null, '100');
INSERT INTO `himall_skus` VALUES ('1160_0_0_0', '6216', '1160', null, null, null, null, '1000', '0.00', '4.50', null, '100');
INSERT INTO `himall_skus` VALUES ('1161_0_0_0', '6217', '1161', null, null, null, null, '1000', '0.00', '4.50', null, '100');
INSERT INTO `himall_skus` VALUES ('1162_0_0_0', '6218', '1162', null, null, null, null, '1111', '0.00', '11.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1163_0_0_0', '6219', '1163', null, null, null, null, '100', '0.00', '5.00', null, '20');
INSERT INTO `himall_skus` VALUES ('1164_0_0_0', '6220', '1164', null, null, null, null, '100', '0.00', '6.00', null, '20');
INSERT INTO `himall_skus` VALUES ('1165_0_0_0', '6221', '1165', null, null, null, null, '1000', '0.00', '29.00', null, '100');
INSERT INTO `himall_skus` VALUES ('1166_0_0_0', '6222', '1166', null, null, null, null, '1000', '0.00', '12.00', null, '20');
INSERT INTO `himall_skus` VALUES ('1167_0_0_0', '6223', '1167', null, null, null, null, '1000', '0.00', '19.00', null, '80');
INSERT INTO `himall_skus` VALUES ('1168_831_843_0', '6224', '1168', '蓝色', '170/88(M)', null, null, '999', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_836_842_0', '6225', '1168', '黑色', '165/84(S)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_835_840_0', '6226', '1168', '黄色', '160/80(XS)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_831_844_0', '6227', '1168', '蓝色', '175/92(L)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_836_840_0', '6228', '1168', '黑色', '160/80(XS)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_835_842_0', '6229', '1168', '黄色', '165/84(S)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_835_844_0', '6230', '1168', '黄色', '175/92(L)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_837_843_0', '6231', '1168', '深灰色', '170/88(M)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_831_840_0', '6232', '1168', '蓝色', '160/80(XS)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_836_844_0', '6233', '1168', '黑色', '175/92(L)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_831_842_0', '6234', '1168', '蓝色', '165/84(S)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_836_843_0', '6235', '1168', '黑色', '170/88(M)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_837_845_0', '6236', '1168', '深灰色', '180/96(XL)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_837_842_0', '6237', '1168', '深灰色', '165/84(S)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_836_845_0', '6238', '1168', '黑色', '180/96(XL)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_837_840_0', '6239', '1168', '深灰色', '160/80(XS)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_831_845_0', '6240', '1168', '蓝色', '180/96(XL)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_835_843_0', '6241', '1168', '黄色', '170/88(M)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_837_844_0', '6242', '1168', '深灰色', '175/92(L)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1168_835_845_0', '6243', '1168', '黄色', '180/96(XL)', null, null, '1000', '0.00', '59.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1169_837_840_0', '6244', '1169', '深灰色', '160/80(XS)', null, null, '1000', '0.00', '118.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1169_836_843_0', '6245', '1169', '黑色', '170/88(M)', null, null, '1000', '0.00', '118.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1169_837_844_0', '6246', '1169', '深灰色', '175/92(L)', null, null, '1000', '0.00', '118.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1169_837_843_0', '6247', '1169', '深灰色', '170/88(M)', null, null, '1000', '0.00', '118.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1169_836_845_0', '6248', '1169', '黑色', '180/96(XL)', null, null, '1000', '0.00', '118.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1169_836_842_0', '6249', '1169', '黑色', '165/84(S)', null, null, '1000', '0.00', '118.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1169_837_845_0', '6250', '1169', '深灰色', '180/96(XL)', null, null, '1000', '0.00', '118.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1169_836_840_0', '6251', '1169', '黑色', '160/80(XS)', null, null, '1000', '0.00', '118.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1169_836_844_0', '6252', '1169', '黑色', '175/92(L)', null, null, '1000', '0.00', '118.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1169_837_842_0', '6253', '1169', '深灰色', '165/84(S)', null, null, '1000', '0.00', '118.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1170_831_843_0', '6254', '1170', '蓝色', '170/88(M)', null, null, '1000', '0.00', '268.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1170_831_844_0', '6255', '1170', '蓝色', '175/92(L)', null, null, '1000', '0.00', '268.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1170_831_846_0', '6256', '1170', '蓝色', '185/100(XXL)', null, null, '1000', '0.00', '268.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1170_831_845_0', '6257', '1170', '蓝色', '180/96(XL)', null, null, '1000', '0.00', '268.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1171_828_844_0', '6258', '1171', '红色', '175/92(L)', null, null, '998', '0.00', '69.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1171_836_843_0', '6259', '1171', '黑色', '170/88(M)', null, null, '1000', '0.00', '69.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1171_828_842_0', '6260', '1171', '红色', '165/84(S)', null, null, '1000', '0.00', '69.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1171_836_845_0', '6261', '1171', '黑色', '180/96(XL)', null, null, '1000', '0.00', '69.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1171_836_842_0', '6262', '1171', '黑色', '165/84(S)', null, null, '1000', '0.00', '69.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1171_835_842_0', '6263', '1171', '黄色', '165/84(S)', null, null, '1000', '0.00', '69.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1171_835_844_0', '6264', '1171', '黄色', '175/92(L)', null, null, '1000', '0.00', '69.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1171_828_845_0', '6265', '1171', '红色', '180/96(XL)', null, null, '1000', '0.00', '69.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1171_836_844_0', '6266', '1171', '黑色', '175/92(L)', null, null, '1000', '0.00', '69.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1171_828_843_0', '6267', '1171', '红色', '170/88(M)', null, null, '1000', '0.00', '69.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1171_835_843_0', '6268', '1171', '黄色', '170/88(M)', null, null, '1000', '0.00', '69.00', null, '0');
INSERT INTO `himall_skus` VALUES ('1171_835_845_0', '6269', '1171', '黄色', '180/96(XL)', null, null, '1000', '0.00', '69.00', null, '0');

-- ----------------------------
-- Table structure for himall_slideads
-- ----------------------------
DROP TABLE IF EXISTS `himall_slideads`;
CREATE TABLE `himall_slideads` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID，0：平台轮播图  ',
  `ImageUrl` varchar(100) NOT NULL COMMENT '图片保存URL',
  `Url` varchar(1000) NOT NULL COMMENT '图片跳转URL',
  `DisplaySequence` bigint(20) NOT NULL,
  `TypeId` int(11) NOT NULL DEFAULT '0',
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_slideads
-- ----------------------------
INSERT INTO `himall_slideads` VALUES ('169', '0', '/Storage/Plat/ImageAd/201708290824374109310.jpg', 'http://119.29.164.13:7001/Product/Detail/1164', '2', '1', null);
INSERT INTO `himall_slideads` VALUES ('170', '0', '/Storage/Plat/ImageAd/201708290827429451870.jpg', 'http://119.29.164.13:7001/Product/Detail/1161', '1', '1', null);
INSERT INTO `himall_slideads` VALUES ('171', '0', '/Storage/Plat/ImageAd/201708290824565818350.jpg', 'http://119.29.164.13:7001/Product/Detail/1165', '3', '1', null);

-- ----------------------------
-- Table structure for himall_specificationvalues
-- ----------------------------
DROP TABLE IF EXISTS `himall_specificationvalues`;
CREATE TABLE `himall_specificationvalues` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Specification` int(11) NOT NULL COMMENT '规格名',
  `TypeId` bigint(20) NOT NULL COMMENT '类型ID',
  `Value` varchar(100) NOT NULL COMMENT '规格值',
  PRIMARY KEY (`Id`),
  KEY `FK_Type_SpecificationValue` (`TypeId`) USING BTREE,
  CONSTRAINT `himall_specificationvalues_ibfk_1` FOREIGN KEY (`TypeId`) REFERENCES `himall_types` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=850 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_specificationvalues
-- ----------------------------
INSERT INTO `himall_specificationvalues` VALUES ('814', '1', '101', '紫色');
INSERT INTO `himall_specificationvalues` VALUES ('815', '1', '101', '红色');
INSERT INTO `himall_specificationvalues` VALUES ('816', '1', '101', '绿色');
INSERT INTO `himall_specificationvalues` VALUES ('817', '1', '101', '蓝色');
INSERT INTO `himall_specificationvalues` VALUES ('818', '1', '101', '黄色');
INSERT INTO `himall_specificationvalues` VALUES ('819', '1', '101', '白色');
INSERT INTO `himall_specificationvalues` VALUES ('820', '1', '101', '黑色');
INSERT INTO `himall_specificationvalues` VALUES ('821', '2', '101', '1.4M书桌');
INSERT INTO `himall_specificationvalues` VALUES ('822', '2', '101', '1.2M书桌');
INSERT INTO `himall_specificationvalues` VALUES ('823', '2', '101', '1.8M书桌');
INSERT INTO `himall_specificationvalues` VALUES ('824', '1', '105', '银色');
INSERT INTO `himall_specificationvalues` VALUES ('825', '1', '105', '黑色');
INSERT INTO `himall_specificationvalues` VALUES ('826', '1', '105', '白色');
INSERT INTO `himall_specificationvalues` VALUES ('827', '1', '106', '紫色');
INSERT INTO `himall_specificationvalues` VALUES ('828', '1', '106', '红色');
INSERT INTO `himall_specificationvalues` VALUES ('829', '1', '106', '绿色');
INSERT INTO `himall_specificationvalues` VALUES ('830', '1', '106', '花色');
INSERT INTO `himall_specificationvalues` VALUES ('831', '1', '106', '蓝色');
INSERT INTO `himall_specificationvalues` VALUES ('832', '1', '106', '褐色');
INSERT INTO `himall_specificationvalues` VALUES ('833', '1', '106', '透明');
INSERT INTO `himall_specificationvalues` VALUES ('834', '1', '106', '酒红色');
INSERT INTO `himall_specificationvalues` VALUES ('835', '1', '106', '黄色');
INSERT INTO `himall_specificationvalues` VALUES ('836', '1', '106', '黑色');
INSERT INTO `himall_specificationvalues` VALUES ('837', '1', '106', '深灰色');
INSERT INTO `himall_specificationvalues` VALUES ('838', '1', '106', '深紫色');
INSERT INTO `himall_specificationvalues` VALUES ('839', '1', '106', '深蓝色');
INSERT INTO `himall_specificationvalues` VALUES ('840', '2', '106', '160/80(XS)');
INSERT INTO `himall_specificationvalues` VALUES ('841', '2', '106', '190/110(XXXL)');
INSERT INTO `himall_specificationvalues` VALUES ('842', '2', '106', '165/84(S)');
INSERT INTO `himall_specificationvalues` VALUES ('843', '2', '106', '170/88(M)');
INSERT INTO `himall_specificationvalues` VALUES ('844', '2', '106', '175/92(L)');
INSERT INTO `himall_specificationvalues` VALUES ('845', '2', '106', '180/96(XL)');
INSERT INTO `himall_specificationvalues` VALUES ('846', '2', '106', '185/100(XXL)');
INSERT INTO `himall_specificationvalues` VALUES ('847', '2', '106', '160/84(XS)');
INSERT INTO `himall_specificationvalues` VALUES ('848', '2', '106', '165/88(S)');
INSERT INTO `himall_specificationvalues` VALUES ('849', '2', '106', '170/92(M)');

-- ----------------------------
-- Table structure for himall_statisticordercomments
-- ----------------------------
DROP TABLE IF EXISTS `himall_statisticordercomments`;
CREATE TABLE `himall_statisticordercomments` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `CommentKey` int(11) NOT NULL COMMENT '评价的枚举（宝贝与描述相符 商家得分）',
  `CommentValue` decimal(10,4) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `himall_statisticordercomments_ibfk_1` (`ShopId`) USING BTREE,
  CONSTRAINT `himall_statisticordercomments_ibfk_1` FOREIGN KEY (`ShopId`) REFERENCES `himall_shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_statisticordercomments
-- ----------------------------

-- ----------------------------
-- Table structure for himall_templatevisualizationsettings
-- ----------------------------
DROP TABLE IF EXISTS `himall_templatevisualizationsettings`;
CREATE TABLE `himall_templatevisualizationsettings` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CurrentTemplateName` varchar(2000) NOT NULL COMMENT '当前使用的模板的名称',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺Id（平台为0）',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_templatevisualizationsettings
-- ----------------------------

-- ----------------------------
-- Table structure for himall_theme
-- ----------------------------
DROP TABLE IF EXISTS `himall_theme`;
CREATE TABLE `himall_theme` (
  `ThemeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `TypeId` int(11) NOT NULL COMMENT '0、默认主题；1、自定义主题',
  `MainColor` varchar(50) DEFAULT NULL COMMENT '商城主色',
  `SecondaryColor` varchar(50) DEFAULT NULL COMMENT '商城辅色',
  `WritingColor` varchar(50) DEFAULT NULL COMMENT '字体颜色',
  `FrameColor` varchar(50) DEFAULT NULL COMMENT '边框颜色',
  `ClassifiedsColor` varchar(50) DEFAULT NULL COMMENT '商品分类栏',
  PRIMARY KEY (`ThemeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='主题设置表';

-- ----------------------------
-- Records of himall_theme
-- ----------------------------
INSERT INTO `himall_theme` VALUES ('2', '0', '#3c78d8', '', '', '', '');

-- ----------------------------
-- Table structure for himall_topicmodules
-- ----------------------------
DROP TABLE IF EXISTS `himall_topicmodules`;
CREATE TABLE `himall_topicmodules` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `TopicId` bigint(20) NOT NULL COMMENT '专题ID',
  `Name` varchar(100) NOT NULL COMMENT '专题名称',
  `TitleAlign` int(11) NOT NULL COMMENT '标题位置 0、left；1、center ；2、right',
  PRIMARY KEY (`Id`),
  KEY `FK_Topic_TopicModule` (`TopicId`) USING BTREE,
  CONSTRAINT `himall_topicmodules_ibfk_1` FOREIGN KEY (`TopicId`) REFERENCES `himall_topics` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_topicmodules
-- ----------------------------

-- ----------------------------
-- Table structure for himall_topics
-- ----------------------------
DROP TABLE IF EXISTS `himall_topics`;
CREATE TABLE `himall_topics` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL COMMENT '专题名称',
  `FrontCoverImage` varchar(100) DEFAULT NULL COMMENT '封面图片',
  `TopImage` varchar(100) NOT NULL COMMENT '主图',
  `BackgroundImage` varchar(100) DEFAULT NULL COMMENT '背景图片',
  `PlatForm` int(11) NOT NULL DEFAULT '0' COMMENT '使用终端',
  `Tags` varchar(100) DEFAULT NULL COMMENT '标签',
  `ShopId` bigint(20) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `IsRecommend` tinyint(1) unsigned zerofill NOT NULL COMMENT '是否推荐',
  `SelfDefineText` text COMMENT '自定义热点',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_topics
-- ----------------------------

-- ----------------------------
-- Table structure for himall_typebrands
-- ----------------------------
DROP TABLE IF EXISTS `himall_typebrands`;
CREATE TABLE `himall_typebrands` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `TypeId` bigint(20) NOT NULL,
  `BrandId` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Brand_TypeBrand` (`BrandId`) USING BTREE,
  KEY `FK_Type_TypeBrand` (`TypeId`) USING BTREE,
  CONSTRAINT `himall_typebrands_ibfk_1` FOREIGN KEY (`BrandId`) REFERENCES `himall_brands` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_typebrands_ibfk_2` FOREIGN KEY (`TypeId`) REFERENCES `himall_types` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1891 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_typebrands
-- ----------------------------
INSERT INTO `himall_typebrands` VALUES ('1881', '96', '341');
INSERT INTO `himall_typebrands` VALUES ('1882', '96', '339');
INSERT INTO `himall_typebrands` VALUES ('1883', '102', '361');
INSERT INTO `himall_typebrands` VALUES ('1884', '102', '365');
INSERT INTO `himall_typebrands` VALUES ('1885', '104', '366');
INSERT INTO `himall_typebrands` VALUES ('1887', '105', '367');
INSERT INTO `himall_typebrands` VALUES ('1888', '106', '368');
INSERT INTO `himall_typebrands` VALUES ('1889', '107', '370');
INSERT INTO `himall_typebrands` VALUES ('1890', '107', '369');

-- ----------------------------
-- Table structure for himall_types
-- ----------------------------
DROP TABLE IF EXISTS `himall_types`;
CREATE TABLE `himall_types` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL COMMENT '类型名称',
  `IsSupportColor` tinyint(1) NOT NULL COMMENT '是否支持颜色规格',
  `IsSupportSize` tinyint(1) NOT NULL COMMENT '是否支持尺寸规格',
  `IsSupportVersion` tinyint(1) NOT NULL COMMENT '是否支持版本规格',
  `IsDeleted` bit(1) NOT NULL COMMENT '是否已删除',
  `ColorAlias` varchar(50) DEFAULT NULL COMMENT '颜色别名',
  `SizeAlias` varchar(50) DEFAULT NULL COMMENT '尺码别名',
  `VersionAlias` varchar(50) DEFAULT NULL COMMENT '规格别名',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_types
-- ----------------------------
INSERT INTO `himall_types` VALUES ('90', '珠宝', '0', '0', '0', '\0', null, null, null);
INSERT INTO `himall_types` VALUES ('91', 'NAS', '0', '0', '0', '\0', null, null, null);
INSERT INTO `himall_types` VALUES ('92', '??', '0', '0', '0', '', null, null, null);
INSERT INTO `himall_types` VALUES ('93', '??', '0', '0', '0', '', null, null, null);
INSERT INTO `himall_types` VALUES ('94', '钟表', '0', '0', '0', '\0', null, null, null);
INSERT INTO `himall_types` VALUES ('95', '图书', '0', '0', '0', '\0', null, null, null);
INSERT INTO `himall_types` VALUES ('96', '医药保健', '0', '0', '0', '\0', null, null, null);
INSERT INTO `himall_types` VALUES ('97', '母婴', '0', '0', '0', '\0', null, null, null);
INSERT INTO `himall_types` VALUES ('98', '汽车用品', '0', '0', '0', '\0', null, null, null);
INSERT INTO `himall_types` VALUES ('99', '运动', '0', '0', '0', '\0', null, null, null);
INSERT INTO `himall_types` VALUES ('100', '鞋包', '0', '0', '0', '\0', null, null, null);
INSERT INTO `himall_types` VALUES ('101', '家居', '1', '1', '0', '\0', '颜色', '尺寸', null);
INSERT INTO `himall_types` VALUES ('102', '化妆', '0', '0', '0', '\0', null, null, null);
INSERT INTO `himall_types` VALUES ('103', '家用电器', '0', '0', '0', '\0', null, null, null);
INSERT INTO `himall_types` VALUES ('104', '生鲜', '0', '0', '0', '\0', null, null, null);
INSERT INTO `himall_types` VALUES ('105', '电脑办公', '1', '0', '0', '\0', '颜色', null, null);
INSERT INTO `himall_types` VALUES ('106', '衣服', '1', '1', '0', '\0', '颜色', '尺寸', null);
INSERT INTO `himall_types` VALUES ('107', '零食', '0', '0', '0', '\0', null, null, null);

-- ----------------------------
-- Table structure for himall_vshop
-- ----------------------------
DROP TABLE IF EXISTS `himall_vshop`;
CREATE TABLE `himall_vshop` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) DEFAULT NULL COMMENT '名称',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `CreateTime` datetime NOT NULL COMMENT '创建日期',
  `VisitNum` int(11) NOT NULL COMMENT '历览次数',
  `buyNum` int(11) NOT NULL COMMENT '购买数量',
  `State` int(11) NOT NULL COMMENT '状态',
  `Logo` varchar(200) DEFAULT NULL COMMENT 'LOGO',
  `BackgroundImage` varchar(200) DEFAULT NULL COMMENT '背景图',
  `Description` varchar(30) DEFAULT NULL COMMENT '详情',
  `Tags` varchar(100) DEFAULT NULL COMMENT '标签',
  `HomePageTitle` varchar(20) DEFAULT NULL COMMENT '微信首页显示的标题',
  `WXLogo` varchar(200) DEFAULT NULL COMMENT '微信Logo',
  PRIMARY KEY (`Id`),
  KEY `FK_vshop_shopinfo` (`ShopId`) USING BTREE,
  CONSTRAINT `himall_vshop_ibfk_1` FOREIGN KEY (`ShopId`) REFERENCES `himall_shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_vshop
-- ----------------------------

-- ----------------------------
-- Table structure for himall_vshopextend
-- ----------------------------
DROP TABLE IF EXISTS `himall_vshopextend`;
CREATE TABLE `himall_vshopextend` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `VShopId` bigint(20) NOT NULL COMMENT '微店ID',
  `Sequence` int(11) DEFAULT NULL COMMENT '顺序',
  `Type` int(11) NOT NULL COMMENT '微店类型（主推微店、热门微店）',
  `AddTime` datetime NOT NULL COMMENT '添加时间',
  `State` int(11) NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`Id`),
  KEY `FK_vshopextend_vshop` (`VShopId`) USING BTREE,
  CONSTRAINT `himall_vshopextend_ibfk_1` FOREIGN KEY (`VShopId`) REFERENCES `himall_vshop` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_vshopextend
-- ----------------------------

-- ----------------------------
-- Table structure for himall_weiactivityaward
-- ----------------------------
DROP TABLE IF EXISTS `himall_weiactivityaward`;
CREATE TABLE `himall_weiactivityaward` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ActivityId` bigint(20) NOT NULL,
  `AwardLevel` int(11) NOT NULL COMMENT '保存字段1-10 分别对应1至10等奖',
  `AwardType` int(11) NOT NULL COMMENT '积分；红包；优惠卷',
  `AwardCount` int(11) NOT NULL,
  `Proportion` float NOT NULL,
  `Integral` int(11) DEFAULT NULL,
  `BonusId` bigint(20) DEFAULT NULL,
  `CouponId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_WeiActivityAward_2` (`ActivityId`),
  CONSTRAINT `FK_Himall_WeiActivityAward_2` FOREIGN KEY (`ActivityId`) REFERENCES `himall_weiactivityinfo` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_weiactivityaward
-- ----------------------------

-- ----------------------------
-- Table structure for himall_weiactivityinfo
-- ----------------------------
DROP TABLE IF EXISTS `himall_weiactivityinfo`;
CREATE TABLE `himall_weiactivityinfo` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ActivityTitle` varchar(200) NOT NULL,
  `ActivityType` int(11) NOT NULL,
  `ActivityDetails` varchar(500) NOT NULL,
  `ActivityUrl` varchar(300) NOT NULL,
  `BeginTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `ParticipationType` int(11) NOT NULL COMMENT '0 共几次 1天几次 2无限制',
  `ParticipationCount` int(11) DEFAULT NULL,
  `ConsumePoint` int(11) NOT NULL COMMENT '0不消耗积分 大于0消耗积分',
  `CodeUrl` varchar(300) DEFAULT NULL,
  `AddDate` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_weiactivityinfo
-- ----------------------------

-- ----------------------------
-- Table structure for himall_weiactivitywininfo
-- ----------------------------
DROP TABLE IF EXISTS `himall_weiactivitywininfo`;
CREATE TABLE `himall_weiactivitywininfo` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL,
  `ActivityId` bigint(20) NOT NULL,
  `AwardId` bigint(20) NOT NULL,
  `IsWin` tinyint(1) NOT NULL,
  `AwardName` varchar(200) DEFAULT NULL,
  `AddDate` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_WeiActivityWinInfo_W2` (`ActivityId`),
  CONSTRAINT `FK_Himall_WeiActivityWinInfo_W2` FOREIGN KEY (`ActivityId`) REFERENCES `himall_weiactivityinfo` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=914 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_weiactivitywininfo
-- ----------------------------

-- ----------------------------
-- Table structure for himall_weixinbasic
-- ----------------------------
DROP TABLE IF EXISTS `himall_weixinbasic`;
CREATE TABLE `himall_weixinbasic` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Ticket` varchar(200) DEFAULT NULL COMMENT '微信Ticket',
  `TicketOutTime` datetime DEFAULT NULL COMMENT '微信Ticket过期日期',
  `AppId` varchar(50) DEFAULT NULL,
  `AccessToken` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_weixinbasic
-- ----------------------------

-- ----------------------------
-- Table structure for himall_weixinmsgtemplate
-- ----------------------------
DROP TABLE IF EXISTS `himall_weixinmsgtemplate`;
CREATE TABLE `himall_weixinmsgtemplate` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MessageType` int(11) DEFAULT NULL COMMENT '消息类别',
  `TemplateNum` varchar(30) DEFAULT NULL COMMENT '消息模板编号',
  `TemplateId` varchar(100) DEFAULT NULL COMMENT '消息模板ID',
  `UpdateDate` datetime DEFAULT NULL COMMENT '更新日期',
  `IsOpen` tinyint(1) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of himall_weixinmsgtemplate
-- ----------------------------
INSERT INTO `himall_weixinmsgtemplate` VALUES ('41', '1', 'OPENTM207102467', null, '2017-07-27 12:00:51', '0');
INSERT INTO `himall_weixinmsgtemplate` VALUES ('42', '2', 'OPENTM207185188', null, '2017-07-27 12:00:51', '0');
INSERT INTO `himall_weixinmsgtemplate` VALUES ('43', '3', 'OPENTM202243318', null, '2017-07-27 12:00:51', '0');
INSERT INTO `himall_weixinmsgtemplate` VALUES ('44', '4', 'TM00430', null, '2017-07-27 12:00:51', '0');
INSERT INTO `himall_weixinmsgtemplate` VALUES ('45', '5', 'OPENTM203847595', null, '2017-07-27 12:00:51', '0');
INSERT INTO `himall_weixinmsgtemplate` VALUES ('46', '9', 'OPENTM200750297', null, '2017-07-27 12:00:51', '0');
INSERT INTO `himall_weixinmsgtemplate` VALUES ('47', '10', 'TM00251', null, '2017-07-27 12:00:51', '0');
INSERT INTO `himall_weixinmsgtemplate` VALUES ('48', '11', 'OPENTM206903698', null, '2017-07-27 12:00:51', '0');
INSERT INTO `himall_weixinmsgtemplate` VALUES ('49', '12', 'OPENTM201272994', null, '2017-07-27 12:00:51', '0');
INSERT INTO `himall_weixinmsgtemplate` VALUES ('50', '13', 'OPENTM400048565', null, '2017-07-27 12:00:51', '0');
INSERT INTO `himall_weixinmsgtemplate` VALUES ('51', '14', 'OPENTM400048581', null, '2017-07-27 12:00:51', '0');
INSERT INTO `himall_weixinmsgtemplate` VALUES ('52', '15', 'TM00712', null, '2017-07-27 12:00:51', '0');
INSERT INTO `himall_weixinmsgtemplate` VALUES ('53', '16', 'OPENTM400232755', null, '2017-07-27 12:00:51', '0');
INSERT INTO `himall_weixinmsgtemplate` VALUES ('54', '17', 'OPENTM401153728', null, '2017-07-27 12:00:51', '0');

-- ----------------------------
-- Table structure for himall_wxacctoken
-- ----------------------------
DROP TABLE IF EXISTS `himall_wxacctoken`;
CREATE TABLE `himall_wxacctoken` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AppId` varchar(50) DEFAULT NULL,
  `AccessToken` varchar(150) NOT NULL COMMENT '微信访问令牌',
  `TokenOutTime` datetime NOT NULL COMMENT '微信令牌过期日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_wxacctoken
-- ----------------------------

-- ----------------------------
-- Table structure for himall_wxcardcodelog
-- ----------------------------
DROP TABLE IF EXISTS `himall_wxcardcodelog`;
CREATE TABLE `himall_wxcardcodelog` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CardLogId` bigint(20) DEFAULT NULL COMMENT '卡券记录号',
  `CardId` varchar(50) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL COMMENT '标识',
  `SendTime` datetime DEFAULT NULL COMMENT '投放时间',
  `CodeStatus` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `UsedTime` datetime DEFAULT NULL COMMENT '操作时间 失效、核销、删除时间',
  `CouponType` int(11) DEFAULT NULL COMMENT '红包类型',
  `CouponCodeId` bigint(20) DEFAULT NULL COMMENT '红包记录编号',
  `OpenId` varchar(4000) DEFAULT NULL COMMENT '对应OpenId',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_WXLog_CardLogId` (`CardLogId`) USING BTREE,
  KEY `IDX_Himall_WXLog_CardId` (`CardId`) USING BTREE,
  KEY `IDX_Himall_WXLog_Code` (`Code`) USING BTREE,
  CONSTRAINT `FK_Himall_WXLog_CardLogId` FOREIGN KEY (`CardLogId`) REFERENCES `himall_wxcardlog` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_wxcardcodelog
-- ----------------------------

-- ----------------------------
-- Table structure for himall_wxcardlog
-- ----------------------------
DROP TABLE IF EXISTS `himall_wxcardlog`;
CREATE TABLE `himall_wxcardlog` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CardId` varchar(50) DEFAULT NULL COMMENT '卡券编号',
  `CardTitle` varchar(50) DEFAULT NULL COMMENT '标题 英文27  汉字 9个',
  `CardSubTitle` varchar(100) DEFAULT NULL COMMENT '副标题 英文54  汉字18个',
  `CardColor` varchar(10) DEFAULT NULL COMMENT '卡券颜色 HasTable',
  `AuditStatus` int(11) DEFAULT NULL COMMENT '审核状态',
  `AppId` varchar(50) DEFAULT NULL,
  `AppSecret` varchar(50) DEFAULT NULL,
  `CouponType` int(11) DEFAULT NULL COMMENT '红包类型',
  `CouponId` bigint(20) DEFAULT NULL COMMENT '红包编号 涉及多表，不做外键',
  PRIMARY KEY (`Id`),
  KEY `IDX_Himall_WXCardLog_CardId` (`CardId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_wxcardlog
-- ----------------------------

-- ----------------------------
-- Table structure for himall_wxshop
-- ----------------------------
DROP TABLE IF EXISTS `himall_wxshop`;
CREATE TABLE `himall_wxshop` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `AppId` varchar(30) NOT NULL COMMENT '公众号的APPID',
  `AppSecret` varchar(35) NOT NULL COMMENT '公众号的AppSecret',
  `Token` varchar(30) NOT NULL COMMENT '公众号的Token',
  `FollowUrl` varchar(500) DEFAULT NULL COMMENT '跳转的URL',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of himall_wxshop
-- ----------------------------
