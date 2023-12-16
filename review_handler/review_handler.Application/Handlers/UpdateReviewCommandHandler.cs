using MediatR;
using review_handler.Application.Commands;
using review_handler.Core.Helpers;
using System.Net;

namespace review_handler.Application.Handlers
{
    public class UpdateReviewCommandHandler : IRequestHandler<UpdateReviewCommand, Result>
    {
        private readonly IUnitOfWork _unitOfWork;

        public UpdateReviewCommandHandler(IUnitOfWork unitOfWork) => _unitOfWork = unitOfWork;

        public async Task<Result> Handle(UpdateReviewCommand request, CancellationToken cancellationToken)
        {
            var reviewEntity = await _unitOfWork.ReviewRepository.GetByIdAsync(request.Id);

            if (reviewEntity == null)
            {
                return Result.Failure(HttpStatusCode.NotFound, $"Review with id {request.Id} not found.");
            }

            reviewEntity.ReviewText = request.ReviewText;
            reviewEntity.SciptRating = request.SciptRating;
            reviewEntity.CastRating = request.CastRating;
            reviewEntity.MovieRating = request.MovieRating;
            reviewEntity.DirectorRating = request.DirectorRating;
            reviewEntity.GenreRating = request.GenreRating;

            await _unitOfWork.ReviewRepository.UpdateAsync(reviewEntity);

            return Result.Success(HttpStatusCode.Created);
        }
    }
}
