namespace review_handler.Core.Entities.Review
{
    public class Review
    {
        public Guid Id { get; set; }
        public Movie? Movie { get; set; }
        public User? User { get; set; }
        public int MovieRating { get; set; }
        public int? CastRating { get; set; }
        public int? DirectorRating { get; set; }
        public int? GenreRating { get; set; }
        public int? SciptRating { get; set; }
        public string? ReviewText { get; set; }
    }
}
