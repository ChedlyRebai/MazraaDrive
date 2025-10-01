# Use the official .NET SDK image for building
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy solution file
COPY backend.sln ./

# Copy project files
COPY Core/Core.csproj Core/
COPY Infrastructure/Infrastructure.csproj Infrastructure/
COPY Api/Api.csproj Api/

# Restore dependencies
RUN dotnet restore backend.sln

# Copy all source code
COPY Core/ Core/
COPY Infrastructure/ Infrastructure/
COPY Api/ Api/

# Build and publish the application
RUN dotnet publish Api/Api.csproj -c Release -o /app/publish

# Use the runtime image for the final stage
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app

RUN mkdir -p /app/keys
# Copy the published application
COPY --from=build /app/publish .

VOLUME ["/app/keys"]
# Expose port
EXPOSE 8080

# Set environment variables
ENV PORT=8080
ENV ASPNETCORE_URLS=http://0.0.0.0:8080
ENV ASPNETCORE_ENVIRONMENT=Production

# Set the entry point
ENTRYPOINT ["dotnet", "Api.dll"]