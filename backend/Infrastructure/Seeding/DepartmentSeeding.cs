using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Core.Entities;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Seeding
{
    public static class DepartmentSeeder
    {
        private static readonly (int id ,string Name, string Description)[] Departments = new[]
        {
            (1,"Direction Générale", "Directorate - overall leadership (DG)"),
            (2,"Contrôle de gestion", "Management control and performance monitoring"),
            (3,"Maintenance", "Equipment and facilities maintenance"),
            (4,"Qualité & Réclamation", "Quality assurance and customer complaints (Service Réclamation / Service Qualité)"),
            (5,"Informatique", "IT services and systems (Service informatique / Service facturation)"),
            (6,"Logistique & Livraison", "Logistics, delivery and warehouses (Parc Roulant)"),
            (7,"Achats", "Procurement and supplier management"),
            (8,"Ressources Humaines", "Human resources and personnel management"),
            (9,"Production - Produits crus", "Primary production (Abattage, Découpe & conditionnement, MPF, Stock)"),
            (10,"Production - Produits transformés", "Processed products production"),
            (11,"Financier", "Finance department (Caisse, Comptabilité)"),
            (12,"Engagement client - Crédit", "Customer credit / risk management"),
            (13,"Engagement client - Comptant", "Customer cash operations / POS"),
            (14,"Commercial", "Sales administration, distribution and sales force"),
            (15,"Audit", "Internal audit and compliance"),
            (16,"Maintenance Technique", "Technical maintenance (alternate maintenance role)")
        };

        public static async Task SeedAsync(AppDbContext context)
        {
            if (context == null) throw new ArgumentNullException(nameof(context));

            // ensure migrations applied (safe when called at startup)
            try
            {
                await context.Database.MigrateAsync();
            }
            catch
            {
                // ignore migration errors here; caller can handle if needed
            }

            foreach (var (id,name, description) in Departments)
            {
                var exists = await context.Departments
                    .AsNoTracking()
                    .AnyAsync(d => d.Name == name);

                if (!exists)
                {
                    var dept = new Department
                    {
                        Id=id,
                        Name = name,
                        Description = description,
                        CreatedAt = DateTime.UtcNow,
                        UpdatedAt = DateTime.UtcNow
                    };

                    await context.Departments.AddAsync(dept);
                }
            }

            await context.SaveChangesAsync();
        }
    }
}