namespace review_handler.Core.Entities.ReviewBuilder
{
    public class ReviewBuilderDirector
    {
        public Review FinishedReview { get; set; }
        public ReviewBuilderDirector(Guid movieId, Guid userId, int movieRating, int castRating, int directorRating, int genreRating, int scriptRating, string reviewText)
        {
            var reviewBuilder = new ReviewBuilder();

            reviewBuilder.BuildMovie(movieId);
            reviewBuilder.BuildUser(userId);

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
