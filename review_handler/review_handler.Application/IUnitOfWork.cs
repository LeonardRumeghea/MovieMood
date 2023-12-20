using review_handler.Core.Entities;
using review_handler.Core.Repositories.Base;

namespace review_handler.Application
{
    public interface IUnitOfWork
    {
        IRepository<Movie> MovieRepository { get; }
        IRepository<Review> ReviewRepository { get; }
        IRepository<User> UserRepository { get; }

        Task SaveChanges();
    }
}
