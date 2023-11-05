using review_handler.Core.Enums;

namespace review_handler.Core.Entities
{
    public class Director : Person
    {
        public List<Movie> Filmography { get; set; }
        public List<Genre> Style { get; set; } 

        public Director(string firstName, string lastName, DateTime dateOfBirth, string biography, string nationality, List<Movie> filmography, List<Genre> style)
            : base(firstName, lastName, dateOfBirth, biography, nationality)
        {
            this.Filmography = filmography;
            this.Style = style;
        }

    }
}
