using System;
using Core.DTO;
using Core.DTOs;
using Core.Entities;


namespace Core.Interfaces;


public interface IDocumentAccessService
{
    Task<string> GenerateAccessLink(int documentId, string userId, TimeSpan validityDuration,
                                  bool canRead, bool canUpdate, bool canDelete);
    Task<DocumentAccessLink?> ValidateAccessLink(string token);
    Task<bool> HasPermission(string token, string requiredPermission);
    Task RevokeAccessLink(string token);
}