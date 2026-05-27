package com.fpt.bean;

import com.fpt.dal.BrandDal;
import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "brands")
public class BrandBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer brandId;

    @Column(name = "name")
    private String name;
    @Column(name = "contact")
    private String contact;
    @Column(name = "website")
    private String website;

    // Constructors
    public BrandBean() {}
    public BrandBean(Integer brandId, String name, String contact, String website) {
        this.brandId = brandId;
        this.name    = name;
        this.contact = contact;
        this.website = website;
    }

    // Getters & Setters
    public Integer getBrandId()          { return brandId; }
    public void    setBrandId(Integer v) { this.brandId = v; }
    public String  getName()             { return name; }
    public void    setName(String v)     { this.name = v; }
    public String  getContact()          { return contact; }
    public void    setContact(String v)  { this.contact = v; }
    public String  getWebsite()          { return website; }
    public void    setWebsite(String v)  { this.website = v; }

    // ===================== CRUD =====================

    // 4.1 findAll
    public List<BrandBean> findAll() {
        EntityManager em = BrandDal.getEM();
        try {
            Query query = em.createQuery("SELECT b FROM BrandBean b");
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    // 4.2 create
    public void create(BrandBean brand) {
        EntityManager em = BrandDal.getEM();
        try {
            em.getTransaction().begin();
            em.persist(brand);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    // 4.3 findById
    public BrandBean findById(Integer id) {
        EntityManager em = BrandDal.getEM();
        try {
            return em.find(BrandBean.class, id);
        } finally {
            em.close();
        }
    }

    // 4.4 update
    public void update(BrandBean brand) {
        EntityManager em = BrandDal.getEM();
        try {
            em.getTransaction().begin();
            em.merge(brand);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    // 4.5 delete
    public void delete(Integer id) {
        EntityManager em = BrandDal.getEM();
        try {
            em.getTransaction().begin();
            BrandBean brand = em.find(BrandBean.class, id);
            if (brand != null) em.remove(brand);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }
}
