using review_handler.Core.Enums;

namespace review_handler.Core.Entities
{
    public class Award
    {
        public Guid Id { get; set; }
        public string? Title { get; set; } = "";
        public DateTime Date { get; set; }
        public Genre Category { get; set; }
        public string? Description { get; set; } = "";
    }
}
