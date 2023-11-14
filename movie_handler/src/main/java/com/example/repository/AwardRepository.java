package com.example.repository;

import com.example.model.Award;
import com.example.model.Movie;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.util.List;
import java.util.UUID;

public class AwardRepository {

    private EntityManagerFactory entityManagerFactory;

    public AwardRepository() {
        this.entityManagerFactory = Persistence.createEntityManagerFactory("awards-unit"); // UnitName specificat în persistence.xml
    }

    public void save(Award award) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        try {
            entityManager.persist(award);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
    }

    public Award findById(UUID id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            return entityManager.find(Award.class, id);
        } finally {
            entityManager.close();
        }
    }

    public List<Award> findByTitle(String title) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            TypedQuery<Award> query = entityManager.createQuery("SELECT a FROM Award a WHERE a.title = :title", Award.class);
            query.setParameter("title", title);
            return query.getResultList();
        } finally {
            entityManager.close();
        }
    }

    public List<Award> findAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            TypedQuery<Award> query = entityManager.createQuery("SELECT a FROM Award a", Award.class);
            return query.getResultList();
        } finally {
            entityManager.close();
        }
    }
}