FROM mcr.microsoft.com/dotnet/sdk:9.0
ADD . /nop
WORKDIR /nop
RUN dotnet build -c Release src/Presentation/Nop.web/Nop.web.csproj
