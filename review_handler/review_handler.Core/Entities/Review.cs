using review_handler.Core.Helpers;

namespace review_handler.Core.Entities
{
    public class Review
    {
        public Guid Id { get; set; }
        public Guid MovieId { get; set; }
        public Guid UserId { get; set; }
        public int MovieRating { get; set; }
        public int? CastRating { get; set; }
        public int? DirectorRating { get; set; }
        public int? GenreRating { get; set; }
        public int? SciptRating { get; set; }
        public string? ReviewText { get; set; }

        public static ResultOfEntity<Review> Create(Guid movieId, Guid userId, int movieRating)
        {
            var review = new Review
            {
                Id = Guid.NewGuid(),
                MovieId = movieId,
                UserId = userId,
                MovieRating = movieRating
            };

            return ResultOfEntity<Review>.Success(review);
        }
    }
}
