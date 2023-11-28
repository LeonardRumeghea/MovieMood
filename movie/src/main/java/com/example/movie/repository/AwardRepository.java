package com.example.movie.repository;

import com.example.movie.model.Actor;

import java.util.UUID;

public class AwardRepository extends Repository<Actor, UUID>{

    public AwardRepository(Class<Actor> entityClass) {
        super(entityClass);
    }
}