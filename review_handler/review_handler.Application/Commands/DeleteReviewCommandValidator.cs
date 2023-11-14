using FluentValidation;

namespace review_handler.Application.Commands
{
    public class DeleteReviewCommandValidator : AbstractValidator<DeleteReviewCommand>
    {
        public DeleteReviewCommandValidator()
        {
            RuleFor(x => x.Id).NotEmpty();
        }
    }
}
