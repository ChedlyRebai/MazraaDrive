using System;
using System.Linq.Expressions;
using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories;

public class AuditLogRepository : IAuditLogRepository
{
    
    private readonly AppDbContext _context;
    public AuditLogRepository(AppDbContext context)
    {
        _context = context;
    }
    public Task AddAsync(AuditLog entity)
    {
        if (entity == null)
        {
            throw new ArgumentNullException(nameof(entity), "AuditLog cannot be null");
        }

        _context.AuditLogs.Add(entity);
        return _context.SaveChangesAsync();
    }


    public Task DeleteAsync(int id)
    {
        var auditLog = _context.AuditLogs.Find(id);
        if (auditLog == null)
        {
            throw new ArgumentException($"AuditLog with id {id} not found");
        }

        _context.AuditLogs.Remove(auditLog);
        return _context.SaveChangesAsync();
    }

    public async Task<IReadOnlyList<AuditLog>> GetAllAsync()
    {
        var auditLogs = await _context.AuditLogs.ToListAsync();
        if (auditLogs == null || !auditLogs.Any())
        {
            throw new InvalidOperationException("No AuditLogs found");
        }
        return auditLogs;
    }

    
    public Task<AuditLog> GetByIdAsync(int id)
    {
        var auditLog = _context.AuditLogs.FirstOrDefaultAsync(log => log.Id == id);
        if (auditLog == null)
        {
            throw new ArgumentException($"AuditLog with id {id} not found");
        }
        return auditLog;
    }

    

    public Task UpdateAsync(AuditLog entity)
    {
        if (entity == null)
        {
            throw new ArgumentNullException(nameof(entity), "AuditLog cannot be null");
        }

        _context.AuditLogs.Update(entity);
        return _context.SaveChangesAsync();
    }
}
