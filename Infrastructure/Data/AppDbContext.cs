using System;
using System.Reflection;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Core.Entities;

namespace Infrastructure.Data
{
    public class AppDbContext : IdentityDbContext<AppUser>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        // DbSets
        //public virtual DbSet<Address> Addresses { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<AccessRight> AccessRights { get; set; }
        public virtual DbSet<Folder> Folders { get; set; }
        public virtual DbSet<Document> Documents { get; set; }
        public virtual DbSet<DocumentRequest> DocumentRequests { get; set; }
        public virtual DbSet<AIQueryLog> AIQueryLogs { get; set; }
        public virtual DbSet<AuditLog> AuditLogs { get; set; }
        //public virtual DbSet<Message> Messages { get; set; }
        //public virtual DbSet<MailFolder> MailFolders { get; set; }
        //public virtual DbSet<MailMessageFolder> MailMessageFolders { get; set; }
        // public virtual DbSet<Role> Roles { get; set; }
        // public virtual DbSet<RolePermission> RolePermissions { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());

            // AppUser - Address relationship (One-to-One)
            //     modelBuilder.Entity<AppUser>()
            //         .HasOne(u => u.Address)
            //         .WithOne(a => a.AppUser)
            //         .HasForeignKey<Address>(a => a.AppUserId)
            //         .OnDelete(DeleteBehavior.Cascade);

            //     // AppUser - Department relationship (Many-to-One)
            //     modelBuilder.Entity<AppUser>()
            //         .HasOne(u => u.Department)
            //         .WithMany(d => d.Users)
            //         .HasForeignKey(u => u.DepartmentId)
            //         .OnDelete(DeleteBehavior.Restrict);

            //     // AppUser - Role relationship (Many-to-One)
            //     modelBuilder.Entity<AppUser>()
            //         .HasOne(u => u.Role)
            //         .WithMany(r => r.Users)
            //         .HasForeignKey(u => u.RoleId)
            //         .OnDelete(DeleteBehavior.Restrict);

            //     // AppUser - AccessRight relationship (One-to-Many)
            //     modelBuilder.Entity<AccessRight>()
            //         .HasOne(ar => ar.User)
            //         .WithMany(u => u.AccessRights)
            //         .HasForeignKey(ar => ar.UserId)
            //         .OnDelete(DeleteBehavior.Cascade);

            //     // Folder - Department relationship (Many-to-One)
            //     modelBuilder.Entity<Folder>()
            //         .HasOne(f => f.Department)
            //         .WithMany(d => d.Folders)
            //         .HasForeignKey(f => f.DepartmentId)
            //         .OnDelete(DeleteBehavior.Restrict);

            //     // Folder - AppUser relationship (Many-to-One for CreatedBy)
            //     modelBuilder.Entity<Folder>()
            //         .HasOne(f => f.CreatedBy)
            //         .WithMany(u => u.CreatedFolders)
            //         .HasForeignKey(f => f.CreatedById)
            //         .OnDelete(DeleteBehavior.Restrict);

            //     // Folder - Folder relationship (Self-referencing for Parent-Child)
            //     modelBuilder.Entity<Folder>()
            //         .HasOne(f => f.ParentFolder)
            //         .WithMany(f => f.SubFolders)
            //         .HasForeignKey(f => f.ParentFolderId)
            //         .OnDelete(DeleteBehavior.Restrict);

            //     // Document - Folder relationship (Many-to-One)
            //     modelBuilder.Entity<Document>()
            //         .HasOne(d => d.Folder)
            //         .WithMany(f => f.Documents)
            //         .HasForeignKey(d => d.FolderId)
            //         .OnDelete(DeleteBehavior.Restrict);

            //     // Document - AppUser relationship (Many-to-One for UploadedBy)
            //     modelBuilder.Entity<Document>()
            //         .HasOne(d => d.UploadedBy)
            //         .WithMany(u => u.UploadedDocuments)
            //         .HasForeignKey(d => d.UploadedById)
            //         .OnDelete(DeleteBehavior.Restrict);

            //     // DocumentRequest - AppUser relationship (Many-to-One for Requester)
            //     modelBuilder.Entity<DocumentRequest>()
            //         .HasOne(dr => dr.Requester)
            //         .WithMany(u => u.DocumentRequests)
            //         .HasForeignKey(dr => dr.RequesterId)
            //         .OnDelete(DeleteBehavior.Restrict);

            //     // DocumentRequest - Department relationship (Many-to-One)
            //     modelBuilder.Entity<DocumentRequest>()
            //         .HasOne(dr => dr.Department)
            //         .WithMany(d => d.DocumentRequests)
            //         .HasForeignKey(dr => dr.DepartmentId)
            //         .OnDelete(DeleteBehavior.Restrict);

            //     // DocumentRequest - Document relationship (Many-to-One for ResponseDocument)
            //     modelBuilder.Entity<DocumentRequest>()
            //         .HasOne(dr => dr.ResponseDocument)
            //         .WithMany(d => d.DocumentRequests)
            //         .HasForeignKey(dr => dr.ResponseDocumentId)
            //         .OnDelete(DeleteBehavior.SetNull);

            //     // AIQueryLog - AppUser relationship (Many-to-One)
            //     modelBuilder.Entity<AIQueryLog>()
            //         .HasOne(aql => aql.User)
            //         .WithMany(u => u.AIQueryLogs)
            //         .HasForeignKey(aql => aql.UserId)
            //         .OnDelete(DeleteBehavior.Cascade);

            //     // AuditLog - AppUser relationship (Many-to-One)
            //     modelBuilder.Entity<AuditLog>()
            //         .HasOne(al => al.User)
            //         .WithMany(u => u.AuditLogs)
            //         .HasForeignKey(al => al.UserId)
            //         .OnDelete(DeleteBehavior.Restrict);

            //     // Message - AppUser relationships (Many-to-One for Sender and Receiver)
            //     modelBuilder.Entity<Message>()
            //         .HasOne(m => m.Sender)
            //         .WithMany(u => u.SentMessages)
            //         .HasForeignKey(m => m.SenderId)
            //         .OnDelete(DeleteBehavior.Restrict);

            //     modelBuilder.Entity<Message>()
            //         .HasOne(m => m.Receiver)
            //         .WithMany(u => u.ReceivedMessages)
            //         .HasForeignKey(m => m.ReceiverId)
            //         .OnDelete(DeleteBehavior.Restrict);

            //     // MailFolder - AppUser relationship (Many-to-One)
            //     modelBuilder.Entity<MailFolder>()
            //         .HasOne(mf => mf.User)
            //         .WithMany(u => u.MailFolders)
            //         .HasForeignKey(mf => mf.UserId)
            //         .OnDelete(DeleteBehavior.Cascade);

            //     // MailFolder - MailFolder relationship (Self-referencing for Parent-Child)
            //     modelBuilder.Entity<MailFolder>()
            //         .HasOne(mf => mf.ParentFolder)
            //         .WithMany(mf => mf.SubFolders)
            //         .HasForeignKey(mf => mf.ParentFolderId)
            //         .OnDelete(DeleteBehavior.Restrict);

            //     // MailMessageFolder - Message relationship (Many-to-One)
            //     modelBuilder.Entity<MailMessageFolder>()
            //         .HasOne(mmf => mmf.Message)
            //         .WithMany(m => m.MailMessageFolders)
            //         .HasForeignKey(mmf => mmf.MessageId)
            //         .OnDelete(DeleteBehavior.Cascade);

            //     // MailMessageFolder - MailFolder relationship (Many-to-One)
            //     modelBuilder.Entity<MailMessageFolder>()
            //         .HasOne(mmf => mmf.MailFolder)
            //         .WithMany(mf => mf.MailMessageFolders)
            //         .HasForeignKey(mmf => mmf.MailFolderId)
            //         .OnDelete(DeleteBehavior.Cascade);

            //     // Role - RolePermission relationship (One-to-Many)
            //     modelBuilder.Entity<RolePermission>()
            //         .HasOne(rp => rp.Role)
            //         .WithMany(r => r.RolePermissions)
            //         .HasForeignKey(rp => rp.RoleId)
            //         .OnDelete(DeleteBehavior.Cascade);

            //     // Indexes and Constraints
            //     modelBuilder.Entity<AppUser>()
            //         .HasIndex(u => u.Email)
            //         .IsUnique();

            //     modelBuilder.Entity<Department>()
            //         .HasIndex(d => d.Name)
            //         .IsUnique();

            //     modelBuilder.Entity<Role>()
            //         .HasIndex(r => r.Name)
            //         .IsUnique();

            //     modelBuilder.Entity<RolePermission>()
            //         .HasIndex(rp => new { rp.RoleId, rp.Permission })
            //         .IsUnique();

            //     modelBuilder.Entity<MailMessageFolder>()
            //         .HasIndex(mmf => new { mmf.MessageId, mmf.MailFolderId })
            //         .IsUnique();

            //     // Configure decimal properties for precision
            //     modelBuilder.Entity<Document>()
            //         .Property(d => d.FileSize)
            //         .HasColumnType("bigint");

            //     // Configure string length constraints
            //     modelBuilder.Entity<AppUser>()
            //         .Property(u => u.UserName)
            //         .HasMaxLength(256);

            //     modelBuilder.Entity<AppUser>()
            //         .Property(u => u.Email)
            //         .HasMaxLength(256);

            //     modelBuilder.Entity<Department>()
            //         .Property(d => d.Name)
            //         .HasMaxLength(255);

            //     modelBuilder.Entity<Folder>()
            //         .Property(f => f.Name)
            //         .HasMaxLength(255);

            //     modelBuilder.Entity<Document>()
            //         .Property(d => d.Name)
            //         .HasMaxLength(255);

            //     modelBuilder.Entity<Document>()
            //         .Property(d => d.StoragePath)
            //         .HasMaxLength(500);

            //     modelBuilder.Entity<Role>()
            //         .Property(r => r.Name)
            //         .HasMaxLength(100);

            //     modelBuilder.Entity<RolePermission>()
            //         .Property(rp => rp.Permission)
            //         .HasMaxLength(100);
            // 
         
        }
    }
}