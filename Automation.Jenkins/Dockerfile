# Стадия сборки
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /app

# Установка конфигурации сборки (по умолчанию - Release)
ARG BUILD_CONFIGURATION=Release

# Копирование файла проекта и восстановление зависимостей
COPY *.csproj ./
RUN dotnet restore

# Копирование всех остальных файлов и публикация
COPY . ./
RUN dotnet publish --no-restore -c $BUILD_CONFIGURATION -o /out

# Стадия выполнения
FROM mcr.microsoft.com/dotnet/aspnet:8.0

WORKDIR /app

# Копирование опубликованных файлов из стадии сборки
COPY --from=build-env /out ./

# Установка точки входа для запуска приложения
ENTRYPOINT ["dotnet", "Automation.Jenkins.dll"]
