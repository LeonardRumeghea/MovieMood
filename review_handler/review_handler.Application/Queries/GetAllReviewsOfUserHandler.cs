﻿using MediatR;
using review_handler.Application.Mappers;
using review_handler.Application.Response;
using review_handler.Core.Helpers;
using System.Net;

namespace review_handler.Application.Queries
{
    public class GetAllReviewsOfUserHandler : IRequestHandler<GetAllReviewsOfUser, ResultOfEntity<List<ReviewResponse>>>
    {
        private readonly IUnitOfWork _unitOfWork;

        public GetAllReviewsOfUserHandler(IUnitOfWork unitOfWork) => _unitOfWork = unitOfWork;

        public async Task<ResultOfEntity<List<ReviewResponse>>> Handle(GetAllReviewsOfUser request, CancellationToken cancellationToken)
        {
            var userEntity = await _unitOfWork.UserRepository.GetByIdAsync(request.UserId);

            if (userEntity == null)
            {
                return ResultOfEntity<List<ReviewResponse>>.Failure(HttpStatusCode.NotFound, $"User with id {request.UserId} not found.");
            }

            var reviewEntities = (await _unitOfWork.ReviewRepository.GetAllAsync()).Where(r => r.MovieId == request.UserId).ToList();

            if (reviewEntities == null)
            {
                return ResultOfEntity<List<ReviewResponse>>.Failure(HttpStatusCode.NotFound, $"{userEntity.Id} has not reviewed any movies.");
            }

            return ResultOfEntity<List<ReviewResponse>>.Success(
                HttpStatusCode.OK,
                ReviewMapper.Mapper.Map<List<ReviewResponse>>(reviewEntities)
            );
        }
    }
}
