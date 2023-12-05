package com.example.movie.service;

import com.example.movie.model.Actor;
import com.example.movie.repository.ActorRepository;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;

import java.util.List;
import java.util.UUID;

@Stateless
public class ActorService {

    @Inject
    private ActorRepository actorRepository;

    public void createActor(Actor actor) {
        actorRepository.create(actor);
    }

    public Actor findActorById(UUID id) {
        return actorRepository.findById(id);
    }

    public List<Actor> findActorsByFirstName(String firstName) {
        return actorRepository.findByFirstName(firstName);
    }

    public List<Actor> findActorsByLastName(String lastName) {
        return actorRepository.findByLastName(lastName);
    }

    public List<Actor> findAllActors() {
        return actorRepository.findAll();
    }

    public void deleteActor(UUID actorId) {
        Actor actor = actorRepository.findById(actorId);
        actorRepository.delete(actor);
    }

    public void updateActor(UUID actorId, String firstName, String lastName) {
        Actor actor = actorRepository.findById(actorId);
        if (firstName != null) {
            actor.setFirstName(firstName);
        }
        if (lastName != null) {
            actor.setLastName(lastName);
        }
        actorRepository.create(actor);
    }
}