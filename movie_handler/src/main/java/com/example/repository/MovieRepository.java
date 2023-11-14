package com.example.repository;

import com.example.model.Movie;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.util.List;

@Repository
public class MovieRepository {

    private EntityManagerFactory entityManagerFactory;

    public MovieRepository() {
        this.entityManagerFactory = Persistence.createEntityManagerFactory("movies-unit"); // UnitName specificat în persistence.xml
    }

    public void save(Movie movie) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        try {
            entityManager.persist(movie);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
    }

    public Movie findById(Long id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            return entityManager.find(Movie.class, id);
        } finally {
            entityManager.close();
        }
    }

    public List<Movie> findByTitle(String title) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            TypedQuery<Movie> query = entityManager.createQuery("SELECT m FROM Movie m WHERE m.title = :title", Movie.class);
            query.setParameter("title", title);
            return query.getResultList();
        } finally {
            entityManager.close();
        }
    }

    public List<Movie> findAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            TypedQuery<Movie> query = entityManager.createQuery("SELECT m FROM Movie m", Movie.class);
            return query.getResultList();
        } finally {
            entityManager.close();
        }
    }
}