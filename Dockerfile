FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
ADD . /nop
WORKDIR /nop
RUN dotnet publish -c Release src/Presentation/Nop.Web/Nop.Web.csproj -o published/
RUN mkdir published/bin published/logs

#RUN adduser --disabled-password --home /usr/share/nop --shell /bin/bash nop
#RUN chown -R nop:nop /nop/published
#USER nop
#WORKDIR /nop/published

FROM mcr.microsoft.com/dotnet/aspnet:9.0
COPY --from=build /nop/published /nop
WORKDIR /nop
EXPOSE 5000
CMD ["dotnet", "Nop.Web.dll", "--urls=http://0.0.0.0:5000"]
