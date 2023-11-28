package com.example.movie.repository;


import com.example.movie.model.Actor;
import jakarta.ejb.Stateless;

import java.util.UUID;

@Stateless
public class ActorRepository extends Repository<Actor, UUID>{

    public ActorRepository(Class<Actor> entityClass) {
        super(entityClass);
    }


}