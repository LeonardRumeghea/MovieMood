using MediatR;
using review_handler.Application.Mappers;
using review_handler.Application.Response;
using review_handler.Core.Helpers;
using System.Net;

namespace review_handler.Application.Queries
{
    public class GetAllReviewsOfMovieHandler : IRequestHandler<GetAllReviewsOfMovie, ResultOfEntity<List<ReviewResponse>>>
    {
        private readonly IUnitOfWork _unitOfWork;

        public GetAllReviewsOfMovieHandler(IUnitOfWork unitOfWork) => _unitOfWork = unitOfWork;


        public async Task<ResultOfEntity<List<ReviewResponse>>> Handle(GetAllReviewsOfMovie request, CancellationToken cancellationToken)
        {
            var reviews = (await _unitOfWork.ReviewRepository.GetAllAsync()).Where(x => x.MovieId == request.MovieId).ToList();

            if (reviews.Count == 0)
            {
                return ResultOfEntity<List<ReviewResponse>>.Failure(HttpStatusCode.NotFound, $"No reviews found for movie with id {request.MovieId}.");
            }

            return ResultOfEntity<List<ReviewResponse>>.Success(
                HttpStatusCode.OK,
                ReviewMapper.Mapper.Map<List<ReviewResponse>>(reviews)
            ) ;
        }
    }
}
