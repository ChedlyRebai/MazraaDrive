using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AccessRight : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "FolderId",
                table: "AccessRights",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_AccessRights_FolderId",
                table: "AccessRights",
                column: "FolderId");

            migrationBuilder.AddForeignKey(
                name: "FK_AccessRights_Folder_FolderId",
                table: "AccessRights",
                column: "FolderId",
                principalTable: "Folder",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AccessRights_Folder_FolderId",
                table: "AccessRights");

            migrationBuilder.DropIndex(
                name: "IX_AccessRights_FolderId",
                table: "AccessRights");

            migrationBuilder.DropColumn(
                name: "FolderId",
                table: "AccessRights");
        }
    }
}
