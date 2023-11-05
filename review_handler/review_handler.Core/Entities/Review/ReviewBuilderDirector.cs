namespace review_handler.Core.Entities.Review
{
    public class ReviewBuilderDirector
    {
        public Review FinishedReview { get; set; }
        public ReviewBuilderDirector(Movie movie, User user, int movieRating, int castRating, int directorRating, int genreRating, int scriptRating, string reviewText)
        {
            var reviewBuilder = new ReviewBuilder();

            reviewBuilder.BuildMovie(movie);
            reviewBuilder.BuildUser(user);

            reviewBuilder.BuildMovieRating(movieRating);
            reviewBuilder.BuildCastRating(castRating);
            reviewBuilder.BuildDirectorRating(directorRating);
            reviewBuilder.BuildGenreRating(genreRating);
            reviewBuilder.BuildScriptRating(scriptRating);
            reviewBuilder.BuildReviewText(reviewText);

            FinishedReview = reviewBuilder.Build();
        }
    }
}
