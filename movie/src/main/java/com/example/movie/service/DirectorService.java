package com.example.movie.service;

import com.example.movie.model.Director;
import com.example.movie.repository.DirectorRepository;
import jakarta.ejb.Stateless;

import java.util.List;
import java.util.UUID;

@Stateless
public class DirectorService {

    private DirectorRepository directorRepository;

    public void createDirector(Director director) {
        directorRepository.create(director);
    }

    public Director findDirectorById(UUID id) {
        return directorRepository.findById(id);
    }

    public List<Director> findDirectorsByFirstName(String firstName) {
        return directorRepository.findByFirstName(firstName);
    }

    public List<Director> findDirectorsByLastName(String lastName) {
        return directorRepository.findByLastName(lastName);
    }

    public List<Director> findAllDirectors() {
        return directorRepository.findAll();
    }

    public void delete(UUID directorId) {
        Director director = directorRepository.findById(directorId);
        directorRepository.delete(director);
    }

    public void updateDirector(UUID directorId, String firstName, String lastName) {
        Director director = directorRepository.findById(directorId);
        if (firstName != null) {
            director.setFirstName(firstName);
        }
        if (lastName != null) {
            director.setLastName(lastName);
        }
        directorRepository.create(director);
    }
}