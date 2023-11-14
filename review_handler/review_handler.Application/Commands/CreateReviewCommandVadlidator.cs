using FluentValidation;

namespace review_handler.Application.Commands
{
    public class CreateReviewCommandVadlidator : AbstractValidator<CreateReviewCommand>
    {
        public CreateReviewCommandVadlidator()
        {
            {
                RuleFor(x => x.MovieId).NotEmpty();
                RuleFor(x => x.UserId).NotEmpty();
                RuleFor(x => x.MovieRating).NotEmpty().InclusiveBetween(1, 5);
                RuleFor(x => x.CastRating).NotEmpty().InclusiveBetween(1, 5);
                RuleFor(x => x.DirectorRating).NotEmpty().InclusiveBetween(1, 5);
                RuleFor(x => x.GenreRating).NotEmpty().InclusiveBetween(1, 5);
                RuleFor(x => x.SciptRating).NotEmpty().InclusiveBetween(1, 5);
                RuleFor(x => x.ReviewText).NotEmpty().MaximumLength(2500);
            }
        }
    }
}
