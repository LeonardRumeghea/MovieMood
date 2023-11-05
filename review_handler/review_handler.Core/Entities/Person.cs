using review_handler.Core.Helpers;

namespace review_handler.Core.Entities
{
    public abstract class Person
    {
        public Guid Id { get; set; }
        public string? FirstName { get; set; } = "";
        public string? LastName { get; set; } = "";
        public DateTime DateOfBirth { get; set; }
        public string? Biography { get; set; } = "";
        public string? Nationality { get; set; } = "";

        public Person(string firstName, string lastName, DateTime dateOfBirth, string biography, string nationality)
        {
            Id = Guid.NewGuid();
            FirstName = firstName;
            LastName = lastName;
            DateOfBirth = dateOfBirth;
            Biography = biography;
            Nationality = nationality;
        }

        protected Person() { }

        public static Result CanCreatePerson(string firstName, string lastName, string dateOfBirth, string biography, string nationality)
        {
            if (firstName == null || firstName == "" || firstName.Length < 3 || firstName.Length > 50)
            {
                return Result.Failure("First name is required and must be between 3 and 50 characters");
            }

            if (lastName == null || lastName == "" || lastName.Length < 3 || lastName.Length > 50)
            {
                return Result.Failure("Last name is required and must be between 3 and 50 characters");
            }

            DateTime resultDate;
            if (DateTime.TryParse(dateOfBirth, out resultDate) == false || resultDate > DateTime.Now)
            {
                return Result.Failure("Date of birth is required and must be a valid date and in the past");
            }

            if (biography == null || biography == "" || biography.Length < 3 || biography.Length > 1000)
            {
                return Result.Failure("Biography is required and must be between 3 and 1000 characters");
            }

            return Result.Success();
        }
    }
}
