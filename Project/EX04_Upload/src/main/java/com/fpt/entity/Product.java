package com.fpt.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * Entity class representing a product.
 * Maps to the 'products' table in WCDLab database.
 * Note: DB column 'image' maps to Java field 'filename'.
 */
@Data               // Sinh: getter, setter, toString, equals, hashCode
@AllArgsConstructor // Sinh: constructor(code, name, price, filename)
public class Product {
    private String code;      // Primary Key
    private String name;      // Product name
    private Integer price;    // Product price (Integer to allow null)
    private String filename;  // Image filename (DB column: image)
}
