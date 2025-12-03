#!/usr/bin/env bash

docker build -t godot-pck-explorer .
docker run --name godot-pck-explorer-run godot-pck-explorer
rm -rf ./publish
docker cp godot-pck-explorer-run:/opt/GodotPCKExplorer/publish/Win64 publish
docker container rm godot-pck-explorer-run

