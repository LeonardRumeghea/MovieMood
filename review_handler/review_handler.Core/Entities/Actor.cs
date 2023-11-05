namespace review_handler.Core.Entities
{
    public class Actor : Person
    {
        public List<Movie> Filmography { get; set; } = new List<Movie>();
        public List<Award> Awards { get; set; } = new List<Award>();

        public Actor(string firstName, string lastName, DateTime dateOfBirth, string biography, string nationality, List<Movie> filmography, List<Award> awards)
            : base(firstName, lastName, dateOfBirth, biography, nationality)
        {
            this.Filmography = filmography;
            this.Awards = awards;
        }
    }
}
