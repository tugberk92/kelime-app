#!/bin/bash
# ╭─────────────────────────────────────╮
# │  Kelime Turkish Tutor — macOS       │
# │  Double-click to launch             │
# ╰─────────────────────────────────────╯

cd "$(dirname "$0")"

# Find an available port
PORT=8765
while lsof -ti:$PORT >/dev/null 2>&1; do
    PORT=$((PORT + 1))
done

clear
echo ""
echo "  🇹🇷  Kelime — Turkish Tutor"
echo "  ─────────────────────────────"
echo ""
echo "  ✓ Server running at http://localhost:$PORT"
echo "  ✓ Browser will open in 1 second..."
echo ""
echo "  → To stop: press Ctrl+C or close this window"
echo ""

# Open in default browser after a short delay
( sleep 1 && open "http://localhost:$PORT/" ) &

# Try Python 3 first, fallback to Python 2
if command -v python3 >/dev/null 2>&1; then
    python3 -m http.server $PORT 2>/dev/null
elif command -v python >/dev/null 2>&1; then
    python -m SimpleHTTPServer $PORT 2>/dev/null
else
    echo ""
    echo "  ⚠️  Python not found. Install via Xcode Command Line Tools:"
    echo "     Run in Terminal:  xcode-select --install"
    echo ""
    read -p "Press Enter to close..."
fi
