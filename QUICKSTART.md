# 🚀 Quick Start Guide - LvCreations Bot v2.0.1

## ⚡ 5 Minutes Setup

### 1️⃣ Installation
```bash
cd "LvCreations Bot"
npm install
```

### 2️⃣ Configuration
```bash
# Copier le fichier d'exemple (si pas déjà fait)
cp .env.example .env

# Éditer .env avec tes paramètres:
# - DISCORD_TOKEN=ton_token
# - CLIENT_ID=ton_client_id
# - GUILD_ID=ton_guild_id (optionnel)
```

### 3️⃣ Lancer le Bot
```bash
npm start
```

**Fait! ✅** Le bot devrait être en ligne.

---

## 🎮 Commandes Essentielles

### Modération
```
/kick @user [raison]
/ban @user [raison]
/timeout @user 10m [raison]
/clear 10
/warn @user raison
```

### Musique
```
/play nom_chanson
/pause
/resume
/skip
/queue
```

### Giveaways
```
/giveaway 10m 1 Nitro
/reroll message_id
```

### Admin
```
/setup log-channel #channel
/protections
/settings anti-spam on
/botinfo
```

---

## 📊 Important à Savoir

- **43 commandes** complètement fonctionnelles
- **7 événements** automatiques implémentés
- **6 protections** actives
- **Aucun bug** connu

---

## 🐛 Bugs Fixes (v2.0.1)

✅ ActivityType enum fixé  
✅ parseDuration() ajoutée  
✅ Commandes admin enregistrées  
✅ Sécurité eval améliorée  
✅ .env formaté correctement  
✅ IDs en storage corrigés  

---

## 📁 Fichiers Importants

- `src/index.js` - Bot principal avec toutes les commandes
- `src/storage.js` - Gestion de la base de données JSON
- `src/embeds.js` - Embed helpers
- `src/protections.js` - Système de protection
- `.env` - Configuration (garder privé!)
- `IMPROVEMENTS.md` - Rapport détaillé des fixes
- `CHANGELOG.md` - Historique des changements

---

## 🔧 Mode Développement

```bash
npm run dev
# Redémarre automatiquement à chaque changement
```

---

## ⚙️ Mode Production (PM2)

```bash
npm run pm2:start    # Lancer
npm run pm2:logs     # Voir les logs
npm run pm2:restart  # Redémarrer
npm run pm2:stop     # Arrêter
npm run pm2:monitor  # Monitoring
```

---

## ✅ Checklist Avant Production

- [ ] DISCORD_TOKEN est défini dans `.env`
- [ ] CLIENT_ID est défini dans `.env`
- [ ] Bot a permission Administrator sur le serveur
- [ ] FFmpeg est installé (pour la musique)
- [ ] Node.js 18.17+ installé
- [ ] `npm install` a été exécuté
- [ ] Bot démarre sans erreurs

---

## 🆘 Troubleshooting

### Le bot ne démarre pas
```
1. Vérifier DISCORD_TOKEN dans .env
2. npm install
3. Vérifier Node.js version: node -v
```

### Pas de musique
```
1. Installer FFmpeg: https://ffmpeg.org/download.html
2. Ajouter au PATH Windows
3. Redémarrer le bot
```

### Commandes non disponibles
```
1. SYNC_COMMANDS=true dans .env
2. Attendre 5-10 minutes
3. Rafraîchir Discord (Ctrl+R)
```

---

## 📞 Support

Consulter:
- `IMPROVEMENTS.md` - Détails techniques
- `CHANGELOG.md` - Changements v2.0.1
- `README.md` - Documentation complète

---

**Bon gaming! 🎮**

Dernière mise à jour: 31 Janvier 2026
