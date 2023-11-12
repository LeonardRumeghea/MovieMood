using MediatR;
using review_handler.Application.Response;
using review_handler.Core.Helpers;

namespace review_handler.Application.Queries
{
    public class GetAllReviewsOfMovie : IRequest<ResultOfEntity<List<ReviewResponse>>>
    {
        public Guid MovieId { get; set; }
    }
}
