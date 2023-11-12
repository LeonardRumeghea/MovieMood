using MediatR;
using review_handler.Application.Response;
using review_handler.Core.Helpers;

namespace review_handler.Application.Queries
{
    public class GetReviewById : IRequest<ResultOfEntity<ReviewResponse>>
    {
        public Guid Id { get; set; }
    }
}
