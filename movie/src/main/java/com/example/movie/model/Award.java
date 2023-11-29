package com.example.movie.model;

import jakarta.persistence.Entity;
import java.util.Date;
import java.util.UUID;

@Entity
public class Award extends AbstractEntity<UUID>{

    private String title;
    private Date date;
    private Genre category;
    private String description;

    public Award(String title, Date date, Genre category, String description) {
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
