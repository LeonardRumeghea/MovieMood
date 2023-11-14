package com.example.repository;

import com.example.model.Director;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.util.List;
import java.util.UUID;

@Repository
public class DirectorRepository {
    private EntityManagerFactory entityManagerFactory;

    public DirectorRepository() {
        this.entityManagerFactory = Persistence.createEntityManagerFactory("directors-unit");
    }

    public void save(Director director) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        try {
            entityManager.persist(director);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
    }

    public Director findById(UUID id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            return entityManager.find(Director.class, id);
        } finally {
            entityManager.close();
        }
    }

    public List<Director> findByFirstName(String firstName) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            TypedQuery<Director> query = entityManager.createQuery("SELECT d FROM Director d WHERE d.firstName = :firstName", Director.class);
            query.setParameter("firstName", firstName);
            return query.getResultList();
        } finally {
            entityManager.close();
        }
    }

    public List<Director> findByLastName(String lastName) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            TypedQuery<Director> query = entityManager.createQuery("SELECT d FROM Director d WHERE d.lastName = :lastName", Director.class);
            query.setParameter("lastName", lastName);
            return query.getResultList();
        } finally {
            entityManager.close();
        }
    }

    public List<Director> findAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            TypedQuery<Director> query = entityManager.createQuery("SELECT d FROM Director d", Director.class);
            return query.getResultList();
        } finally {
            entityManager.close();
        }
    }
}