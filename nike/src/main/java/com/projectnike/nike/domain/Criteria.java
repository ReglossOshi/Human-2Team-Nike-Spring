package com.projectnike.nike.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {
    private String type;    // 옵션
    private  String search; // 검색값

    public String[] getTypeArr() { return type == null ? new String[] {} : type.split("");}
}
