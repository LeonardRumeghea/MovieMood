using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.EntityFrameworkCore;
using review_handler.API.Controllers;
using review_handler.Infrastructure.Data;

namespace review_handler.Integration.Tests
{
    public class BaseIntegrationTests : IClassFixture<WebApplicationFactory<ReviewController>>
    {
        protected HttpClient HttpClient { get; private set; }

        protected BaseIntegrationTests()
        {
            HttpClient = new WebApplicationFactory<ReviewController>()
                .WithWebHostBuilder(builder => { })
                .CreateClient();
        }
    }
}