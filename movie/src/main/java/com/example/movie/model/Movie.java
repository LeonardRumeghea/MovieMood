package com.example.movie.model;

import jakarta.persistence.*;

import java.util.List;
import java.util.UUID;

@Entity
public class Movie extends AbstractEntity<UUID> {

    protected String title;
    protected int year;
    @ManyToMany
    protected List<Actor> cast;
    protected List<Genre> genre;

    @OneToOne
    protected Director director;
    protected double rating;

    public Movie(String title, int year, List<Actor> cast, List<Genre> genre, Director director, double rating) {
        this.title = title;
        this.year = year;
        this.cast = cast;
        this.genre = genre;
        this.director = director;
        this.rating = rating;
    }

    public Movie() {

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

    @Override
    public String toString() {
        return "Movie{" +
                "title='" + title + '\'' +
                ", year=" + year +
                ", cast=" + cast +
                ", genre=" + genre +
                ", director=" + director +
                ", rating=" + rating +
                '}';
    }
}
