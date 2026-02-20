#!/bin/bash
# Quick Start Script - LvCreations Bot Captcha System
# Usage: bash quickstart.sh

echo "🚀 LvCreations Bot - Système Captcha"
echo "════════════════════════════════════════════════"
echo ""

# Step 1: Check Node.js
echo "1️⃣ Vérification de Node.js..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js n'est pas installé"
    echo "📍 Téléchargez depuis https://nodejs.org/"
    exit 1
fi
echo "✅ Node.js $(node --version)"
echo ""

# Step 2: Install dependencies
echo "2️⃣ Installation des dépendances..."
if [ ! -d "node_modules" ]; then
    npm install
    echo "✅ Dépendances installées"
else
    echo "✅ Dépendances déjà installées"
fi
echo ""

# Step 3: Check .env file
echo "3️⃣ Vérification du fichier .env..."
if [ ! -f ".env" ]; then
    echo "⚠️  Fichier .env non trouvé"
    echo "📝 Créez un fichier .env avec:"
    echo ""
    echo "   DISCORD_TOKEN=votre_token"
    echo "   CLIENT_ID=votre_client_id"
    echo "   GUILD_ID=votre_guild_id"
    echo "   CAPTCHA_ENABLED=true"
    echo "   CAPTCHA_EXPIRE_SECONDS=600"
    echo ""
    echo "Puis réexécutez ce script."
    exit 1
fi
echo "✅ Fichier .env configuré"
echo ""

# Step 4: Run tests
echo "4️⃣ Exécution des tests..."
node test-deployment.js
echo ""

# Step 5: Show next steps
echo "5️⃣ Prochaines étapes:"
echo ""
echo "🔧 Pour lancer le bot en mode développement:"
echo "   npm run dev"
echo ""
echo "🔧 Pour lancer le bot avec PM2:"
echo "   npm run pm2:start"
echo ""
echo "🌐 Pour accéder au dashboard:"
echo "   Ouvrez web/dashboard.html dans votre navigateur"
echo ""
echo "📖 Pour plus d'informations:"
echo "   - CAPTCHA_COMMANDS_SETTINGS.md"
echo "   - README_IMPLEMENTATION.md"
echo "   - INDEX_COMPLET.md"
echo ""
echo "✅ Prêt? Lancez: npm run dev"
echo ""
