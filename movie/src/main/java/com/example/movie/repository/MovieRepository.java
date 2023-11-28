package com.example.movie.repository;

import com.example.movie.model.Actor;

import java.util.UUID;

public class MovieRepository extends Repository<Actor, UUID>{
    public MovieRepository(Class<Actor> entityClass) {
        super(entityClass);
    }
}