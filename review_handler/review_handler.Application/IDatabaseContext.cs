using Microsoft.EntityFrameworkCore;
using review_handler.Core.Entities;

namespace review_handler.Application
{
    public interface IDatabaseContext
    {
        public DbSet<User> User { get; }
        public DbSet<Review> Review { get; }
        public DbSet<Movie> Movies { get; }

        public void Save();
    }
}
