/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fpt.dal;
import com.fpt.entity.Account;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author ASUS
 */
public class AccountDal {
    //2.1. EntityManagerFactory
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("AccountPU");

    //2.2. checkLogin() method
    public boolean checkLogin(String username, String password) {

        EntityManager em = emf.createEntityManager();
        Account account = em.find(Account.class, username);

        em.close(); //Giải phóng bộ nhớ

        return account != null && BCrypt.checkpw(password, account.getPassword());
    }

    //2.3. registerAccount() method
    public boolean registerAccount(String username, String rawPassword) {

        EntityManager em = emf.createEntityManager();
        String hashedPass = BCrypt.hashpw(rawPassword, BCrypt.gensalt());

        if (em.find(Account.class, username) != null) {
            return false; //Trùng account
        }

        em.getTransaction().begin();
        em.persist(new Account(username, hashedPass, "user"));
        em.getTransaction().commit();

        em.close(); //Giải phóng bộ nhớ

        return true;
    }
}
