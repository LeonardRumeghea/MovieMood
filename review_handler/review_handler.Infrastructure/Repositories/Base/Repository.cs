using Microsoft.EntityFrameworkCore;
using review_handler.Core.Repositories.Base;
using review_handler.Infrastructure.Data;
#nullable disable
namespace review_handler.Infrastructure.Repositories.Base
{
    public class Repository<T> : IRepository<T> where T : class
    {
        protected readonly DatabaseContext context;

        public Repository(DatabaseContext petOwnerContext) => this.context = petOwnerContext;

        public virtual async Task<IReadOnlyList<T>> GetAllAsync() => await context.Set<T>().ToListAsync();

        public virtual async Task<T> GetByIdAsync(Guid id) => await context.Set<T>().FindAsync(id);


        public async Task<T> AddAsync(T entity)
        {
            await context.Set<T>().AddAsync(entity);
            await context.SaveChangesAsync();

            return entity;
        }

        public async Task DeleteAsync(T entity)
        {
            context.Set<T>().Remove(entity);
            await context.SaveChangesAsync();
        }


        public async Task UpdateAsync(T entity)
        {
            context.Update(entity);
            await context.SaveChangesAsync();
        }

        public async Task SaveChanges() => await context.SaveChangesAsync();
    }
}
