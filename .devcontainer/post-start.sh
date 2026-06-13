#!/bin/bash
# post-start.sh — runs every time the container STARTS (including after stop/restart)
# Use this for things that need to be alive each session, not just on first create.

set -e
echo "▶️  Container starting..."

# Fix Claude config directory permissions if needed (survives volume remounts)
if [ -d "$HOME/.claude" ]; then
    sudo chown -R vscode:vscode "$HOME/.claude" 2>/dev/null || true
fi

# Friendly reminder of key commands
echo ""
echo "─────────────────────────────────────────────"
echo "  🤖  Claude Code  →  claude"
echo "  ⚛️   React app    →  cd react-app && npm start"
echo "  🤖  Telegram bot →  cd telegram-bot && python bot.py"
echo "  🌐  WordPress    →  wp server --host=0.0.0.0 --port=8080"
echo "  🔗  Expose port  →  ngrok http 3000"
echo "─────────────────────────────────────────────"
echo ""
