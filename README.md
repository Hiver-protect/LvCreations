# LvCreations Bot

Bot Discord complet en Node.js avec 40+ commandes et de nombreuses fonctionnalités avancées. ✨

## ✨ Fonctionnalités Complètes

### 🛡️ Modération
- Kick, ban, timeout, clear
- Système d'avertissements (warn/warns/clearwarn)
- Auto-mute et auto-ban après X avertissements
- Mute/unmute en vocal
- Logging complet des actions

### 🎫 Système de Tickets
- Création de tickets avec boutons
- Panel de tickets réutilisable
- Permissions automatiques
- Logs des actions

### 🎵 Musique
- Play, pause, resume, skip, stop
- File d'attente avec pagination
- Support YouTube, Spotify, et autres sources
- Join/leave automatique

### 🎉 Giveaways
- Création de giveaways avec réactions
- Reroll automatique
- Sélection aléatoire des gagnants
- Rôle requis optionnel

### 📊 Leveling & Profil
- Système XP automatique par message
- Rankup avec annonces
- Profil utilisateur avec stats
- Info serveur détaillée

### 🔐 Protections Avancées
- Anti-spam
- Anti-raid avec détection d'joins massifs
- Anti-publicité
- AutoMod
- Vérification de membres (captcha)
- Raid mode activable manuellement

### 👥 Reaction Roles
- Ajouter/supprimer des rôles via réactions
- Stockage persistant
- Support emoji personnalisés

### 🎮 Jeux & Fun
- 8ball (boule magique)
- Dés
- Blagues aléatoires
- Citations du jour
- Machine à sous
- Pierre-papier-ciseaux
- Calculatrice
- Statut AFK

### 📢 Annonces & Sondages
- Annonces formatées
- Sondages avec réactions
- Suggestions avec votes

### ⚙️ Administration
- Commandes eval (ADMIN)
- Reload et poweroff du bot
- Voir les logs du bot
- Configuration serveur
- Stats en temps réel

## 🚀 Installation Rapide

1. **Crée le bot Discord**
   - Va sur [Discord Developer Portal](https://discord.com/developers/applications)
   - Crée une nouvelle application
   - Ajoute un bot et récupère le token

2. **Clone et configure**
   ```bash
   npm install
   cp .env.example .env
   # Edite .env avec tes paramètres
   ```

3. **Installe les dépendances système**
   - Installe [FFmpeg](https://ffmpeg.org/download.html) (requis pour la musique)
   - Utilise Node.js 18.17 ou supérieur
   - Windows: Ajoute FFmpeg au PATH

4. **Lance le bot**
   ```bash
   npm start
   ```

## 🎮 Utilisation

Invite le bot sur ton serveur avec les permissions appropriées, puis utilise les slash commands:

```
/help          - Liste toutes les commandes
/botinfo       - Infos du bot
/serverinfo    - Infos du serveur
/play [chanson] - Jouer une musique
/kick @user    - Expulser un membre
/giveaway      - Lancer un giveaway
```

## 📋 Commandes Principales

### Modération
- `/kick`, `/ban`, `/timeout`, `/untimeout`, `/clear`
- `/warn`, `/warns`, `/clearwarn`
- `/mute`, `/unmute`

### Musique
- `/play`, `/pause`, `/resume`, `/skip`, `/stop`, `/queue`
- `/join`, `/leave`

### Giveaways
- `/giveaway [durée] [gagnants] [prix]`
- `/reroll [message_id]`

### Profil & Info
- `/rank`, `/userinfo`, `/serverinfo`, `/botinfo`
- `/avatar`, `/stats`

### Admin
- `/setup`, `/protections`, `/settings`
- `/eval`, `/reload`, `/poweroff`

**Voir [IMPROVEMENTS.md](IMPROVEMENTS.md) pour la liste complète de toutes les commandes.**

## Variables d'environnement
- `DISCORD_TOKEN`: token du bot
- `CLIENT_ID`: application id du bot
- `COMMAND_PREFIX`: préfixe des commandes (ex: !)
- `GUILD_ID`: optionnel, pour sync plus rapide des slash
- `LOG_CHANNEL_ID`: salon de logs
- `WELCOME_CHANNEL_ID`: salon bienvenue/leave
- `LEVEL_CHANNEL_ID`: salon pour annonces de level
- `TICKET_CATEGORY_ID`: catégorie pour tickets (optionnel)
- `STAFF_ROLE_ID`: rôle staff pour tickets
- `GIVEAWAY_ROLE_ID`: rôle requis pour participer aux giveaways (optionnel)
- `SYNC_COMMANDS`: true/false pour sync auto des slash
- `CAPTCHA_ENABLED`: true/false
- `CAPTCHA_CHANNEL_ID`: salon de vérification (si DM fermés)
- `UNVERIFIED_ROLE_ID`: rôle ajouté avant vérification
- `VERIFIED_ROLE_ID`: rôle ajouté après vérification
- `CAPTCHA_EXPIRE_SECONDS`: durée avant expiration
- `RAID_WINDOW_SECONDS`: fenêtre de détection
- `RAID_MAX_JOINS`: seuil de joins
- `RAID_MODE_DURATION`: durée du raid mode
- `RAID_ACTION`: action pendant raid (kick)

## Commandes principales
- `kick @membre [raison]`
- `ban @membre [raison]`
- `timeout @membre 10m [raison]`
- `untimeout @membre`
- `clear 10`
- `ticket create` / `ticket close`
- `ticketpanel`
- `rank [@membre]`
- `giveaway 10m 1 Nitro`
- `reroll <message_id> [winners]`
- `rr add <message_id> <emoji> <role>`
- `rr remove <message_id> <emoji> <role>`
- `join`
- `leave`
- `play <recherche|url>`
- `pause`
- `resume`
- `skip`
- `stop`
- `queue`
- `verify <code>`
- `raidmode on/off`
