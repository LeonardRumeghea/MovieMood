using review_handler.Core.Entities;
using review_handler.Core.Repositories.Base;

namespace review_handler.Application
{
    public interface IUnitOfWork
    {
        IRepository<Actor> ActorRepository { get; }
        IRepository<Award> AwardRepository { get; }
        IRepository<Director> DirectorRepository { get; }
        IRepository<Movie> MovieRepository { get; }
        IRepository<Review> ReviewRepository { get; }
        IRepository<User> UserRepository { get; }

        Task SaveChanges();
    }
}
