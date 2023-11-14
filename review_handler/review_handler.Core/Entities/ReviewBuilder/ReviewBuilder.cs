namespace review_handler.Core.Entities.ReviewBuilder
{
    public class ReviewBuilder : IReviewBuilder
    {
        private Review _review;

        public ReviewBuilder()
        {
            _review = new Review();
        }

        public void BuildMovie(Guid movieId)
        {
            _review.MovieId = movieId;
        }

        public void BuildUser(Guid userId)
        {
            _review.UserId = userId;
        }

        public void BuildMovieRating(int movieRating)
        {
            _review.MovieRating = movieRating;
        }

        public void BuildCastRating(int castRating)
        {
            _review.CastRating = castRating;
        }

        public void BuildDirectorRating(int directorRating)
        {
            _review.DirectorRating = directorRating;
        }

        public void BuildGenreRating(int genreRating)
        {
            _review.GenreRating = genreRating;
        }

        public void BuildScriptRating(int scriptRating)
        {
            _review.SciptRating = scriptRating;
        }

        public void BuildReviewText(string reviewText)
        {
            _review.ReviewText = reviewText;
        }

        public Review Build()
        {
            return _review;
        }
    }
}
