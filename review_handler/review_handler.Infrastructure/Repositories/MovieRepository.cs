using review_handler.Core.Entities;
using review_handler.Core.Repositories;
using review_handler.Infrastructure.Data;
using review_handler.Infrastructure.Repositories.Base;

namespace review_handler.Infrastructure.Repositories
{
    public class MovieRepository : Repository<Movie>, IMovieRepository
    {
        public MovieRepository(DatabaseContext context) : base(context) { }
    }
}
