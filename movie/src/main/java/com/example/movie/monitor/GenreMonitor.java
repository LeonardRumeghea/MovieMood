package com.example.movie.monitor;

import com.example.movie.model.Director;
import com.example.movie.model.Genre;
import com.example.movie.model.Movie;
import com.example.movie.repository.DirectorRepository;
import com.example.movie.repository.MovieRepository;

import java.util.List;

public class GenreMonitor {
    private DirectorRepository directorRepository;
    public void verifyUpdatedMovie(Movie movie, List<Genre> genres) {
        List<Genre> currentGenres = movie.getGenre();
        Director director = movie.getDirector();
        boolean hasDirectorChanged = false;
        for (Genre genreItr : genres) {
            if (!currentGenres.contains(genreItr)) {
                hasDirectorChanged = true;
                director.addStyle(genreItr);
            }
        }

        if (hasDirectorChanged) {
            directorRepository.update(director);
        }
    }

    public void verifyDeletedMovie(Movie movie) {
        Director director = movie.getDirector();

        List<Genre> movieGenres = movie.getGenre();

        List<Movie> filmography = director.getFilmography();

        boolean hasStyleChanged = false;
        for(Genre genreItr : movieGenres) {
            boolean existsMovieWithGenre = false;
            for(Movie movieItr : filmography) {
                if (movieItr.getGenre().contains(genreItr)){
                    existsMovieWithGenre = true;
                    break;
                }
            }

            if (!existsMovieWithGenre) {
                director.deleteStyle(genreItr);
                hasStyleChanged = true;
            }
        }

        if (hasStyleChanged) {
            directorRepository.update(director);
        }
    }

    public void verifyCreatedMovie(Movie movie) {
        Director director = movie.getDirector();

        boolean hasStyleChanged = false;
        for(Genre genreItr : movie.getGenre()) {
            if (!director.getStyle().contains(genreItr)){
                hasStyleChanged = true;
                director.addStyle(genreItr);
            }
        }

        if (hasStyleChanged) {
            directorRepository.update(director);
        }
    }
}
