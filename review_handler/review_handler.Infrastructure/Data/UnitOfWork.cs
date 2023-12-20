using review_handler.Application;
using review_handler.Core.Entities;
using review_handler.Core.Repositories;
using review_handler.Core.Repositories.Base;
using review_handler.Infrastructure.Repositories;

#nullable disable
namespace review_handler.Infrastructure.Data
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly DatabaseContext _context;

        private IMovieRepository movieRepository;
        private IReviewRepository reviewRepository;
        private IUserRepository userRepository;

        public UnitOfWork(DatabaseContext context) => _context = context;

        public IRepository<Movie> MovieRepository
        {
            get
            {
                movieRepository ??= new MovieRepository(_context);
                return movieRepository;
            }
        }

        public IRepository<Review> ReviewRepository
        {
            get
            {
                reviewRepository ??= new ReviewRepository(_context);
                return reviewRepository;
            }
        }

        public IRepository<User> UserRepository
        {
            get
            {
                userRepository ??= new UserRepository(_context);
                return userRepository;
            }
        }

        public async Task SaveChanges() => await _context.SaveChangesAsync();
    }
}
