package com.fpt.entity;
import lombok.AllArgsConstructor;
import lombok.Data;

/**
 *
 * @author ASUS
 */
// @Data @Getter + @Setter
@Data
@AllArgsConstructor
public class Course {
    private int id;
    private String code;
    private String name;
    private String semester;
}
