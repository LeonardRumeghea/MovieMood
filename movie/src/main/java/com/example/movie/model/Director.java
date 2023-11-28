package com.example.movie.model;

import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Entity
public class Director extends Person {
    @OneToMany
    private List<Movie> filmography;
    @OneToMany
    private List<Genre> style;

    public Director(String firstName, String lastName, Date dateOfBirth, String nationality, String biography, UUID profileImage, List<Movie> filmography, List<Genre> style) {
        super(firstName, lastName, dateOfBirth, nationality, biography, profileImage);
        this.filmography = filmography;
        this.style = style;
    }

    public Director() {

    }

    public List<Movie> getFilmography() {
        return filmography;
    }

    public void setFilmography(List<Movie> filmography) {
        this.filmography = filmography;
    }

    public List<Genre> getStyle() {
        return style;
    }

    public void setStyle(List<Genre> style) {
        this.style = style;
    }

}
