using MediatR;
using review_handler.Core.Helpers;

namespace review_handler.Application.Commands
{
    public class CreateReviewCommand : IRequest<Result>
    {
        public Guid MovieId { get; set; }
        public Guid UserId { get; set; }
        public int MovieRating { get; set; }
        public int? CastRating { get; set; }
        public int? DirectorRating { get; set; }
        public int? GenreRating { get; set; }
        public int? SciptRating { get; set; }
        public string? ReviewText { get; set; }
    }
}
