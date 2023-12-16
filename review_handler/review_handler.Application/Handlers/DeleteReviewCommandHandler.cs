using MediatR;
using review_handler.Application.Commands;
using review_handler.Core.Helpers;
using System.Net;

namespace review_handler.Application.Handlers
{
    public class DeleteReviewCommandHandler : IRequestHandler<DeleteReviewCommand, Result>
    {
        private readonly IUnitOfWork _unitOfWork;

        public DeleteReviewCommandHandler(IUnitOfWork unitOfWork) => _unitOfWork = unitOfWork;

        public async Task<Result> Handle(DeleteReviewCommand request, CancellationToken cancellationToken)
        {
            var reviewEntity = await _unitOfWork.ReviewRepository.GetByIdAsync(request.Id);

            if (reviewEntity == null)
            {
                return Result.Failure(HttpStatusCode.NotFound, $"Review with id {request.Id} not found.");
            }

            await _unitOfWork.ReviewRepository.DeleteAsync(reviewEntity);

            return Result.Success(HttpStatusCode.OK);
        }
    }
}
