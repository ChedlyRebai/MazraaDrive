using System.Threading.Tasks;
using Core.Interfaces;
using Core.Entities;
using Microsoft.EntityFrameworkCore;
using Infrastructure.Data;

namespace Infrastructure.Services;
public class AccessRightService : IAccessRightService
{
    private readonly AppDbContext _ctx;
    public AccessRightService(AppDbContext ctx) => _ctx = ctx;

    public async Task GrantAsync(string userId, int documentId, bool read, bool write, bool delete)
    {
        var existing = await _ctx.AccessRights
            .FirstOrDefaultAsync(r => r.UserId == userId && r.DocumentId == documentId);
        if (existing == null)
        {
            existing = new AccessRight
            {
                UserId = userId,
                DocumentId = documentId,
                CanRead = read,
                CanCreate = write,
                CanUpdate = write,
                CanDelete = delete
            };
            await _ctx.AccessRights.AddAsync(existing);
        }
        else
        {
            existing.CanRead |= read;
            existing.CanCreate |= write;
            existing.CanUpdate |= write;
            existing.CanDelete |= delete;
        }
        await _ctx.SaveChangesAsync();
    }
}