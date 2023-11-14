using Microsoft.EntityFrameworkCore;
using review_handler.Core.Entities;

namespace review_handler.Application
{
    public interface IDatabaseContext
    {
        public DbSet<User> User { get; }
        public DbSet<Review> Review { get; }
        public DbSet<Actor> Actors { get; }
        public DbSet<Award> Awards { get; }
        public DbSet<Director> Directors { get; }
        public DbSet<Movie> Movies { get; }

        public void Save();
    }
}
