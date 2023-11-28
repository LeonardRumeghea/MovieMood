package com.example.movie.model;


import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Entity
public class Actor extends Person {

    @OneToMany
    private List<Movie> filmography;
    @OneToMany
    private List<Award> awards;

    public Actor(String firstName, String lastName, Date dateOfBirth, String nationality, String biography, UUID profileImage, List<Movie> filmography, List<Award> awards) {
        super(firstName, lastName, dateOfBirth, nationality, biography, profileImage);
        this.filmography = filmography;
        this.awards = awards;
    }

    public Actor() {

    }

    public List<Movie> getFilmography() {
        return filmography;
    }

    public void setFilmography(List<Movie> filmography) {
        this.filmography = filmography;
    }

    public List<Award> getAwards() {
        return awards;
    }

    public void setAwards(List<Award> awards) {
        this.awards = awards;
    }

}
