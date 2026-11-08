#!/bin/bash
# ============================================================
#  Sagavar Launcher v2.2 — Offline AI Language Tutor
#  Simply Linux 11 / ALT / Ubuntu / Debian (Xfce)
#  First run needs internet (auto-download); after that: 100% offline
# ============================================================
cd "$(dirname "$0")" || exit 1
exec > >(tee -a sagavar.log) 2>&1
echo "=== Sagavar started at $(date) ==="

KOBOLD_BIN="koboldcpp-linux-x64-nocuda"
KOBOLD_URL="https://github.com/LostRuins/koboldcpp/releases/latest/download/koboldcpp-linux-x64-nocuda"
MODEL="Qwen2.5-1.5B-Instruct-Q4_K_M.gguf"
MODEL_URL="https://huggingface.co/bartowski/Qwen2.5-1.5B-Instruct-GGUF/resolve/main/$MODEL"
PORT_KOBOLD=5001
PORT_WEB=8000

port_open() {
    python3 -c 'import socket,sys; s=socket.socket(); sys.exit(0 if s.connect_ex(("127.0.0.1",int(sys.argv[1])))==0 else 1)' "$1" 2>/dev/null
}

download() { # $1=url $2=dest $3=size_MB
    [ -f "$2" ] && return 0
    local free_mb=$(df -Pm . | awk 'NR==2 {print $4}')
    if [ "$free_mb" -lt "$3" ]; then
        echo "ERROR: not enough disk space (need ~${3} MB, free: ${free_mb} MB)."
        read -r -p "Press ENTER to exit."; exit 1
    fi
    echo "Downloading $(basename "$2") (~${3} MB). You can stop anytime and re-run: it resumes."
    wget -c -O "$2.part" "$1" || {
        echo "Download interrupted. Run this script again to resume."
        read -r -p "Press ENTER to exit."; exit 1
    }
    mv "$2.part" "$2"
}

cleanup() {
    echo; echo "Stopping Sagavar..."
    [ -n "$WEB_PID" ]    && kill "$WEB_PID"    2>/dev/null
    [ -n "$KOBOLD_PID" ] && kill "$KOBOLD_PID" 2>/dev/null
    sleep 1
    kill -9 "$KOBOLD_PID" "$WEB_PID" 2>/dev/null
    rm -f kobold.pid web.pid
    echo "All services stopped. Logs: sagavar.log, kobold.log"
    exit 0
}
# EXIT copre anche la chiusura della finestra del terminale
trap cleanup EXIT INT TERM HUP

# ---------- pre-flight checks ----------
if ! command -v python3 >/dev/null 2>&1; then
    echo "ERROR: python3 not found. Install: sudo apt-get install python3"
    read -r -p "Press ENTER to exit."; exit 1
fi
if ! command -v wget >/dev/null 2>&1; then
    echo "ERROR: wget not found. Install: sudo apt-get install wget"
    read -r -p "Press ENTER to exit."; exit 1
fi

# stop leftovers from a previous crashed run
[ -f kobold.pid ] && { kill "$(cat kobold.pid)" 2>/dev/null; rm -f kobold.pid; }
[ -f web.pid ]    && { kill "$(cat web.pid)"    2>/dev/null; rm -f web.pid; }
if port_open "$PORT_KOBOLD" || port_open "$PORT_WEB"; then
    echo "WARNING: ports $PORT_KOBOLD/$PORT_WEB are busy. Another Sagavar may be running."
    read -r -p "Press ENTER to exit."; exit 1
fi

# ---------- files (auto-download on first run, resumable) ----------
download "$MODEL_URL" "$MODEL" 1300
download "$KOBOLD_URL" "$KOBOLD_BIN" 500
chmod +x "$KOBOLD_BIN"

# ---------- start ----------
echo "Starting AI server (KoboldCpp)..."
# --host 127.0.0.1: anche il server AI resta raggiungibile solo dal proprio PC
./"$KOBOLD_BIN" "$MODEL" --host 127.0.0.1 --contextsize 2048 --port "$PORT_KOBOLD" > kobold.log 2>&1 &
KOBOLD_PID=$!; echo "$KOBOLD_PID" > kobold.pid

echo "Starting web server (port $PORT_WEB)..."
python3 -m http.server "$PORT_WEB" --bind 127.0.0.1 > web.log 2>&1 &
WEB_PID=$!; echo "$WEB_PID" > web.pid

echo -n "Loading model, please wait "
for i in $(seq 1 180); do
    port_open "$PORT_KOBOLD" && break
    echo -n "."; sleep 1
done
if ! port_open "$PORT_KOBOLD"; then
    echo "ERROR: AI server did not start. Check kobold.log"
    exit 1
fi
echo " ready!"

echo "Opening browser... (if it doesn't open: http://localhost:$PORT_WEB/sagavar.html)"
xdg-open "http://localhost:$PORT_WEB/sagavar.html" 2>/dev/null

echo
echo "Sagavar is running. Press ENTER (or Ctrl+C) to stop everything."
read -r
