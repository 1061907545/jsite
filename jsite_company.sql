/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.249
Source Server Version : 50723
Source Host           : 192.168.1.249:3306
Source Database       : jsite

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-05-17 16:53:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_de_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_de_databasechangelog`;
CREATE TABLE `act_de_databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_de_databasechangelog
-- ----------------------------
INSERT INTO `act_de_databasechangelog` VALUES ('1', 'flowable', 'META-INF/liquibase/flowable-modeler-app-db-changelog.xml', '2019-03-06 17:41:44', '1', 'EXECUTED', '8:e70d1d9d3899a734296b2514ccc71501', 'createTable tableName=ACT_DE_MODEL; createIndex indexName=idx_proc_mod_created, tableName=ACT_DE_MODEL; createTable tableName=ACT_DE_MODEL_HISTORY; createIndex indexName=idx_proc_mod_history_proc, tableName=ACT_DE_MODEL_HISTORY; createTable tableN...', '', null, '3.6.2', null, null, '1865829831');
INSERT INTO `act_de_databasechangelog` VALUES ('3', 'flowable', 'META-INF/liquibase/flowable-modeler-app-db-changelog.xml', '2019-03-06 17:41:44', '2', 'EXECUTED', '8:3a9143bef2e45f2316231cc1369138b6', 'addColumn tableName=ACT_DE_MODEL; addColumn tableName=ACT_DE_MODEL_HISTORY', '', null, '3.6.2', null, null, '1865829831');

-- ----------------------------
-- Table structure for act_de_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_de_databasechangeloglock`;
CREATE TABLE `act_de_databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_de_databasechangeloglock
-- ----------------------------
INSERT INTO `act_de_databasechangeloglock` VALUES ('1', '\0', null, null);

-- ----------------------------
-- Table structure for act_de_model
-- ----------------------------
DROP TABLE IF EXISTS `act_de_model`;
CREATE TABLE `act_de_model` (
  `id` varchar(255) NOT NULL,
  `name` varchar(400) NOT NULL,
  `model_key` varchar(400) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `model_comment` varchar(4000) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `model_editor_json` longtext,
  `thumbnail` longblob,
  `model_type` int(11) DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_proc_mod_created` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_de_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_de_model_history
-- ----------------------------
DROP TABLE IF EXISTS `act_de_model_history`;
CREATE TABLE `act_de_model_history` (
  `id` varchar(255) NOT NULL,
  `name` varchar(400) NOT NULL,
  `model_key` varchar(400) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `model_comment` varchar(4000) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `removal_date` datetime(6) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `model_editor_json` longtext,
  `model_id` varchar(255) NOT NULL,
  `model_type` int(11) DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_proc_mod_history_proc` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_de_model_history
-- ----------------------------

-- ----------------------------
-- Table structure for act_de_model_relation
-- ----------------------------
DROP TABLE IF EXISTS `act_de_model_relation`;
CREATE TABLE `act_de_model_relation` (
  `id` varchar(255) NOT NULL,
  `parent_model_id` varchar(255) DEFAULT NULL,
  `model_id` varchar(255) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relation_parent` (`parent_model_id`),
  KEY `fk_relation_child` (`model_id`),
  CONSTRAINT `fk_relation_child` FOREIGN KEY (`model_id`) REFERENCES `act_de_model` (`id`),
  CONSTRAINT `fk_relation_parent` FOREIGN KEY (`parent_model_id`) REFERENCES `act_de_model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_de_model_relation
-- ----------------------------

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count', 'true', '1');
INSERT INTO `act_ge_property` VALUES ('cfg.task-related-entities-count', 'true', '1');
INSERT INTO `act_ge_property` VALUES ('common.schema.version', '6.4.0.0', '1');
INSERT INTO `act_ge_property` VALUES ('identitylink.schema.version', '6.4.0.0', '1');
INSERT INTO `act_ge_property` VALUES ('job.schema.version', '6.4.0.0', '1');
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', '1');
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(6.3.2.0)', '1');
INSERT INTO `act_ge_property` VALUES ('schema.version', '6.4.0.0', '1');
INSERT INTO `act_ge_property` VALUES ('task.schema.version', '6.4.0.0', '1');
INSERT INTO `act_ge_property` VALUES ('variable.schema.version', '6.4.0.0', '1');

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_id_bytearray`;
CREATE TABLE `act_id_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_priv
-- ----------------------------
DROP TABLE IF EXISTS `act_id_priv`;
CREATE TABLE `act_id_priv` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PRIV_NAME` (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_priv
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_priv_mapping
-- ----------------------------
DROP TABLE IF EXISTS `act_id_priv_mapping`;
CREATE TABLE `act_id_priv_mapping` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_PRIV_MAPPING` (`PRIV_ID_`),
  KEY `ACT_IDX_PRIV_USER` (`USER_ID_`),
  KEY `ACT_IDX_PRIV_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `act_id_priv` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_priv_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_property
-- ----------------------------
DROP TABLE IF EXISTS `act_id_property`;
CREATE TABLE `act_id_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_property
-- ----------------------------
INSERT INTO `act_id_property` VALUES ('schema.version', '6.4.0.0', '1');

-- ----------------------------
-- Table structure for act_id_token
-- ----------------------------
DROP TABLE IF EXISTS `act_id_token`;
CREATE TABLE `act_id_token` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `IP_ADDRESS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_AGENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_token
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_VERSION_` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`DERIVED_VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_deadletter_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_deadletter_job`;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_DJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_deadletter_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_history_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_history_job`;
CREATE TABLE `act_ru_history_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_history_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_JOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_suspended_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_suspended_job`;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_SJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_suspended_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `SUB_TASK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_timer_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_timer_job`;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_TJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_timer_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
DROP TABLE IF EXISTS `gen_scheme`;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生成方案';

-- ----------------------------
-- Records of gen_scheme
-- ----------------------------
INSERT INTO `gen_scheme` VALUES ('325d42709242476aab909b8d54a5ad73', '树结构表生成', 'treeTable', 'com.jsite.modules', 'test', '', '树结构表生成', '树结构表生成', 'liuruijun', '3195020a929e41c7bc3dfbd539ed5351', '1', '2019-01-05 22:12:10', '1', '2019-01-08 15:22:56', '', '0');
INSERT INTO `gen_scheme` VALUES ('c544bf7da3744ab1aa285fa3bfef6000', '主子表生成', 'curd_many', 'com.jsite.modules', 'test', '', '主子表生成测试', '主子表生成', 'liuruijun', 'd7c3fff144a046698aa3766844582a4c', '1', '2018-12-29 11:50:24', '1', '2019-01-02 10:06:04', '', '0');
INSERT INTO `gen_scheme` VALUES ('f09437aa6b9c440481e40aa63daf81d7', '单表生成', 'curd', 'com.jsite.modules', 'test', '', '单表生成测试', '单表生成', 'liuruijun', '39c9a49ccd87400b9b19606a46b12dd6', '1', '2018-12-29 11:46:43', '1', '2019-01-02 10:01:38', '', '0');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('3195020a929e41c7bc3dfbd539ed5351', 'test_tree', '树结构表', 'TestTree', '', '', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table` VALUES ('39c9a49ccd87400b9b19606a46b12dd6', 'test_data', '业务数据表', 'TestData', '', '', '1', '2018-12-29 11:19:36', '1', '2018-12-29 11:19:36', null, '0');
INSERT INTO `gen_table` VALUES ('794ea2d0349e4590ba4366529d499833', 'test_data_child', '业务数据子表', 'TestDataChild', 'test_data_main', 'test_data_main_id', '1', '2018-12-29 11:21:18', '1', '2018-12-29 11:21:18', null, '0');
INSERT INTO `gen_table` VALUES ('d7c3fff144a046698aa3766844582a4c', 'test_data_main', '业务数据表', 'TestDataMain', '', '', '1', '2018-12-29 11:20:51', '1', '2018-12-29 11:20:51', null, '0');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT 'JDBC类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_row` char(1) DEFAULT NULL COMMENT '是否独占一行',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式',
  `show_type` varchar(200) DEFAULT NULL COMMENT '显示类型',
  `dict_type` varchar(200) DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) DEFAULT NULL COMMENT '其它设置',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `gen_table_id` (`gen_table_id`),
  CONSTRAINT `gen_table_column_ibfk_1` FOREIGN KEY (`gen_table_id`) REFERENCES `gen_table` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('036c21c4346a4b9a9bd4729f5b1996ed', 'd7c3fff144a046698aa3766844582a4c', 'id', '编号', 'varchar(64)', 'String', 'id', '0', '1', '0', '1', '0', '0', '0', '=', 'input', '', null, '10', '1', '2018-12-29 11:20:51', '1', '2018-12-29 11:20:51', null, '0');
INSERT INTO `gen_table_column` VALUES ('0739b3a11c40466b8b3d9c488e3a6bf8', '39c9a49ccd87400b9b19606a46b12dd6', 'area_id', '归属区域', 'varchar(64)', 'com.jsite.modules.sys.entity.Area', 'area.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'areaselect', '', null, '40', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('08b216da6fe042fa817db5a95e4399a7', '3195020a929e41c7bc3dfbd539ed5351', 'parent_id', '父级编号', 'varchar(64)', 'This', 'parent.id|name', '0', '0', '0', '1', '1', '0', '0', '=', 'treeselect', '', null, '20', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('0d48145e1a154e31b276963e1503682c', '3195020a929e41c7bc3dfbd539ed5351', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '0', '1', '0', '0', '0', '=', 'dateselect', '', null, '90', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('18bbfa2e86a14ca4a6be2d8a643c98d7', '794ea2d0349e4590ba4366529d499833', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '0', '1', '0', '0', '0', '=', 'dateselect', '', null, '50', '1', '2018-12-29 11:21:19', '1', '2018-12-29 11:21:19', null, '0');
INSERT INTO `gen_table_column` VALUES ('1f36d1a2217f4b09a6b7dc2683b5a6a9', 'd7c3fff144a046698aa3766844582a4c', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '0', '1', '1', '1', '0', '=', 'dateselect', '', null, '110', '1', '2018-12-29 11:20:52', '1', '2018-12-29 11:20:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('3421eb7ef5a3427f92c48a6033441a0e', '39c9a49ccd87400b9b19606a46b12dd6', 'update_by', '更新者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'updateBy.id', '0', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '100', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('3a745b100cde4fc99eb0f4e35f27a1b7', '39c9a49ccd87400b9b19606a46b12dd6', 'create_by', '创建者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'createBy.id', '0', '0', '0', '1', '0', '0', '0', '=', 'input', '', null, '80', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('3b9990bbe9144b52b316402cac1678e8', '3195020a929e41c7bc3dfbd539ed5351', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '0', '1', '1', '1', '0', '=', 'dateselect', '', null, '110', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('404a90b909bb416baa030a1838af45d0', '39c9a49ccd87400b9b19606a46b12dd6', 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'like', 'input', '', null, '50', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('40dc876733f4428a84349621d3ae7e79', '3195020a929e41c7bc3dfbd539ed5351', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '130', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('4316cdf1fbff40e591419cbb75de6742', '3195020a929e41c7bc3dfbd539ed5351', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, '120', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('471db37a88de4c02a9c2db052faf5dec', '794ea2d0349e4590ba4366529d499833', 'id', '编号', 'varchar(64)', 'String', 'id', '0', '1', '0', '1', '0', '0', '0', '=', 'input', '', null, '10', '1', '2018-12-29 11:21:18', '1', '2018-12-29 11:21:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('4fa8affc845740448035c44686a6b4f1', 'd7c3fff144a046698aa3766844582a4c', 'create_by', '创建者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'createBy.id', '0', '0', '0', '1', '0', '0', '0', '=', 'input', '', null, '80', '1', '2018-12-29 11:20:52', '1', '2018-12-29 11:20:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('518b26e7bd6c4a6aaac289678ef64ace', '39c9a49ccd87400b9b19606a46b12dd6', 'id', '编号', 'varchar(64)', 'String', 'id', '0', '1', '0', '1', '0', '0', '0', '=', 'input', '', null, '10', '1', '2018-12-29 11:19:36', '1', '2018-12-29 11:19:36', null, '0');
INSERT INTO `gen_table_column` VALUES ('5442ba5226c149f5a12187e55f68ca4a', '39c9a49ccd87400b9b19606a46b12dd6', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '60', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('547037387f074c43a5912e32073e4ba7', '794ea2d0349e4590ba4366529d499833', 'test_data_main_id', '业务主表ID', 'varchar(64)', 'String', 'testDataMainId', '0', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '20', '1', '2018-12-29 11:21:18', '1', '2018-12-29 11:21:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('5542c325e3364eb98450c6b7c386885b', '3195020a929e41c7bc3dfbd539ed5351', 'parent_ids', '所有父级编号', 'varchar(2000)', 'String', 'parentIds', '0', '0', '0', '1', '1', '0', '0', 'like', 'input', '', null, '30', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('5806f2b63737423fabe0efde8cd638fc', 'd7c3fff144a046698aa3766844582a4c', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '0', '1', '0', '0', '0', '=', 'dateselect', '', null, '90', '1', '2018-12-29 11:20:52', '1', '2018-12-29 11:20:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('58749bef8ac24ad0a651ec63c6f0cf79', '794ea2d0349e4590ba4366529d499833', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, '80', '1', '2018-12-29 11:21:19', '1', '2018-12-29 11:21:19', null, '0');
INSERT INTO `gen_table_column` VALUES ('63a7634cd1c449d1966355825f9ae0a1', '3195020a929e41c7bc3dfbd539ed5351', 'create_by', '创建者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'createBy.id', '0', '0', '0', '1', '0', '0', '0', '=', 'input', '', null, '80', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('660bcce031194ba195c23225e15f4ebc', 'd7c3fff144a046698aa3766844582a4c', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '0', '1', '1', '1', '1', '0', '=', 'input', '', null, '60', '1', '2018-12-29 11:20:51', '1', '2018-12-29 11:20:51', null, '0');
INSERT INTO `gen_table_column` VALUES ('7301b4d629db45209e07cdc8849c40f6', '39c9a49ccd87400b9b19606a46b12dd6', 'in_date', '加入日期', 'date', 'java.util.Date', 'inDate', '0', '0', '1', '1', '1', '0', '0', '=', 'dateselect', '', null, '70', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('8ee7f0a8f2804042bb200e24f23de333', '39c9a49ccd87400b9b19606a46b12dd6', 'user_id', '归属用户', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'user.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'userselect', '', null, '20', '1', '2018-12-29 11:19:36', '1', '2018-12-29 11:19:36', null, '0');
INSERT INTO `gen_table_column` VALUES ('9a6afed319b744f79071887baecac3a1', '3195020a929e41c7bc3dfbd539ed5351', 'id', '编号', 'varchar(64)', 'String', 'id', '0', '1', '0', '1', '0', '0', '0', '=', 'input', '', null, '10', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('9a6d8fcf3fdc4eefad2a63b09cda5c7f', '39c9a49ccd87400b9b19606a46b12dd6', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, '120', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('a04f28b86fd545a6b3ea4a85861b55f9', 'd7c3fff144a046698aa3766844582a4c', 'area_id', '归属区域', 'varchar(64)', 'com.jsite.modules.sys.entity.Area', 'area.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'areaselect', '', null, '40', '1', '2018-12-29 11:20:51', '1', '2018-12-29 11:20:51', null, '0');
INSERT INTO `gen_table_column` VALUES ('a460e3cbfc4f4b87b07b5a8f88e37c63', '3195020a929e41c7bc3dfbd539ed5351', 'sort', '排序', 'decimal(10,0)', 'Integer', 'sort', '0', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '50', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('ac74bc0c9b7746249dbf92499b89f310', '794ea2d0349e4590ba4366529d499833', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '90', '1', '2018-12-29 11:21:19', '1', '2018-12-29 11:21:19', null, '0');
INSERT INTO `gen_table_column` VALUES ('acc2ffe13abb49fdb3e76fc871caa46e', '794ea2d0349e4590ba4366529d499833', 'create_by', '创建者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'createBy.id', '0', '0', '0', '1', '0', '0', '0', '=', 'input', '', null, '40', '1', '2018-12-29 11:21:19', '1', '2018-12-29 11:21:19', null, '0');
INSERT INTO `gen_table_column` VALUES ('afad04f3c0334e35ae2781b3966e33bf', '3195020a929e41c7bc3dfbd539ed5351', 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'like', 'input', '', null, '40', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('bb2f13421fa04287ac31263650f56522', 'd7c3fff144a046698aa3766844582a4c', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, '120', '1', '2018-12-29 11:20:52', '1', '2018-12-29 11:20:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('bb984414563449d5a428b798432ebee4', '39c9a49ccd87400b9b19606a46b12dd6', 'office_id', '归属部门', 'varchar(64)', 'com.jsite.modules.sys.entity.Office', 'office.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'officeselect', '', null, '30', '1', '2018-12-29 11:19:36', '1', '2018-12-29 11:19:36', null, '0');
INSERT INTO `gen_table_column` VALUES ('bdeae7b5f5764a219b773493ce7ce717', 'd7c3fff144a046698aa3766844582a4c', 'user_id', '归属用户', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'user.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'userselect', '', null, '20', '1', '2018-12-29 11:20:51', '1', '2018-12-29 11:20:51', null, '0');
INSERT INTO `gen_table_column` VALUES ('cb23c6752a744f7c865fc4461189e9e5', '3195020a929e41c7bc3dfbd539ed5351', 'tree_level', '树形层级(0:根级)', 'decimal(4,0)', 'String', 'treeLevel', '0', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '70', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('ce459de5970642e6ab8791ac72d0dfc6', 'd7c3fff144a046698aa3766844582a4c', 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'like', 'input', '', null, '50', '1', '2018-12-29 11:20:51', '1', '2018-12-29 11:20:51', null, '0');
INSERT INTO `gen_table_column` VALUES ('d333b5918d2f4db1996a360d2ac74a99', '39c9a49ccd87400b9b19606a46b12dd6', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '0', '1', '1', '1', '0', '=', 'dateselect', '', null, '110', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('d3952c7032284832b26a532543f4fe78', '794ea2d0349e4590ba4366529d499833', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '0', '1', '1', '1', '0', '=', 'dateselect', '', null, '70', '1', '2018-12-29 11:21:19', '1', '2018-12-29 11:21:19', null, '0');
INSERT INTO `gen_table_column` VALUES ('deca344f6dc146bfae6377e939a0c097', '39c9a49ccd87400b9b19606a46b12dd6', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '130', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('e05d48dae1354898ae9f9b7c469313db', '3195020a929e41c7bc3dfbd539ed5351', 'update_by', '更新者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'updateBy.id', '0', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '100', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('e399ea7f86c44ace9a69c03e489797bb', 'd7c3fff144a046698aa3766844582a4c', 'in_date', '加入日期', 'date', 'java.util.Date', 'inDate', '0', '0', '1', '1', '1', '1', '0', '=', 'dateselect', '', null, '70', '1', '2018-12-29 11:20:52', '1', '2018-12-29 11:20:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('e8e3f6f2d66c44a08210a0c35e74caa8', '3195020a929e41c7bc3dfbd539ed5351', 'tree_leaf', '是否树形叶子节点（0:不是,1:是）', 'char(1)', 'String', 'treeLeaf', '0', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '60', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('e948c667cfe4486eb2119583ff9805b4', 'd7c3fff144a046698aa3766844582a4c', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '130', '1', '2018-12-29 11:20:52', '1', '2018-12-29 11:20:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('ea80f499adc049e897889b36c1cfa220', '794ea2d0349e4590ba4366529d499833', 'update_by', '更新者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'updateBy.id', '0', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '60', '1', '2018-12-29 11:21:19', '1', '2018-12-29 11:21:19', null, '0');
INSERT INTO `gen_table_column` VALUES ('f3cfb155ee3d433fa287759b9e471b72', '39c9a49ccd87400b9b19606a46b12dd6', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '0', '1', '0', '0', '0', '=', 'dateselect', '', null, '90', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('f4e277e2ae97497fa3ebef882f3ac50d', 'd7c3fff144a046698aa3766844582a4c', 'office_id', '归属部门', 'varchar(64)', 'com.jsite.modules.sys.entity.Office', 'office.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'officeselect', '', null, '30', '1', '2018-12-29 11:20:51', '1', '2018-12-29 11:20:51', null, '0');
INSERT INTO `gen_table_column` VALUES ('f610077a6e774855802b92389241fef7', 'd7c3fff144a046698aa3766844582a4c', 'update_by', '更新者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'updateBy.id', '0', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '100', '1', '2018-12-29 11:20:52', '1', '2018-12-29 11:20:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('fe3e9323ad1841a99ad7788770ea3101', '794ea2d0349e4590ba4366529d499833', 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'like', 'input', '', null, '30', '1', '2018-12-29 11:21:19', '1', '2018-12-29 11:21:19', null, '0');

-- ----------------------------
-- Table structure for gen_template
-- ----------------------------
DROP TABLE IF EXISTS `gen_template`;
CREATE TABLE `gen_template` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) DEFAULT NULL COMMENT '生成文件名',
  `content` text COMMENT '内容',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码模板表';

-- ----------------------------
-- Records of gen_template
-- ----------------------------

-- ----------------------------
-- Table structure for oa_leave
-- ----------------------------
DROP TABLE IF EXISTS `oa_leave`;
CREATE TABLE `oa_leave` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `proc_ins_id` varchar(64) DEFAULT NULL COMMENT '流程实例编号',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `leave_type` varchar(20) DEFAULT NULL COMMENT '请假类型',
  `reason` varchar(255) DEFAULT NULL COMMENT '请假理由',
  `dept_lead_text` varchar(200) DEFAULT NULL COMMENT '部门领导意见',
  `hr_text` varchar(200) DEFAULT NULL COMMENT '人力资源意见',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假流程表';

-- ----------------------------
-- Records of oa_leave
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('quartzScheduler', 'com.jsite.common.quartz.job.HelloJob', '1', '0/5 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('quartzScheduler', 'com.jsite.common.quartz.job.NewJob', '2', '0/55 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('quartzScheduler', 'com.jsite.common.quartz.job.TestJob', '3', '0/40 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler', 'com.jsite.common.quartz.job.HelloJob', '1', null, 'com.jsite.common.quartz.job.HelloJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler', 'com.jsite.common.quartz.job.NewJob', '2', null, 'com.jsite.common.quartz.job.NewJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler', 'com.jsite.common.quartz.job.TestJob', '3', null, 'com.jsite.common.quartz.job.TestJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('quartzScheduler', 'com.jsite.common.quartz.job.HelloJob', '1', 'com.jsite.common.quartz.job.HelloJob', '1', null, '1551867230000', '1551867225000', '5', 'PAUSED', 'CRON', '1547207629000', '0', null, '0', '');
INSERT INTO `qrtz_triggers` VALUES ('quartzScheduler', 'com.jsite.common.quartz.job.NewJob', '2', 'com.jsite.common.quartz.job.NewJob', '2', null, '1547207815000', '1547207793711', '5', 'PAUSED', 'CRON', '1547092828000', '0', null, '0', '');
INSERT INTO `qrtz_triggers` VALUES ('quartzScheduler', 'com.jsite.common.quartz.job.TestJob', '3', 'com.jsite.common.quartz.job.TestJob', '3', null, '1547197680000', '1547197660000', '5', 'PAUSED', 'CRON', '1547092566000', '0', null, '0', '');

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `tree_leaf` char(1) NOT NULL COMMENT '是否叶子节点',
  `tree_level` int(11) NOT NULL COMMENT '树形层级',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('015345144e9e40d6bbe832a9f1cba1f7', 'd36735ce07044a49ad205854fb2ca078', '0,d36735ce07044a49ad205854fb2ca078,', 'California', '10', '1', '1', '01', '2', '1', '2018-06-20 17:32:51', '1', '2019-01-02 00:11:18', '', '0');
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', '10', '0', '0', '1', '1', '1', '2013-05-27 08:00:00', '1', '2018-12-28 00:19:15', '', '0');
INSERT INTO `sys_area` VALUES ('16166c3ecb954be0ad47159c087cd8af', 'd36735ce07044a49ad205854fb2ca078', '0,d36735ce07044a49ad205854fb2ca078,', '明尼苏达', '30', '1', '1', '', '2', '1', '2019-01-25 17:40:25', '1', '2019-01-25 17:40:25', '', '0');
INSERT INTO `sys_area` VALUES ('3fbaf3a3f58a47118f13976cb2e2544d', 'd36735ce07044a49ad205854fb2ca078', '0,d36735ce07044a49ad205854fb2ca078,', '佛罗里达州', '20', '1', '1', '02', '2', '1', '2018-06-20 17:38:08', '1', '2018-06-20 17:38:08', '', '0');
INSERT INTO `sys_area` VALUES ('d36735ce07044a49ad205854fb2ca078', '0', '0,', '美国', '30', '0', '0', '2', '1', '1', '2018-06-20 15:36:19', '1', '2018-06-20 15:36:19', '', '0');
INSERT INTO `sys_area` VALUES ('da2da01621b64be5a85b07a8c883228f', '1', '0,1,', '上海', '30', '1', '1', '34243', '2', '1', '2018-12-10 14:01:09', '1', '2019-01-18 21:22:55', '', '0');
INSERT INTO `sys_area` VALUES ('f762fb569d8445f28a226a9b831cfb90', '1', '0,1,', '北京', '30', '1', '1', '150', '2', '1', '2018-02-02 17:37:51', '1', '2018-11-20 10:22:36', '', '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('101', 'com.jsite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('102', 'com.jsite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('103', 'com.jsite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('105', '1', '会议通告\0\0', 'oa_notify_type', '通知通告类型', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('106', '2', '奖惩通告\0\0', 'oa_notify_type', '通知通告类型', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('107', '3', '活动通告\0\0', 'oa_notify_type', '通知通告类型', '30', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('109', '1', '发布', 'oa_notify_status', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('110', '0', '未读', 'oa_notify_read', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('111', '1', '已读', 'oa_notify_read', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('18', '2', '省份/直辖市', 'sys_area_type', '区域类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2018-06-15 14:46:37', '', '0');
INSERT INTO `sys_dict` VALUES ('19', '3', '地市/州', 'sys_area_type', '区域类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2018-06-15 14:47:38', '', '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('20', '4', '县/区', 'sys_area_type', '区域类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2018-06-15 14:48:01', '', '0');
INSERT INTO `sys_dict` VALUES ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('263374341bb04a88a149456094a5bd4f', 'WAITING', '等待执行', 'sys_job_status', '定时任务状态（PAUSED-暂停，ACQUIRED-正在执行，WAITING-等待执行）', '30', '0', '1', '2019-01-10 11:58:07', '1', '2019-01-11 12:02:01', '', '0');
INSERT INTO `sys_dict` VALUES ('26f56c93297146ca869fb1924569d5fc', '0', '停用', 'sys_user_status', '用户状态（0-停用，1-正常）', '10', '0', '1', '2018-06-29 08:40:36', '1', '2018-06-29 08:40:36', '', '0');
INSERT INTO `sys_dict` VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('49fefff665614e80b8c0e91902f2c817', 'images/userinfo.png', '默认头像', 'default_headphoto_big', '默认头像(大图)', '10', '0', '1', '2018-07-30 11:58:29', '1', '2018-07-30 13:41:11', '默认头像(原图)', '0');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('5ff3843961654e639a419410afc89bbc', '4', '人力资源', 'sys_user_type', '用户类型', '10', '0', '1', '2018-12-28 13:51:04', '1', '2018-12-28 13:51:04', '', '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('62', '1', '公休', 'oa_leave_type', '请假类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('63', '2', '病假', 'oa_leave_type', '请假类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('631f38d9f5e24dc88fdb472f4855d68d', '1', '正常', 'sys_user_status', '用户状态（0-停用，1-正常）', '20', '0', '1', '2018-06-29 08:41:42', '1', '2018-06-29 08:41:42', '', '0');
INSERT INTO `sys_dict` VALUES ('64', '3', '事假', 'oa_leave_type', '请假类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('6437d5741af64dca861fe5bec7994891', '1', '显示', 'sys_show_hide', '显示-隐藏', '10', '0', '1', '2018-06-25 18:21:38', '1', '2018-06-25 18:21:38', '显示-隐藏', '0');
INSERT INTO `sys_dict` VALUES ('65', '4', '调休', 'oa_leave_type', '请假类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('66', '5', '婚假', 'oa_leave_type', '请假类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('71', 'leave', '请假流程', 'act_category', '流程分类', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('72', 'metting', '会议室申请流程', 'act_category', '流程分类', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('75', 'tree', '树结构', 'gen_category', '代码生成分类', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('80', 'between', 'Between', 'gen_query_type', '查询方式', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('81', 'like', 'Like', 'gen_query_type', '查询方式', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('90', 'userselect', '人员选择', 'gen_show_type', '字段生成方案', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类\0\0\0\0', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('a1367ff32ec044b08ead3a56f69748db', 'ACQUIRED', '正在执行', 'sys_job_status', '定时任务状态（PAUSED-暂停，ACQUIRED-正在执行，WAITING-等待执行）', '20', '0', '1', '2019-01-09 16:27:54', '1', '2019-01-11 12:01:52', '', '0');
INSERT INTO `sys_dict` VALUES ('a6aff6268f1f4d77952f3424b5e843d6', '123456', 'default_password', 'default_pass', '系统默认配置密码', '10', '0', '1', '2018-07-03 11:40:03', '1', '2018-07-03 11:40:03', '', '0');
INSERT INTO `sys_dict` VALUES ('a6c017055f7b4ce2bb644ec8bb240d4a', 'PAUSED', '暂停', 'sys_job_status', '定时任务状态（PAUSED-暂停，ACQUIRED-正在执行，WAITING-等待执行）', '10', '0', '1', '2019-01-09 15:37:38', '1', '2019-01-11 20:53:20', '', '0');
INSERT INTO `sys_dict` VALUES ('a8a0aeb824d84d73ad1cca1bdc35c8dc', '5', '乡/镇', 'sys_area_type', '区域类型', '50', '0', '1', '2018-06-15 14:48:45', '1', '2018-06-15 14:48:45', '', '0');
INSERT INTO `sys_dict` VALUES ('c3f4554124e64c4a9cf96ebe94e55ade', '6', '村/社区', 'sys_area_type', '区域类型', '60', '0', '1', '2018-06-15 14:49:25', '1', '2018-06-15 14:49:25', '', '0');
INSERT INTO `sys_dict` VALUES ('da5b5781a8604398aea411a3949b8486', '0', '隐藏', 'sys_show_hide', '显示-隐藏', '10', '0', '1', '2018-06-25 18:22:06', '1', '2018-06-25 18:22:06', '显示-隐藏', '0');
INSERT INTO `sys_dict` VALUES ('edc2e89282bb4eeba397857a2cfb6b33', 'com.jsite.modules.oa.leave', '请假流程1', 'act_category', '请假流程111', '10', '0', '1', '2018-08-03 10:37:05', '1', '2018-08-03 10:37:05', '', '0');
INSERT INTO `sys_dict` VALUES ('ee843534a2884752bf2ebd2444551771', 'images/userinfo.png', '默认头像', 'default_headphoto_small', '默认头像(缩略图)', '10', '0', '1', '2018-07-30 11:52:22', '1', '2018-07-30 11:56:54', '默认小头像(缩略图)图片路径', '0');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `file_tree_id` varchar(64) NOT NULL COMMENT '文件分类',
  `name` varchar(256) NOT NULL COMMENT '原文件名称',
  `path` varchar(256) DEFAULT NULL COMMENT '文件路径',
  `save_name` varchar(255) NOT NULL COMMENT '服务器保存文件名称',
  `file_size` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `file_tree_id` (`file_tree_id`),
  CONSTRAINT `sys_file_ibfk_1` FOREIGN KEY (`file_tree_id`) REFERENCES `sys_file_tree` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('15e0f0655f0949899e6df9353654e41e', 'b7803810cc734b90a3f44643fad06bd7', 'git命令.txt', null, '539', 'common/b7803810cc734b90a3f44643fad06bd7\\20180727\\git命令.txt', '1', '2018-07-27 15:40:29', '1', '2018-07-27 15:40:29', null, '0');
INSERT INTO `sys_file` VALUES ('354d0ad6df5f4b81a6df003967b8dde3', '018abc93050045dd8f419c14c1a5bfd5', 'picture.jpg', null, '157296', 'common/018abc93050045dd8f419c14c1a5bfd5\\20180625\\picture.jpg', '1', '2018-06-25 15:44:40', '1', '2018-06-25 15:44:40', null, '1');
INSERT INTO `sys_file` VALUES ('47348b3a5ee94d8e8d0a6d4b0d728b12', 'f1d7c9459a5a44adb38ed662bd5d682f', '新建文本文档.txt', null, '4890', 'common/f1d7c9459a5a44adb38ed662bd5d682f\\20180613\\新建文本文档.txt', '1', '2018-06-13 14:40:09', '1', '2018-06-13 14:40:09', null, '1');
INSERT INTO `sys_file` VALUES ('48b4b3ab2e064d4a9113318bcf5ddec8', '018abc93050045dd8f419c14c1a5bfd5', 'picture.jpg', null, '157296', 'common/7a0440b426f94db1b5b79772210437d2\\20180709\\picture.jpg', '1', '2018-07-09 10:41:49', '1', '2018-07-09 10:46:44', null, '0');
INSERT INTO `sys_file` VALUES ('4e9aea81e3234813bae688162b032e88', '8c5b5246330e42f4adb0593b1db498b4', 'BluetoothGet.zip', null, '2774021', 'F:\\git\\itamcs\\src\\main\\webapp\\upload\\common/7a0440b426f94db1b5b79772210437d2\\20180611\\BluetoothGet.zip', '1', '2018-06-11 10:20:13', '1', '2018-06-27 09:27:01', null, '1');
INSERT INTO `sys_file` VALUES ('5121fa6273e743a7912a58cc5a15ba2f', '8c5b5246330e42f4adb0593b1db498b4', '安装配置教程.docx', null, '429193', 'common/8c5b5246330e42f4adb0593b1db498b4/20181214/安装配置教程.docx', '1', '2018-12-14 09:37:00', '1', '2018-12-14 09:37:00', null, '0');
INSERT INTO `sys_file` VALUES ('5e3fff31d0724f5d89ab106519e8634a', '8c5b5246330e42f4adb0593b1db498b4', 'XXX旅游APP项目功能模块20180528.xlsx', null, '19530', 'common/8c5b5246330e42f4adb0593b1db498b4\\20180803\\XXX旅游APP项目功能模块20180528.xlsx', '1', '2018-08-03 09:37:09', '1', '2018-08-03 09:37:09', null, '0');
INSERT INTO `sys_file` VALUES ('6770be70d39d432d802150b41af00370', '8c5b5246330e42f4adb0593b1db498b4', 'PictureUnlock_gf_11393.pictureunlock.jpg', null, '103041', 'common/8c5b5246330e42f4adb0593b1db498b4/20181214/PictureUnlock_gf_11393.pictureunlock.jpg', '1', '2018-12-14 21:25:23', '1', '2018-12-14 21:25:23', null, '0');
INSERT INTO `sys_file` VALUES ('6f061e5b673c4a35981aba68b5feb771', '8c5b5246330e42f4adb0593b1db498b4', 'git命令.txt', null, '871', 'common/8c5b5246330e42f4adb0593b1db498b4\\20181211\\git命令.txt', '1', '2018-12-11 10:42:40', '1', '2018-12-11 10:42:40', null, '0');
INSERT INTO `sys_file` VALUES ('802ae641d0d84c488143885487a2d937', '8c5b5246330e42f4adb0593b1db498b4', 'IT资产管控平台初设说明书-20180408001.docx', null, '1438387', 'common/8c5b5246330e42f4adb0593b1db498b4\\20180803\\IT资产管控平台初设说明书-20180408001.docx', '1', '2018-08-03 09:44:42', '1', '2018-08-03 09:44:42', null, '0');
INSERT INTO `sys_file` VALUES ('a3ececf035d84d9280b1c4b2ae614074', 'f1d7c9459a5a44adb38ed662bd5d682f', 'BeyondAdmin-master.zip', null, '2425874', 'F:\\git\\itamcs\\src\\main\\webapp\\upload\\common/f1d7c9459a5a44adb38ed662bd5d682f\\20180611\\BeyondAdmin-master.zip', '1', '2018-06-11 11:06:27', '1', '2018-06-11 11:06:27', null, '1');
INSERT INTO `sys_file` VALUES ('bee545f738e941b18c321189fd962f8b', '8c5b5246330e42f4adb0593b1db498b4', '解决问题罗列.txt', null, '22351', 'common/8c5b5246330e42f4adb0593b1db498b4\\20180709\\解决问题罗列.txt', '1', '2018-07-09 16:15:38', '1', '2018-07-09 16:15:38', null, '0');
INSERT INTO `sys_file` VALUES ('cde9fce0e36e479682f87121bbedb3be', '11da634ddacb4129bb2c4f14854585f5', 'imageclip.html', null, '7707', 'common/11da634ddacb4129bb2c4f14854585f5\\20180709\\imageclip.html', '1', '2018-07-09 11:46:48', '1', '2018-07-09 11:46:48', null, '0');
INSERT INTO `sys_file` VALUES ('d67606c039784624955e8155032662de', '8c5b5246330e42f4adb0593b1db498b4', '大屏修改反馈-20180416.docx', null, '2297953', 'common/8c5b5246330e42f4adb0593b1db498b4\\20180709\\大屏修改反馈-20180416.docx', '1', '2018-07-09 16:15:39', '1', '2018-07-09 16:15:39', null, '0');
INSERT INTO `sys_file` VALUES ('da2ac86c3d934295a4d2bfd15518698b', '7a0440b426f94db1b5b79772210437d2', 'note.html', null, '1063', 'common/7a0440b426f94db1b5b79772210437d2/20180612/note.html', '1', '2018-06-12 11:56:54', '1', '2018-06-12 11:56:54', null, '1');
INSERT INTO `sys_file` VALUES ('fc7cb4ccf7ae42dfa6f81463006bf8eb', '8c5b5246330e42f4adb0593b1db498b4', 'aac.txt', null, '3484', 'common/8c5b5246330e42f4adb0593b1db498b4\\20180823\\aac.txt', '1', '2018-08-23 10:57:50', '1', '2018-08-23 10:57:50', null, '0');

-- ----------------------------
-- Table structure for sys_file_tree
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_tree`;
CREATE TABLE `sys_file_tree` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `tree_leaf` char(1) NOT NULL DEFAULT '0' COMMENT '是否为叶子节点',
  `tree_level` decimal(4,0) NOT NULL COMMENT '树形层级',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件分类';

-- ----------------------------
-- Records of sys_file_tree
-- ----------------------------
INSERT INTO `sys_file_tree` VALUES ('018abc93050045dd8f419c14c1a5bfd5', '2bacb604df77451d9ef9c60494c4a5b3', '0,c9265b260c1845b6b46462acd36e4304,2bacb604df77451d9ef9c60494c4a5b3', 'ffff', '1', '1', '2', '1', '2018-06-04 14:40:37', '1', '2018-06-04 14:40:37', '', '0');
INSERT INTO `sys_file_tree` VALUES ('11da634ddacb4129bb2c4f14854585f5', '5dbb8533c98b4869901270ae2eb4d0ad', '0,5dbb8533c98b4869901270ae2eb4d0ad', 'aaa', '3', '0', '1', '1', '2018-06-05 09:58:58', '1', '2018-06-06 18:11:33', '', '0');
INSERT INTO `sys_file_tree` VALUES ('12fe7758f865410283b26ee134f8a0bf', '11da634ddacb4129bb2c4f14854585f5', '0,5dbb8533c98b4869901270ae2eb4d0ad,11da634ddacb4129bb2c4f14854585f5', 'bbb', '5', '1', '2', '1', '2018-06-05 09:59:24', '1', '2018-06-06 18:11:33', '', '0');
INSERT INTO `sys_file_tree` VALUES ('2bacb604df77451d9ef9c60494c4a5b3', 'c9265b260c1845b6b46462acd36e4304', '0,c9265b260c1845b6b46462acd36e4304', '2', '2', '0', '1', '1', '2018-03-28 14:41:39', '1', '2018-06-04 17:01:59', '2', '0');
INSERT INTO `sys_file_tree` VALUES ('5dbb8533c98b4869901270ae2eb4d0ad', '0', '0', 'mmm', '4', '0', '0', '1', '2018-06-06 09:58:30', '1', '2018-06-06 18:11:32', '', '0');
INSERT INTO `sys_file_tree` VALUES ('7a0440b426f94db1b5b79772210437d2', 'f1d7c9459a5a44adb38ed662bd5d682f', '0,c9265b260c1845b6b46462acd36e4304,2bacb604df77451d9ef9c60494c4a5b3,f1d7c9459a5a44adb38ed662bd5d682f', 'ccc', '10', '1', '3', '1', '2018-06-05 09:59:11', '1', '2018-06-06 18:11:55', '', '0');
INSERT INTO `sys_file_tree` VALUES ('885944d2b2784fe68a4a33c276eaa229', '9e31a73796a242009c89995c2de86bbb', '0,5dbb8533c98b4869901270ae2eb4d0ad,9e31a73796a242009c89995c2de86bbb', 'ggg', '3', '1', '2', '1', '2018-06-04 13:56:48', '1', '2018-06-06 17:34:56', 'dxxa', '0');
INSERT INTO `sys_file_tree` VALUES ('8c5b5246330e42f4adb0593b1db498b4', 'b7803810cc734b90a3f44643fad06bd7', '0,c9265b260c1845b6b46462acd36e4304,b7803810cc734b90a3f44643fad06bd7', '5', '3', '1', '2', '1', '2018-06-04 13:54:18', '1', '2018-06-04 13:54:18', '', '0');
INSERT INTO `sys_file_tree` VALUES ('9e31a73796a242009c89995c2de86bbb', '5dbb8533c98b4869901270ae2eb4d0ad', '0,5dbb8533c98b4869901270ae2eb4d0ad', 'wowowow', '4', '0', '1', '1', '2018-06-04 16:45:08', '1', '2018-06-06 17:45:28', '', '0');
INSERT INTO `sys_file_tree` VALUES ('b7803810cc734b90a3f44643fad06bd7', 'c9265b260c1845b6b46462acd36e4304', '0,c9265b260c1845b6b46462acd36e4304', '1', '1', '0', '1', '1', '2018-03-28 14:41:23', '1', '2018-03-28 14:41:23', '1', '0');
INSERT INTO `sys_file_tree` VALUES ('c07436d34ed8412ebfd65c7d7139283d', '0', '0', 'testMode', '120', '0', '0', '1', '2018-07-27 15:30:33', '1', '2018-07-27 16:55:25', 'safsf', '0');
INSERT INTO `sys_file_tree` VALUES ('c9265b260c1845b6b46462acd36e4304', '0', '0', '默认', '0', '0', '0', '1', '2018-03-28 14:33:54', '1', '2018-06-05 10:01:53', null, '0');
INSERT INTO `sys_file_tree` VALUES ('f1d7c9459a5a44adb38ed662bd5d682f', '2bacb604df77451d9ef9c60494c4a5b3', '0,c9265b260c1845b6b46462acd36e4304,2bacb604df77451d9ef9c60494c4a5b3', 'test', '3', '0', '2', '1', '2018-06-04 14:39:45', '1', '2018-06-06 18:11:55', '1111', '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(500) DEFAULT NULL COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('001fb2ff01ea49faaa342dccf1a30a4e', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 17:53:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('00806e331b444ec2b5b404ce8ecc48ee', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:15', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=12fe7758f865410283b26ee134f8a0bf&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('02a6ce093f2c43618f133440bb927d28', '1', '在线办公-待办任务', '1', '2019-03-07 11:29:03', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/task/todo', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('02d188e473084dc898649670a0d3bb37', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('046550d4017b485da12eb11d428775c8', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('0491c698920342baac025667b8176945', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:16', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=12fe7758f865410283b26ee134f8a0bf&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('054ee92ccf774322848ff2add5dde714', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:09', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=7a0440b426f94db1b5b79772210437d2&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('0569dd0eaa1e481d924c3c5ea295bae7', '1', '系统管理-机构用户-区域管理', '1', '2019-03-07 11:29:20', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('060655af69ec48a486bacc490bbcf9df', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:11', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=7a0440b426f94db1b5b79772210437d2&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('066ef34592594a6e8718d94d277b642b', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('06ddb5806d9a4ff5b483d22a7da3866e', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:26', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('070a127a5f234116ba5df5c58c8f900f', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 12:08:28', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0767f4b4d4774d77858ecdb43ca809da', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('083bcdf63a584614a5412c98785ee3a1', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('08b8e4ca08ae4bebbe931ffad4c41c98', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('08c546e68e6c460d8d31815dde110cde', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 12:08:30', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('090cd48f639649ac9d2117012d5cfbff', '1', '文件管理-文件管理-编辑', '1', '2019-03-07 11:01:15', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/download', 'GET', 'id=15e0f0655f0949899e6df9353654e41e', '');
INSERT INTO `sys_log` VALUES ('0963861cdc4345caa9119e3d839add63', '1', '系统管理-机构用户-用户管理', '1', '2019-03-08 14:14:21', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0a5bf53388e74267a7d9a88005d45df0', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:15', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=12fe7758f865410283b26ee134f8a0bf&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('0b3e126033504e0c83832a321d84d991', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:18:18', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0b696fc014874ed5ac2b8f30ea54da42', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:11', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=7a0440b426f94db1b5b79772210437d2&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('0d47de60ec9f4330a46c64390cc3498e', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('0e34fffcbe41466d81039f1ede3cf909', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('0f20488cedd84a249b771bedbd85b8b7', '1', '在线办公-待办任务', '1', '2019-03-08 11:35:15', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/todo', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0fe7623605264105b1ebffd2c1239b95', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:28', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.login_name asc', '');
INSERT INTO `sys_log` VALUES ('117ff26d39c44ed8a0619f5de035ac32', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:26', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('11adb781070a4998a4b489f1df296233', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('11d8bc9785a7464f94d48d5f6e5b1af5', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:00:14', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('149a5fea65de4abb8736153d50394c86', '1', '在线办公-发起流程', '1', '2019-03-08 11:33:05', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('14ac490969db48e8813cdb589a62d3e6', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:02', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=7a0440b426f94db1b5b79772210437d2&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('15e3bd98c8914ad8b6e40db6b6ff3c6e', '1', '系统管理-在线人员', '1', '2019-03-06 17:54:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/online/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1610d2bbc777457790edd6dbbd219f91', '1', '系统管理-机构用户-机构管理', '1', '2019-03-07 11:29:20', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/office/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('164a16c6e0184172b5ddfddc6206ab05', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('16fe992914e44c5696f486d8895bf40c', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('1716b7bce3ff4f8ebb5c897547bd9872', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:27', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('174a8c73bb404d8fae66123c76503f25', '1', '在线办公-已办任务', '1', '2019-03-08 12:23:31', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/historic', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('17b51140f2344a35abe588a60c1bdd1c', '1', '在线办公-已发任务', '1', '2019-03-08 11:39:28', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/hasSent', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('17c68e02c60e4ee9945f3b7224e029d4', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:14', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.mobile desc', '');
INSERT INTO `sys_log` VALUES ('185102d2faf04eb791f4868402839e2b', '1', '在线办公-发起流程', '1', '2019-03-07 11:00:02', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/task/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('18ba592e11a84d8889c0164f5fb25617', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:15', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.phone asc', '');
INSERT INTO `sys_log` VALUES ('1b179810fa41465dbc6fff08052e71ad', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:26', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name desc', '');
INSERT INTO `sys_log` VALUES ('1b4da4e7e76945d7af78dba19f81df83', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:20', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('1b8df8cc31814b0b92377d907c226709', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('1c571daacd614176b64e62a90c05c9f5', '1', '文件管理-文件管理', '1', '2019-03-07 11:00:14', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1d5990c67c30472b8438dee0ea539b15', '1', '在线办公-发起流程', '1', '2019-03-08 14:19:13', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1d73200c6a5a4fe580e8d2951a228b5b', '1', '流程管理-运行中的流程', '1', '2019-03-07 11:15:38', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/process/running', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1dc631249619403c8ca3be8fa07ebd24', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:10', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=f1d7c9459a5a44adb38ed662bd5d682f&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('1ea8a8e358ff4b5ba21fbba4657d468d', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:12', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.email asc', '');
INSERT INTO `sys_log` VALUES ('2050aa067f9f453eb17629ceea500447', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:25', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=4&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('20a189b8b83e4de88e93bd5fb5be855d', '1', '在线办公-待办任务', '1', '2019-03-12 14:39:25', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/todo', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('20c64faf82dd4a12b350b38f7d437a3a', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('20e82bdf5dc84c3b9f7b7cb7501ba241', '1', '在线办公-已办任务', '1', '2019-03-06 17:54:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/task/historic', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('20f82a3df6d94ef8bd86b3ba89889fb4', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('216c82f33ed747389434593f002e7677', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 18:05:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('21798b5b972b443581f72c34b6ab153b', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('21f00e1c44de4ad5a5ed1c4c5b63a778', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('229c5aab87b84485be7b95683372d6d7', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:28', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.login_name desc', '');
INSERT INTO `sys_log` VALUES ('2312fb89d583431c991b8cf0459a6507', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('235b10e5b8c14760a473bf87e0c8b8cc', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:03', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('24dbea2cfcc749418f67d5e92c0520ed', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:10', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=7a0440b426f94db1b5b79772210437d2&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('251c2d631e3c4800b93dc2ff708dfe5d', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:21', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name desc', '');
INSERT INTO `sys_log` VALUES ('2670d865be5042a08ec843553c5653a1', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:10', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=7a0440b426f94db1b5b79772210437d2&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('26cb9159003241539921903a10490e07', '1', '在线办公-发起流程', '1', '2019-03-12 14:39:34', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('26d3e4e4afcd41c98e892bcf2d2ba6dd', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:06', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('278257a66d7a43078d46625bdda19bd4', '1', '系统管理-系统设置-字典管理', '1', '2019-03-06 18:06:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('29491b2b0f184b3bbc2b188e084a03cb', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:17', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=12fe7758f865410283b26ee134f8a0bf&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('29544f216e5340b498a63068cd55b2c2', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:06:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('2bc3e225ccd74a2d89b93d58c4cc0de2', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 17:52:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('2d07e3ec1312402494da22d1197862a5', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('2d89a3a1eda0451885a86fac05a27831', '1', '文件管理-文件管理', '1', '2019-03-07 11:18:18', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2db9fc30e7bd41de9b94a014849be300', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('3052a99bb2ed47a5b88996f36a70bfa9', '1', '系统管理-机构用户-机构管理-查看', '1', '2019-03-06 18:05:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/office/listData', 'POST', 'pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('30bbd2de343a4146a6a35a0960e12293', '1', '系统管理-机构用户-用户管理', '1', '2019-03-08 14:32:02', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('30e4bb13e57e4b549e1e3a5ae1ce257f', '1', '在线办公-待办任务', '1', '2019-03-06 17:51:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/task/todo', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('314449453009442ba115c63c4af5ed97', '1', '系统管理-系统设置-定时任务-编辑', '1', '2019-03-06 18:10:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/resetform', 'GET', 'jobClassName=com.jsite.common.quartz.job.HelloJob&jobGroupName=1&cronExpression=0/30 * * * * ?', '');
INSERT INTO `sys_log` VALUES ('3182db98f7a748679f5e43604f3805b7', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('31c2d5d4cdbe4ddaa9c7e731baabf934', '1', '文件管理-文件夹管理-查看', '1', '2019-03-07 11:00:09', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/filetree/sysFileTree/listData', 'POST', 'name=&pageNo=&pageSize=&orderBy=&parentId=11da634ddacb4129bb2c4f14854585f5', '');
INSERT INTO `sys_log` VALUES ('31d3f76c33774b16ab80914ea6cd450a', '1', '个人中心-个人信息', '1', '2019-03-06 17:51:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('32a55ba7d885483dad1f7b0f7447197c', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:13', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=2bacb604df77451d9ef9c60494c4a5b3&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('330a07424d1243788803f1cb4383b05a', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 17:53:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('356a9eb31ee94ac798a2448c7796116c', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('363ba59f53794c30abf5f9a1cca3a905', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:23', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('374436a35f8145f2a325dea1f30b650d', '1', '系统管理-系统设置-菜单管理', '1', '2019-03-07 11:29:33', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('37fc7a21c122443f8c5c06c400fc0bd4', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:00', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=2bacb604df77451d9ef9c60494c4a5b3&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('3897bd97d27c4237833c36e5a043a69f', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:09', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=018abc93050045dd8f419c14c1a5bfd5&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('38b2a044321341e6a575d2b78cc76154', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:28', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.login_name asc', '');
INSERT INTO `sys_log` VALUES ('38cbab9fb5d64392b73e4029ac35c117', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:10', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=7a0440b426f94db1b5b79772210437d2&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('391c22e549804fef9c30f2dc584df1d9', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:17', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=12fe7758f865410283b26ee134f8a0bf&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('3969c7ffaf1c4c2195ac305829fa85d9', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('3b3d270ee0e649e19c9c21fb34532f22', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:23', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=4&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('3b6bd5fa813548e29f8da99213981a02', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:03', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=12fe7758f865410283b26ee134f8a0bf&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('3bfd361350934a4aa47c7611382d433c', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:21', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('3c3c3817c4f2461b93ba020c141e8f2d', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('3d8366a59706489ca7dd6d6200823cf8', '1', '系统管理-机构用户-用户管理', '1', '2019-03-06 17:52:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3de62a187e5f4d8e9c273ff16e5bace3', '1', '在线办公-已发任务', '1', '2019-03-08 12:22:10', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/hasSent', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3e849ad7527b45f4a0b2a34f8ad959d7', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('3f2bbcb7dc6c427bb3aa6e28bc6111e5', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:14', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.mobile asc', '');
INSERT INTO `sys_log` VALUES ('3f2df398530e4900899c611f7fc8e70a', '1', '文件管理-文件夹管理-查看', '1', '2019-03-07 11:00:13', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/filetree/sysFileTree/listData', 'POST', 'name=&pageNo=&pageSize=&orderBy=&parentId=2bacb604df77451d9ef9c60494c4a5b3', '');
INSERT INTO `sys_log` VALUES ('3f41a668e48d4b6c94973e925983e3b2', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('40533d6fb2ed47c985348a4de7b94401', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('42ddabdf75c34ca6925c9e2865ddf88c', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:28', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.login_name asc', '');
INSERT INTO `sys_log` VALUES ('4306071482c5420988d0df67166576fd', '1', '在线办公-已办任务', '1', '2019-03-06 17:51:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/task/historic', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('43d29208b0754c1081e337d3ec2d9729', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:16', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.login_flag desc', '');
INSERT INTO `sys_log` VALUES ('441d26986f4242f89ba6473dd35b3d63', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:21', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('449012d9bd7e46f2835f9bc7baac270f', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('4523340b19b046f59fd0d93cf787e576', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:11', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=f1d7c9459a5a44adb38ed662bd5d682f&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('455a3a9643a84efca2a34fa8442f00d9', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('458bf789bf7a4fc998f31ed3e4573ad9', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 17:53:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('45ae8967c5934698bb101ec82b793402', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:16', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.login_flag asc', '');
INSERT INTO `sys_log` VALUES ('46a41bceade14625b8dbf874008f6f5b', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('46b350bae0974064b327a5f558b27b61', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:00:57', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('46b6bb67dc484031853d25bc478eb12d', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('46dee45c6e524047b1fc8889b6829b3e', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('472dabd511eb42af93c81b30eeb41772', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:24', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=5&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('476f92f171d54b41b6decc0a0a7c637a', '1', '系统管理-系统设置-菜单管理', '1', '2019-03-06 18:06:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('47f1d3843ecb4f7ebcb149ab40e432af', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:23', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name desc', '');
INSERT INTO `sys_log` VALUES ('4810a9a83a094244a05b7a290cd87117', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('48335c1cefff4b009f017fe6b9093b79', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('488dcf7cce4e471ab09a572a10ef1c8f', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('4b0df12afea94e5a9ba307785653be60', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:22', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=3&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('4b2809411dd443af9314e9bc03035750', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:22', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('4b306bff0eb04f7e89e0333abd9c4a90', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:18:58', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=2bacb604df77451d9ef9c60494c4a5b3&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('4b6cf594929e4c64be4c70046f70e177', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:09', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=7a0440b426f94db1b5b79772210437d2&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('4ba92536463d470abef9dda78696d3ce', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('4c24a5be94514401a5b932f70b1e4e3f', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:16', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.login_flag desc', '');
INSERT INTO `sys_log` VALUES ('4ca387bff300464e8da89975ba63cb7b', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('4d52c5ab7b9349aca5ff476e476f93d0', '1', '在线办公-已办任务', '1', '2019-03-07 11:29:04', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/task/historic', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4eea0ef8c9344913ae2d9b27375d159c', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:22', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name desc', '');
INSERT INTO `sys_log` VALUES ('4ff37ec51acb460fbcebbca85d551537', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:14:25', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('4fff80867d2a42d683baa1eb542c2834', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('5095bd8487e848c3be6dfd9e4e946f17', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:09', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=7a0440b426f94db1b5b79772210437d2&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('52647ecacfd54a7cafb7b2659a898961', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:08', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.login_name desc', '');
INSERT INTO `sys_log` VALUES ('52b5107dc1e94ac7a4fa8d6f21ae74aa', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:21', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=4&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('531c0e06dafe4df5a67d5b4048fe20fe', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:06', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=11da634ddacb4129bb2c4f14854585f5&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('53535ab055704348bb7beabd3e7be7f4', '1', '在线办公-已办任务', '1', '2019-03-08 14:19:08', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/historic', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('53c3383dd2334faf9e5b49cd5a62ca4a', '1', '在线办公-已办任务', '1', '2019-03-08 12:03:18', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/historic', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('547f0e79863346a3b2d70c20f9fb31bc', '1', '流程管理-部署流程', '1', '2019-03-07 11:15:39', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/process/deploy', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('55c22c18fe984bcfb2120acf505e2a64', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:16', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=12fe7758f865410283b26ee134f8a0bf&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('56c4e09431b64d8fa63689a7d2e99ade', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:13', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.mobile desc', '');
INSERT INTO `sys_log` VALUES ('570d55b1b4694bd9a050cc16a52c7dd3', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:09', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=2bacb604df77451d9ef9c60494c4a5b3&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('5867c47cd7aa425bb5f9d340b631b36a', '1', '在线办公-已办任务', '1', '2019-03-06 18:05:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/task/historic', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('599da509fd134bdca33484fc8f0df4fd', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('5a37d77a527b41dbb3f44a35d0d1905d', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('5a97fa78784d470487dca295753d2b14', '1', '在线办公-已发任务', '1', '2019-03-06 18:05:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/task/hasSent', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5af8ea044f7d436aac11a9f7746c8d28', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:10', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=7a0440b426f94db1b5b79772210437d2&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('5b709605f12c4877a63e989ba674b446', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:26', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name desc', '');
INSERT INTO `sys_log` VALUES ('5c4060d32b5f4b368317a0fd5618122e', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:14', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=11da634ddacb4129bb2c4f14854585f5&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('5c89d07e7e374979a937cb8e2786913c', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 17:53:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5cc1cc5789c040589e2bf38b9f04ef33', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('5f16519c39f8486bb992f577db873a1f', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('5f38c8578d5944c0b9f99f359447324d', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:08', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=7a0440b426f94db1b5b79772210437d2&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('600db5b640fb42ffaceab66a7db5dd53', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:15', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=12fe7758f865410283b26ee134f8a0bf&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('604f545f17c44fa798156385053e3c40', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('60caa9aad9774fea97a3e0c37f3e284d', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:10', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=7a0440b426f94db1b5b79772210437d2&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('612c05ee049b4791bedb0515a3abf2ce', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:05', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name desc', '');
INSERT INTO `sys_log` VALUES ('61c587605c84495391e6f9649ff2f182', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:18:18', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('621ba6b195904be8938b6e378d03af9b', '1', '在线办公-已办任务', '1', '2019-03-08 11:39:28', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/historic', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('625ade363b5747daac7dc168efa370c9', '1', '文件管理-文件夹管理', '1', '2019-03-07 11:00:04', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/filetree/sysFileTree/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6295b57406ea4ec1b83294d084809a49', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:27', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name desc', '');
INSERT INTO `sys_log` VALUES ('63798464728745f7a0dafb6f8c21c3b9', '1', '系统登录', '1', '2019-03-12 14:38:23', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('63fc2bac12b3458db185d1b70ec7f82a', '1', '系统登录', '1', '2019-03-07 10:59:55', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('6665840af19743eb93c3267b733935c4', '1', '系统管理-机构用户-用户管理', '1', '2019-03-07 11:29:14', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('67b68b480a0d4167afbd0aae445a5b0f', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:16', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=12fe7758f865410283b26ee134f8a0bf&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('681834e8295e4dd9850f96e1d5e43a99', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('683c35442f4d4a5eac9680ebdfff2e29', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:21', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name desc', '');
INSERT INTO `sys_log` VALUES ('68c9ad5350ca4d3e9c66b3c1788eb007', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('69162eea451440efa714aec543d1c1a5', '1', '系统管理-系统设置-定时任务-编辑', '1', '2019-03-06 18:13:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/resetform', 'GET', 'jobClassName=com.jsite.common.quartz.job.HelloJob&jobGroupName=1&cronExpression=0/5 * * * * ?', '');
INSERT INTO `sys_log` VALUES ('692a4252f2ba4b41944a9f7c490b3b97', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('694f1bff60b04c3aa4484f2c5e4019db', '1', '系统管理-系统设置-字典管理-查看', '1', '2019-03-06 18:06:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/dict/listAll', 'POST', 'type=&description=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('6a06a322dfa446aab1cc17bd369b756f', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('6aa56f909771417ba5e5c87acbee6b2b', '1', '系统管理-机构用户-机构管理-查看', '1', '2019-03-06 17:52:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/office/listData', 'POST', 'pageNo=&pageSize=&orderBy=&parentId=f976e8760ae944389694cdc12c91a18d', '');
INSERT INTO `sys_log` VALUES ('6abb7a2882834e51b06f255dd11b2809', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 17:53:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('6b27b9d3f68e416db6445c2862823690', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:29', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('6bed7a8623114b48957d0eb3cb2c9e10', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('6c3c313f236c40f69d2af1677e3491d9', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('6d7f22ee6e304a9d9cb43f32cabfb28b', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:04', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=885944d2b2784fe68a4a33c276eaa229&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('6dbe1dd2c7ac4f1ba8769d1d984dbad1', '1', '在线办公-待办任务', '1', '2019-03-06 17:54:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/task/todo', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6ddf18724e5d44d7aa2c29e1af31b53c', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:07', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.login_name desc', '');
INSERT INTO `sys_log` VALUES ('6e6cbabc11504f13960e61a6c0d89df5', '1', '系统管理-系统设置-定时任务-暂停', '1', '2019-03-06 18:13:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/pause', 'POST', 'jobClassName=com.jsite.common.quartz.job.HelloJob&jobGroupName=1', '');
INSERT INTO `sys_log` VALUES ('6e6ffdfd5c134cb2aa75113e999f6a1e', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:15', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.phone desc', '');
INSERT INTO `sys_log` VALUES ('6ec2b9e931794c15a799cdfe02c7b538', '1', '系统登录', '1', '2019-03-08 11:32:58', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('6f9fe132a0324515a9100b212f431648', '1', '在线办公-已发任务', '1', '2019-03-06 17:51:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/task/hasSent', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('707e8f29a3544c2886dc90ff2e374016', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('713ff89dbbb14a74b9a641c304acdaa4', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('7157c8030777413fbc80c7052e8e2c52', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 12:24:36', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('71769b8f6e5146b4a81ab00b77fea623', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('71a43f34e4a242bf98c56a1b1de894dd', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 17:53:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('71e9479781e34c0c9ab746f0334521ba', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 17:53:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('731d06c4640b4347ab55154e1a5a6183', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('7419533d720b44c79cc801523e41e8fd', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:03', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=9e31a73796a242009c89995c2de86bbb&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('7604203dc3fa4cffaef6f86600ecde4d', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:29', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name desc', '');
INSERT INTO `sys_log` VALUES ('76d2a1784fea4aa1b845ad4eac8aebd7', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('7869bab6ac684c8eb4c04b104c0c52e8', '1', '文件管理-文件管理', '1', '2019-03-07 11:00:57', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('796153fcbb2649899661801c2b173128', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('7a047461529e4edab4b21cafdf5420e1', '1', '在线办公-已发任务', '1', '2019-03-08 14:18:58', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/hasSent', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7b3f4b4c9309400daef3c77cdfd3ed56', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:15', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.phone asc', '');
INSERT INTO `sys_log` VALUES ('7b70ba493d544d6e985fa4c7f3d8bfc5', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('7b9e37e44bd44b8b9a2971498440d381', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:15', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.login_flag desc', '');
INSERT INTO `sys_log` VALUES ('7cacb0706fd64837bb983061e061a83a', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('7d3cbe481e264955a389272879c821d6', '1', '流程管理-模型管理', '1', '2019-03-07 11:29:35', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/model', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7f1b767d59a44024897d876dc5f8a539', '1', '系统管理-机构用户-区域管理-查看', '1', '2019-03-06 18:05:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/area/listData', 'POST', 'pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('7f4bddffeadd4a518f29bd4ddd95c1a7', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:17', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=12fe7758f865410283b26ee134f8a0bf&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('802460a611b94fec944dcb37a63f5a73', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('80eeddf6bb804cfbb332748fd5ebcb14', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:16', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.login_flag asc', '');
INSERT INTO `sys_log` VALUES ('81b64b49192e4b4cbc9d32da9f5f64f4', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('8208cfc646da42078e6cb7d38c050d7b', '1', '文件管理-文件夹管理', '1', '2019-03-07 11:18:17', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/filetree/sysFileTree/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('820f8b68dc514914b18c656d44f81b7f', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:18:19', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('822cfe2ba63340b0ba4ff2a8ef9ead43', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:10', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=7a0440b426f94db1b5b79772210437d2&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('827e08d271024a38ad2126e986640643', '1', '在线办公-已办任务', '1', '2019-03-07 11:00:01', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/task/historic', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('829cb00c4c8a4c538630162a010fbba4', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:00:57', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('82f3c51c91fc44f2a4d5690b48cc58ef', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 12:24:36', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('83addabfc0734375b9eaf899235b688c', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:23', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name desc', '');
INSERT INTO `sys_log` VALUES ('83bcead92e4d454095a7ba2cafb242fb', '1', '系统管理-系统设置-角色管理-查看', '1', '2019-03-06 17:52:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/role/listData', 'POST', 'pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('84512fe2d45c4f14aefe81f8acc4515e', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:06', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=f1d7c9459a5a44adb38ed662bd5d682f&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('8520c3137a9a48d7941dbd19e3da88f1', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:24', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=171eb600266c4d32998c7265a20a8648&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('8635bd8521ef4239a159ece0f77723c9', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 17:52:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('865f85cd430b4aee984f42639533555a', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('869d29b2a74d4e0b8a23ef38805b2a45', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('86e452b9f2604a9194394f77a1dcab8e', '1', '系统管理-机构用户-区域管理-查看', '1', '2019-03-07 11:29:21', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/area/listData', 'POST', 'pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('87448c5a925f4613a7c7736aa3ed0764', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:00:14', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('87594027df174b6faa6478d0e79a8ae6', '1', '系统管理-系统设置-角色管理-查看', '1', '2019-03-06 18:06:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/role/listData', 'POST', 'pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('87e17f279ceb4744aaf94be27797144c', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('899226aabac94f9b8c1a8369289eed07', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:14', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.phone desc', '');
INSERT INTO `sys_log` VALUES ('89e908ab2b1041f2846c2ef18c33710c', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:07', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.login_name asc', '');
INSERT INTO `sys_log` VALUES ('8a43e81974d84ddfafd784ba1ad0382d', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:12', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=f1d7c9459a5a44adb38ed662bd5d682f&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('8aba7cdee85140c88654cba2b136d46f', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('8b1d1018016e4d4fbfad808726f387a2', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:23', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=171eb600266c4d32998c7265a20a8648&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('8bd041f1e1064a139ced2ab1b435cf15', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('8f2ce090a2964e979d4706f13bbb9ca2', '1', '系统管理-系统设置-字典管理-查看', '1', '2019-03-07 11:29:30', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/dict/listAll', 'POST', 'type=&description=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('8fbd5426c9e94ff5823aaa2ade2a9290', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:15', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=12fe7758f865410283b26ee134f8a0bf&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('90aa172848dd4eed9b6fd297ed3ed09e', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('91d3059aeea74f838475f11569613ece', '1', '文件管理-文件夹管理-查看', '1', '2019-03-07 11:00:05', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/filetree/sysFileTree/listData', 'POST', 'name=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('944c92f6d245472ca000bfe98aaedffe', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:00:58', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=11da634ddacb4129bb2c4f14854585f5&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('94a7e48709764189b234b3bbb8e5e269', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('94e3f20a6d534b81b6dbb0771fa98bdf', '1', '在线办公-已发任务', '1', '2019-03-08 14:19:26', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/hasSent', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('95538568caac4304b014260088fa8af1', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:25', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=1&office.id=3&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('957be501b0d84f4ca8c8ed50cd935f90', '1', '系统登录', '1', '2019-03-06 18:12:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('95967ab4b91144aeb6763ff72761e97c', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:04', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=885944d2b2784fe68a4a33c276eaa229&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('97a7cd00106d40ea99f8f6b159afe6a2', '1', '在线办公-发起流程', '1', '2019-03-06 18:05:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/task/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9887804ee634415d8929bf3ee9e6bc81', '1', '流程管理-部署流程', '1', '2019-03-07 11:08:39', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/process/deploy', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('98d697c3945a4206976ca5a46adbc341', '1', '系统管理-机构用户-机构管理-查看', '1', '2019-03-06 17:52:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/office/listData', 'POST', 'pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('99ad24657eea4e4dbfeabc872e4b5659', '1', '在线办公-待办任务', '1', '2019-03-07 11:00:01', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/task/todo', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('99c0f98318f94686a067a6212ca8cd61', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('9a3f9c2b2f33415d94260d43a9670e56', '1', '在线办公-已发任务', '1', '2019-03-08 11:33:05', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/hasSent', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9a4a156b2afd4680a631a8dfbc16e969', '1', '系统管理-机构用户-用户管理', '1', '2019-03-08 14:18:17', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9a5b5a034e3449918f39920ab0c72766', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:05', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=018abc93050045dd8f419c14c1a5bfd5&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('9b680ad0c4ee4b7fa2ca4ac3a04d8392', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:14', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.phone asc', '');
INSERT INTO `sys_log` VALUES ('9b75e0597a80473bb3fabd31b36d9ed6', '1', '在线办公-发起流程', '1', '2019-03-08 11:39:29', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9c3d47881768484d8b1f77c7adad0a2a', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:32', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('9c6eff5979364ed0b73437f5fef643ef', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('9ced215cecac413dafdd30dd649490fe', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('9de967433d444ecbbe695533984b97b8', '1', '系统管理-机构用户-机构管理-查看', '1', '2019-03-06 17:52:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/office/listData', 'POST', 'pageNo=&pageSize=&orderBy=&parentId=3', '');
INSERT INTO `sys_log` VALUES ('9f5d4d09276a437aaba7d04331a45ae1', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:29', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('9f9ab6f9869d4bbeb4f9e7307591a48d', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:12', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=b7803810cc734b90a3f44643fad06bd7&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('9ff989a07d6b44abab0176fdbb68fbb6', '1', '文件管理-文件夹管理-查看', '1', '2019-03-07 11:18:18', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/filetree/sysFileTree/listData', 'POST', 'name=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('a17705b5aca14194aacbcdb8e398e6df', '1', '系统管理-系统设置-菜单管理-查看', '1', '2019-03-06 18:06:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/menu/listData', 'POST', 'pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('a2854ac6d7864f5a81b7de0e6ead9127', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('a32a66a59a7b4b6389980c4caee5ae1d', '1', '在线办公-待办任务', '1', '2019-03-08 11:39:28', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/todo', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a443e360142447ad9c2e94e4d439a640', '1', '在线办公-待办任务', '1', '2019-03-08 14:18:56', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/todo', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a4ffd451d6ab4679ac1a1d712de1596b', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('a60293d688b948278fd8f3c413e4613e', '1', '系统管理-系统设置-定时任务', '1', '2019-03-07 11:29:31', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a66602dc19f943c3a334fd8b52050877', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('a680adb986994fddb72f372968eaea1a', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:12', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.email asc', '');
INSERT INTO `sys_log` VALUES ('a6ecaed5c1a245508adbc73e027baa43', '1', '系统管理-系统设置-字典管理', '1', '2019-03-07 11:29:30', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a70fbfd0ab4845e28954e3f042c1882e', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:24', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=171eb600266c4d32998c7265a20a8648&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('a7f044b1e1524b7897a1440a447039ac', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('a83f713f1b604fb881d9056ed417dfad', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:15', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=12fe7758f865410283b26ee134f8a0bf&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('a8d09530d29f412d9a7afbb6002ef9ab', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:05', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=c07436d34ed8412ebfd65c7d7139283d&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('a96bc9d5988c428fad331550cc358760', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('aa75d2dca13c444c88b1006dd14fa4dd', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:23', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=5&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('aab65ab1609e4c6987475e7ecbae96de', '1', '系统管理-系统设置-角色管理', '1', '2019-03-06 17:52:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('aada7df18c5b4836b0709d30c1f977a3', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 17:53:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('ab21f5fb77284899ab09ac4f5a20c578', '1', '在线办公-已发任务', '1', '2019-03-12 14:39:33', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/hasSent', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ac4ff2430b8542c29842b05633380ef9', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('acc58688e8eb4476bad82fc363e6db8d', '1', '在线办公-已办任务', '1', '2019-03-08 11:33:05', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/historic', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ad03897e9a5f47ab988ff42fd5a812e4', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:22', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=3&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('ada4bd42117345c0ba691d70ff3980c9', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('ae076c4d887a42fcab3691defad61583', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:12', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=f1d7c9459a5a44adb38ed662bd5d682f&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('ae0cc41b5d4840d7b30147d73e758892', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('ae0cde7f699845a4b6b6b3e852543b01', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('ae7d09aeaedc4a48a044e148c96a5fd0', '1', '系统管理-系统设置-角色管理-查看', '1', '2019-03-07 11:29:31', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/role/listData', 'POST', 'pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('af0dc0a4342747a5b403f4c337c4b6f9', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:23', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('b0d9978830bd40748b9a694561a7c451', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 17:53:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('b1a7898669f64117a8b0f55319ac859a', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('b256ea677e4e46f98bbb7cd9dee8a3bc', '1', '系统管理-机构用户-机构管理', '1', '2019-03-08 12:10:46', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/office/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b49836575e2b49298df4528e028f2252', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:07', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name desc', '');
INSERT INTO `sys_log` VALUES ('b528609d43074e9a8632d6fdc4a78842', '1', '文件管理-文件夹管理-查看', '1', '2019-03-07 11:00:12', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/filetree/sysFileTree/listData', 'POST', 'name=&pageNo=&pageSize=&orderBy=&parentId=c9265b260c1845b6b46462acd36e4304', '');
INSERT INTO `sys_log` VALUES ('b5c97ea4f3224b20a439b0fbe410994d', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:01', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=f1d7c9459a5a44adb38ed662bd5d682f&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('b62371afaf2a475a8f11a4501111eff3', '1', '系统管理-机构用户-机构管理-查看', '1', '2019-03-07 11:29:20', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/office/listData', 'POST', 'pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('b65cb36f2a5946d69526b19f05764bff', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:12', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=018abc93050045dd8f419c14c1a5bfd5&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('b70032e8d5d7466786382890bfc0f7d4', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:12', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=b7803810cc734b90a3f44643fad06bd7&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('b77c1ddc1e214dd9847707357c1082fb', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:22', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('b795ab7a8d2d4ddda006164dabe71af0', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:06', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('b8909536a80047839281d09cb9fb9c6e', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 17:53:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('b8fc8dbffed04a8491d69f4fc40a4be7', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:25', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=3&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('b96fc09688524d2183f9d44d7c34ed38', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('b9b22acf4dea4f32876bc3b4ad70a6bb', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('ba9397e774174412bd042b177f358fb6', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('bac5d62af42e438eb5938f3ae246ca3e', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('baf023205a434bf7af9b71dac320c960', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:12', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.email desc', '');
INSERT INTO `sys_log` VALUES ('bc04045e740b4678b5cb179058947fc2', '1', '系统管理-机构用户-用户管理', '1', '2019-03-06 18:05:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bc77ad4d91504e52b95bd1bcce802c84', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:16', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=12fe7758f865410283b26ee134f8a0bf&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('bca1f7b12c854396af74e62a3b74ce6e', '1', '系统管理-系统设置-定时任务-编辑', '1', '2019-03-06 18:13:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/reschedule', 'POST', 'jobClassName=com.jsite.common.quartz.job.HelloJob&jobGroupName=1&cronExpression=0/5 * * * * ?', '');
INSERT INTO `sys_log` VALUES ('bd0b32dd221c4141b6e6356e5397753c', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('bd8582a8df6f47b8963c812deb2dfee5', '1', '系统管理-机构用户-区域管理-查看', '1', '2019-03-06 17:52:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/area/listData', 'POST', 'pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('bdcef352c2f3440a87bd17f88571d056', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('be7075f0dc814fb7a1fc35ea693cc077', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:03', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bea194ec2a1449e2be004c496782b9bb', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:24', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=5&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('bedfdb720f2d4c91898747400b014093', '1', '系统管理-机构用户-机构管理-查看', '1', '2019-03-06 17:52:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/office/listData', 'POST', 'pageNo=&pageSize=&orderBy=&parentId=1', '');
INSERT INTO `sys_log` VALUES ('c116435fa713411588a3692e2e8b9a02', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('c52b4324a27043fa8940f926ca9328a8', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 17:53:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('c539915e65d54af890e4cb94b7e75ba5', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:07', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.login_name asc', '');
INSERT INTO `sys_log` VALUES ('c57550af5de94be8b05ba6fa940b4cd6', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:27', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('c57d666f729c4b99bd162054a603ac62', '1', '文件管理-文件管理-编辑', '1', '2019-03-07 11:00:23', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/download', 'GET', 'id=15e0f0655f0949899e6df9353654e41e', '');
INSERT INTO `sys_log` VALUES ('c693e25990af420583d09518c21c61de', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:22', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=3&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('c6f8ab8f82674279bd68bdc7fe17f5bd', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:13', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.email asc', '');
INSERT INTO `sys_log` VALUES ('c8dce88dfb614df3903b5d964daff955', '1', '系统登录', '1', '2019-03-06 18:05:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a;JSESSIONID=0b72609863ff49b7bf94b8e8ac48e8bb', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c9bacc1fe9a84c7e87db936b1a3edf67', '1', '在线办公-待办任务', '1', '2019-03-08 11:33:04', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/todo', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ca20a29d01774418b3a36dc2b9609f5f', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:07', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=f1d7c9459a5a44adb38ed662bd5d682f&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('ca4c8f51507b465fb9e81c8c6ccc82e6', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:12', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.email desc', '');
INSERT INTO `sys_log` VALUES ('ca815410aae9414bb0403cced9b61cde', '1', '系统管理-系统设置-菜单管理-查看', '1', '2019-03-06 17:52:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/menu/form', 'GET', 'id=9c37ebfd00764ec99f7c65107faca3d1', '');
INSERT INTO `sys_log` VALUES ('cba6f98e748d4dad8397813305f33ac4', '1', '系统管理-系统设置-菜单管理-查看', '1', '2019-03-07 11:29:33', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/menu/listData', 'POST', 'pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('cc1a5205515d479ba26a2149f4ed9b27', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:05', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('cc380c63a8304f04849c6d8180e6be27', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:08', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=2bacb604df77451d9ef9c60494c4a5b3&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('cc6c7750666a4138b6c104d32a8ea595', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:22', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('cc998622b44b411e883d3cac499d1a29', '1', '在线办公-发起流程', '1', '2019-03-06 17:54:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/task/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ccaf61d0e80e4fa4a62a6683556d3ce6', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:16', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.login_flag asc', '');
INSERT INTO `sys_log` VALUES ('cebff0187f1a4d1fb1ecc8f2591dc934', '1', '系统管理-机构用户-区域管理', '1', '2019-03-06 17:52:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cee38542d11f45c699e3ba408d64e0b0', '1', '系统管理-机构用户-区域管理', '1', '2019-03-06 18:05:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cf04096c4f5840caa83d0daa5377bcdc', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('d0106780977a490492f122ab614d0587', '1', '系统管理-机构用户-用户管理', '1', '2019-03-08 12:24:35', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d11727b7939645bf8321c0f18601aa3a', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:06', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=f1d7c9459a5a44adb38ed662bd5d682f&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('d2471d0490ec4f0e9abcf749695391f6', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:15', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.login_flag asc', '');
INSERT INTO `sys_log` VALUES ('d312542e744f4c64b573cf2fc0cfcfb5', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('d359c0e010914d85bfb4c0de64aa848c', '1', '在线办公-发起流程', '1', '2019-03-06 17:51:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/task/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d3658a3834a149c991d91194064cd08a', '1', '系统管理-系统设置-定时任务-编辑', '1', '2019-03-06 18:10:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/reschedule', 'POST', 'jobClassName=com.jsite.common.quartz.job.HelloJob&jobGroupName=1&cronExpression=0/5 * * * * ?', '');
INSERT INTO `sys_log` VALUES ('d37a332ee28d4a42a35798d7520931d3', '1', '代码生成-业务表配置', '1', '2019-03-06 17:54:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d4f4407c13124f788991224bd2ecbd97', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('d4f6a90622ac43b8a3b72005e7571e1f', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:16', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=12fe7758f865410283b26ee134f8a0bf&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('d579b32772e54446a6bc8cb6563ff930', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('d5ad2768d9a74b139c7b5d812c4dbe7c', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:27', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name desc', '');
INSERT INTO `sys_log` VALUES ('d5e9677d87054516b02e96b19b113901', '1', '在线办公-已发任务', '1', '2019-03-08 11:45:52', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/hasSent', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d61d53783eca4853bde53196c19d5c4e', '1', '在线办公-已办任务', '1', '2019-03-12 14:39:27', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/historic', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d62004e7d8ad435aac1b114f26ba8596', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 17:53:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('d72d5978e2d54cfdb5f20b06fd2d2d38', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('d735bfc209bf4782abf10ab653578387', '1', '在线办公-待办任务', '1', '2019-03-06 18:05:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/task/todo', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d74a2313eed945ab9715c68cc76bb94b', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:13', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=b7803810cc734b90a3f44643fad06bd7&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('d85c3b86e25d467e8dd365d7dbff7f80', '1', '系统管理-日志查询-日志查询', '1', '2019-03-06 17:53:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/log', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d8fa56bc9304439fb2846e8016955863', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:00:16', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=b7803810cc734b90a3f44643fad06bd7&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('da41332953ff474e8fd80e88d287200b', '1', '在线办公-已发任务', '1', '2019-03-08 14:19:35', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/hasSent', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('db7f5eb7bae34b18a4cd41624de47d1a', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:15', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dbec4aa96c65463689f8dc588599d896', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:18', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=12fe7758f865410283b26ee134f8a0bf&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('dde581d0831d4dbfb1be8e73d01a73c7', '1', '文件管理-文件夹管理-查看', '1', '2019-03-07 11:00:08', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/filetree/sysFileTree/listData', 'POST', 'name=&pageNo=&pageSize=&orderBy=&parentId=5dbb8533c98b4869901270ae2eb4d0ad', '');
INSERT INTO `sys_log` VALUES ('de0239867aee4598baa0b0217ce4f638', '1', '在线办公-待办任务', '1', '2019-03-08 11:33:23', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/todo', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('df52cc79cc3a4f87bf2bfa4817e6c58c', '1', '系统管理-机构用户-机构管理', '1', '2019-03-06 18:05:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/office/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dfcbb5fa7a774919b64e7638c1cf6e73', '1', '在线办公-待办任务', '1', '2019-03-08 11:45:49', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/todo', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dfd96454407e4718a40f8f950ef4be71', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:06', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name desc', '');
INSERT INTO `sys_log` VALUES ('e0e0c66d14a440ceb8e427fbd49e09b8', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('e11e8c27ab3e4de9a2f6a08f9ec9a1e7', '1', '系统管理-机构用户-机构管理', '1', '2019-03-06 17:52:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/office/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e382b61732804700a8393d02d80e9fb6', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:23', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=5&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('e3ab8593a8894a68baaf6269b908d52c', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('e45dc0be4fb74c558d0811935dba5c74', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('e49ebe1cd56f42cd92499b9fadddcb44', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:27', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name asc', '');
INSERT INTO `sys_log` VALUES ('e4cd04116415487a81b52633ba86834a', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:22', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name desc', '');
INSERT INTO `sys_log` VALUES ('e5ceed4be1f343438d9d709fe703d345', '1', '系统管理-系统设置-定时任务', '1', '2019-03-06 18:06:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e6325cc26c5e46769a0abfad65c71eb5', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:18:18', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e674ce0b99e543018db5b1cafacf66a3', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('e6e14b7b4e63412bac6d0e49a5deb4a0', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('e7586a8071ad49b6bdcdcb7c0b075c59', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 18:05:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e7650741ceb94cb0a36caa2a9724dc53', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-06 17:53:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('e96b91eb2691451887dcc668fe62316e', '1', '系统登录', '1', '2019-03-08 12:21:59', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('eb5925e37eb4453f9da0517504af9e3c', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:14', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.mobile asc', '');
INSERT INTO `sys_log` VALUES ('ebadf4aa5c4147b5ab6f3d69f267dc5f', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:19:17', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=12fe7758f865410283b26ee134f8a0bf&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('ec9b3b368a744616bfeb76f7941f5c4f', '1', '流程管理-运行中的流程', '1', '2019-03-07 11:08:23', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/process/running', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ecdaf140ad0442bcaeb968ae3038715b', '1', '系统管理-系统设置-角色管理', '1', '2019-03-07 11:29:31', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ece7219029c1435485a866076fbbb445', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:13', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.mobile asc', '');
INSERT INTO `sys_log` VALUES ('edb10a171d2043a9b253f2737bd71021', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:23', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name desc', '');
INSERT INTO `sys_log` VALUES ('efa29e33ae8d48b09a5ef85b3e14e827', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-07 11:29:16', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('f09233eae67044668371297e17c7ca2e', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:01', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=018abc93050045dd8f419c14c1a5bfd5&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('f0efff27ac344dc886604751da3ac954', '1', '系统管理-系统设置-角色管理', '1', '2019-03-06 18:06:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f12c5e8b249f4299983588e5114ee499', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('f1790dd7c7c94607ae7955b79c2ad0c1', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('f25a563124204b75bfad46ff9902701b', '1', '系统管理-系统设置-定时任务-编辑', '1', '2019-03-06 18:11:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/reschedule', 'POST', 'jobClassName=com.jsite.common.quartz.job.HelloJob&jobGroupName=1&cronExpression=0/5 * * * * ?', '');
INSERT INTO `sys_log` VALUES ('f3021e417d334c74a7561f10cd49c726', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:22', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.name desc', '');
INSERT INTO `sys_log` VALUES ('f462c08030b3420c9b31ccdf0c5f9422', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:14:22', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f47df62bd0e0454c82f404229f8c0db2', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-07 11:29:31', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('f50aaf807d114d40b291706613344ace', '1', '在线办公-待办任务', '1', '2019-03-08 11:34:39', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/act/task/todo', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f52ad03cb8074d5a95b80c01aefbf8f1', '1', '文件管理-文件管理-查看', '1', '2019-03-07 11:01:11', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/file/sysFile/listData', 'POST', 'name=&fileTreeId=018abc93050045dd8f419c14c1a5bfd5&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('f6ce220e59af4c0f986fff5e57f51d1e', '1', '系统管理-系统设置-菜单管理', '1', '2019-03-06 17:52:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f7456d5194434b6d9c47f637f4de086c', '1', '系统登录', '1', '2019-03-06 17:51:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f80b47f2a4934d7ca14e257dedb3948c', '1', '系统管理-机构用户-用户管理', '1', '2019-03-08 12:05:32', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f8c7ba65f46f46cda232c1f079d76730', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('f8fc6ae813bf484ea0b15dddc254f23b', '1', '系统管理-机构用户-用户管理-查看', '1', '2019-03-08 14:32:28', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '/jsite/a/sys/user/listData', 'POST', 'loginName=a&email=&mobile=&phone=&name=&company.id=&office.id=&loginFlag=1&pageNo=&pageSize=&orderBy=a.login_name desc', '');
INSERT INTO `sys_log` VALUES ('f97ab979e78e4491bb9c316b32af4ebd', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('fa0d9fe54f294f12aacd6d3497420181', '1', '系统管理-系统设置-定时任务-查看', '1', '2019-03-06 18:13:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/job/listAll', 'POST', 'jobClassName=&jobGroupName=&pageNo=&pageSize=&orderBy=', '');
INSERT INTO `sys_log` VALUES ('fa527d08b2fb4e99bc830ab16ddb6835', '1', '系统管理-机构用户-用户管理', '1', '2019-03-06 17:53:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fb87ccbbb4e54118b26edad908486b61', '1', '流程管理-流程管理', '1', '2019-03-07 11:08:40', '192.168.1.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/act/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fddd8f5343f3469ca4908d1f7dd2eefd', '1', '系统管理-系统设置-菜单管理-查看', '1', '2019-03-06 17:52:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '/jsite/a/sys/menu/listData', 'POST', 'pageNo=&pageSize=&orderBy=', '');

-- ----------------------------
-- Table structure for sys_mdict
-- ----------------------------
DROP TABLE IF EXISTS `sys_mdict`;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `tree_leaf` char(1) NOT NULL COMMENT '是否叶子节点',
  `tree_level` int(11) NOT NULL COMMENT '树形层级',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';

-- ----------------------------
-- Records of sys_mdict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `tree_leaf` char(1) NOT NULL COMMENT '是否叶子节点',
  `tree_level` int(11) NOT NULL COMMENT '树形层级',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('05fd7c19569e419abef02c703669b90f', '3', '0,2,3,', '定时任务', '90', '0', '2', '/sys/job/', '', 'icon-speedometer', '1', '', '1', '2019-01-07 16:29:56', '1', '2019-01-07 16:29:56', '', '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,2,3,', '字典管理', '60', '0', '2', '/sys/dict/', '', 'fa fa-columns', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-04 17:14:49', '', '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,2,', '机构用户', '970', '0', '1', '', '', 'fa fa-th-large', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-05-11 09:46:02', '', '0');
INSERT INTO `sys_menu` VALUES ('13e52acca1254df283520c9ee3db769b', '4', '0,2,3,4,', '编辑', '60', '1', '3', '', '', 'fa fa-circle-thin', '1', 'sys:menu:edit', '1', '2018-07-04 16:17:40', '1', '2018-07-04 16:17:40', '', '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,2,13,', '区域管理', '50', '0', '2', '/sys/area/', '', 'fa fa-map', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-05 10:36:49', '', '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,2,13,', '机构管理', '40', '0', '2', '/sys/office/', '', 'fa fa-puzzle-piece', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-05 10:35:25', '', '0');
INSERT INTO `sys_menu` VALUES ('185e17bc1e5b4fa8a997b8c86a828f1d', '9c37ebfd00764ec99f7c65107faca3d1', '0,56,9c37ebfd00764ec99f7c65107faca3d1,', '查看', '30', '1', '2', '', '', 'fa fa-circle-thin', '0', 'filetree:sysFileTree:view', '1', '2018-07-05 09:08:10', '1', '2018-07-27 15:21:28', '', '0');
INSERT INTO `sys_menu` VALUES ('1aca9bd8565544cc889bb8d366877234', 'fbe403d809b0400d9d36df16cb56abf2', '0,fbe403d809b0400d9d36df16cb56abf2,', '主子表生成', '60', '1', '1', '/test/testDataMain', '', 'fa fa-circle-thin', '1', 'test:testDataMain:view,test:testDataMain:edit', '1', '2018-12-29 13:34:17', '1', '2019-01-02 10:09:10', '', '0');
INSERT INTO `sys_menu` VALUES ('1cbff3f7903c4276902db28ed9e5916e', '7', '0,2,3,7,', '查看', '30', '1', '3', '', '', 'fa fa-circle-thin', '1', 'sys:role:view', '1', '2018-07-04 16:45:37', '1', '2018-07-04 16:45:37', '', '0');
INSERT INTO `sys_menu` VALUES ('1cc9a6712a86420d9557bbf52b24680a', '14', '0,2,13,14,', '编辑', '60', '1', '3', '', '', 'fa fa-circle-thin', '0', 'sys:area:edit', '1', '2018-07-05 10:36:25', '1', '2018-07-05 10:36:25', '', '0');
INSERT INTO `sys_menu` VALUES ('1e43e4e03d724542b1a31f8c0593ca33', 'b06b6eae9f714d028480d6b6c114d498', '0,56,b06b6eae9f714d028480d6b6c114d498,', '查看', '30', '1', '2', '', '', '', '0', 'file:sysFile:view', '1', '2018-03-28 17:05:35', '1', '2018-07-27 15:22:00', '', '0');
INSERT INTO `sys_menu` VALUES ('2', '0', '0,', '系统管理', '80', '0', '0', '', '', 'icon-settings', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-05-18 09:12:14', '', '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,2,13,', '用户管理', '30', '0', '2', '/sys/user/index', '', 'fa fa-users', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-05 10:32:22', '', '0');
INSERT INTO `sys_menu` VALUES ('2051e10b979246a69331f96a56d6bb17', '05fd7c19569e419abef02c703669b90f', '0,2,3,05fd7c19569e419abef02c703669b90f,', '恢复', '150', '1', '3', '', '', 'fa fa-circle-thin', '1', 'sys:job:resume', '1', '2019-01-11 09:46:56', '1', '2019-01-11 09:46:56', '', '0');
INSERT INTO `sys_menu` VALUES ('23', '2', '0,2,', '关于帮助', '990', '1', '1', '', '', '', '0', '', '1', '2013-05-27 08:00:00', '1', '2018-04-18 14:41:45', '', '0');
INSERT INTO `sys_menu` VALUES ('24', '23', '0,2,23,', '官方首页', '30', '1', '2', 'http://jsite.org.cn', '_blank', '', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-04-18 10:53:18', '', '0');
INSERT INTO `sys_menu` VALUES ('246838c40d334f2f9f929b5292771bc8', '62', '0,62,', '已办任务', '30', '1', '1', '/act/task/historic', '', 'fa fa-circle-thin', '1', '', '1', '2018-08-07 14:58:35', '1', '2018-08-07 14:58:35', '', '0');
INSERT INTO `sys_menu` VALUES ('28', '0', '0,', '个人中心', '50', '0', '0', '', '', 'icon-user', '0', '', '1', '2013-05-27 08:00:00', '1', '2018-06-26 14:13:44', '', '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,28,', '个人信息', '30', '1', '1', '/sys/user/info', '', 'icon-user-following', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-06-26 18:13:35', '', '0');
INSERT INTO `sys_menu` VALUES ('294700ca86cc45eba00fb7e6c6f2b121', 'b06b6eae9f714d028480d6b6c114d498', '0,56,b06b6eae9f714d028480d6b6c114d498,', '编辑', '60', '1', '2', '', '', '', '0', 'file:sysFile:edit', '1', '2018-03-28 17:06:13', '1', '2018-07-27 15:22:13', '', '0');
INSERT INTO `sys_menu` VALUES ('2f436a3b76924563acf09132adfe666e', '2', '0,2,', '在线人员', '1020', '1', '1', '/sys/online/list', '', 'icon-user-following', '0', 'sys:online:view,sys:online:edit', '1', '2018-08-30 16:34:49', '1', '2018-08-30 16:34:49', '', '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,2,', '系统设置', '980', '0', '1', '', '', 'fa fa-gear', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-05-11 11:59:04', '', '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,28,', '修改密码', '40', '1', '1', '/sys/user/modifyPwd', '', 'icon-lock', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-06-26 15:17:38', '', '0');
INSERT INTO `sys_menu` VALUES ('31', '0', '0,', '内容管理', '5000', '0', '0', '', '', 'icon-note', '0', '', '1', '2013-05-27 08:00:00', '1', '2018-06-28 08:48:56', '', '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '0,31,', '栏目设置', '990', '1', '1', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '32', '0,31,32', '栏目管理', '30', '1', '2', '/cms/category/', null, 'align-justify', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '33', '0,31,32,33,', '查看', '30', '1', '3', null, null, null, '0', 'cms:category:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '33', '0,31,32,33,', '修改', '40', '1', '3', null, null, null, '0', 'cms:category:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '32', '0,31,32', '站点设置', '40', '1', '2', '/cms/site/', null, 'certificate', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('37', '36', '0,31,32,36,', '查看', '30', '1', '3', null, null, null, '0', 'cms:site:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('38', '36', '0,31,32,36,', '修改', '40', '1', '3', null, null, null, '0', 'cms:site:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('39', '32', '0,31,32', '切换站点', '50', '1', '2', '/cms/site/select', null, 'retweet', '1', 'cms:site:select', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,2,3,', '菜单管理', '30', '0', '2', '/sys/menu/', '', 'fa fa-list-alt', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-04 16:17:54', '', '0');
INSERT INTO `sys_menu` VALUES ('40', '31', '0,31,', '内容管理', '500', '1', '1', null, null, null, '1', 'cms:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('41', '40', '0,31,40,', '内容发布', '30', '1', '2', '/cms/', null, 'briefcase', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('42', '41', '0,31,40,41,', '文章模型', '40', '1', '3', '/cms/article/', null, 'file', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('43', '42', '0,31,40,41,42,', '查看', '30', '1', '4', null, null, null, '0', 'cms:article:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('44', '42', '0,31,40,41,42,', '修改', '40', '1', '4', null, null, null, '0', 'cms:article:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('45', '42', '0,31,40,41,42,', '审核', '50', '1', '4', null, null, null, '0', 'cms:article:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('46', '41', '0,31,40,41,', '链接模型', '60', '1', '3', '/cms/link/', null, 'random', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('47', '46', '0,31,40,41,46,', '查看', '30', '1', '4', null, null, null, '0', 'cms:link:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('48', '46', '0,31,40,41,46,', '修改', '40', '1', '4', null, null, null, '0', 'cms:link:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('49', '46', '0,31,40,41,46,', '审核', '50', '1', '4', null, null, null, '0', 'cms:link:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('4b2965d0d0f7460e969abc2eb07f1560', '62', '0,62,', '发起流程', '50', '1', '1', '/act/task/process', '', 'fa fa-circle-thin', '1', '', '1', '2018-08-07 15:07:41', '1', '2018-08-20 14:22:31', '', '0');
INSERT INTO `sys_menu` VALUES ('50', '40', '0,31,40,', '评论管理', '40', '1', '2', '/cms/comment/?status=2', null, 'comment', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('51', '50', '0,31,40,50,', '查看', '30', '1', '3', null, null, null, '0', 'cms:comment:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('52', '50', '0,31,40,50,', '审核', '40', '1', '3', null, null, null, '0', 'cms:comment:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('53', '40', '0,31,40,', '公共留言', '80', '1', '2', '/cms/guestbook/?status=2', null, 'glass', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('53365d59807c448b926fb3766b783c1f', '10', '0,2,3,10,', '查看', '30', '1', '3', '', '', 'fa fa-circle-thin', '1', 'sys:dict:view', '1', '2018-07-04 17:14:31', '1', '2018-07-04 17:14:31', '', '0');
INSERT INTO `sys_menu` VALUES ('54', '53', '0,31,40,53,', '查看', '30', '1', '3', null, null, null, '0', 'cms:guestbook:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('55', '53', '0,31,40,53,', '审核', '40', '1', '3', null, null, null, '0', 'cms:guestbook:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('56', '0', '0,', '文件管理', '120', '0', '0', '', '', 'icon-folder', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-06-28 08:47:09', '', '0');
INSERT INTO `sys_menu` VALUES ('5e67ea5689484d878ad6a6019e5989c5', '05fd7c19569e419abef02c703669b90f', '0,2,3,05fd7c19569e419abef02c703669b90f,', '编辑', '60', '1', '3', '', '', 'fa fa-circle-thin', '1', 'sys:job:edit', '1', '2019-01-08 14:58:22', '1', '2019-01-08 15:02:23', '', '0');
INSERT INTO `sys_menu` VALUES ('60', '31', '0,31,', '统计分析', '600', '1', '1', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('61', '60', '0,31,60,', '信息量统计', '30', '1', '2', '/cms/stats/article', null, 'tasks', '1', 'cms:stats:article', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('62', '0', '0,', '在线办公', '20', '0', '0', '', '', 'icon-cloud-upload', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-06-28 08:48:13', '', '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,2,', '日志查询', '985', '0', '1', '', '', 'fa fa-calendar', '1', '', '1', '2013-06-03 08:00:00', '1', '2018-05-11 10:12:56', '', '0');
INSERT INTO `sys_menu` VALUES ('67a7d3780a704dff89d5c6467370bea4', 'fbe403d809b0400d9d36df16cb56abf2', '0,fbe403d809b0400d9d36df16cb56abf2,', '单表生成', '30', '1', '1', '/test/testData', '', 'fa fa-circle-thin', '1', 'test:testData:view,test:testData:edit', '1', '2018-12-19 17:00:12', '1', '2019-01-02 10:05:25', '', '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,2,67,', '日志查询', '30', '1', '2', '/sys/log', '', 'fa fa-edit', '1', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2018-05-11 10:16:51', '', '0');
INSERT INTO `sys_menu` VALUES ('69', '0', '0,', '流程管理', '100', '0', '0', '', '', 'icon-equalizer', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-08-02 09:08:56', '', '0');
INSERT INTO `sys_menu` VALUES ('6c7a6cff4a6a45058291bbf09ff3e780', '17', '0,2,13,17,', '查看', '30', '1', '3', '', '', 'fa fa-circle-thin', '0', 'sys:office:view', '1', '2018-07-05 10:33:26', '1', '2018-07-05 10:33:26', '', '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,2,3,', '角色管理', '50', '0', '2', '/sys/role/', '', 'icon-social-dropbox', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-06 14:43:59', '', '0');
INSERT INTO `sys_menu` VALUES ('70', '69', '0,69,', '流程管理', '30', '1', '1', '/act/process', '', 'fa fa-circle-thin', '1', 'act:process:edit', '1', '2013-05-27 08:00:00', '1', '2018-08-02 09:09:21', '', '0');
INSERT INTO `sys_menu` VALUES ('72', '69', '0,69,', '模型管理', '40', '1', '1', '/act/model', '', 'fa fa-circle-thin', '1', 'act:model:edit', '1', '2013-09-20 08:00:00', '1', '2018-08-02 09:10:06', '', '0');
INSERT INTO `sys_menu` VALUES ('7eeda5473bff486895a2df0262bd55f4', '62', '0,62,', '请假流程：发起|办理权限', '70', '1', '2', '', '', '', '0', 'oa:leave:view,oa:leave:edit', '1', '2018-08-15 14:40:25', '1', '2018-08-15 17:22:11', '', '0');
INSERT INTO `sys_menu` VALUES ('81', 'af9b8c36092b40b2864054e75890608e', '0,af9b8c36092b40b2864054e75890608e,', '生成方案配置', '30', '1', '1', '/gen/genScheme', '', 'fa fa-circle-thin', '1', 'gen:genScheme:view,gen:genScheme:edit', '1', '2013-10-16 08:00:00', '1', '2018-05-11 10:03:25', '', '0');
INSERT INTO `sys_menu` VALUES ('82', 'af9b8c36092b40b2864054e75890608e', '0,af9b8c36092b40b2864054e75890608e,', '业务表配置', '20', '1', '1', '/gen/genTable', '', 'fa fa-circle-thin', '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', '2013-10-16 08:00:00', '1', '2018-05-11 10:03:11', '', '0');
INSERT INTO `sys_menu` VALUES ('83', 'af9b8c36092b40b2864054e75890608e', '0,af9b8c36092b40b2864054e75890608e,', '代码模板管理', '90', '1', '1', '/gen/genTemplate', '', 'fa fa-circle-thin', '0', 'gen:genTemplate:view,gen:genTemplate:edit', '1', '2013-10-16 08:00:00', '1', '2018-07-05 10:40:27', '', '0');
INSERT INTO `sys_menu` VALUES ('8308c0438092480997f4712ae8308827', '62', '0,62,', '已发任务', '40', '1', '1', '/act/task/hasSent', '', 'fa fa-circle-thin', '1', '', '1', '2018-08-09 20:28:01', '1', '2018-08-13 18:14:55', '', '0');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,2,67,', '连接池监视', '40', '1', '2', '/../druid', '', 'fa fa-link', '1', '', '1', '2013-10-18 08:00:00', '1', '2018-05-11 10:16:02', '', '0');
INSERT INTO `sys_menu` VALUES ('88', '62', '0,62,', '通知通告', '60', '0', '1', '', '', 'icon-volume-2', '1', '', '1', '2013-11-08 08:00:00', '1', '2018-08-02 09:05:01', '', '0');
INSERT INTO `sys_menu` VALUES ('89', '88', '0,62,88,', '我的通告', '30', '1', '2', '/oa/oaNotify/self', '', 'fa fa-circle-thin', '1', '', '1', '2013-11-08 08:00:00', '1', '2018-08-02 09:12:37', '', '0');
INSERT INTO `sys_menu` VALUES ('8e1f2cf1dc3a43b0b5e50ff5b92cc298', '05fd7c19569e419abef02c703669b90f', '0,2,3,05fd7c19569e419abef02c703669b90f,', '暂停', '120', '1', '3', '', '', 'fa fa-circle-thin', '1', 'sys:job:pause', '1', '2019-01-11 09:31:49', '1', '2019-01-11 09:31:49', '', '0');
INSERT INTO `sys_menu` VALUES ('90', '88', '0,62,88,', '通告管理', '50', '1', '2', '/oa/oaNotify', '', 'fa fa-circle-thin', '1', 'oa:oaNotify:view,oa:oaNotify:edit', '1', '2013-11-08 08:00:00', '1', '2018-08-02 09:12:46', '', '0');
INSERT INTO `sys_menu` VALUES ('95db821b31cd4670ab51b115ce73d271', '62', '0,62,', '待办任务', '20', '1', '1', '/act/task/todo', '', 'fa fa-circle-thin', '1', 'act:process:view,act:process:edit', '1', '2018-08-07 14:57:37', '1', '2018-12-22 22:47:45', '', '0');
INSERT INTO `sys_menu` VALUES ('960d503ac572449bae996bfc928f1bf3', '7', '0,2,3,7,', '编辑', '60', '1', '3', '', '', 'fa fa-circle-thin', '1', 'sys:role:edit', '1', '2018-07-04 16:46:18', '1', '2018-07-04 16:47:17', '', '0');
INSERT INTO `sys_menu` VALUES ('97716fb3af4b41bd88f1eca181bc0587', 'fbe403d809b0400d9d36df16cb56abf2', '0,fbe403d809b0400d9d36df16cb56abf2,', '树结构表生成', '90', '1', '1', '/test/testTree', '', 'fa fa-circle-thin', '1', 'test:testTree:view,test:testTree:edit', '1', '2019-01-07 11:49:29', '1', '2019-01-07 11:49:29', '', '0');
INSERT INTO `sys_menu` VALUES ('9c37ebfd00764ec99f7c65107faca3d1', '56', '0,56,', '文件夹管理', '5060', '0', '1', '/filetree/sysFileTree/index', '', 'fa fa-list', '1', '', '1', '2018-03-28 09:21:04', '1', '2018-07-27 15:20:46', '', '0');
INSERT INTO `sys_menu` VALUES ('a4f7a04b94f1495da822915f92c8e481', '17', '0,2,13,17,', '编辑', '60', '1', '3', '', '', 'fa fa-circle-thin', '0', 'sys:office:edit', '1', '2018-07-05 10:33:43', '1', '2018-07-05 10:33:43', '', '0');
INSERT INTO `sys_menu` VALUES ('af4793c752914654bb89870f1e5733c9', '05fd7c19569e419abef02c703669b90f', '0,2,3,05fd7c19569e419abef02c703669b90f,', '删除', '180', '1', '3', '', '', 'fa fa-circle-thin', '1', 'sys:job:del', '1', '2019-01-11 11:00:11', '1', '2019-01-11 11:00:11', '', '0');
INSERT INTO `sys_menu` VALUES ('af9b8c36092b40b2864054e75890608e', '0', '0,', '代码生成', '1020', '0', '0', '', '', 'fa fa-file-code-o', '1', '', '1', '2018-05-14 16:26:49', '1', '2018-06-14 16:53:20', '', '0');
INSERT INTO `sys_menu` VALUES ('b06b6eae9f714d028480d6b6c114d498', '56', '0,56,', '文件管理', '5090', '0', '1', '/file/sysFile/index', '', 'fa fa-copy', '1', '', '1', '2018-03-28 17:04:29', '1', '2018-07-27 15:21:03', '', '0');
INSERT INTO `sys_menu` VALUES ('b522939e606543b3b4fee4b045c900c7', '4', '0,2,3,4,', '查看', '30', '1', '3', '', '', 'fa fa-circle-thin', '1', 'sys:menu:view', '1', '2018-07-04 16:16:09', '1', '2018-07-04 16:16:37', '', '0');
INSERT INTO `sys_menu` VALUES ('c1a03d4ac6e6461f8a3f8bc083ebb83e', '9c37ebfd00764ec99f7c65107faca3d1', '0,56,9c37ebfd00764ec99f7c65107faca3d1,', '编辑', '60', '1', '2', '', '', 'fa fa-circle-thin', '0', 'filetree:sysFileTree:edit', '1', '2018-07-05 09:08:33', '1', '2018-07-27 15:21:44', '', '0');
INSERT INTO `sys_menu` VALUES ('c73127a0972c4c66aa676947e50469cd', '05fd7c19569e419abef02c703669b90f', '0,2,3,05fd7c19569e419abef02c703669b90f,', '添加', '90', '1', '3', '', '', 'fa fa-circle-thin', '1', 'sys:job:add', '1', '2019-01-09 17:33:37', '1', '2019-01-09 17:33:37', '', '0');
INSERT INTO `sys_menu` VALUES ('cf195f0c91ff463da5fe8b49509f5774', '69', '0,69,', '部署流程', '20', '1', '1', '/act/process/deploy', '', 'fa fa-circle-thin', '1', 'act:process:edit', '1', '2018-08-02 08:53:30', '1', '2018-08-02 09:02:26', '', '0');
INSERT INTO `sys_menu` VALUES ('deba887e31ed487a980ec6d1357398ee', '14', '0,2,13,14,', '查看', '30', '1', '3', '', '', 'fa fa-circle-thin', '0', 'sys:area:view', '1', '2018-07-05 10:36:00', '1', '2018-07-05 10:36:00', '', '0');
INSERT INTO `sys_menu` VALUES ('eb457a022d9841b89da35c93ae0d7f0f', '10', '0,2,3,10,', '编辑', '60', '1', '3', '', '', 'fa fa-circle-thin', '1', 'sys:dict:edit', '1', '2018-07-04 17:15:17', '1', '2018-07-04 17:15:17', '', '0');
INSERT INTO `sys_menu` VALUES ('f081fd38850941c98cd80bd6954b712f', '69', '0,69,', '运行中的流程', '10', '1', '1', '/act/process/running', '', 'fa fa-circle-thin', '1', 'act:process:edit', '1', '2018-08-02 08:58:48', '1', '2018-08-02 09:01:36', '', '0');
INSERT INTO `sys_menu` VALUES ('f5e0c5b0d3e24f969588e8ba8cacfc9b', '20', '0,2,13,20,', '编辑', '60', '1', '3', '', '', 'fa fa-circle-thin', '0', 'sys:user:edit', '1', '2018-07-05 10:33:04', '1', '2018-07-05 10:33:04', '', '0');
INSERT INTO `sys_menu` VALUES ('f6bc0ba744ed4b08b491ec00460d21c2', '20', '0,2,13,20,', '查看', '30', '1', '3', '', '', 'fa fa-circle-thin', '0', 'sys:user:view', '1', '2018-07-05 10:32:42', '1', '2018-07-05 10:32:42', '', '0');
INSERT INTO `sys_menu` VALUES ('fbe403d809b0400d9d36df16cb56abf2', '0', '0,', '代码生成测试', '5030', '0', '0', '', '', 'icon-direction', '1', '', '1', '2018-12-19 16:59:07', '1', '2018-12-19 16:59:07', '', '0');
INSERT INTO `sys_menu` VALUES ('fed13e36e0f84d9aa438741c3142b651', '05fd7c19569e419abef02c703669b90f', '0,2,3,05fd7c19569e419abef02c703669b90f,', '查看', '30', '1', '3', '', '', 'fa fa-circle-thin', '1', 'sys:job:view', '1', '2019-01-07 16:33:42', '1', '2019-01-07 16:33:42', '', '0');

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `tree_leaf` char(1) NOT NULL COMMENT '是否叶子节点',
  `tree_level` int(11) NOT NULL COMMENT '树形层级',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `sys_office_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `sys_area` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('1', '0', '0,', 'Jsite测试公司', '10', '0', '0', 'f762fb569d8445f28a226a9b831cfb90', '100000', '1', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2019-02-01 10:17:54', '', '0');
INSERT INTO `sys_office` VALUES ('171eb600266c4d32998c7265a20a8648', '1', '0,1,', '北京分公司', '30', '1', '1', 'f762fb569d8445f28a226a9b831cfb90', '100', '2', '2', '', '', '', '', '', '', '1', '', '', '1', '2019-02-01 10:13:32', '1', '2019-02-01 10:13:32', '', '0');
INSERT INTO `sys_office` VALUES ('3', '1', '0,1,', '综合部', '20', '0', '1', 'f762fb569d8445f28a226a9b831cfb90', '100002', '2', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2019-01-29 09:42:45', '', '0');
INSERT INTO `sys_office` VALUES ('4', '1', '0,1,', '市场部', '30', '1', '1', 'f762fb569d8445f28a226a9b831cfb90', '100003', '2', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2018-02-02 17:40:28', '', '0');
INSERT INTO `sys_office` VALUES ('5', '1', '0,1,', '技术部', '40', '1', '1', 'f762fb569d8445f28a226a9b831cfb90', '100004', '2', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2018-02-02 17:40:37', '', '0');
INSERT INTO `sys_office` VALUES ('a242a3d625c44281b267b91ec6449524', '3', '0,1,3,', '测试', '30', '1', '2', 'da2da01621b64be5a85b07a8c883228f', '110000', '2', '2', '', '', '', '', '', '', '', '56620c5ef567427c8debe68875c0eda2', '', '1', '2019-01-29 09:42:45', '1', '2019-01-29 09:42:45', '', '0');
INSERT INTO `sys_office` VALUES ('dd872755880842bc826290fc96e00270', 'f976e8760ae944389694cdc12c91a18d', '0,f976e8760ae944389694cdc12c91a18d,', '总部', '30', '1', '1', 'f762fb569d8445f28a226a9b831cfb90', '', '1', '2', '', '', '', '', '', '', '', '', '', '1', '2019-01-08 09:45:00', '1', '2019-01-15 11:13:24', '', '0');
INSERT INTO `sys_office` VALUES ('f976e8760ae944389694cdc12c91a18d', '0', '0,', '测试公司', '30', '0', '0', 'f762fb569d8445f28a226a9b831cfb90', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '2019-01-08 09:44:19', '1', '2019-01-08 09:45:00', '', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '5', '系统管理员', 'Manager', 'security-role', '1', '1', '1', '1', '1', '2013-05-27 08:00:00', '1', '2019-01-11 20:55:30', 'AA', '0');
INSERT INTO `sys_role` VALUES ('1042c40b2d2d496c9af546bba7006623', '3', 'hr', 'hr', 'assignment', '4', '1', '1', '1', '1', '2018-08-20 14:33:33', '1', '2018-12-28 13:53:05', '', '0');
INSERT INTO `sys_role` VALUES ('6', '4', '普通用户', 'Comuser', 'assignment', '3', '8', '1', '1', '1', '2013-05-27 08:00:00', '1', '2018-07-05 11:54:44', '', '0');
INSERT INTO `sys_role` VALUES ('a868b9836f664b43909757005390022f', '5', '部门经理', 'dept', 'security-role', '2', '3', '1', '1', '1', '2018-12-22 22:21:56', '1', '2018-12-22 22:25:33', '', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `sys_role_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_role_menu_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '05fd7c19569e419abef02c703669b90f');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '13e52acca1254df283520c9ee3db769b');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '185e17bc1e5b4fa8a997b8c86a828f1d');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '185e17bc1e5b4fa8a997b8c86a828f1d');
INSERT INTO `sys_role_menu` VALUES ('1', '1aca9bd8565544cc889bb8d366877234');
INSERT INTO `sys_role_menu` VALUES ('1', '1cbff3f7903c4276902db28ed9e5916e');
INSERT INTO `sys_role_menu` VALUES ('1', '1cc9a6712a86420d9557bbf52b24680a');
INSERT INTO `sys_role_menu` VALUES ('1', '1e43e4e03d724542b1a31f8c0593ca33');
INSERT INTO `sys_role_menu` VALUES ('6', '1e43e4e03d724542b1a31f8c0593ca33');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '1e43e4e03d724542b1a31f8c0593ca33');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '2051e10b979246a69331f96a56d6bb17');
INSERT INTO `sys_role_menu` VALUES ('1', '23');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '246838c40d334f2f9f929b5292771bc8');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '246838c40d334f2f9f929b5292771bc8');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '246838c40d334f2f9f929b5292771bc8');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '28');
INSERT INTO `sys_role_menu` VALUES ('6', '28');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '29');
INSERT INTO `sys_role_menu` VALUES ('6', '29');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '294700ca86cc45eba00fb7e6c6f2b121');
INSERT INTO `sys_role_menu` VALUES ('6', '294700ca86cc45eba00fb7e6c6f2b121');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '294700ca86cc45eba00fb7e6c6f2b121');
INSERT INTO `sys_role_menu` VALUES ('6', '2e95be57e16f478ba3347549692feb1f');
INSERT INTO `sys_role_menu` VALUES ('1', '2f436a3b76924563acf09132adfe666e');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '30');
INSERT INTO `sys_role_menu` VALUES ('6', '30');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '31');
INSERT INTO `sys_role_menu` VALUES ('1', '32');
INSERT INTO `sys_role_menu` VALUES ('6', '32e3d2df46c34197a8d0bbec797d78ae');
INSERT INTO `sys_role_menu` VALUES ('1', '33');
INSERT INTO `sys_role_menu` VALUES ('1', '34');
INSERT INTO `sys_role_menu` VALUES ('1', '35');
INSERT INTO `sys_role_menu` VALUES ('1', '36');
INSERT INTO `sys_role_menu` VALUES ('1', '37');
INSERT INTO `sys_role_menu` VALUES ('1', '38');
INSERT INTO `sys_role_menu` VALUES ('1', '39');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '40');
INSERT INTO `sys_role_menu` VALUES ('1', '41');
INSERT INTO `sys_role_menu` VALUES ('1', '42');
INSERT INTO `sys_role_menu` VALUES ('1', '43');
INSERT INTO `sys_role_menu` VALUES ('1', '44');
INSERT INTO `sys_role_menu` VALUES ('1', '45');
INSERT INTO `sys_role_menu` VALUES ('1', '46');
INSERT INTO `sys_role_menu` VALUES ('1', '47');
INSERT INTO `sys_role_menu` VALUES ('1', '48');
INSERT INTO `sys_role_menu` VALUES ('1', '49');
INSERT INTO `sys_role_menu` VALUES ('1', '4b2965d0d0f7460e969abc2eb07f1560');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '4b2965d0d0f7460e969abc2eb07f1560');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '4b2965d0d0f7460e969abc2eb07f1560');
INSERT INTO `sys_role_menu` VALUES ('1', '50');
INSERT INTO `sys_role_menu` VALUES ('1', '51');
INSERT INTO `sys_role_menu` VALUES ('6', '512b3905583c42429a28ebc114a0f2d2');
INSERT INTO `sys_role_menu` VALUES ('1', '52');
INSERT INTO `sys_role_menu` VALUES ('1', '53');
INSERT INTO `sys_role_menu` VALUES ('1', '53365d59807c448b926fb3766b783c1f');
INSERT INTO `sys_role_menu` VALUES ('1', '54');
INSERT INTO `sys_role_menu` VALUES ('1', '55');
INSERT INTO `sys_role_menu` VALUES ('6', '55117c43bed14757b9d92a55faee2dc7');
INSERT INTO `sys_role_menu` VALUES ('1', '56');
INSERT INTO `sys_role_menu` VALUES ('6', '56');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '56');
INSERT INTO `sys_role_menu` VALUES ('6', '5e54e9e5c1f548a485069f9601010ffd');
INSERT INTO `sys_role_menu` VALUES ('1', '5e67ea5689484d878ad6a6019e5989c5');
INSERT INTO `sys_role_menu` VALUES ('6', '5fa583311c5e42de9d8f5bf35663111f');
INSERT INTO `sys_role_menu` VALUES ('1', '60');
INSERT INTO `sys_role_menu` VALUES ('1', '61');
INSERT INTO `sys_role_menu` VALUES ('1', '62');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '62');
INSERT INTO `sys_role_menu` VALUES ('6', '62');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '62');
INSERT INTO `sys_role_menu` VALUES ('6', '63');
INSERT INTO `sys_role_menu` VALUES ('6', '64');
INSERT INTO `sys_role_menu` VALUES ('6', '65');
INSERT INTO `sys_role_menu` VALUES ('6', '66');
INSERT INTO `sys_role_menu` VALUES ('1', '67');
INSERT INTO `sys_role_menu` VALUES ('1', '67a7d3780a704dff89d5c6467370bea4');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '69');
INSERT INTO `sys_role_menu` VALUES ('6', '69');
INSERT INTO `sys_role_menu` VALUES ('1', '6c7a6cff4a6a45058291bbf09ff3e780');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '70');
INSERT INTO `sys_role_menu` VALUES ('6', '70');
INSERT INTO `sys_role_menu` VALUES ('1', '72');
INSERT INTO `sys_role_menu` VALUES ('6', '72');
INSERT INTO `sys_role_menu` VALUES ('6', '73');
INSERT INTO `sys_role_menu` VALUES ('6', '736b4ec8cbe74bf7937fe92668dcc44a');
INSERT INTO `sys_role_menu` VALUES ('6', '74');
INSERT INTO `sys_role_menu` VALUES ('6', '742be3b803174b9b81357843607fd14e');
INSERT INTO `sys_role_menu` VALUES ('6', '74db9eeede4b4146943737ce74af731d');
INSERT INTO `sys_role_menu` VALUES ('1', '7eeda5473bff486895a2df0262bd55f4');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '7eeda5473bff486895a2df0262bd55f4');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '7eeda5473bff486895a2df0262bd55f4');
INSERT INTO `sys_role_menu` VALUES ('1', '81');
INSERT INTO `sys_role_menu` VALUES ('1', '82');
INSERT INTO `sys_role_menu` VALUES ('1', '8308c0438092480997f4712ae8308827');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '8308c0438092480997f4712ae8308827');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '8308c0438092480997f4712ae8308827');
INSERT INTO `sys_role_menu` VALUES ('1', '84');
INSERT INTO `sys_role_menu` VALUES ('1', '88');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '88');
INSERT INTO `sys_role_menu` VALUES ('6', '88');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '88');
INSERT INTO `sys_role_menu` VALUES ('1', '89');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '89');
INSERT INTO `sys_role_menu` VALUES ('6', '89');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '89');
INSERT INTO `sys_role_menu` VALUES ('6', '89f06a97bd9a42c7a3d80908aa1daef3');
INSERT INTO `sys_role_menu` VALUES ('1', '8e1f2cf1dc3a43b0b5e50ff5b92cc298');
INSERT INTO `sys_role_menu` VALUES ('1', '90');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '90');
INSERT INTO `sys_role_menu` VALUES ('6', '90');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '90');
INSERT INTO `sys_role_menu` VALUES ('6', '912fa92c6d014a618846b353cb053125');
INSERT INTO `sys_role_menu` VALUES ('6', '9387017c31a643f6a5acf70f092cb958');
INSERT INTO `sys_role_menu` VALUES ('1', '95db821b31cd4670ab51b115ce73d271');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '95db821b31cd4670ab51b115ce73d271');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '95db821b31cd4670ab51b115ce73d271');
INSERT INTO `sys_role_menu` VALUES ('1', '960d503ac572449bae996bfc928f1bf3');
INSERT INTO `sys_role_menu` VALUES ('1', '9c37ebfd00764ec99f7c65107faca3d1');
INSERT INTO `sys_role_menu` VALUES ('6', '9c37ebfd00764ec99f7c65107faca3d1');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '9c37ebfd00764ec99f7c65107faca3d1');
INSERT INTO `sys_role_menu` VALUES ('1', 'a4f7a04b94f1495da822915f92c8e481');
INSERT INTO `sys_role_menu` VALUES ('1', 'af4793c752914654bb89870f1e5733c9');
INSERT INTO `sys_role_menu` VALUES ('1', 'af9b8c36092b40b2864054e75890608e');
INSERT INTO `sys_role_menu` VALUES ('6', 'b01fe17249ef4616823da0146d298650');
INSERT INTO `sys_role_menu` VALUES ('1', 'b06b6eae9f714d028480d6b6c114d498');
INSERT INTO `sys_role_menu` VALUES ('6', 'b06b6eae9f714d028480d6b6c114d498');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', 'b06b6eae9f714d028480d6b6c114d498');
INSERT INTO `sys_role_menu` VALUES ('1', 'b522939e606543b3b4fee4b045c900c7');
INSERT INTO `sys_role_menu` VALUES ('6', 'b95b7e2a63c44a2db7011639a369266a');
INSERT INTO `sys_role_menu` VALUES ('1', 'c1a03d4ac6e6461f8a3f8bc083ebb83e');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', 'c1a03d4ac6e6461f8a3f8bc083ebb83e');
INSERT INTO `sys_role_menu` VALUES ('1', 'c73127a0972c4c66aa676947e50469cd');
INSERT INTO `sys_role_menu` VALUES ('1', 'cf195f0c91ff463da5fe8b49509f5774');
INSERT INTO `sys_role_menu` VALUES ('1', 'deba887e31ed487a980ec6d1357398ee');
INSERT INTO `sys_role_menu` VALUES ('6', 'e0dc8f9573bb4617a38cdf65e7270bb1');
INSERT INTO `sys_role_menu` VALUES ('6', 'e0f05bb6657d4742bc130253eab8c5f1');
INSERT INTO `sys_role_menu` VALUES ('6', 'e1242de3f82e4efbab2abdde73ca3d77');
INSERT INTO `sys_role_menu` VALUES ('1', 'eb457a022d9841b89da35c93ae0d7f0f');
INSERT INTO `sys_role_menu` VALUES ('1', 'f081fd38850941c98cd80bd6954b712f');
INSERT INTO `sys_role_menu` VALUES ('1', 'f5e0c5b0d3e24f969588e8ba8cacfc9b');
INSERT INTO `sys_role_menu` VALUES ('1', 'f6bc0ba744ed4b08b491ec00460d21c2');
INSERT INTO `sys_role_menu` VALUES ('1', 'fbe403d809b0400d9d36df16cb56abf2');
INSERT INTO `sys_role_menu` VALUES ('6', 'fc3d8379172f4a67ac3b5727636aed56');
INSERT INTO `sys_role_menu` VALUES ('1', 'fed13e36e0f84d9aa438741c3142b651');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`),
  KEY `office_id` (`office_id`),
  CONSTRAINT `sys_role_office_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `sys_office` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_role_office_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `office_id` (`office_id`),
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `sys_office` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_user_ibfk_2` FOREIGN KEY (`office_id`) REFERENCES `sys_office` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '5', 'jsite', '57b89d1421898c692ebf98b530c3869b56d32e1e80f2bb703aba8a39', '0001', '系统管理员', 'admin@admin.com', '1111', '1111', '1', '/jsite/userfiles/headphoto/1.jpg', '192.168.1.124', '2019-03-12 14:38:23', '1', '1', '2013-05-27 08:00:00', '1', '2019-01-10 10:38:39', '11221', '0');
INSERT INTO `sys_user` VALUES ('43f6a4a84e784e5e98b5b1c530bef73b', '1', '5', 'dept', '56c52163316679d8c83c84f03d44a592246d76a70bacb1da76cdc149', '000002', '部门经理', '', '', '', '2', null, '36.110.13.18', '2019-01-11 17:41:41', '1', '1', '2018-12-22 22:22:25', '1', '2018-12-22 22:22:25', '', '0');
INSERT INTO `sys_user` VALUES ('56620c5ef567427c8debe68875c0eda2', '1', '3', 'jsitehr', '7e14e4c693492493db3bc12ba2bdd9cec2629613deae9ebd9c42dac1', '000003', '人力资源', '', '', '', '4', null, '39.128.26.20', '2019-01-10 22:51:08', '1', '1', '2018-12-22 22:23:39', '1', '2018-12-28 13:52:29', '', '0');
INSERT INTO `sys_user` VALUES ('68225048f4b7465293feb9779448d0af', '1', '5', 'jsiteuser', '2f445129a012d18383f4fbdc9fdaca446794a89e80c384dc3a1e1f1a', '000005', '普通用户', '', '', '', '3', null, '118.117.68.100', '2019-01-02 10:48:42', '1', '1', '2018-12-28 13:55:56', '1', '2018-12-28 16:44:40', '', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('56620c5ef567427c8debe68875c0eda2', '1042c40b2d2d496c9af546bba7006623');
INSERT INTO `sys_user_role` VALUES ('68225048f4b7465293feb9779448d0af', '1042c40b2d2d496c9af546bba7006623');
INSERT INTO `sys_user_role` VALUES ('68225048f4b7465293feb9779448d0af', '6');
INSERT INTO `sys_user_role` VALUES ('43f6a4a84e784e5e98b5b1c530bef73b', 'a868b9836f664b43909757005390022f');

-- ----------------------------
-- Table structure for test_data
-- ----------------------------
DROP TABLE IF EXISTS `test_data`;
CREATE TABLE `test_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `user_id` varchar(64) DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据表';

-- ----------------------------
-- Records of test_data
-- ----------------------------
INSERT INTO `test_data` VALUES ('1308ea640764443898a5673b3712c447', '', '', '', '', '', null, '1', '2019-01-03 01:55:41', '1', '2019-01-03 01:55:41', '', '0');
INSERT INTO `test_data` VALUES ('4491abf519834a078b307fcfb1aee334', '56620c5ef567427c8debe68875c0eda2', '3', '', '', '', null, '1', '2019-01-02 11:19:24', '1', '2019-01-02 11:19:24', '', '1');
INSERT INTO `test_data` VALUES ('ba7c670abe4a49d1af8ded2256810f36', '56620c5ef567427c8debe68875c0eda2', '5', '1', '', 'a', '2019-01-08', '1', '2019-01-08 16:12:42', '1', '2019-01-10 19:00:11', 'aaaaaaa', '0');
INSERT INTO `test_data` VALUES ('bbd94222359142af97c01e5f9920ea32', '56620c5ef567427c8debe68875c0eda2', '4', '3fbaf3a3f58a47118f13976cb2e2544d', '改革', '', '2019-01-02', '1', '2019-01-02 11:10:22', '1', '2019-01-11 19:12:13', '', '0');
INSERT INTO `test_data` VALUES ('e55163dab0e74737968584bc6c2d7507', '43f6a4a84e784e5e98b5b1c530bef73b', '3', 'da2da01621b64be5a85b07a8c883228f', '', '', '2019-01-02', '1', '2019-01-02 13:07:00', '1', '2019-01-02 13:07:00', '', '1');

-- ----------------------------
-- Table structure for test_data_child
-- ----------------------------
DROP TABLE IF EXISTS `test_data_child`;
CREATE TABLE `test_data_child` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `test_data_main_id` varchar(64) DEFAULT NULL COMMENT '业务主表ID',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_main_id` (`test_data_main_id`),
  CONSTRAINT `test_data_child_ibfk_1` FOREIGN KEY (`test_data_main_id`) REFERENCES `test_data_main` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据子表';

-- ----------------------------
-- Records of test_data_child
-- ----------------------------
INSERT INTO `test_data_child` VALUES ('2357df346f1642d99a15a49e1be09cfb', '40a0fd9625e742f19e310a9469341260', 'aaabb', '1', '2019-01-04 15:59:34', '1', '2019-01-04 15:59:34', 'abbb', '1');
INSERT INTO `test_data_child` VALUES ('4fd234bb5ba147cf8103ab5e97ff0a08', null, '333', '1', '2019-01-05 21:49:14', '1', '2019-01-05 21:55:37', '444', '0');
INSERT INTO `test_data_child` VALUES ('5c393aca623f49b9badf54ff44463fb6', '135e474961044a42b1d480c7dfe816f0', 'testtbl1', '1', '2019-01-11 18:15:43', '1', '2019-01-11 18:15:43', '', '0');
INSERT INTO `test_data_child` VALUES ('6c4be2cc266c44baa087d6a71dfee9e2', null, 'wre', '1', '2019-01-07 13:35:47', '1', '2019-01-08 11:53:29', 'ewr', '0');
INSERT INTO `test_data_child` VALUES ('6cbf4b86873840c08954387b3898084d', null, 'rwerw', '1', '2019-01-07 13:35:47', '1', '2019-01-08 11:53:29', 'erwewr', '0');
INSERT INTO `test_data_child` VALUES ('a6b8d00d29664df99bf6dbecb08f719b', 'c557c0a63c854975beed9ec276129b3f', 'sfsadf', '1', '2019-01-02 12:28:28', '1', '2019-01-02 12:28:28', 'sadf', '1');
INSERT INTO `test_data_child` VALUES ('b49de329fb6f4663b026576eab6cb729', null, '111', '1', '2019-01-05 21:49:14', '1', '2019-01-05 21:55:37', '222', '0');
INSERT INTO `test_data_child` VALUES ('c048e370336e41bb92c7f45791aa4872', null, 'erwrw', '1', '2019-01-07 13:35:47', '1', '2019-01-08 11:53:29', 'rewrew', '0');
INSERT INTO `test_data_child` VALUES ('e09ddbd55180465f9a8ab4dc8e6fd990', '838616e721d440c88c56605aee981c99', '', '1', '2019-01-07 09:40:27', '1', '2019-01-07 09:40:27', '', '0');
INSERT INTO `test_data_child` VALUES ('e4f228d237204430a18eeea8101c7a1f', '40a0fd9625e742f19e310a9469341260', 'bbbbcc', '1', '2019-01-04 15:59:34', '1', '2019-01-04 15:59:34', 'ccdd', '1');

-- ----------------------------
-- Table structure for test_data_main
-- ----------------------------
DROP TABLE IF EXISTS `test_data_main`;
CREATE TABLE `test_data_main` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `user_id` varchar(64) DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据表';

-- ----------------------------
-- Records of test_data_main
-- ----------------------------
INSERT INTO `test_data_main` VALUES ('135e474961044a42b1d480c7dfe816f0', '3', '4', 'f762fb569d8445f28a226a9b831cfb90', '站点', '难', '2019-01-05', '1', '2019-01-05 21:49:14', '1', '2019-01-11 18:15:43', '', '0');
INSERT INTO `test_data_main` VALUES ('40a0fd9625e742f19e310a9469341260', '68225048f4b7465293feb9779448d0af', '5', 'da2da01621b64be5a85b07a8c883228f', 'aaaabbb', 'a', '2019-01-04', '1', '2019-01-04 15:59:34', '1', '2019-01-05 21:32:22', 'aaa', '0');
INSERT INTO `test_data_main` VALUES ('838616e721d440c88c56605aee981c99', '', '', '', '', '', null, '1', '2019-01-07 09:40:27', '1', '2019-01-07 09:40:27', '', '0');
INSERT INTO `test_data_main` VALUES ('bf07d5f74023446db5b070e25bbdae26', '4', '3', 'f762fb569d8445f28a226a9b831cfb90', '', 'a', null, '1', '2019-01-02 12:28:49', '1', '2019-01-02 17:27:17', 'asdf', '1');
INSERT INTO `test_data_main` VALUES ('c557c0a63c854975beed9ec276129b3f', '', '', '', '', '', null, '1', '2019-01-02 12:28:28', '1', '2019-01-02 12:28:28', '', '1');

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序',
  `tree_leaf` char(1) DEFAULT NULL COMMENT '是否树形叶子节点',
  `tree_level` int(11) DEFAULT NULL COMMENT '树形层级',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='树结构表';

-- ----------------------------
-- Records of test_tree
-- ----------------------------
INSERT INTO `test_tree` VALUES ('0e5f08e37f354783b83d4c12292bb8ce', '0', '0,', '', '30', '1', '0', '1', '2019-01-10 21:44:15', '1', '2019-01-10 21:44:15', '', '0');
INSERT INTO `test_tree` VALUES ('e323c4775e6240fbb924b6442ab8a49d', '0', '0,', '树结构父节点', '30', '0', '0', '1', '2019-01-07 16:55:15', '1', '2019-01-08 15:01:48', 'aa', '0');
INSERT INTO `test_tree` VALUES ('e5a9917fecb94db4b1e6ceede9716715', 'e323c4775e6240fbb924b6442ab8a49d', '0,e323c4775e6240fbb924b6442ab8a49d,', '树结构子节点', '30', '1', '1', '1', '2019-01-07 17:39:06', '1', '2019-01-08 15:02:06', '啊啊', '0');
