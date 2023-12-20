namespace review_handler.Core.Entities
{
    public class Movie
    {
        public Guid Id { get; set; }
        public string? Title { get; set; }
        public DateTime ReleaseDate { get; set; }
        //public List<Genre> Genres { get; set; } = new List<Genre>();
        public double Raiting { get; set; }
    }
}
