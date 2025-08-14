using System.Threading.Tasks;
namespace Core.Interfaces;
public interface IAccessRightService
{
    Task GrantAsync(string userId, int documentId, bool read, bool write, bool delete);
}