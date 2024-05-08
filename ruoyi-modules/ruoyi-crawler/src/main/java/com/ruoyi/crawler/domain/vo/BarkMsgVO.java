package com.ruoyi.crawler.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;


@Data
@Component
@NoArgsConstructor
public class BarkMsgVO extends BaseMsgVo{
    private String groupName;
    private String icon;
    private String url;

    public BarkMsgVO(String title, String msg, String groupName) {
        this.setTitle(title);
        this.setMsg(msg);
        this.groupName = groupName;
    }
    public BarkMsgVO(String title, String msg) {
        this.setTitle(title);
        this.setMsg(msg);
    }

    public BarkMsgVO(String title, String msg, String groupName, String url) {
        this.setTitle(title);
        this.setMsg(msg);
        this.groupName = groupName;
        this.url = url;
    }

    public BarkMsgVO(String msg) {
        this.setTitle("NOTE");
        this.groupName = "NOTE";
        this.setMsg(msg);
    }
}
