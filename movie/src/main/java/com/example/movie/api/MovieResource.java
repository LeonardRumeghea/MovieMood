package com.example.movie.api;

import com.example.movie.model.Movie;
import com.example.movie.service.MovieService;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.awt.image.AreaAveragingScaleFilter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Path("/movies")
//@Produces(MediaType.APPLICATION_JSON)
//@Consumes(MediaType.APPLICATION_JSON)
public class MovieResource {

    @Inject
    private MovieService movieService;

    @POST
    public Response createMovie() {
//        movieService.createMovie(movie);
        movieService.createMovie(new Movie("The Godfather", 1972, new ArrayList<>(), new ArrayList<>(), null, 6.0));
        movieService.createMovie(new Movie("The Godfather: Part II", 1974, new ArrayList<>(), new ArrayList<>(), null, 6.0));
        movieService.createMovie(new Movie("The Godfather: Part III", 1990, new ArrayList<>(), new ArrayList<>(), null, 6.0));
        movieService.createMovie(new Movie("The Shawshank Redemption", 1994, new ArrayList<>(), new ArrayList<>(), null, 6.0));
        movieService.createMovie(new Movie("The Dark Knight", 2008, new ArrayList<>(), new ArrayList<>(), null, 6.0));
        return Response.status(Response.Status.CREATED).build();
    }

    @GET
    @Path("/{id}")
    public Response getMovieById(@PathParam("id") UUID id) {
        Movie movie = movieService.findMovieById(id);
        if (movie != null) {
            return Response.ok(movie).build();
        } else {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
    }

    @GET
    public Response getAllMovies() {
        List<Movie> movies = movieService.findAllMovies();
        return Response.ok(movies).build();
    }

    @DELETE
    @Path("/{id}")
    public Response deleteMovie(@PathParam("id") UUID id) {
        movieService.deleteMovie(id);
        return Response.ok().build();
    }
}
