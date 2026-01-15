package com.alibaba.nacos.plugin.datasource.impl.kingbase;

import com.alibaba.nacos.common.utils.CollectionUtils;
import com.alibaba.nacos.plugin.datasource.constants.DatabaseTypeConstant;
import com.alibaba.nacos.plugin.datasource.constants.FieldConstant;
import com.alibaba.nacos.plugin.datasource.constants.PrimaryKeyConstant;
import com.alibaba.nacos.plugin.datasource.impl.mysql.HistoryConfigInfoMapperByMySql;
import com.alibaba.nacos.plugin.datasource.model.MapperContext;
import com.alibaba.nacos.plugin.datasource.model.MapperResult;

/**
 * The kingbase implementation of HistoryConfigInfoMapper.
 *
 * @author leon
 **/
public class HistoryConfigInfoMapperByKingbase extends HistoryConfigInfoMapperByMySql {

    @Override
    public String getDataSource() {
        return DatabaseTypeConstant.KINGBASE;
    }
    @Override
    public MapperResult removeConfigHistory(MapperContext context) {
        String sql = "DELETE FROM his_config_info WHERE gmt_modified < ? and rownum <= ?";
        return new MapperResult(sql, CollectionUtils.list(context.getWhereParameter(FieldConstant.START_TIME),
                context.getWhereParameter(FieldConstant.LIMIT_SIZE)));
    }
    @Override
    public String getFunction(String functionName) {return functionName;}
}