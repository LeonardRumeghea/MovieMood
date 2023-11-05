package com.example.searchService;

import com.example.model.Actor;
import com.example.model.Award;
import com.example.model.Director;
import com.example.model.Movie;

import java.util.List;

public class ConcreteSearch implements Search {
    @Override
    public List<Movie> searchInMovies(String regex) {
        return null;
    }

    @Override
    public List<Actor> searchInActors(String regex) {
        return null;
    }

    @Override
    public List<Award> searchInAwards(String regex) {
        return null;
    }

    @Override
    public List<Director> searchInDirectors(String regex) {
        return null;
    }
}
