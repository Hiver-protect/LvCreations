#!/usr/bin/env powershell
# Quick Start Script - LvCreations Bot Captcha System (Windows)
# Usage: .\quickstart.ps1

Write-Host "🚀 LvCreations Bot - Système Captcha" -ForegroundColor Cyan
Write-Host "════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# Step 1: Check Node.js
Write-Host "1️⃣ Vérification de Node.js..." -ForegroundColor Yellow
$nodeExists = Get-Command node -ErrorAction SilentlyContinue
if (-not $nodeExists) {
    Write-Host "❌ Node.js n'est pas installé" -ForegroundColor Red
    Write-Host "📍 Téléchargez depuis https://nodejs.org/" -ForegroundColor Cyan
    exit 1
}
$nodeVersion = node --version
Write-Host "✅ Node.js $nodeVersion" -ForegroundColor Green
Write-Host ""

# Step 2: Install dependencies
Write-Host "2️⃣ Installation des dépendances..." -ForegroundColor Yellow
if (-not (Test-Path "node_modules")) {
    npm install
    Write-Host "✅ Dépendances installées" -ForegroundColor Green
} else {
    Write-Host "✅ Dépendances déjà installées" -ForegroundColor Green
}
Write-Host ""

# Step 3: Check .env file
Write-Host "3️⃣ Vérification du fichier .env..." -ForegroundColor Yellow
if (-not (Test-Path ".env")) {
    Write-Host "⚠️  Fichier .env non trouvé" -ForegroundColor Yellow
    Write-Host "📝 Créez un fichier .env avec:" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   DISCORD_TOKEN=votre_token" -ForegroundColor White
    Write-Host "   CLIENT_ID=votre_client_id" -ForegroundColor White
    Write-Host "   GUILD_ID=votre_guild_id" -ForegroundColor White
    Write-Host "   CAPTCHA_ENABLED=true" -ForegroundColor White
    Write-Host "   CAPTCHA_EXPIRE_SECONDS=600" -ForegroundColor White
    Write-Host ""
    Write-Host "Puis réexécutez ce script." -ForegroundColor Yellow
    exit 1
}
Write-Host "✅ Fichier .env configuré" -ForegroundColor Green
Write-Host ""

# Step 4: Run tests
Write-Host "4️⃣ Exécution des tests..." -ForegroundColor Yellow
node test-deployment.js
Write-Host ""

# Step 5: Show next steps
Write-Host "5️⃣ Prochaines étapes:" -ForegroundColor Yellow
Write-Host ""
Write-Host "🔧 Pour lancer le bot en mode développement:" -ForegroundColor Cyan
Write-Host "   npm run dev" -ForegroundColor White
Write-Host ""
Write-Host "🔧 Pour lancer le bot avec PM2:" -ForegroundColor Cyan
Write-Host "   npm run pm2:start" -ForegroundColor White
Write-Host ""
Write-Host "🌐 Pour accéder au dashboard:" -ForegroundColor Cyan
Write-Host "   Ouvrez web/dashboard.html dans votre navigateur" -ForegroundColor White
Write-Host ""
Write-Host "📖 Pour plus d'informations:" -ForegroundColor Cyan
Write-Host "   - CAPTCHA_COMMANDS_SETTINGS.md" -ForegroundColor White
Write-Host "   - README_IMPLEMENTATION.md" -ForegroundColor White
Write-Host "   - INDEX_COMPLET.md" -ForegroundColor White
Write-Host ""
Write-Host "✅ Prêt? Lancez: npm run dev" -ForegroundColor Green
Write-Host ""
