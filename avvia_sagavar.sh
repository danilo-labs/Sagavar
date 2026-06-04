#!/bin/bash
cd "$(dirname "$0")"
echo "Sagavar Launcher - Logs are saved in sagavar.log"
exec > >(tee -a sagavar.log) 2>&1
echo "Starting at $(date)"
echo "Working directory: $(pwd)"
echo "Checking Python..."
if ! command -v python3 &> /dev/null; then
    echo "ERROR: python3 not found. Please install it: sudo apt install python3"
    read -p "Press ENTER to exit."
    exit 1
fi
echo "Launching KoboldCpp (server AI)..."
chmod +x koboldcpp-linux-x64-nocuda
nohup ./koboldcpp-linux-x64-nocuda Qwen2.5-1.5B-Instruct-Q4_0.gguf --contextsize 1024 --port 5001 > kobold.log 2>&1 &
sleep 8
echo "Launching web server (port 8000)..."
nohup python3 -m http.server 8000 > web.log 2>&1 &
sleep 3
echo "Opening browser..."
xdg-open http://localhost:8000/sagavar.html
echo "Sagavar is running. Press ENTER to stop all services and close this window."
read -r