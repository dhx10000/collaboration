#!/bin/bash
# post-create.sh — runs ONCE when the container is first created
# Use this for one-time setup: installing dependencies, cloning tools, etc.

set -e
echo "🚀 Running post-create setup..."

# ─── Python packages for Telegram bot ─────────────────────────────────────────
echo "📦 Installing Python packages..."
pip install --user --upgrade pip
pip install --user \
    python-telegram-bot \
    python-dotenv \
    requests \
    aiohttp \
    fastapi \
    uvicorn

# ─── Global Node.js tools ─────────────────────────────────────────────────────
echo "📦 Installing global Node.js tools..."
npm install -g \
    expo-cli \           # React Native / Expo (for Google Play + App Store builds)
    @wordpress/scripts \ # WordPress block development
    local-ssl-proxy \    # Local HTTPS for webhook testing (Telegram needs HTTPS)
    ngrok               # Expose local ports for Telegram webhook testing

# ─── Verify Claude Code is available ──────────────────────────────────────────
echo "🤖 Verifying Claude Code..."
claude --version && echo "✅ Claude Code ready" || echo "⚠️  Claude Code not found — run: npm install -g @anthropic-ai/claude-code"

echo ""
echo "✅ Post-create setup complete!"
echo ""
echo "Next steps:"
echo "  1. Run 'claude' in the terminal to sign in to Claude Code"
echo "  2. Copy .env.example to .env and fill in your secrets"
echo "  3. For Telegram bot: set TELEGRAM_BOT_TOKEN in .env"
echo "  4. For WordPress: use 'wp' CLI commands to manage your site"
