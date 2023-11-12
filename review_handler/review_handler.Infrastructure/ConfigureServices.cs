using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using review_handler.Application;
using review_handler.Core.Repositories;
using review_handler.Core.Repositories.Base;
using review_handler.Infrastructure.Data;
using review_handler.Infrastructure.Repositories;
using review_handler.Infrastructure.Repositories.Base;

namespace review_handler.Infrastructure
{
    public static class ConfigureServices
    {
        public static IServiceCollection AddInfrastrutureServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
            services.AddScoped(typeof(IUnitOfWork), typeof(UnitOfWork));
            
            services.AddScoped<IActorRepository, ActorRepository>();
            services.AddScoped<IAwardRepository, AwardRepository>();
            services.AddScoped<IDirectorRepository, DirectorRepository>();
            services.AddScoped<IMovieRepository, MovieRepository>();
            services.AddScoped<IReviewRepository, ReviewRepository>();
            services.AddScoped<IUserRepository, UserRepository>();

            services.AddDbContext<DatabaseContext>
            (m => m.UseSqlServer(configuration.GetConnectionString("MovieMoodDB")), ServiceLifetime.Singleton);

            return services;
        }
    }
}
