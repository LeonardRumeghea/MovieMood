using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.EntityFrameworkCore;
using review_handler.API.Controllers;
using review_handler.Infrastructure.Data;

namespace review_handler.Integration.Tests
{
    public class BaseIntegrationTests : IClassFixture<WebApplicationFactory<ReviewController>>
    {
        private readonly DbContextOptions<DatabaseContext> _options = new DbContextOptionsBuilder<DatabaseContext>()
            .UseSqlServer("Server=(localdb)\\mssqllocaldb; Database=MovieMoodDB_Tests;Trusted_Connection=True; MultipleActiveResultSets=True").Options;

        protected HttpClient HttpClient { get; private set; }

        private readonly DatabaseContext _databaseContext;
        protected BaseIntegrationTests()
        {
            HttpClient = new WebApplicationFactory<ReviewController>()
                .WithWebHostBuilder(builder => { })
                .CreateClient();
            _databaseContext = new DatabaseContext(_options);
        }

        protected void CleanDatabases()
        {
            _databaseContext.Review.RemoveRange(_databaseContext.Review.ToList());
            _databaseContext.SaveChanges();
        }
    }
}