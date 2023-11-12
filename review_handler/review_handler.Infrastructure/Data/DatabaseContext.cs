using Microsoft.EntityFrameworkCore;
using review_handler.Application;
using review_handler.Core.Entities;

/*
 *  - Add-Migration InitialCreate
 *  - Update-Database
 *  
 *  - Remove-Migration
 *  - Drop-Database
 */

namespace review_handler.Infrastructure.Data
{
    public class DatabaseContext : DbContext, IDatabaseContext
    {
        public DatabaseContext(DbContextOptions options) : base(options)
        {
            Database.EnsureCreated();
        }

        public DbSet<User> User => Set<User>();
        public DbSet<Review> Review => Set<Review>();
        public DbSet<Actor> Actors => Set<Actor>();
        public DbSet<Award> Awards => Set<Award>();
        public DbSet<Director> Directors => Set<Director>();
        public DbSet<Movie> Movies => Set<Movie>();

        public void Save() => SaveChanges();
    }
}
