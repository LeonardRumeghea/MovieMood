package com.example.movie.repository;

import com.example.movie.aspect.MyAspect;
import com.example.movie.model.Actor;
import com.example.movie.model.Award;
import jakarta.ejb.Stateless;

import java.util.List;
import java.util.UUID;

@Stateless
public class AwardRepository extends Repository<Award, UUID>{

    public AwardRepository() {
        super(Award.class);
    }

    @MyAspect
    public List<Award> findByTitle(String title) {
        return entityManager.createNamedQuery("Award.findByTitle", Award.class).setParameter(1, title).getResultList();
    }
}