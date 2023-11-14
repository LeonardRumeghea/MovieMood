package com.example.controller;

import com.example.model.Director;
import com.example.service.DirectorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping(path = "api/v1/director")
public class DirectorController {

    private final DirectorService directorService;

    @Autowired
    public DirectorController(DirectorService directorService) {
        this.directorService = directorService;
    }

    @GetMapping
    public List<Director> getDirectors() {
        return directorService.findAllDirectors();
    }

    @PostMapping
    public void addNewDirector(@RequestBody Director director) {
        directorService.createDirector(director);
    }

    @DeleteMapping(path = "{directorId}")
    public void deleteDirector(@PathVariable("directorId") UUID directorId) {
        directorService.delete(directorId);
    }

    @PutMapping(path = "{directorId}")
    public void updateDirector(@PathVariable("directorId") UUID directorId, @RequestParam(required = false) String firstName, @RequestParam(required = false) String lastName) {
        directorService.updateDirector(directorId, firstName, lastName);
    }
}