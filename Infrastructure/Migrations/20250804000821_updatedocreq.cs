using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class updatedocreq : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_DocumentRequests_AspNetUsers_RequesterId1",
                table: "DocumentRequests");

            migrationBuilder.DropForeignKey(
                name: "FK_DocumentRequests_Departments_DepartmentId",
                table: "DocumentRequests");

            migrationBuilder.DropForeignKey(
                name: "FK_DocumentRequests_Documents_ResponseDocumentId",
                table: "DocumentRequests");

            migrationBuilder.RenameColumn(
                name: "RequesterId1",
                table: "DocumentRequests",
                newName: "ProcessedById");

            migrationBuilder.RenameIndex(
                name: "IX_DocumentRequests_RequesterId1",
                table: "DocumentRequests",
                newName: "IX_DocumentRequests_ProcessedById");

            migrationBuilder.AlterColumn<string>(
                name: "Status",
                table: "DocumentRequests",
                type: "character varying(20)",
                maxLength: 20,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AlterColumn<string>(
                name: "RequesterId",
                table: "DocumentRequests",
                type: "text",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "integer");

            migrationBuilder.AlterColumn<string>(
                name: "Priority",
                table: "DocumentRequests",
                type: "character varying(20)",
                maxLength: 20,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AlterColumn<string>(
                name: "DocumentType",
                table: "DocumentRequests",
                type: "character varying(100)",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AlterColumn<string>(
                name: "Description",
                table: "DocumentRequests",
                type: "character varying(500)",
                maxLength: 500,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AddColumn<int>(
                name: "DepartmentId1",
                table: "DocumentRequests",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "DocumentId",
                table: "DocumentRequests",
                type: "integer",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_DocumentRequests_DepartmentId1",
                table: "DocumentRequests",
                column: "DepartmentId1");

            migrationBuilder.CreateIndex(
                name: "IX_DocumentRequests_DocumentId",
                table: "DocumentRequests",
                column: "DocumentId");

            migrationBuilder.CreateIndex(
                name: "IX_DocumentRequests_RequesterId",
                table: "DocumentRequests",
                column: "RequesterId");

            migrationBuilder.AddForeignKey(
                name: "FK_DocumentRequests_AspNetUsers_ProcessedById",
                table: "DocumentRequests",
                column: "ProcessedById",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.SetNull);

            migrationBuilder.AddForeignKey(
                name: "FK_DocumentRequests_AspNetUsers_RequesterId",
                table: "DocumentRequests",
                column: "RequesterId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_DocumentRequests_Departments_DepartmentId",
                table: "DocumentRequests",
                column: "DepartmentId",
                principalTable: "Departments",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_DocumentRequests_Departments_DepartmentId1",
                table: "DocumentRequests",
                column: "DepartmentId1",
                principalTable: "Departments",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_DocumentRequests_Documents_DocumentId",
                table: "DocumentRequests",
                column: "DocumentId",
                principalTable: "Documents",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_DocumentRequests_Documents_ResponseDocumentId",
                table: "DocumentRequests",
                column: "ResponseDocumentId",
                principalTable: "Documents",
                principalColumn: "Id",
                onDelete: ReferentialAction.SetNull);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_DocumentRequests_AspNetUsers_ProcessedById",
                table: "DocumentRequests");

            migrationBuilder.DropForeignKey(
                name: "FK_DocumentRequests_AspNetUsers_RequesterId",
                table: "DocumentRequests");

            migrationBuilder.DropForeignKey(
                name: "FK_DocumentRequests_Departments_DepartmentId",
                table: "DocumentRequests");

            migrationBuilder.DropForeignKey(
                name: "FK_DocumentRequests_Departments_DepartmentId1",
                table: "DocumentRequests");

            migrationBuilder.DropForeignKey(
                name: "FK_DocumentRequests_Documents_DocumentId",
                table: "DocumentRequests");

            migrationBuilder.DropForeignKey(
                name: "FK_DocumentRequests_Documents_ResponseDocumentId",
                table: "DocumentRequests");

            migrationBuilder.DropIndex(
                name: "IX_DocumentRequests_DepartmentId1",
                table: "DocumentRequests");

            migrationBuilder.DropIndex(
                name: "IX_DocumentRequests_DocumentId",
                table: "DocumentRequests");

            migrationBuilder.DropIndex(
                name: "IX_DocumentRequests_RequesterId",
                table: "DocumentRequests");

            migrationBuilder.DropColumn(
                name: "DepartmentId1",
                table: "DocumentRequests");

            migrationBuilder.DropColumn(
                name: "DocumentId",
                table: "DocumentRequests");

            migrationBuilder.RenameColumn(
                name: "ProcessedById",
                table: "DocumentRequests",
                newName: "RequesterId1");

            migrationBuilder.RenameIndex(
                name: "IX_DocumentRequests_ProcessedById",
                table: "DocumentRequests",
                newName: "IX_DocumentRequests_RequesterId1");

            migrationBuilder.AlterColumn<string>(
                name: "Status",
                table: "DocumentRequests",
                type: "text",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "character varying(20)",
                oldMaxLength: 20);

            migrationBuilder.AlterColumn<int>(
                name: "RequesterId",
                table: "DocumentRequests",
                type: "integer",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AlterColumn<string>(
                name: "Priority",
                table: "DocumentRequests",
                type: "text",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "character varying(20)",
                oldMaxLength: 20);

            migrationBuilder.AlterColumn<string>(
                name: "DocumentType",
                table: "DocumentRequests",
                type: "text",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "character varying(100)",
                oldMaxLength: 100);

            migrationBuilder.AlterColumn<string>(
                name: "Description",
                table: "DocumentRequests",
                type: "text",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "character varying(500)",
                oldMaxLength: 500);

            migrationBuilder.AddForeignKey(
                name: "FK_DocumentRequests_AspNetUsers_RequesterId1",
                table: "DocumentRequests",
                column: "RequesterId1",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_DocumentRequests_Departments_DepartmentId",
                table: "DocumentRequests",
                column: "DepartmentId",
                principalTable: "Departments",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_DocumentRequests_Documents_ResponseDocumentId",
                table: "DocumentRequests",
                column: "ResponseDocumentId",
                principalTable: "Documents",
                principalColumn: "Id");
        }
    }
}
