FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["Restaurante.Api/Restaurante.Api.csproj", "Restaurante.Api/"]
RUN dotnet restore "Restaurante.Api/Restaurante.Api.csproj"
COPY . .
WORKDIR "/src/Restaurante.Api"
RUN dotnet build "Restaurante.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Restaurante.Api.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Restaurante.Api.dll"]
