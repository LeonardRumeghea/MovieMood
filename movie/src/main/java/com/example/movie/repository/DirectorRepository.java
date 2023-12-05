package com.example.movie.repository;

import com.example.movie.model.Actor;
import com.example.movie.model.Director;

import java.util.List;
import java.util.UUID;

public class DirectorRepository extends Repository<Director, UUID>{

    public DirectorRepository(Class<Director> entityClass) {
        super(entityClass);
    }

    public List<Director> findByFirstName(String firstName) {
        return entityManager.createNamedQuery("Director.findByFirstName", Director.class).setParameter(1, firstName).getResultList();
    }

    public List<Director> findByLastName(String lastName) {
        return entityManager.createNamedQuery("Director.findByFirstName", Director.class).setParameter(1, lastName).getResultList();
    }
}