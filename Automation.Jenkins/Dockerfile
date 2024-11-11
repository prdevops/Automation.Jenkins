FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS build-env

WORKDIR /app
COPY *.csproj .

RUN dotnet restore
COPY . .

RUN dotnet publish -c Release --property:PublishDir=/out

FROM mcr.microsoft.com/dotnet/aspnet:8.0

WORKDIR /app
COPY --from=build-env /app/out .

ENTRYPOINT ["dotnet", "Automation.Jenkins.dll"]