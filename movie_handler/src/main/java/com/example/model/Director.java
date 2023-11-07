package com.example.model;

import com.example.model.enums.Genre;
import com.example.searchService.Search;

import java.util.Date;
import java.util.List;
import java.util.UUID;

public class Director extends Person {
    private List<Movie> filmography;
    private List<Genre> style;

    public Director(String firstName, String lastName, Date dateOfBirth, String nationality, String biography, UUID profileImage, List<Movie> filmography, List<Genre> style) {
        super(firstName, lastName, dateOfBirth, nationality, biography, profileImage);
        this.filmography = filmography;
        this.style = style;
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

    @Override
    public void accept(Search searchObject) {

    }
}
