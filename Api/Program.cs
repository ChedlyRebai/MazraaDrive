using Api.Middleware;
using Infrastructure;
using Microsoft.EntityFrameworkCore;
using Infrastructure.Data;
using Core.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.FileProviders;
using Scalar.AspNetCore;
using Serilog;
using Serilog;
using Serilog.Events;
using Serilog.Formatting.Compact;
using Serilog.Configuration;
using Serilog.Settings.Configuration;
using Serilog.Sinks.Elasticsearch;
using Infrastructure.Repositories;
using Core.Interfaces;
using Infrastructure.Repositories.Service;
var builder = WebApplication.CreateBuilder(args);

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", builder =>
    {
        builder.AllowAnyHeader().
        AllowAnyMethod().
        AllowCredentials().
        WithOrigins("http://localhost:4200");
    });
});
Log.Logger = new LoggerConfiguration()
    .Enrich.FromLogContext()
    .Enrich.WithMachineName()
    .WriteTo.Console()
    .WriteTo.Elasticsearch(new ElasticsearchSinkOptions(new Uri("http://localhost:9200"))
    {
        AutoRegisterTemplate = true,
        IndexFormat = "serilog-logs-{0:yyyy.MM.dd}",
        NumberOfShards = 2,
        NumberOfReplicas = 1,
        AutoRegisterTemplateVersion = AutoRegisterTemplateVersion.ESv8,
        ModifyConnectionSettings = x => x.ServerCertificateValidationCallback(
            (o, certificate, arg3, arg4) => true)
    })
    .WriteTo.File("logs/log-.txt", rollingInterval: RollingInterval.Day)
    .CreateLogger();

builder.Host.UseSerilog();
// builder.Host.UseSerilog((context, configuration) =>
//     configuration.ReadFrom.Configuration(context.Configuration));


builder.Services.AddMemoryCache();

builder.Services.AddEndpointsApiExplorer();

builder.Services.AddSwaggerGen();

builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new() { Title = "MazraaDrive API", Version = "v1" });

    // Add JWT authentication to Swagger
    c.AddSecurityDefinition("Bearer", new Microsoft.OpenApi.Models.OpenApiSecurityScheme
    {
        Description = "JWT Authorization header using the Bearer scheme. Example: \"Authorization: Bearer {token}\"",
        Name = "Authorization",
        In = Microsoft.OpenApi.Models.ParameterLocation.Header,
        Type = Microsoft.OpenApi.Models.SecuritySchemeType.ApiKey
    });

    c.AddSecurityRequirement(new Microsoft.OpenApi.Models.OpenApiSecurityRequirement
    {
        {
            new Microsoft.OpenApi.Models.OpenApiSecurityScheme
            {
                Reference = new Microsoft.OpenApi.Models.OpenApiReference
                {
                    Type = Microsoft.OpenApi.Models.ReferenceType.SecurityScheme,
                    Id = "Bearer"
                }
            },
            new string[] {}
        }
    });
});
// builder.Services.AddIdentity<AppUser, IdentityRole<int>>(options =>
// {
//     // Your identity options here
// })
// .AddEntityFrameworkStores<AppDbContext>()
// .AddDefaultTokenProviders();
// Add controllers
builder.Services.AddControllers();


builder.Services.AddIdentity<AppUser, Role>()
    .AddEntityFrameworkStores<AppDbContext>()
    .AddDefaultTokenProviders();

builder.Services.AddScoped<RoleManager<Role>>();
builder.Services.AddHttpContextAccessor();
// Register infrastructure services
builder.Services.infrastructureRegistration(builder.Configuration);


builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
builder.Services.AddResponseCompression();
builder.Services.AddSignalR();
builder.Services.AddCors(o => o.AddPolicy("CorsAll", p =>
    p.WithOrigins("http://localhost:4200", "https://your-vercel-domain.vercel.app")
     .AllowAnyHeader().AllowAnyMethod()
     .AllowCredentials()));
builder.Services.AddOpenApi();
// builder.Services.AddScalarApiReference();

builder.Services.AddAuthorization(op =>
        {
            op.AddPolicy("RequireManagerRole",
            policy => policy.RequireRole("Manager", "Admin", "SuperAdmin", "AuditManager",
            "FinanceManager", "ProductionManager", "HRManager", "LogisticsManager", "ITManager", "LegalManager",
            "QualityManager", "SalesManager", "MarketingManager"
            ));
        });
var app = builder.Build();
//app.UseMiddleware<GlobalAuditMiddleware>();






if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
    app.MapScalarApiReference();

    // app.UseSwagger();
    // app.UseSwaggerUI(c =>
    // {
    //     c.SwaggerEndpoint("/swagger/v1/swagger.json", "Mazraa Drive Api v1");
    //     c.RoutePrefix = string.Empty; // Set Swagger UI at the root (optional)
    // });
}
var uploadsPath = Path.Combine(Directory.GetCurrentDirectory(), "uploads");
if (!Directory.Exists(uploadsPath))
{
    Directory.CreateDirectory(uploadsPath);
}

app.MapGet("/", () => "Hello world!");
// After app.Build(), add:
app.UseCors("AllowAll");
//app.UseCors("CORSPolicy");
app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = new PhysicalFileProvider(uploadsPath),
    RequestPath = "/api/uploads"
});
app.UseMiddleware<ExceptionMiddleware>();
app.UseAuthentication();
app.UseAuthorization();
app.UseStatusCodePagesWithReExecute("/errors/{0}");

// var connectionString = builder.Configuration.GetConnectionString("GameStore");
// builder.Services.AddDbContext<AppDbContext>(options =>
//     options.UseMySql(
//         connectionString, ServerVersion.AutoDetect(connectionString)
//     ));


using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    var roleManager = services.GetRequiredService<RoleManager<Role>>();
    await Infrastructure.Seeding.RoleSeeder.SeedRolesAsync(roleManager);
}


using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;

    // seed roles (optional)
    try
    {
        var roleManager = services.GetService<Microsoft.AspNetCore.Identity.RoleManager<Core.Entities.Role>>();
        if (roleManager != null)
        {
            await Infrastructure.Seeding.RoleSeeder.SeedRolesAsync(roleManager);
        }
    }
    catch
    {
        // log or ignore
    }

    // seed departments
    try
    {
        var db = services.GetRequiredService<Infrastructure.Data.AppDbContext>();
        await Infrastructure.Seeding.DepartmentSeeder.SeedAsync(db);
    }
    catch
    {
        // log or ignore
    }
}
// ...existing code...







app.UseResponseCompression();
app.UseResponseCaching();
app.MapControllers();
app.MapHub<Api.Hubs.DepartmentHub>("/hubs/departments");
app.Run();
