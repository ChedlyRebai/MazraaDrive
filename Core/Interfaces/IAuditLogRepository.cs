using System;
using Core.DTOs;
using Core.Entities;

namespace Core.Interfaces;

public interface IAuditLogRepository:IGenericRepository<AuditLog>
{
     Task<AuditLogDTO> CreateAuditLogAsync(AuditLogDTO auditLogDto);
        Task<AuditLogDTO> GetAuditLogByIdAsync(int id);
        Task<IEnumerable<AuditLogDTO>> GetAllAuditLogsAsync();
        Task<AuditLogDTO> UpdateAuditLogAsync(int id, AuditLogDTO auditLogDto);
        Task<bool> DeleteAuditLogAsync(int id);
}
