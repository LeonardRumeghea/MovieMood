﻿using MediatR;
using review_handler.Application.Commands;
using review_handler.Application.Mappers;
using review_handler.Application.Response;
using review_handler.Core.Entities;
using review_handler.Core.Helpers;
using System.Net;

namespace review_handler.Application.Handlers
{
    public class CreateReviewCommandHandler : IRequestHandler<CreateReviewCommand, ResultOfEntity<ReviewResponse>>
    {
        private readonly IUnitOfWork _unitOfWork;

        public CreateReviewCommandHandler(IUnitOfWork unitOfWork) => _unitOfWork = unitOfWork;

        public async Task<ResultOfEntity<ReviewResponse>> Handle(CreateReviewCommand request, CancellationToken cancellationToken)
        {

            var reviewEntity = ReviewMapper.Mapper.Map<Review>(request);

            var review = await _unitOfWork.ReviewRepository.AddAsync(reviewEntity);
            await _unitOfWork.SaveChanges();

            return ResultOfEntity<ReviewResponse>.Success(HttpStatusCode.Created, ReviewMapper.Mapper.Map<ReviewResponse>(review));
        }
    }
}
