using MediatR;
using Microsoft.AspNetCore.Mvc;
using review_handler.Application.Commands;
using review_handler.Application.Queries;

namespace review_handler.API.Controllers
{
    [Route("api/v{version:apiVersion}/reviews")]
    [ApiController]
    [ApiVersion("1.0")]
    public class ReviewController : ControllerBase
    {
        private readonly IMediator _mediator;

        public ReviewController(IMediator mediator) => _mediator = mediator;

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CreateReviewCommand command)
        {
            var result = await _mediator.Send(command);
            return StatusCode((int)result.StatusCode);
        }

        [HttpGet("{id:Guid}")]
        public async Task<IActionResult> GetById(Guid id)
        {
            var result = await _mediator.Send(new GetReviewById() { Id = id });
            return result.IsSuccess
                ? Ok(result.Entity)
                : StatusCode((int)result.StatusCode, result.Message);
        }

        [HttpGet("user/{userId:Guid}")]
        public async Task<IActionResult> GetAllOfUser(Guid userId)
        {
            var result = await _mediator.Send(new GetAllReviewsOfUser() { UserId = userId });
            return result.IsSuccess
                ? Ok(result.Entity)
                : StatusCode((int)result.StatusCode, result.Message);
        }

        [HttpGet("movie/{movieId:Guid}")]
        public async Task<IActionResult> GetAllOfMovie(Guid movieId)
        {
            var result = await _mediator.Send(new GetAllReviewsOfMovie() { MovieId = movieId });
            return result.IsSuccess
                ? Ok(result.Entity)
                : StatusCode((int)result.StatusCode, result.Message);
        }

        [HttpPut("{id:Guid}")]
        public async Task<IActionResult> UpdateReview(UpdateReviewCommand command)
        {
            var result = await _mediator.Send(command);
            return StatusCode((int)result.StatusCode);
        }


        [HttpDelete("{id:Guid}")]
        public async Task<IActionResult> DeleteReview(UpdateReviewCommand command)
        {
            var result = await _mediator.Send(command);
            return StatusCode((int)result.StatusCode);
        }
    }
}
