using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class updateDOcumentss : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AccessRights_Documents_documentId",
                table: "AccessRights");

            migrationBuilder.RenameColumn(
                name: "documentId",
                table: "AccessRights",
                newName: "DocumentId");

            migrationBuilder.RenameIndex(
                name: "IX_AccessRights_documentId",
                table: "AccessRights",
                newName: "IX_AccessRights_DocumentId");

            migrationBuilder.AddForeignKey(
                name: "FK_AccessRights_Documents_DocumentId",
                table: "AccessRights",
                column: "DocumentId",
                principalTable: "Documents",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AccessRights_Documents_DocumentId",
                table: "AccessRights");

            migrationBuilder.RenameColumn(
                name: "DocumentId",
                table: "AccessRights",
                newName: "documentId");

            migrationBuilder.RenameIndex(
                name: "IX_AccessRights_DocumentId",
                table: "AccessRights",
                newName: "IX_AccessRights_documentId");

            migrationBuilder.AddForeignKey(
                name: "FK_AccessRights_Documents_documentId",
                table: "AccessRights",
                column: "documentId",
                principalTable: "Documents",
                principalColumn: "Id");
        }
    }
}
