package com.example.movie.repository;


import com.example.movie.aspect.MyAspect;
import com.example.movie.model.Actor;
import jakarta.ejb.Stateless;

import java.util.List;
import java.util.UUID;

@Stateless
public class ActorRepository extends Repository<Actor, UUID>{

    public ActorRepository() {
        super(Actor.class);
    }

    @MyAspect
    public List<Actor> findByFirstName(String firstName) {
        return entityManager.createNamedQuery("Actor.findByFirstName", Actor.class).setParameter(1, firstName).getResultList();
    }

    @MyAspect
    public List<Actor> findByLastName(String lastName) {
        return entityManager.createNamedQuery("Actor.findByLastName", Actor.class).setParameter(1, lastName).getResultList();
    }
}