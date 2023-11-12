namespace review_handler.Core.Entities.ReviewBuilder
{
    public interface IReviewBuilder
    {
        void BuildMovie(Guid movieId);
        void BuildUser(Guid userId);
        
        void BuildMovieRating(int movieRating);
        void BuildCastRating(int castRating);
        void BuildDirectorRating(int directorRating);
        void BuildGenreRating(int genreRating);
        void BuildScriptRating(int scriptRating);
        void BuildReviewText(string reviewText);

        Review Build();
    }
}
