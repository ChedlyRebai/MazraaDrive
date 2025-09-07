using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Core.Entities;

namespace Infrastructure.Seeding
{
    public static class RoleSeeder
    {
        private static readonly (string Name, string Description)[] Roles = new[]
        {
            ("SuperAdmin","Director General - full access"),
            ("Admin","Global administrator"),
            ("FinanceManager","Financial manager / contrôle de gestion"),
            ("Accountant","Accounting"),
            ("Cashier","Cash desk"),
            ("HR","Human Resources"),
            ("Procurement","Purchasing"),
            ("ITAdmin","IT / system admin"),
            ("Billing","Billing / Facturation"),
            ("LogisticsManager","Logistics / Delivery"),
            ("FleetOperator","Fleet operator"),
            ("ProductionManager","Production manager"),
            ("ProductionOperator","Production operator"),
            ("QualityManager","Quality & reclamation"),
            ("ClaimsAgent","Customer complaints"),
            ("SalesAdmin","Sales administration"),
            ("SalesRep","Sales force"),
            ("CreditOfficer","Customer credit"),
            ("CashCustomerAgent","Customer cash operations"),
            ("Auditor","Audit - read only"),
            ("Maintenance","Maintenance"),
            ("Viewer","Read-only access")
        };

        public static async Task SeedRolesAsync(RoleManager<Role> roleManager)
        {
            if (roleManager == null) throw new ArgumentNullException(nameof(roleManager));
            foreach (var (name, desc) in Roles)
            {
                if (!await roleManager.RoleExistsAsync(name))
                {
                    var role = new Role
                    {
                        Name = name,
                        NormalizedName = name.ToUpperInvariant(),
                        Description = desc
                    };
                    var result = await roleManager.CreateAsync(role);
                    // optional: log result.Errors if !Succeeded
                }
            }
        }
    }
}