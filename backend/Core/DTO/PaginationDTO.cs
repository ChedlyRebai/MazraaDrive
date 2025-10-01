// Add to Core/DTOs/PaginationDto.cs
using System.ComponentModel.DataAnnotations;

namespace Core.DTO
{
    public class PaginationParams
    {
        private const int MaxPageSize = 100;
        private int _pageSize = 10;

        [Range(1, int.MaxValue, ErrorMessage = "Page number must be greater than 0")]
        public int PageNumber { get; set; } = 1;

        [Range(1, MaxPageSize, ErrorMessage = "Page size must be between 1 and 100")]
        public int PageSize
        {
            get => _pageSize;
            set => _pageSize = value > MaxPageSize ? MaxPageSize : value;
        }

        public string? Search { get; set; }
        public string? SortBy { get; set; }
        public string? SortDirection { get; set; } = "asc"; // asc or desc
    }

    public class PagedResult<T>
    {
        public IEnumerable<T> Data { get; set; } = new List<T>();
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
        public int TotalRecords { get; set; }
        public int TotalPages { get; set; }
        public bool HasPreviousPage { get; set; }
        public bool HasNextPage { get; set; }
        public string? Search { get; set; }
        public string? SortBy { get; set; }
        public string? SortDirection { get; set; }
    }

    public static class PagedResultExtensions
    {
        public static PagedResult<T> ToPagedResult<T>(
            this IEnumerable<T> source,
            int pageNumber,
            int pageSize,
            int totalRecords,
            string? search = null,
            string? sortBy = null,
            string? sortDirection = null)
        {
            var totalPages = (int)Math.Ceiling((double)totalRecords / pageSize);

            return new PagedResult<T>
            {
                Data = source,
                PageNumber = pageNumber,
                PageSize = pageSize,
                TotalRecords = totalRecords,
                TotalPages = totalPages,
                HasPreviousPage = pageNumber > 1,
                HasNextPage = pageNumber < totalPages,
                Search = search,
                SortBy = sortBy,
                SortDirection = sortDirection
            };
        }
    }
}