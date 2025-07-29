using System;
using Core.DTO;
using Core.Entities;

namespace Core.Interfaces;

public interface IDepartmentRepository:IGenericRepository<Department>
{
        Task<PagedResult<Department>> GetPageAsync(DepartmentFilterDto filter);
Task<Department> AddAsync(Department department);
        Task DeleteAsync(int id);
        Task<IReadOnlyList<Department>> GetAllAsync();
        Task<Department?> GetByIdAsync(int id);
        Task<Department?> GetByNameAsync(string name);
        Task UpdateAsync(Department department);
        Task<bool> ExistsAsync(int id);
        Task<bool> ExistsByNameAsync(string name);
        Task<IReadOnlyList<Department>> GetWithUserCountAsync();
}
