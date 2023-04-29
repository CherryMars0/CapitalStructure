package com.example.cwgl.entity;

import lombok.Data;

@Data
public class House {
    private Integer id;
    private Integer ownerid;   //家主编号
    private String housename;  //家庭名称
    private String address; //家庭地址
}
