package com.example.service;

import com.example.model.Director;
import com.example.repository.DirectorRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
@Service
public class DirectorService {

    private final DirectorRepository directorRepository;

    public DirectorService(DirectorRepository directorRepository) {
        this.directorRepository = directorRepository;
    }

    public void createDirector(Director director) {
        directorRepository.save(director);
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
        directorRepository.save(director);
    }
}