package com.example.movie.repository;


import com.example.movie.model.Actor;

import java.util.UUID;

public class DirectorRepository extends Repository<Actor, UUID>{

    public DirectorRepository(Class<Actor> entityClass) {
        super(entityClass);
    }
}