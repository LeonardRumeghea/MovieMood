package com.example.repository;

import com.example.model.Actor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.util.List;
import java.util.UUID;

@Repository
public class ActorRepository {

    private EntityManagerFactory entityManagerFactory;

    public ActorRepository() {
        this.entityManagerFactory = Persistence.createEntityManagerFactory("actors-unit");
    }

    public void save(Actor actor) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        try {
            entityManager.persist(actor);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
    }

    public Actor findById(UUID id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            return entityManager.find(Actor.class, id);
        } finally {
            entityManager.close();
        }
    }

    public List<Actor> findByFirstName(String firstName) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            TypedQuery<Actor> query = entityManager.createQuery("SELECT a FROM Actor a WHERE a.firstName = :firstName", Actor.class);
            query.setParameter("firstName", firstName);
            return query.getResultList();
        } finally {
            entityManager.close();
        }
    }

    public List<Actor> findByLastName(String lastName) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            TypedQuery<Actor> query = entityManager.createQuery("SELECT a FROM Actor a WHERE a.lastName = :lastName", Actor.class);
            query.setParameter("lastName", lastName);
            return query.getResultList();
        } finally {
            entityManager.close();
        }
    }

    public List<Actor> findAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            TypedQuery<Actor> query = entityManager.createQuery("SELECT a FROM Actor a", Actor.class);
            return query.getResultList();
        } finally {
            entityManager.close();
        }
    }

    public void delete(Actor actor) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        try {
            entityManager.remove(actor);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
    }
}