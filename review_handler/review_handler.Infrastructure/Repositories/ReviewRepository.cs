using Microsoft.EntityFrameworkCore;
using review_handler.Core.Entities;
using review_handler.Core.Repositories;
using review_handler.Infrastructure.Data;
using review_handler.Infrastructure.Repositories.Base;

namespace review_handler.Infrastructure.Repositories
{
    public class ReviewRepository : Repository<Review>, IReviewRepository
    {
        public ReviewRepository(DatabaseContext context) : base(context) { }

        public async Task<IEnumerable<Review>> GetAllReviewsOfUser(Guid movieId)
        {
            return await context.Review.Where(r => r.MovieId == movieId).ToListAsync();
        }

        public async Task<IEnumerable<Review>> GetAllReviewsOfMovie(Guid userId)
        {
            return await context.Review.Where(r => r.UserId == userId).ToListAsync();
        }

        //public async Task<Review> GetReviewById(Guid id)
        //{
        //    return await context.Review.FirstOrDefaultAsync(r => r.Id == id);
        //}
    }
}
