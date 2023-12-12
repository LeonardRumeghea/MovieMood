package com.example.movie.repository;

import com.example.movie.aspect.MyAspect;
import com.example.movie.model.Movie;
import jakarta.ejb.Stateless;

import java.util.List;
import java.util.UUID;

@Stateless
public class MovieRepository extends Repository<Movie, UUID>{
    public MovieRepository() {
        super(Movie.class);
    }

    @MyAspect
    public List<Movie> findByTitle(String title) {
        return entityManager.createNamedQuery("Movie.findByTitle", Movie.class).setParameter(1, title).getResultList();
    }
}