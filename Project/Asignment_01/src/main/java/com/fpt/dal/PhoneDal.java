package com.fpt.dal;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class PhoneDal {

    // EMF phải là singleton — chỉ tạo 1 lần duy nhất
    private static final EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("PhonePU");

    public static EntityManager getEM() {
        return emf.createEntityManager();
    }
}
