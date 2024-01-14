using Microsoft.AspNetCore.Mvc.Testing;
using review_handler.API.Controllers;
using review_handler.Application.Commands;
using review_handler.Application.Response;

#nullable disable
namespace review_handler.Integration.Tests
{
    public class ReviewTests : BaseIntegrationTests
    {
        private const string ApiURL = "v1/api/reviews";

        protected ReviewTests(WebApplicationFactory<ReviewController> factory) : base(factory) { }

        [Fact]
        public async Task When_CreateReview_Then_ShouldSaveIt()
        {
            // Act
            var response = await HttpClient.PostAsJsonAsync(ApiURL, CreateReviewSUT());

            // Assert
            response.EnsureSuccessStatusCode();
            response.StatusCode.Should().Be(HttpStatusCode.Created);

            //CleanUp
            var review = await response.Content.ReadFromJsonAsync<ReviewResponse>();
            await HttpClient.DeleteAsync($"{ApiURL}/{review.Id}");
        }

        [Fact]
        public async Task When_GetReviewById_Then_ShouldReturnIt()
        {
            // Arrange
            var review = CreateReviewSUT();
            var response = await HttpClient.PostAsJsonAsync(ApiURL, review);
            var reviewResponse = await response.Content.ReadFromJsonAsync<ReviewResponse>();

            // Act
            response = await HttpClient.GetAsync($"{ApiURL}/{reviewResponse.Id}");

            // Assert
            response.EnsureSuccessStatusCode();
            response.StatusCode.Should().Be(HttpStatusCode.OK);

            //CleanUp
            await HttpClient.DeleteAsync($"{ApiURL}/{reviewResponse.Id}");
        }

        [Fact]
        public async Task When_GetReviewByInvalidId_Then_ShouldReturnNotFound()
        {
            {
                // Act
                var response = await HttpClient.GetAsync($"{ApiURL}/{Guid.NewGuid()}");

                // Assert
                response.StatusCode.Should().Be(HttpStatusCode.NotFound);
            }
        }

        [Fact]
        public async Task When_DeleteReview_Then_ShouldDeleteIt()
        {
            // Arrange
            var review = CreateReviewSUT();
            var response = await HttpClient.PostAsJsonAsync(ApiURL, review);
            var reviewResponse = await response.Content.ReadFromJsonAsync<ReviewResponse>();

            // Act
            response = await HttpClient.DeleteAsync($"{ApiURL}/{reviewResponse.Id}");

            // Assert
            response.EnsureSuccessStatusCode();
            response.StatusCode.Should().Be(HttpStatusCode.OK);
        }

        [Fact]
        public async Task When_DeleteReviewWithInvalidId_Then_ShouldReturnNotFound()
        {
            // Act
            var response = await HttpClient.DeleteAsync($"{ApiURL}/{Guid.NewGuid()}");

            // Assert
            response.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async Task When_UpdateReview_Then_ShouldUpdateIt()
        {
            // Arrange
            var review = CreateReviewSUT();
            var response = await HttpClient.PostAsJsonAsync(ApiURL, review);
            var reviewResponse = await response.Content.ReadFromJsonAsync<ReviewResponse>();

            // Act
            response = await HttpClient.PutAsJsonAsync($"{ApiURL}/{reviewResponse.Id}", UpdateReviewSUT(reviewResponse.Id));

            // Assert
            response.EnsureSuccessStatusCode();
            response.StatusCode.Should().Be(HttpStatusCode.Created);

            //CleanUp
            await HttpClient.DeleteAsync($"{ApiURL}/{reviewResponse.Id}");
        }

        [Fact]
        public async Task When_UpdateReviewWithInvalidId_Then_ShouldReturnNotFound()
        {
            // Arrange

            // Act
            var response = await HttpClient.PutAsJsonAsync($"{ApiURL}/{Guid.NewGuid()}", UpdateReviewSUT(Guid.NewGuid()));

            // Assert
            response.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async Task When_GetAllReviewsOfUser_Then_ShouldReturnThem()
        {
            // Arrange
            var review = CreateReviewSUT();
            var response = await HttpClient.PostAsJsonAsync(ApiURL, review);
            var reviewResponse = await response.Content.ReadFromJsonAsync<ReviewResponse>();

            // Act
            response = await HttpClient.GetAsync($"{ApiURL}/user/{reviewResponse.UserId}");

            // Assert
            response.EnsureSuccessStatusCode();
            response.StatusCode.Should().Be(HttpStatusCode.OK);

            //CleanUp
            await HttpClient.DeleteAsync($"{ApiURL}/{reviewResponse.Id}");
        }

        [Fact]
        public async Task When_GetAllReviewsOfUserWithInvalidId_Then_ShouldReturnNotFound()
        {
            // Act
            var response = await HttpClient.GetAsync($"{ApiURL}/user/{Guid.NewGuid()}");

            // Assert
            response.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async Task When_GetAllReviewsOfMovie_Then_ShouldReturnThem()
        {
            // Arrange
            var review = CreateReviewSUT();
            var response = await HttpClient.PostAsJsonAsync(ApiURL, review);
            var reviewResponse = await response.Content.ReadFromJsonAsync<ReviewResponse>();

            // Act
            response = await HttpClient.GetAsync($"{ApiURL}/movie/{reviewResponse.MovieId}");

            // Assert
            response.EnsureSuccessStatusCode();
            response.StatusCode.Should().Be(HttpStatusCode.OK);

            //CleanUp
            await HttpClient.DeleteAsync($"{ApiURL}/{reviewResponse.Id}");
        }

        [Fact]
        public async Task When_GetAllReviewsOfMovieWithInvalidId_Then_ShouldReturnNotFound()
        {
            // Act
            var response = await HttpClient.GetAsync($"{ApiURL}/movie/{Guid.NewGuid()}");

            // Assert
            response.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        private static CreateReviewCommand CreateReviewSUT()
        {
            return new CreateReviewCommand()
            {
                MovieId = Guid.NewGuid(),
                UserId = Guid.NewGuid(),
                CastRating = 5,
                DirectorRating = 5,
                GenreRating = 5,
                SciptRating = 5,
                MovieRating = 5,
                ReviewText = "This is a test review"
            };
        }

        private static UpdateReviewCommand UpdateReviewSUT(Guid id)
        {
            return new UpdateReviewCommand()
            {
                Id = id,
                CastRating = 4,
                DirectorRating = 4,
                GenreRating = 4,
                SciptRating = 4,
                MovieRating = 4,
                ReviewText = "This is a test review updated"
            };
        }
    }
}
