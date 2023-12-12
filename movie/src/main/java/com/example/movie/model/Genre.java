package com.example.movie.model;

public enum Genre {
    NOGENRES(0),
    ACTION(1),
    ADVENTURE(2),
    ANIMATION(3),
    COMEDY(4),
    CRIME(5),
    DOCUMENTARY(6),
    DRAMA(7),
    CHILDREN(8),
    FANTASY(9),
    FILMNOIR(10),
    HORROR(11),
    MUSICAL(12),
    MYSTERY(13),
    ROMANCE(14),
    SCIFI(15),
    IMAX(16),
    THRILLER(17),
    WAR(18),
    WESTERN(19);
    private int value;

    private Genre(int value) {
        this.value = value;
    }
}
