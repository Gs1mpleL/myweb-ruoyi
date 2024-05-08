package com.ruoyi.system.api.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 推送服务对象 sys_push_config
 *
 * @author ruoyi
 * @date 2024-05-08
 */
@Data
public class SysPushConfig extends BaseEntity
        {
private static final long serialVersionUID = 1L;

        /** $column.columnComment */
        private Long id;

        /**  */
                @Excel(name = "")
        private String type;

        /** $column.columnComment */
                @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
        private String baseUrl;

        /** $column.columnComment */
                @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
        private String otherNeed;

@Override
public String toString() {
    return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
        .append("id", getId())
        .append("type", getType())
        .append("baseUrl", getBaseUrl())
        .append("otherNeed", getOtherNeed())
            .toString();
}
}
