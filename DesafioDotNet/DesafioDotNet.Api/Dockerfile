FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["DesafioDotNet.Api/DesafioDotNet.Api.csproj", "DesafioDotNet.Api/"]
RUN dotnet restore "DesafioDotNet.Api/DesafioDotNet.Api.csproj"
COPY . .
WORKDIR "/src/DesafioDotNet.Api"
RUN dotnet build "DesafioDotNet.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DesafioDotNet.Api.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DesafioDotNet.Api.dll"]
