package com.fpt.dal;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class BrandDal {

    // EMF phải là singleton — chỉ tạo 1 lần duy nhất
    private static final EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("my_persistence_unit");

    public static EntityManager getEM() {
        return emf.createEntityManager();
    }
}
