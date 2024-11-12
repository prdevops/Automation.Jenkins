FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS build-env
WORKDIR /app
#COPY *.csproj ./
COPY *.csproj .

RUN dotnet restore

COPY . ./

#RUN dotnet publish --no-restore -c Release -o /out
RUN dotnet publish --no-restore -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app


#COPY --from=build-env /out .
COPY --from=build-env /out ./

ENTRYPOINT ["dotnet", "Automation.Jenkins.dll"]
