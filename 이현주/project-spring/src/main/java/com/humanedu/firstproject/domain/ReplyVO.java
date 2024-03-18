package com.humanedu.firstproject.domain;

import lombok.Data;

import java.util.Date;

@Data
public class ReplyVO {

    private int num;
    private String commenter;
    private String content;
    private String date;
}
