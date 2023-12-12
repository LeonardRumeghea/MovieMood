package com.example.movie.service;

import com.example.movie.model.Genre;
import com.example.movie.model.Movie;
import com.example.movie.monitor.GenreMonitor;
import com.example.movie.repository.MovieRepository;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Stateless
public class MovieService {
    @Inject
    private GenreMonitor genreMonitor;
    private MovieRepository movieRepository;
    public void createMovie(Movie movie) {
        genreMonitor.verifyCreatedMovie(movie);
        movieRepository.create(movie);
    }

    public Movie findMovieById(UUID id) {
        return movieRepository.findById(id);
    }

    public List<Movie> findMoviesByTitle(String title) {
        return movieRepository.findByTitle(title);
    }

    public List<Movie> findAllMovies() {
        return movieRepository.findAll();
    }

    public void deleteMovie(UUID movieId) {
        Movie movie = movieRepository.findById(movieId);

        genreMonitor.verifyDeletedMovie(movie);

        movieRepository.delete(movie);
    }

    public void updateMovie(UUID movieId, String title, List<String> genres) {
        Movie movie = movieRepository.findById(movieId);

        if (title != null) {
            movie.setTitle(title);
        }

        if (!genres.isEmpty()) {
            List<Genre> newGenres = genres.stream().map(Genre::valueOf).collect(Collectors.toList());

            genreMonitor.verifyUpdatedMovie(movie, newGenres);

            movie.setGenre(newGenres);
        }
        movieRepository.create(movie);
    }
}