using AutoMapper;
using review_handler.Application.Commands;
using review_handler.Application.Response;
using review_handler.Core.Entities;

namespace review_handler.Application.Mappers
{
    public class ReviewMapperProfile : Profile
    {
        public ReviewMapperProfile()
        {
            CreateMap<Review, ReviewResponse>().ReverseMap();
            CreateMap<Review, CreateReviewCommand>().ReverseMap();
        }
    }
}
