package com.example.service;

import com.example.model.Movie;
import com.example.model.enums.Genre;
import com.example.repository.MovieRepository;
import com.example.service.rabbitmq.MovieMessageProducer;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class MovieService {


    private final MovieRepository movieRepository;
    private final MovieMessageProducer movieMessageProducer;
    @Autowired

    public MovieService(MovieRepository movieRepository, MovieMessageProducer movieMessageProducer) {
        this.movieRepository = movieRepository;
        this.movieMessageProducer = movieMessageProducer;
    }

    public void createMovie(Movie movie) {
        movieRepository.save(movie);
        movieMessageProducer.sendMessage(movie);
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
        movieRepository.delete(movie);
    }

    public void updateMovie(UUID movieId, String title, List<String> genres) {
        Movie movie = movieRepository.findById(movieId);
        if (title != null) {
            movie.setTitle(title);
        }
        if (!genres.isEmpty()) {
            List<Genre> newGenres = genres.stream().map(Genre::valueOf).collect(Collectors.toList());
            movie.setGenre(newGenres);
        }
        movieRepository.save(movie);
    }
}