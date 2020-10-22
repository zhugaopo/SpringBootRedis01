package com.example.demo.model;

import lombok.Data;
import lombok.ToString;

/**
 * @author zgp
 */
@Data
@ToString
public class Student {
    private Integer id;

    private String numbercode;

    private String stuname;

    private String stusex;

    private Integer stuage;
}