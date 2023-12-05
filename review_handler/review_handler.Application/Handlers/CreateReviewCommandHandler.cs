using MediatR;
using review_handler.Application.Commands;
using review_handler.Application.Mappers;
using review_handler.Core.Entities;
using review_handler.Core.Helpers;
using System.Net;

namespace review_handler.Application.Handlers
{
    public class CreateReviewCommandHandler : IRequestHandler<CreateReviewCommand, Result>
    {
        private readonly IUnitOfWork _unitOfWork;

        public CreateReviewCommandHandler(IUnitOfWork unitOfWork) => _unitOfWork = unitOfWork;

        public async Task<Result> Handle(CreateReviewCommand request, CancellationToken cancellationToken)
        {
            //var movie = _unitOfWork.MovieRepository.GetByIdAsync(request.MovieId);
            //if (movie == null)
            //{
            //    return Result.Failure(HttpStatusCode.NotFound, "Movie not found");
            //}

            //var user = _unitOfWork.UserRepository.GetByIdAsync(request.UserId);
            //if (user == null)
            //{
            //    return Result.Failure(HttpStatusCode.NotFound, "User not found");
            //}

            var reviewEntity = ReviewMapper.Mapper.Map<Review>(request);

            await _unitOfWork.ReviewRepository.AddAsync(reviewEntity);
            await _unitOfWork.SaveChanges();

            return Result.Success(HttpStatusCode.Created);
        }
    }
}
