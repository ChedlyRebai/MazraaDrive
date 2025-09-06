using System;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Core.Entities;
using Core.Interfaces;

using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;

namespace Infrastructure.Repositories.Service
{
    public class DocumentAccessService : IDocumentAccessService
    {
        private readonly IMemoryCache _cache;
        private readonly IConfiguration _configuration;
        private readonly IGenericRepository<AccessRequest> _accessRequestRepository;

        public DocumentAccessService(IMemoryCache cache, IConfiguration configuration,
                                   IGenericRepository<AccessRequest> accessRequestRepository)
        {
            _cache = cache;
            _configuration = configuration;
            _accessRequestRepository = accessRequestRepository;
        }

        public async Task<string> GenerateAccessLink(int documentId, string userId,
                                                   TimeSpan validityDuration,
                                                   bool canRead, bool canUpdate, bool canDelete
                                                   )
        {
            // Generate secure token
            var token = GenerateSecureToken();
            var expiresAt = DateTime.UtcNow.Add(validityDuration);

            var accessLink = new DocumentAccessLink
            {
                Token = token,
                DocumentId = documentId,
                UserId = userId,
                ExpiresAt = expiresAt,
                CanRead = canRead,
                CanUpdate = canUpdate,
                CanDelete = canDelete,
                CreatedAt = DateTime.UtcNow,
              
            };

            // Store in cache with expiration
            var cacheKey = $"doc_access_{token}";
            _cache.Set(cacheKey, accessLink, expiresAt);

            // Also store in database for audit purposes (optional)
            await LogAccessLinkGeneration(documentId, userId, token, expiresAt,
                                        canRead, canUpdate, canDelete);

            // Generate the actual URL
            var baseUrl = _configuration["AppSettings:BaseUrl"] ?? "https://yourapp.com";
            return $"{baseUrl}/api/documents/access/{token}";
        }

        public async Task<DocumentAccessLink?> ValidateAccessLink(string token)
        {
            var cacheKey = $"doc_access_{token}";

            if (_cache.TryGetValue(cacheKey, out DocumentAccessLink accessLink))
            {
                // Check if token is expired
                if (accessLink.ExpiresAt < DateTime.UtcNow)
                {
                    _cache.Remove(cacheKey);
                    return null;
                }
                return accessLink;
            }
            return null;
        }

        public async Task<bool> HasPermission(string token, string requiredPermission)
        {
            var accessLink = await ValidateAccessLink(token);
            if (accessLink == null) return false;

            return requiredPermission.ToLower() switch
            {
                "read" => accessLink.CanRead,
                "update" => accessLink.CanUpdate,
                "delete" => accessLink.CanDelete,
                _ => false
            };
        }

        public async Task RevokeAccessLink(string token)
        {
            var cacheKey = $"doc_access_{token}";
            _cache.Remove(cacheKey);

            // Also update database record if you're storing them
            await UpdateAccessLinkStatus(token, "Revoked");
        }

        private string GenerateSecureToken()
        {
            using var rng = RandomNumberGenerator.Create();
            var tokenData = new byte[32];
            rng.GetBytes(tokenData);
            return Convert.ToBase64String(tokenData)
                         .Replace("+", "-")
                         .Replace("/", "_")
                         .Replace("=", "");
        }

        private async Task LogAccessLinkGeneration(int documentId, string userId, string token,
                                                 DateTime expiresAt, bool canRead,
                                                 bool canUpdate, bool canDelete)
        {
            // Implement database logging if needed
            // This could be stored in a separate AccessLinkLogs table
        }

        private async Task UpdateAccessLinkStatus(string token, string status)
        {
            // Update status in database if you're storing access links
        }
    }
}