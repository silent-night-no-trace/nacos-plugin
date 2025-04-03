/*
 * Copyright 1999-2022 Alibaba Group Holding Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.alibaba.nacos.plugin.datasource.impl.kingbase;

import com.alibaba.nacos.plugin.datasource.constants.DatabaseTypeConstant;
import com.alibaba.nacos.plugin.datasource.constants.PrimaryKeyConstant;
import com.alibaba.nacos.plugin.datasource.impl.base.BaseConfigInfoBetaMapper;
import com.alibaba.nacos.plugin.datasource.model.MapperContext;
import com.alibaba.nacos.plugin.datasource.model.MapperResult;

import java.util.ArrayList;
import java.util.List;

/**
 * The kingbase implementation of ConfigInfoBetaMapper.
 *
 * @author leon
 **/

public class ConfigInfoBetaMapperByKingbase extends BaseConfigInfoBetaMapper {

    @Override
    public String getDataSource() {
        return DatabaseTypeConstant.KINGBASE;
    }
//    public String getFunction(String functionName) {return functionName;}
   @Override
   public String getFunction(String functionName) {
      if ("NOW()".equalsIgnoreCase(functionName) || "NOW(3)".equalsIgnoreCase(functionName)) {
         return "GETDATE()"; // 统一改成 GETDATE()
     }
      return functionName;
    }


    @Override
    public MapperResult updateConfigInfo4BetaCas(MapperContext context) {
        String sql = "UPDATE config_info_beta SET content = ?, md5 = ?, beta_ips = ?, src_ip = ?, src_user = ?, " +
                "gmt_modified = GETDATE(), app_name = ? WHERE data_id = ? AND group_id = ? AND tenant_id = ? AND (md5 = ? OR md5 IS NULL OR md5 = '')";

        List<Object> paramList = new ArrayList<>();
        paramList.add(context.getUpdateParameter("content"));
        paramList.add(context.getUpdateParameter("md5"));
        paramList.add(context.getUpdateParameter("betaIps"));
        paramList.add(context.getUpdateParameter("srcIp"));
        paramList.add(context.getUpdateParameter("srcUser"));
        paramList.add(context.getUpdateParameter("app_name"));
        paramList.add(context.getWhereParameter("dataId"));
        paramList.add(context.getWhereParameter("groupId"));
        paramList.add(context.getWhereParameter("tenantId"));
        paramList.add(context.getWhereParameter("md5"));

        return new MapperResult(sql, paramList);
    }


}
