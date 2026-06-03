package com.fpt.bean;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.fpt.dal.PhoneDal;

/**
 *
 * @author ASUS
 */

@Entity
@Table(name = "Phone")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PhoneBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer phoneId;

    private String name;

    @Column(precision = 15, scale = 2)
    private BigDecimal price;

    private String image;

    // 2. Contructor

    // 2.1 Default Contructor
    // 2.2 Parameterized Contructor

    // 3. Geters and Setters

    // 4. CRUD
    // 4.1 findAll() method
    // 4.2 create() method
    public boolean createPhone(PhoneBean phone) {
        EntityManager em = PhoneDal.getEM();
        try {
            em.getTransaction().begin();
            em.persist(phone);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            return false;
        } finally {
            em.close();
        }
        return true;
    }
    // 4.3 update() method
    // 4.4 delete() method
    // 4.5 findByPhoneId method

}