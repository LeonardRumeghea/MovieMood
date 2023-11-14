package com.example.service;

import com.example.model.Actor;
import com.example.repository.ActorRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class ActorService {

    private final ActorRepository actorRepository;

    public ActorService(ActorRepository actorRepository) {
        this.actorRepository = actorRepository;
    }

    public void createActor(Actor actor) {
        actorRepository.save(actor);
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
}