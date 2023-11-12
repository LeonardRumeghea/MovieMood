using MediatR;
using review_handler.Application.Mappers;
using review_handler.Application.Response;
using review_handler.Core.Helpers;
using System.Net;

namespace review_handler.Application.Queries
{
    public class GetReviewByIdHandler : IRequestHandler<GetReviewById, ResultOfEntity<ReviewResponse>>
    {
        private readonly IUnitOfWork _unitOfWork;

        public GetReviewByIdHandler(IUnitOfWork unitOfWork) => _unitOfWork = unitOfWork;

        public async Task<ResultOfEntity<ReviewResponse>> Handle(GetReviewById request, CancellationToken cancellationToken)
        {
            var reviewEntity = await _unitOfWork.ReviewRepository.GetByIdAsync(request.Id);
            if (reviewEntity == null)
            {
                return ResultOfEntity<ReviewResponse>.Failure(HttpStatusCode.NotFound, "Review not found");
            }

            return ResultOfEntity<ReviewResponse>.Success(ReviewMapper.Mapper.Map<ReviewResponse>(reviewEntity));
        }
    }
}
