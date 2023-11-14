using MediatR;
using review_handler.Core.Helpers;

namespace review_handler.Application.Commands
{
    public class DeleteReviewCommand : IRequest<Result>
    {
        public Guid Id { get; set; }
    }
}
