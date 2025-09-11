using System;
using System.Reflection;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Core.Entities;
using Microsoft.AspNetCore.Identity;

namespace Infrastructure.Data
{
    public class AppDbContext : IdentityDbContext<AppUser, Role, string,
    IdentityUserClaim<string>, IdentityUserRole<string>, IdentityUserLogin<string>,
        IdentityRoleClaim<string>, IdentityUserToken<string>>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<DocumentChunk> DocumentChunks { get; set; }
        public virtual DbSet<AccessRequest> AccessRequests { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<AccessRight> AccessRights { get; set; }
        public virtual DbSet<Notification> Notifications { get; set; }
        public virtual DbSet<Folder> Folders { get; set; }
        public virtual DbSet<Document> Documents { get; set; }
        public virtual DbSet<DocumentAccessLink> DocumentAccessLinks { get; set; }
        public virtual DbSet<DocumentRequest> DocumentRequests { get; set; }
        public virtual DbSet<AIQueryLog> AIQueryLogs { get; set; }
        //public virtual DbSet<AuditLog> AuditLogs { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public DbSet<Folder> Folder { get; set; }
        public virtual DbSet<AppUser> User { get; set; }

        

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());

            // modelBuilder.Entity<AppUser>(entity =>
            // {
            //   entity.Property(r => r.Id)
            //   .ValueGeneratedOnAdd();
            // });
            modelBuilder.Entity<Role>(entity =>
           {
               entity.Property(r => r.Id)
               .ValueGeneratedOnAdd();
           });

            modelBuilder.Entity<DocumentRequest>(entity =>
            {
                // Configure Requester relationship
                entity.HasOne(dr => dr.Requester)
                    .WithMany(u => u.RequestedDocuments)
                    .HasForeignKey(dr => dr.RequesterId)
                    .OnDelete(DeleteBehavior.Restrict);

                // Configure ProcessedBy relationship
                entity.HasOne(dr => dr.ProcessedBy)
                    .WithMany(u => u.ProcessedDocuments)
                    .HasForeignKey(dr => dr.ProcessedById)
                    .OnDelete(DeleteBehavior.SetNull);

                // Configure Department relationship
                entity.HasOne(dr => dr.Department)
                    .WithMany()
                    .HasForeignKey(dr => dr.DepartmentId)
                    .OnDelete(DeleteBehavior.Restrict);

                // Configure ResponseDocument relationship
                entity.HasOne(dr => dr.ResponseDocument)
                    .WithMany()
                    .HasForeignKey(dr => dr.ResponseDocumentId)
                    .OnDelete(DeleteBehavior.SetNull);
            });
           

        }
    }
}