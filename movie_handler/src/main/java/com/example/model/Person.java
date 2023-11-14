package com.example.model;

import com.example.searchService.Search;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.MappedSuperclass;

import java.util.Date;
import java.util.UUID;

@MappedSuperclass
@Entity
public abstract class Person {
    @Id
    private UUID profileImage;

    private String firstName;
    private String lastName;
    private String nationality;
    private Date dateOfBirth;
    private String biography;

    public Person(String firstName, String lastName, Date dateOfBirth, String nationality, String biography, UUID profileImage) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.nationality = nationality;
        this.biography = biography;
        this.profileImage = profileImage;
    }

    public Person() {

    }

    public abstract void accept(Search searchObject);

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getBiography() {
        return biography;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }

    public UUID getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(UUID profileImage) {
        this.profileImage = profileImage;
    }
}
