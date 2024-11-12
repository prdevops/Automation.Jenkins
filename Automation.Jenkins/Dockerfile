# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /app

# Copy the project file and restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the application files
COPY . ./

# Команда RUN dotnet publish --no-restore -c Release -o /out внутри Dockerfile гарантирует, 
#что приложение будет публиковаться каждый раз в процессе сборки.
RUN dotnet publish --no-restore -c Release -o /out

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# Copy the published output from the build stage
COPY --from=build-env /out ./

# Set the entry point to the application DLL
ENTRYPOINT ["dotnet", "Automation.Jenkins.dll"]
