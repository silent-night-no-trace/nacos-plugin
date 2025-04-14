/*
 * Copyright 1999-2023 Alibaba Group Holding Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the License);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
CREATE TABLE config_info (
                             id serial NOT NULL,
                             data_id varchar(255) NOT NULL,
                             group_id varchar(255),
                             content text NOT NULL,
                             md5 varchar(32),
                             gmt_create timestamptz NOT NULL,
                             gmt_modified timestamptz NOT NULL,
                             src_user text,
                             src_ip varchar(20),
                             app_name varchar(128),
                             tenant_id varchar(128) DEFAULT 'PUBLIC',
                             c_desc varchar(256),
                             c_use varchar(64),
                             effect varchar(64),
                             type varchar(64),
                             c_schema text,
                             encrypted_data_key text DEFAULT ''
);

COMMENT ON COLUMN config_info.id IS 'id';
COMMENT ON COLUMN config_info.data_id IS 'data_id';
COMMENT ON COLUMN config_info.content IS 'content';
COMMENT ON COLUMN config_info.md5 IS 'md5';
COMMENT ON COLUMN config_info.gmt_create IS '创建时间';
COMMENT ON COLUMN config_info.gmt_modified IS '修改时间';
COMMENT ON COLUMN config_info.src_user IS 'source user';
COMMENT ON COLUMN config_info.src_ip IS 'source ip';
COMMENT ON COLUMN config_info.tenant_id IS '租户字段';
COMMENT ON COLUMN config_info.encrypted_data_key IS '秘钥';
COMMENT ON TABLE config_info IS 'config_info';

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
CREATE TABLE config_info_aggr (
                                  id serial NOT NULL,
                                  data_id varchar(255) NOT NULL,
                                  group_id varchar(255) NOT NULL,
                                  datum_id varchar(255) NOT NULL,
                                  content text NOT NULL,
                                  gmt_modified timestamptz NOT NULL,
                                  app_name varchar(128),
                                  tenant_id varchar(128) DEFAULT 'PUBLIC'
);

COMMENT ON COLUMN config_info_aggr.id IS 'id';
COMMENT ON COLUMN config_info_aggr.data_id IS 'data_id';
COMMENT ON COLUMN config_info_aggr.group_id IS 'group_id';
COMMENT ON COLUMN config_info_aggr.datum_id IS 'datum_id';
COMMENT ON COLUMN config_info_aggr.content IS '内容';
COMMENT ON COLUMN config_info_aggr.gmt_modified IS '修改时间';
COMMENT ON COLUMN config_info_aggr.tenant_id IS '租户字段';
COMMENT ON TABLE config_info_aggr IS '增加租户字段';

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
CREATE TABLE config_info_beta (
                                  id serial NOT NULL,
                                  data_id varchar(255) NOT NULL,
                                  group_id varchar(128) NOT NULL,
                                  app_name varchar(128),
                                  content text NOT NULL,
                                  beta_ips varchar(1024),
                                  md5 varchar(32),
                                  gmt_create timestamptz NOT NULL,
                                  gmt_modified timestamptz NOT NULL,
                                  src_user text,
                                  src_ip varchar(20),
                                  tenant_id varchar(128) DEFAULT 'PUBLIC',
                                  encrypted_data_key text NOT NULL
);

COMMENT ON COLUMN config_info_beta.id IS 'id';
COMMENT ON COLUMN config_info_beta.data_id IS 'data_id';
COMMENT ON COLUMN config_info_beta.group_id IS 'group_id';
COMMENT ON COLUMN config_info_beta.app_name IS 'app_name';
COMMENT ON COLUMN config_info_beta.content IS 'content';
COMMENT ON COLUMN config_info_beta.beta_ips IS 'betaIps';
COMMENT ON COLUMN config_info_beta.md5 IS 'md5';
COMMENT ON COLUMN config_info_beta.gmt_create IS '创建时间';
COMMENT ON COLUMN config_info_beta.gmt_modified IS '修改时间';
COMMENT ON COLUMN config_info_beta.src_user IS 'source user';
COMMENT ON COLUMN config_info_beta.src_ip IS 'source ip';
COMMENT ON COLUMN config_info_beta.tenant_id IS '租户字段';
COMMENT ON COLUMN config_info_beta.encrypted_data_key IS '秘钥';
COMMENT ON TABLE config_info_beta IS 'config_info_beta';

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
CREATE TABLE config_info_tag (
                                 id serial NOT NULL,
                                 data_id varchar(255) NOT NULL,
                                 group_id varchar(128) NOT NULL,
                                 tenant_id varchar(128) DEFAULT 'PUBLIC',
                                 tag_id varchar(128) NOT NULL,
                                 app_name varchar(128),
                                 content text NOT NULL,
                                 md5 varchar(32),
                                 gmt_create timestamptz NOT NULL,
                                 gmt_modified timestamptz NOT NULL,
                                 src_user text,
                                 src_ip varchar(20)
);

COMMENT ON COLUMN config_info_tag.id IS 'id';
COMMENT ON COLUMN config_info_tag.data_id IS 'data_id';
COMMENT ON COLUMN config_info_tag.group_id IS 'group_id';
COMMENT ON COLUMN config_info_tag.tenant_id IS 'tenant_id';
COMMENT ON COLUMN config_info_tag.tag_id IS 'tag_id';
COMMENT ON COLUMN config_info_tag.app_name IS 'app_name';
COMMENT ON COLUMN config_info_tag.content IS 'content';
COMMENT ON COLUMN config_info_tag.md5 IS 'md5';
COMMENT ON COLUMN config_info_tag.gmt_create IS '创建时间';
COMMENT ON COLUMN config_info_tag.gmt_modified IS '修改时间';
COMMENT ON COLUMN config_info_tag.src_user IS 'source user';
COMMENT ON COLUMN config_info_tag.src_ip IS 'source ip';
COMMENT ON TABLE config_info_tag IS 'config_info_tag';

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
CREATE TABLE config_tags_relation (
                                      id serial NOT NULL,
                                      tag_name varchar(128) NOT NULL,
                                      tag_type varchar(64),
                                      data_id varchar(255) NOT NULL,
                                      group_id varchar(128) NOT NULL,
                                      tenant_id varchar(128) DEFAULT 'PUBLIC',
                                      nid serial NOT NULL
);

COMMENT ON COLUMN config_tags_relation.id IS 'id';
COMMENT ON COLUMN config_tags_relation.tag_name IS 'tag_name';
COMMENT ON COLUMN config_tags_relation.tag_type IS 'tag_type';
COMMENT ON COLUMN config_tags_relation.data_id IS 'data_id';
COMMENT ON COLUMN config_tags_relation.group_id IS 'group_id';
COMMENT ON COLUMN config_tags_relation.tenant_id IS 'tenant_id';
COMMENT ON TABLE config_tags_relation IS 'config_tag_relation';

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
CREATE TABLE group_capacity (
                                id serial NOT NULL,
                                group_id varchar(128) NOT NULL,
                                quota int NOT NULL,
                                usage int NOT NULL,
                                max_size int NOT NULL,
                                max_aggr_count int NOT NULL,
                                max_aggr_size int NOT NULL,
                                max_history_count int NOT NULL,
                                gmt_create timestamptz NOT NULL,
                                gmt_modified timestamptz NOT NULL
);

COMMENT ON COLUMN group_capacity.id IS '主键ID';
COMMENT ON COLUMN group_capacity.group_id IS 'Group ID，空字符表示整个集群';
COMMENT ON COLUMN group_capacity.quota IS '配额，0表示使用默认值';
COMMENT ON COLUMN group_capacity.usage IS '使用量';
COMMENT ON COLUMN group_capacity.max_size IS '单个配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN group_capacity.max_aggr_count IS '聚合子配置最大个数，，0表示使用默认值';
COMMENT ON COLUMN group_capacity.max_aggr_size IS '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN group_capacity.max_history_count IS '最大变更历史数量';
COMMENT ON COLUMN group_capacity.gmt_create IS '创建时间';
COMMENT ON COLUMN group_capacity.gmt_modified IS '修改时间';
COMMENT ON TABLE group_capacity IS '集群、各Group容量信息表';

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
CREATE TABLE his_config_info (
                                 id int NOT NULL,
                                 nid serial NOT NULL,
                                 data_id varchar(255) NOT NULL,
                                 group_id varchar(128) NOT NULL,
                                 app_name varchar(128),
                                 content text NOT NULL,
                                 md5 varchar(32),
                                 gmt_create timestamptz DEFAULT CURRENT_TIMESTAMP,
                                 gmt_modified timestamptz NOT NULL,
                                 src_user text,
                                 src_ip varchar(20),
                                 op_type char(10),
                                 tenant_id varchar(128) DEFAULT 'PUBLIC',
                                 encrypted_data_key text DEFAULT ''
);

COMMENT ON COLUMN his_config_info.app_name IS 'app_name';
COMMENT ON COLUMN his_config_info.tenant_id IS '租户字段';
COMMENT ON COLUMN his_config_info.encrypted_data_key IS '秘钥';
COMMENT ON TABLE his_config_info IS '多租户改造';

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
CREATE TABLE permissions (
                             role varchar(50) NOT NULL,
                             resource varchar(512) NOT NULL,
                             action varchar(8) NOT NULL
);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
CREATE TABLE roles (
                       username varchar(50) NOT NULL,
                       role varchar(50) NOT NULL
);

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO roles VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
CREATE TABLE tenant_capacity (
                                 id serial NOT NULL,
                                 tenant_id varchar(128) NOT NULL,
                                 quota int NOT NULL,
                                 usage int NOT NULL,
                                 max_size int NOT NULL,
                                 max_aggr_count int NOT NULL,
                                 max_aggr_size int NOT NULL,
                                 max_history_count int NOT NULL,
                                 gmt_create timestamptz NOT NULL,
                                 gmt_modified timestamptz NOT NULL
);

COMMENT ON COLUMN tenant_capacity.id IS '主键ID';
COMMENT ON COLUMN tenant_capacity.tenant_id IS 'Tenant ID';
COMMENT ON COLUMN tenant_capacity.quota IS '配额，0表示使用默认值';
COMMENT ON COLUMN tenant_capacity.usage IS '使用量';
COMMENT ON COLUMN tenant_capacity.max_size IS '单个配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN tenant_capacity.max_aggr_count IS '聚合子配置最大个数';
COMMENT ON COLUMN tenant_capacity.max_aggr_size IS '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN tenant_capacity.max_history_count IS '最大变更历史数量';
COMMENT ON COLUMN tenant_capacity.gmt_create IS '创建时间';
COMMENT ON COLUMN tenant_capacity.gmt_modified IS '修改时间';
COMMENT ON TABLE tenant_capacity IS '租户容量信息表';

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
CREATE TABLE tenant_info (
                             id serial NOT NULL,
                             kp varchar(128) NOT NULL,
                             tenant_id varchar(128) DEFAULT 'PUBLIC',
                             tenant_name varchar(128),
                             tenant_desc varchar(256),
                             create_source varchar(32),
                             gmt_create int NOT NULL,
                             gmt_modified int NOT NULL
);

COMMENT ON COLUMN tenant_info.id IS 'id';
COMMENT ON COLUMN tenant_info.kp IS 'kp';
COMMENT ON COLUMN tenant_info.tenant_id IS 'tenant_id';
COMMENT ON COLUMN tenant_info.tenant_name IS 'tenant_name';
COMMENT ON COLUMN tenant_info.tenant_desc IS 'tenant_desc';
COMMENT ON COLUMN tenant_info.create_source IS 'create_source';
COMMENT ON COLUMN tenant_info.gmt_create IS '创建时间';
COMMENT ON COLUMN tenant_info.gmt_modified IS '修改时间';
COMMENT ON TABLE tenant_info IS 'tenant_info';

-- ----------------------------
-- Table structure for users
-- ----------------------------
CREATE TABLE users (
                       username varchar(50) NOT NULL,
                       password varchar(500) NOT NULL,
                       enabled boolean NOT NULL
);

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO users VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', true);

-- ----------------------------
-- Indexes structure for table config_info
-- ----------------------------
CREATE UNIQUE INDEX uk_configinfo_datagrouptenant ON config_info (data_id, group_id, tenant_id);
ALTER TABLE config_info ADD CONSTRAINT config_info_pkey PRIMARY KEY (id);

-- ----------------------------
-- Indexes structure for table config_info_aggr
-- ----------------------------
CREATE UNIQUE INDEX uk_configinfoaggr_datagrouptenantdatum ON config_info_aggr (data_id, group_id, tenant_id, datum_id);
ALTER TABLE config_info_aggr ADD CONSTRAINT config_info_aggr_pkey PRIMARY KEY (id);

-- ----------------------------
-- Indexes structure for table config_info_beta
-- ----------------------------
CREATE UNIQUE INDEX uk_configinfobeta_datagrouptenant ON config_info_beta (data_id, group_id, tenant_id);
ALTER TABLE config_info_beta ADD CONSTRAINT config_info_beta_pkey PRIMARY KEY (id);

-- ----------------------------
-- Indexes structure for table config_info_tag
-- ----------------------------
CREATE UNIQUE INDEX uk_configinfotag_datagrouptenanttag ON config_info_tag (data_id, group_id, tenant_id, tag_id);
ALTER TABLE config_info_tag ADD CONSTRAINT config_info_tag_pkey PRIMARY KEY (id);

-- ----------------------------
-- Indexes structure for table config_tags_relation
-- ----------------------------
CREATE INDEX idx_tenant_id ON config_tags_relation (tenant_id);
CREATE UNIQUE INDEX uk_configtagrelation_configidtag ON config_tags_relation (id, tag_name, tag_type);
ALTER TABLE config_tags_relation ADD CONSTRAINT config_tags_relation_pkey PRIMARY KEY (nid);

-- ----------------------------
-- Indexes structure for table group_capacity
-- ----------------------------
CREATE UNIQUE INDEX uk_group_id ON group_capacity (group_id);
ALTER TABLE group_capacity ADD CONSTRAINT group_capacity_pkey PRIMARY KEY (id);

-- ----------------------------
-- Indexes structure for table his_config_info
-- ----------------------------
CREATE INDEX idx_did ON his_config_info (data_id);
CREATE INDEX idx_gmt_create ON his_config_info (gmt_create);
CREATE INDEX idx_gmt_modified ON his_config_info (gmt_modified);
ALTER TABLE his_config_info ADD CONSTRAINT his_config_info_pkey PRIMARY KEY (nid);

-- ----------------------------
-- Indexes structure for table permissions
-- ----------------------------
CREATE UNIQUE INDEX uk_role_permission ON permissions (role, resource, action);

-- ----------------------------
-- Indexes structure for table roles
-- ----------------------------
CREATE UNIQUE INDEX uk_username_role ON roles (username, role);

-- ----------------------------
-- Indexes structure for table tenant_capacity
-- ----------------------------
CREATE UNIQUE INDEX uk_tenant_id ON tenant_capacity (tenant_id);
ALTER TABLE tenant_capacity ADD CONSTRAINT tenant_capacity_pkey PRIMARY KEY (id);

-- ----------------------------
-- Indexes structure for table tenant_info
-- ----------------------------
CREATE UNIQUE INDEX uk_tenant_info_kptenantid ON tenant_info (kp, tenant_id);