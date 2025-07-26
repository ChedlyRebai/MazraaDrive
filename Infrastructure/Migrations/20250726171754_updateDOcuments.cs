using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class updateDOcuments : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AccessRights_Folder_FolderId",
                table: "AccessRights");

            migrationBuilder.AlterColumn<int>(
                name: "FolderId",
                table: "AccessRights",
                type: "integer",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "integer");

            migrationBuilder.AddColumn<int>(
                name: "documentId",
                table: "AccessRights",
                type: "integer",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_AccessRights_documentId",
                table: "AccessRights",
                column: "documentId");

            migrationBuilder.AddForeignKey(
                name: "FK_AccessRights_Documents_documentId",
                table: "AccessRights",
                column: "documentId",
                principalTable: "Documents",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_AccessRights_Folder_FolderId",
                table: "AccessRights",
                column: "FolderId",
                principalTable: "Folder",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AccessRights_Documents_documentId",
                table: "AccessRights");

            migrationBuilder.DropForeignKey(
                name: "FK_AccessRights_Folder_FolderId",
                table: "AccessRights");

            migrationBuilder.DropIndex(
                name: "IX_AccessRights_documentId",
                table: "AccessRights");

            migrationBuilder.DropColumn(
                name: "documentId",
                table: "AccessRights");

            migrationBuilder.AlterColumn<int>(
                name: "FolderId",
                table: "AccessRights",
                type: "integer",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "integer",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_AccessRights_Folder_FolderId",
                table: "AccessRights",
                column: "FolderId",
                principalTable: "Folder",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
