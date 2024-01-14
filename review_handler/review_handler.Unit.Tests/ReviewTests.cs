using review_handler.Core.Entities;

#nullable disable
namespace review_handler.Unit.Tests
{
    public class ReviewTests
    {
        [Fact]
        public void When_CreateReview_Then_ShouldSaveIt()
        {
            // Act
            var sut = CreateReviewSUT();

            // Arrange
            var result = Review.Create(sut.Item1, sut.Item2, sut.Item3);

            // Assert
            result.IsSuccess.Should().BeTrue();
            result.Entity.Should().NotBeNull();
            result.Entity.MovieId.Should().Be(sut.Item1);
            result.Entity.UserId.Should().Be(sut.Item2);
            result.Entity.MovieRating.Should().Be(sut.Item3);
        }

        private static Tuple<Guid, Guid, int> CreateReviewSUT()
        {
            return new Tuple<Guid, Guid, int>(new Guid(), new Guid(), 8);
        }
    }
}