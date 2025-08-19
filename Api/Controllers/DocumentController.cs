using Api.Helper;
using AutoMapper;
using Core.DTO;
using Core.DTOs;
using Core.Entities;
using Core.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class DocumentController : BaseController
    {
        public readonly IAuditLogRepository _auditLogger;
        private readonly IWebHostEnvironment _environment;
        private const long MaxFileSize = 100 * 1024 * 1024; // 100MB
        private readonly string[] AllowedFileTypes = { ".pdf", ".doc", ".docx", ".xls", ".xlsx", ".ppt", ".pptx", ".txt", ".jpg", ".jpeg", ".png", ".gif" };

        public DocumentController( IAuditLogRepository auditLogger,IUnitOfWork unitOfWork, IMapper mapper, IWebHostEnvironment environment) 
            : base(unitOfWork, mapper)
        {
            _auditLogger = auditLogger;
            _environment = environment;
        }

        [HttpGet("test")]
        public string TestApi()
        {
            return "Document API is working!";
        }


        [HttpGet]
        public async Task<ActionResult<DocumentPagedResult>> GetDocuments([FromQuery] DocumentFilterDto filter)
        {
            try
            {
                var pagedDocuments = await _unitOfWork.DocumentRepository.GetPagedAsync(filter);
                var documentDtos = _mapper.Map<IEnumerable<DocumentDto>>(pagedDocuments.Data);
                Console.WriteLine($"Total Records: {pagedDocuments.TotalRecords}, Page Size: {pagedDocuments.PageSize}, Page Number: {pagedDocuments.PageNumber}");
                var result = new DocumentPagedResult
                {
                    Data = documentDtos,
                    PageNumber = pagedDocuments.PageNumber,
                    PageSize = pagedDocuments.PageSize,
                    TotalRecords = pagedDocuments.TotalRecords,
                    TotalPages = pagedDocuments.TotalPages,
                    HasPreviousPage = pagedDocuments.HasPreviousPage,
                    HasNextPage = pagedDocuments.HasNextPage,
                    Search = pagedDocuments.Search,
                    SortBy = pagedDocuments.SortBy,
                    SortDirection = pagedDocuments.SortDirection,
                    TotalDocuments = pagedDocuments.TotalRecords,
                    TotalUsers = 100
                };
                Console.WriteLine("result:****************************************");

                // Log the retrieval of documents
                //await _auditLogger.LogAsync("GetDocuments", "Retrieved paged list of documents", "10", "Document");
                ////await _auditLogger.LogAsync("GetDocuments", "Retrieved paged list of documents", "10", "Document");
                Console.WriteLine(result.Data);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<DocumentDto>> GetDocument(int id)
        {
            try
            {
                var document = await _unitOfWork.DocumentRepository.GetByIdWithDetailsAsync(id);
                if (document == null)
                    return NotFound(new { success = false, message = "Document not found" });

                var documentDto = _mapper.Map<DocumentDto>(document);
                //await _auditLogger.LogAsync("GetDocument", "Retrieved document details", "10", "Document");
                return Ok(new { success = true, data = documentDto });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("folder/{folderId}")]
        public async Task<ActionResult<PagedResult<DocumentDto>>> GetDocumentsByFolder(
            int folderId, 
            [FromQuery] PaginationParams pagination)
        {
            try
            {
                var pagedDocuments = await _unitOfWork.DocumentRepository.GetByFolderPagedAsync(folderId, pagination);
                var documentDtos = _mapper.Map<IEnumerable<DocumentDto>>(pagedDocuments.Data);

                var result = documentDtos.ToPagedResult(
                    pagedDocuments.PageNumber,
                    pagedDocuments.PageSize,
                    pagedDocuments.TotalRecords,
                    pagedDocuments.Search,
                    pagedDocuments.SortBy,
                    pagedDocuments.SortDirection
                );

                //await _auditLogger.LogAsync("GetDocumentsByFolder", "Retrieved document by folder", "10", "Document");
                return Ok(new { success = true, data = result });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("user/{userId}")]
        public async Task<ActionResult<PagedResult<DocumentDto>>> GetDocumentsByUser(
            string userId, 
            [FromQuery] PaginationParams pagination)
        {
            try
            {
                // Authorization: Users can only view their own documents unless they're Admin/Manager
                var currentUserId = "10";
                if (userId != currentUserId && !User.IsInRole("Admin") && !User.IsInRole("Manager"))
                {
                    return Forbid();
                }

                var pagedDocuments = await _unitOfWork.DocumentRepository.GetByUserPagedAsync(userId, pagination);
                var documentDtos = _mapper.Map<IEnumerable<DocumentDto>>(pagedDocuments.Data);

                var result = documentDtos.ToPagedResult(
                    pagedDocuments.PageNumber,
                    pagedDocuments.PageSize,
                    pagedDocuments.TotalRecords,
                    pagedDocuments.Search,
                    pagedDocuments.SortBy,
                    pagedDocuments.SortDirection
                );

                //await _auditLogger.LogAsync("GetDocumentsByUser", "Retrieved document by user", "10", "Document");
                return Ok(new { success = true, data = result });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        
        /*[HttpGet]
        public async Task<ActionResult<IEnumerable<DocumentDto>>> GetDocuments()
        {
            try
            {
                var documents = await _unitOfWork.DocumentRepository.GetAllAsync();
                var documentDtos = _mapper.Map<IEnumerable<DocumentDto>>(documents);
                return Ok(documentDtos );
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(500, ex.Message));
            }
        }*/

       /* [HttpGet("{id}")]
        public async Task<ActionResult<DocumentDto>> GetDocument(int id)
        {
            try
            {
                var document = await _unitOfWork.DocumentRepository.GetByIdAsync(id);
                if (document == null)
                    return NotFound(new { success = false, message = "Document not found" });

                var documentDto = _mapper.Map<DocumentDto>(document);
                return Ok(documentDto);
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(500, ex.Message));
            }
        }*/

     /*   [HttpGet("folder/{folderId}")]
        public async Task<ActionResult<IEnumerable<DocumentDto>>> GetDocumentsByFolder(int folderId)
        {
            try
            {
                var documents = await _unitOfWork.DocumentRepository.GetByFolderAsync(folderId);
                var documentDtos = _mapper.Map<IEnumerable<DocumentDto>>(documents);
                return Ok(documentDtos);
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(500, ex.Message));
            }
        }*/

       /* [HttpGet("user/{userId}")]
        public async Task<ActionResult<IEnumerable<DocumentDto>>> GetDocumentsByUser(string userId)
        {
            try
            {
                var documents = await _unitOfWork.DocumentRepository.GetByUserAsync(userId);
                var documentDtos = _mapper.Map<IEnumerable<DocumentDto>>(documents);
                return Ok(documentDtos);
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(500, ex.Message));
            }
        }*/

        [HttpGet("validated")]
        public async Task<ActionResult<IEnumerable<DocumentDto>>> GetValidatedDocuments()
        {
            try
            {
                var documents = await _unitOfWork.DocumentRepository.GetValidatedDocumentsAsync();
                var documentDtos = _mapper.Map<IEnumerable<DocumentDto>>(documents);
                //await _auditLogger.LogAsync("GetValidatedDocuments", "Retrieved validated documents", "10", "Document");
                return Ok(documentDtos);
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(500, ex.Message));
            }
        }

        [HttpGet("pending-validation")]
        public async Task<ActionResult<IEnumerable<DocumentDto>>> GetPendingValidation()
        {
            try
            {
                var documents = await _unitOfWork.DocumentRepository.GetPendingValidationAsync();
                var documentDtos = _mapper.Map<IEnumerable<DocumentDto>>(documents);
                //await _auditLogger.LogAsync("GetPendingValidation", "Retrieved documents pending validation", "10", "Document");
                return Ok(documentDtos);
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(500, ex.Message));
            }
        }

        [HttpPost("upload")]
        public async Task<ActionResult<DocumentDto>> UploadDocument([FromForm] DocumentUploadDto uploadDto)
        {
            try
            {
                if (uploadDto?.File == null)
                    return BadRequest(new { success = false, message = "File is required" });

                if (!ModelState.IsValid)
                    return BadRequest(new { success = false, message = "Invalid data", errors = ModelState });

                // Validate file size
                if (uploadDto.File.Length > MaxFileSize)
                    return BadRequest(new { success = false, message = $"File size cannot exceed {MaxFileSize / (1024 * 1024)}MB" });

                // Validate file type
                var fileExtension = Path.GetExtension(uploadDto.File.FileName).ToLower();
                if (!AllowedFileTypes.Contains(fileExtension))
                    return BadRequest(new { success = false, message = "File type not allowed" });

                // Verify folder exists
                var folder = await _unitOfWork.FolderRepository.GetByIdAsync(uploadDto.FolderId);
                if (folder == null)
                    return BadRequest(new { success = false, message = "Folder not found" });

                // Check if document with same name exists in folder
                var existingDocument = await _unitOfWork.DocumentRepository.GetByNameAsync(
                    Path.GetFileNameWithoutExtension(uploadDto.File.FileName), uploadDto.FolderId);
                if (existingDocument != null)
                    return BadRequest(new { success = false, message = "Document with this name already exists in this folder" });

                // Create uploads directory if it doesn't exist
                var uploadsPath = Path.Combine(_environment.WebRootPath ?? _environment.ContentRootPath, "uploads");
                Directory.CreateDirectory(uploadsPath);

                // Generate unique filename
                var fileName = $"{Guid.NewGuid()}{fileExtension}";
                var filePath = Path.Combine(uploadsPath, fileName);

                // Save file
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await uploadDto.File.CopyToAsync(stream);
                }

                // Create document entity
                var document = new Document
                {
                    Name = Path.GetFileNameWithoutExtension(uploadDto.File.FileName),
                    
                   // Description = uploadDto.Description,
                    FileType = fileExtension.TrimStart('.'),
                    FileSize = uploadDto.File.Length,
                    StoragePath = fileName,
                    FolderId = uploadDto.FolderId,
                    DepartmentId= 10,
                    UploadedById = "10",
                    Version = 1,
                    IsValidated = false,
                    
                };

                var createdDocument = await _unitOfWork.DocumentRepository.AddAsync(document);
                await _unitOfWork.SaveChangesAsync();

                var documentDto = _mapper.Map<DocumentDto>(createdDocument);
                // Log the document upload
                //await _auditLogger.LogAsync("UploadDocument", "Uploaded new document", "10", "Document");
                return CreatedAtAction(nameof(GetDocument), new { id = documentDto.Id },
                    new { success = true, data = documentDto });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<DocumentDto>> UpdateDocument(int id, [FromBody] UpdateDocumentDto updateDocumentDto)
        {
            try
            {
                if (updateDocumentDto == null)
                    return BadRequest(new { success = false, message = "Update data is required" });

                var existingDocument = await _unitOfWork.DocumentRepository.GetByIdAsync(id);
                if (existingDocument == null)
                    return NotFound(new { success = false, message = "Document not found" });

                // Verify new folder exists (if folder is being changed)
                if (updateDocumentDto.FolderId.HasValue && updateDocumentDto.FolderId != existingDocument.FolderId)
                {
                    var folder = await _unitOfWork.FolderRepository.GetByIdAsync(updateDocumentDto.FolderId.Value);
                    if (folder == null)
                        return BadRequest(new { success = false, message = "Target folder not found" });
                }

                _mapper.Map(updateDocumentDto, existingDocument);
                await _unitOfWork.DocumentRepository.UpdateAsync(existingDocument);
                await _unitOfWork.SaveChangesAsync();

                var documentDto = _mapper.Map<DocumentDto>(existingDocument);

                //await _auditLogger.LogAsync("UpdateDocument", "Updated document details", "10", "Document");
                return Ok(documentDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpPut("{id}/validate")]
        public async Task<ActionResult> ValidateDocument(int id, [FromBody] bool isValid)
        {
            try
            {
                var result = await _unitOfWork.DocumentRepository.ValidateDocumentAsync(id, isValid);
                if (!result)
                    return NotFound(new { success = false, message = "Document not found" });

                await _unitOfWork.SaveChangesAsync();
                //await _auditLogger.LogAsync("ValidateDocument", "Validated document", "10", "Document");
                return Ok(new { success = true, message = $"Document {(isValid ? "validated" : "rejected")} successfully" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteDocument(int id)
        {
            try
            {
                var document = await _unitOfWork.DocumentRepository.GetByIdAsync(id);
                if (document == null)
                    return NotFound(new { success = false, message = "Document not found" });

                // Delete physical file
                if (System.IO.File.Exists(document.StoragePath))
                {
                    System.IO.File.Delete(document.StoragePath);
                }

                await _unitOfWork.DocumentRepository.DeleteAsync(id);
                await _unitOfWork.SaveChangesAsync();

                //await _auditLogger.LogAsync("DeleteDocument", "Deleted document", "10", "Document");
                return Ok(new ResponseAPI(200, "Document deleted successfully"));
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpGet("{id}/download")]
        public async Task<ActionResult> DownloadDocument(int id)
        {
            try
            {
                var document = await _unitOfWork.DocumentRepository.GetByIdAsync(id);
                if (document == null)
                    return NotFound(new { success = false, message = "Document not found" });

                if (!System.IO.File.Exists(document.StoragePath))
                    return NotFound(new { success = false, message = "File not found on server" });

                var memory = new MemoryStream();
                using (var stream = new FileStream(document.StoragePath, FileMode.Open))
                {
                    await stream.CopyToAsync(memory);
                }
                memory.Position = 0;

                var contentType = GetContentType(document.FileType);
                var fileName = $"{document.Name}.{document.FileType}";

                //await _auditLogger.LogAsync("DownloadDocument", "Downloaded document", "10", "Document");
                return File(memory, contentType, fileName);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpGet("stats")]
        public async Task<ActionResult> GetDocumentStats()
        {
            try
            {
                var totalSize = await _unitOfWork.DocumentRepository.GetTotalFileSizeAsync();
                var totalCount = (await _unitOfWork.DocumentRepository.GetAllAsync()).Count;
                var validatedCount = (await _unitOfWork.DocumentRepository.GetValidatedDocumentsAsync()).Count;
                var pendingCount = (await _unitOfWork.DocumentRepository.GetPendingValidationAsync()).Count;

                var stats = new
                {
                    TotalDocuments = totalCount,
                    ValidatedDocuments = validatedCount,
                    PendingValidation = pendingCount,
                    TotalFileSize = totalSize,
                    TotalFileSizeFormatted = FormatFileSize(totalSize)
                };
                //await _auditLogger.LogAsync("GetDocumentStats", "Retrieved document statistics", "10", "Document");
                return Ok(stats);
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(500, ex.Message));
            }
        }

        private string GetCurrentUserId()
        {
            return User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? "system";
        }

        private string GetContentType(string fileExtension)
        {
            return fileExtension.ToLower() switch
            {
                "pdf" => "application/pdf",
                "doc" => "application/msword",
                "docx" => "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                "xls" => "application/vnd.ms-excel",
                "xlsx" => "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                "ppt" => "application/vnd.ms-powerpoint",
                "pptx" => "application/vnd.openxmlformats-officedocument.presentationml.presentation",
                "txt" => "text/plain",
                "jpg" or "jpeg" => "image/jpeg",
                "png" => "image/png",
                "gif" => "image/gif",
                _ => "application/octet-stream"
            };
        }

        private string FormatFileSize(long bytes)
        {
            if (bytes >= 1073741824)
                return $"{bytes / 1073741824.0:F2} GB";
            else if (bytes >= 1048576)
                return $"{bytes / 1048576.0:F2} MB";
            else if (bytes >= 1024)
                return $"{bytes / 1024.0:F2} KB";
            else
                return $"{bytes} bytes";
        }
    }
}