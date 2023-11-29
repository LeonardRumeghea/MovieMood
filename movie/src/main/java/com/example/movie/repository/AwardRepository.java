package com.example.movie.repository;

import com.example.movie.model.Actor;
import com.example.movie.model.Award;

import java.util.List;
import java.util.UUID;

public class AwardRepository extends Repository<Award, UUID>{

    public AwardRepository(Class<Award> entityClass) {
        super(entityClass);
    }

    public List<Award> findByTitle(String title) {
        return entityManager.createNamedQuery("Award.findByTitle", Award.class).setParameter(1, title).getResultList();
    }
}