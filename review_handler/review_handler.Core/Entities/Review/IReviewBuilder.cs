namespace review_handler.Core.Entities.Review
{
    public interface IReviewBuilder
    {
        void BuildMovie(Movie movie);
        void BuildUser(User user);
        
        void BuildMovieRating(int movieRating);
        void BuildCastRating(int castRating);
        void BuildDirectorRating(int directorRating);
        void BuildGenreRating(int genreRating);
        void BuildScriptRating(int scriptRating);
        void BuildReviewText(string reviewText);

        Review Build();
    }
}
