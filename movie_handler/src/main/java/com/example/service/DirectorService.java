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
}