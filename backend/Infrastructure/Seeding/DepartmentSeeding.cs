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
        private static readonly (string Name, string Description)[] Departments = new[]
        {
            ("Direction Générale", "Directorate - overall leadership (DG)"),
            ("Contrôle de gestion", "Management control and performance monitoring"),
            ("Maintenance", "Equipment and facilities maintenance"),
            ("Qualité & Réclamation", "Quality assurance and customer complaints (Service Réclamation / Service Qualité)"),
            ("Informatique", "IT services and systems (Service informatique / Service facturation)"),
            ("Logistique & Livraison", "Logistics, delivery and warehouses (Parc Roulant)"),
            ("Achats", "Procurement and supplier management"),
            ("Ressources Humaines", "Human resources and personnel management"),
            ("Production - Produits crus", "Primary production (Abattage, Découpe & conditionnement, MPF, Stock)"),
            ("Production - Produits transformés", "Processed products production"),
            ("Financier", "Finance department (Caisse, Comptabilité)"),
            ("Engagement client - Crédit", "Customer credit / risk management"),
            ("Engagement client - Comptant", "Customer cash operations / POS"),
            ("Commercial", "Sales administration, distribution and sales force"),
            ("Audit", "Internal audit and compliance"),
            ("Maintenance Technique", "Technical maintenance (alternate maintenance role)")
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

            foreach (var (name, description) in Departments)
            {
                var exists = await context.Departments
                    .AsNoTracking()
                    .AnyAsync(d => d.Name == name);

                if (!exists)
                {
                    var dept = new Department
                    {
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