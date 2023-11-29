package com.example.movie.repository;

import com.example.movie.model.Movie;

import java.util.List;
import java.util.UUID;

public class MovieRepository extends Repository<Movie, UUID>{
    public MovieRepository(Class<Movie> entityClass) {
        super(entityClass);
    }

    public List<Movie> findByTitle(String title) {
        return entityManager.createNamedQuery("Movie.findByFirstName", Movie.class).setParameter(1, title).getResultList();
    }
}