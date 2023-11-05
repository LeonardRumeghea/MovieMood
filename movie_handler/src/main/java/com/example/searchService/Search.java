package com.example.searchService;

import com.example.model.*;

import java.util.List;

public interface Search {
    public List<Movie> searchInMovies(String regex);
    public List<Actor> searchInActors(String regex);
    public List<Award> searchInAwards(String regex);
    public List<Director> searchInDirectors(String regex);
}
