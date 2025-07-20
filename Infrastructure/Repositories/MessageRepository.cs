using System;
using System.Linq.Expressions;
using Core.Entities;
using Core.Interfaces;

namespace Infrastructure.Repositories;

public class MessageRepository : IMessageRepository

{
    public Task AddAsync(Message entity)
    {
        throw new NotImplementedException();
    }

    public Task<int> CountAsync()
    {
        throw new NotImplementedException();
    }

    public Task DeleteAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<Message>> GetAllAsync()
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<Message>> GetAllAsync(params Expression<Func<Message, object>>[] includes)
    {
        throw new NotImplementedException();
    }

    public Task<Message> GetByIdAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<Message> GetByIdAsync(int id, params Expression<Func<Message, object>>[] includes)
    {
        throw new NotImplementedException();
    }

    public Task UpdateAsync(Message entity)
    {
        throw new NotImplementedException();
    }
}
