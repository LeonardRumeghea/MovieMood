using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.EntityFrameworkCore;
using review_handler.API.Controllers;
using review_handler.Infrastructure.Data;

namespace review_handler.Integration.Tests
{
    public class BaseIntegrationTests : IClassFixture<WebApplicationFactory<ReviewController>>
    {
        protected HttpClient HttpClient { get; private set; }

        protected readonly WebApplicationFactory<ReviewController> _factory;
        protected BaseIntegrationTests(WebApplicationFactory<ReviewController> factory)
        {
            _factory = factory;

            HttpClient = new WebApplicationFactory<ReviewController>()
                .WithWebHostBuilder(builder => { })
                .CreateClient();
        }
    }
}