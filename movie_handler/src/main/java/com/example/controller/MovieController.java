package com.example.controller;

import com.example.model.Movie;
import com.example.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping(path = "api/v1/movie")
public class MovieController {

    private final MovieService movieService;

    @Autowired
    public MovieController(MovieService movieService) {
        this.movieService = movieService;
    }

    @GetMapping
    public List<Movie> getMovies() {
        return movieService.findAllMovies();
    }

    @PostMapping
    public void addNewMovie(@RequestBody Movie movie) {
        movieService.createMovie(movie);
    }

    @DeleteMapping(path = "{movieId}")
    public void deleteMovie(@PathVariable("movieId") UUID movieId) {
        movieService.deleteMovie(movieId);
    }

    @PutMapping(path = "{movieId}")
    public void updateMovie(@PathVariable("movieId") UUID movieId, @RequestParam(required = false) String title, @RequestParam(required = false) List<String> genres) {
        movieService.updateMovie(movieId, title, genres);
    }
}
