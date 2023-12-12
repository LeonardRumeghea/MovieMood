package com.example.movie.model;

import jakarta.persistence.Entity;
import jakarta.persistence.OneToOne;

import java.util.Date;
import java.util.UUID;

@Entity
public class Award extends AbstractEntity<UUID>{

    protected String title;
    protected Date date;
    protected Genre category;
    protected String description;

    @OneToOne
    private Actor actor;

    public Award(String title, Date date, Genre category, String description) {
        this.id = UUID.randomUUID();
        this.title = title;
        this.date = date;
        this.category = category;
        this.description = description;
    }

    public Award() {

    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Genre getCategory() {
        return category;
    }

    public void setCategory(Genre category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Award{" +
                "title='" + title + '\'' +
                ", date=" + date +
                ", category=" + category +
                ", description='" + description + '\'' +
                '}';
    }
}
