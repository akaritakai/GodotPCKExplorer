FROM mcr.microsoft.com/dotnet/sdk:9.0

# Copy the project into the container
WORKDIR /opt/GodotPCKExplorer
COPY . /opt/GodotPCKExplorer/
# Remove our Dockerfile
RUN rm -rf /opt/GodotPCKExplorer/publish \
           /opt/GodotPckExplorer/Dockerfile \
           /opt/GodotPckExplorer/build.sh

# Build applications
RUN dotnet publish Bruteforcer/Console/PCKBruteforcer.Console.csproj -p:PublishProfile=Win64 -c Release -o publish/Win64
RUN dotnet publish Bruteforcer/UI/PCKBruteforcer.UI.csproj -p:PublishProfile=Win64 -c Release -o publish/Win64
RUN dotnet publish Explorer/Console/GodotPCKExplorer.Console.csproj -p:PublishProfile=Win64 -c Release -o publish/Win64
RUN dotnet build Explorer/UI/GodotPCKExplorer.UI.csproj -c Release -o publish/Win64

ENTRYPOINT ["/bin/bash"]
