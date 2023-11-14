package com.example.controller;

import com.example.model.Actor;
import com.example.service.ActorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping(path = "api/v1/actor")
public class ActorController {

    private final ActorService actorService;

    @Autowired
    public ActorController(ActorService actorService) {
        this.actorService = actorService;
    }

    @GetMapping
    public List<Actor> getActors() {
        return actorService.findAllActors();
    }

    @PostMapping
    public void addNewActor(@RequestBody Actor actor) {
        actorService.createActor(actor);
    }

    @DeleteMapping(path = "{actorId}")
    public void deleteActor(@PathVariable("actorId") UUID actorId) {
        actorService.deleteActor(actorId);
    }

    @PutMapping(path = "{actorId}")
    public void updateActor(@PathVariable("actorId") UUID actorId, @RequestParam(required = false) String firstName, @RequestParam(required = false) String lastName) {
        actorService.updateActor(actorId, firstName, lastName);
    }
}
