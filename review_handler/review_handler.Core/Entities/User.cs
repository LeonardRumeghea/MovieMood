namespace review_handler.Core.Entities
{
    public class User
    {
        public Guid Id { get; set; }
        public string? Username { get; set; }
        public string? Email { get; set; }
        public string? Password { get; set; }
        public string? Role { get; set; }
        public List<Entities.Review> Reviews { get; set; } = new List<Entities.Review>();
    }
}
