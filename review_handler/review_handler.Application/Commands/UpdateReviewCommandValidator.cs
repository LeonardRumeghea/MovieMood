using FluentValidation;

namespace review_handler.Application.Commands
{
    public class UpdateReviewCommandValidator : AbstractValidator<UpdateReviewCommand>
    {
        public UpdateReviewCommandValidator()
        {
            RuleFor(x => x.Id).NotEmpty();
            RuleFor(x => x.MovieRating).NotEmpty().InclusiveBetween(1, 5);
            RuleFor(x => x.CastRating).NotEmpty().InclusiveBetween(1, 5);
            RuleFor(x => x.DirectorRating).NotEmpty().InclusiveBetween(1, 5);
            RuleFor(x => x.GenreRating).NotEmpty().InclusiveBetween(1, 5);
            RuleFor(x => x.SciptRating).NotEmpty().InclusiveBetween(1, 5);
            RuleFor(x => x.ReviewText).NotEmpty().MaximumLength(2500);
        }
    }
}
