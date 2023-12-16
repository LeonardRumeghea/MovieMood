namespace review_handler.Application.Response
{
    public class ReviewResponse
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
    }
}
