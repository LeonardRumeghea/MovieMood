package com.example.model;

import com.example.searchService.Search;

import java.util.List;

public class Movie {
    private String title;
    private int year;
    private List<Actor> cast;
    private List<Genre> genre;
    private Director director;
    private double rating;

    public Movie(String title, int year, List<Actor> cast, List<Genre> genre, Director director, double rating) {
        this.title = title;
        this.year = year;
        this.cast = cast;
        this.genre = genre;
        this.director = director;
        this.rating = rating;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public List<Actor> getCast() {
        return cast;
    }

    public void setCast(List<Actor> cast) {
        this.cast = cast;
    }

    public List<Genre> getGenre() {
        return genre;
    }

    public void setGenre(List<Genre> genre) {
        this.genre = genre;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public void accept(Search searchObject) {

    }
}
