#!/bin/bash

echo "🚀 Launching Stable Diffusion WebUI..."

docker run --gpus all \
  -p 7860:7860 \
  --rm -d \
  --name sd-webui \
  -v $HOME/stable-diffusion/outputs:/outputs \
  ghcr.io/ashawkey/stable-diffusion-webui
