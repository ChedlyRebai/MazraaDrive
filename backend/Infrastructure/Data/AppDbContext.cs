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

        public virtual DbSet<Role> Role { get; set; }
        public DbSet<Folder> Folder { get; set; }
        public virtual DbSet<AppUser> User { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());

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

            modelBuilder.Entity<AccessRight>()
                .HasIndex(ar => new { ar.UserId, ar.FolderId })
                .IsUnique();

            modelBuilder.Entity<Notification>()
                .HasOne(n => n.User)
                .WithMany(u => u.Notifications)
                .HasForeignKey(n => n.UserId)
                .OnDelete(DeleteBehavior.Cascade);


            // Configure Notification relationships
            modelBuilder.Entity<Notification>(entity =>
            {
                entity.HasOne(n => n.User)
                    .WithMany(u => u.Notifications)
                    .HasForeignKey(n => n.UserId)
                    .OnDelete(DeleteBehavior.Cascade);

                entity.HasOne(n => n.Sender)
                    .WithMany() // Sender doesn't have a collection of notifications they sent
                    .HasForeignKey(n => n.SenderId)
                    .OnDelete(DeleteBehavior.Restrict);

                entity.Property(n => n.title).IsRequired().HasMaxLength(255);
                entity.Property(n => n.Message).IsRequired();

                entity.HasIndex(n => n.UserId);
                entity.HasIndex(n => n.IsRead);

            });




            modelBuilder.Entity<AppUser>(entity =>
            {
                entity.HasMany(u => u.Notifications)
                    .WithOne(n => n.User)
                    .HasForeignKey(n => n.UserId)
                    .OnDelete(DeleteBehavior.Cascade);
            });

        }
    }
}