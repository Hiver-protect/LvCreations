# 🔐 Système de Captcha, Commandes et Settings

## 📋 Vue d'ensemble

Ce document décrit les nouveaux systèmes implémentés pour LvCreations Bot v2.1:
- **Système de Captcha** - Vérification automatique des nouveaux membres
- **Système de Commandes** - Commandes slash complètes et structurées
- **Système de Settings** - Gestion centralisée des paramètres par serveur

---

## 🔐 Système de Captcha

### Fichier: `src/captcha.js`

Le système de captcha offre 3 types différents de vérification:

#### Types de Captcha

**1. Code Simple** - 4 chiffres aléatoires
```
Code: 3847
```

**2. Problème Mathématique** - Opérations simples
```
Question: 15 + 23 = ?
```

**3. Code Image** - 6 caractères alphanumériques
```
Code: A7K3M9
```

### API Captcha Manager

```javascript
const captchaManager = require('./captcha');

// Générer un code
const code = captchaManager.generateCode();

// Générer un problème mathématique
const math = captchaManager.generateMathCaptcha();

// Générer un code image
const image = captchaManager.generateImageCaptcha();

// Créer un embed de captcha
const embed = captchaManager.createCaptchaEmbed(userId, 'code');

// Vérifier un captcha
const result = captchaManager.verifyCaptcha(userId, userAnswer, 'code');

// Marquer comme vérifiés
captchaManager.markVerified(userId);
captchaManager.isVerified(userId);

// Statistiques
const stats = captchaManager.getStats();
```

### Configuration du Captcha

```env
CAPTCHA_ENABLED=true
CAPTCHA_CHANNEL_ID=1234567890
UNVERIFIED_ROLE_ID=1234567890
VERIFIED_ROLE_ID=1234567890
CAPTCHA_EXPIRE_SECONDS=600
```

---

## 📋 Système de Commandes

### Fichier: `src/commands.js`

Le fichier contient toutes les commandes slash structurées:

### Catégories de Commandes

#### 🔐 Captcha
```
/captcha enable      - Activer le captcha
/captcha disable     - Désactiver le captcha
/captcha type        - Changer le type
/captcha status      - Voir l'état
```

#### ⚙️ Paramètres
```
/settings welcome    - Canal de bienvenue
/settings logs       - Canal de logs
/settings prefix     - Changer le préfixe
/settings language   - Changer la langue
/settings view       - Voir tous les paramètres
```

#### 🛡️ Modération
```
/warn       - Avertir un utilisateur
/kick       - Expulser
/ban        - Bannir
/timeout    - Mettre en timeout
/clear      - Supprimer des messages
```

#### 🎵 Musique
```
/play       - Jouer une chanson
/pause      - Mettre en pause
/resume     - Reprendre
/skip       - Passer au suivant
/stop       - Arrêter
/queue      - Voir la file d'attente
```

#### 🎫 Tickets
```
/ticket create  - Créer un panel
/ticket close   - Fermer le ticket
```

#### 🎁 Giveaways
```
/giveaway   - Créer un giveaway
```

#### ℹ️ Informations
```
/serverinfo - Info du serveur
/userinfo   - Info utilisateur
/stats      - Statistiques du bot
/help       - Aide
/ping       - Ping du bot
```

---

## ⚙️ Système de Settings

### Fichier: `src/settings.js`

Gestion centralisée des paramètres par serveur.

### Paramètres Disponibles

```javascript
{
    prefix: '/',                    // Préfixe du bot
    language: 'fr',                 // Langue: fr, en, es
    captchaEnabled: true,           // Captcha activé
    captchaType: 'code',            // Type: code, math, image
    welcomeChannel: null,           // Canal de bienvenue
    logsChannel: null,              // Canal de logs
    ticketCategory: null,           // Catégorie tickets
    staffRole: null,                // Rôle staff
    modLogChannel: null,            // Canal logs modération
    autoModeration: true,           // Auto-modération
    antiRaid: true,                 // Anti-raid
    antiSpam: true,                 // Anti-spam
    levelSystem: true,              // Système de niveaux
    musicFormat: 'high',            // Qualité: low, medium, high
    timezone: 'Europe/Paris'        // Fuseau horaire
}
```

### API Settings Manager

```javascript
const settingsManager = require('./settings');

// Obtenir les paramètres d'un serveur
const settings = settingsManager.getGuildSettings(guildId);

// Modifier un paramètre
settingsManager.setSetting(guildId, 'prefix', '!');

// Mettre à jour plusieurs paramètres
settingsManager.updateSettings(guildId, {
    language: 'en',
    autoModeration: false
});

// Réinitialiser
settingsManager.resetSettings(guildId);

// Captcha
settingsManager.setCaptchaEnabled(guildId, true);
settingsManager.setCaptchaType(guildId, 'math');

// Canaux
settingsManager.setWelcomeChannel(guildId, channelId);
settingsManager.setLogsChannel(guildId, channelId);

// Rôles
settingsManager.setStaffRole(guildId, roleId);

// Fonctionnalités
settingsManager.setAutoModeration(guildId, true);
settingsManager.setAntiRaid(guildId, true);
```

---

## 🌐 Dashboard Web

### Fichier: `web/dashboard.html`

Interface web pour gérer le bot avec 4 sections principales:

### 📊 Dashboard
- Affiche les statistiques du bot
- État de connexion
- Utilisateurs vérifiés
- Captchas actifs
- Performance

### 🔐 Gestion du Captcha
- Activer/Désactiver le captcha
- Changer le type
- Définir l'expiration
- Aperçu du captcha
- Test du captcha

### 📋 Commandes
- Liste complète des commandes
- Organisées par catégorie
- Description de chaque commande

### ⚙️ Paramètres
- Préfixe
- Langue
- Fuseau horaire
- Sécurité (Anti-Raid, Anti-Spam, etc.)
- Fonctionnalités (Musique, Niveaux, etc.)
- Sauvegarde / Réinitialisation

---

## 📁 Structure des Fichiers

```
src/
├── captcha.js              # Système de captcha
├── commands.js             # Définitions des commandes
├── settings.js             # Gestion des paramètres
├── commandHandlers.js      # Handlers des commandes
└── index.js                # Bot principal (à intégrer)

web/
├── dashboard.html          # Interface principale
├── css/
│   └── dashboard.css       # Styles
└── js/
    └── dashboard.js        # Logique du dashboard
```

---

## 🔗 Intégration avec le Bot

Pour intégrer ces systèmes au bot principal (`src/index.js`):

```javascript
const captchaManager = require('./captcha');
const settingsManager = require('./settings');
const commands = require('./commands');
const { handleCaptcha, handleSettings } = require('./commandHandlers');

// Charger les commandes
const rest = new REST({ version: '10' }).setToken(process.env.DISCORD_TOKEN);
const commandData = commands.map(cmd => cmd.toJSON());

// Enregistrer les commandes
(async () => {
  try {
    await rest.put(
      Routes.applicationCommands(process.env.CLIENT_ID),
      { body: commandData }
    );
    console.log('✅ Commandes chargées');
  } catch (error) {
    console.error('❌ Erreur chargement commandes:', error);
  }
})();

// Gérer les interactions
client.on('interactionCreate', async (interaction) => {
    if (!interaction.isChatInputCommand()) return;
    
    try {
        await handleCaptcha(interaction, client);
        await handleSettings(interaction, client);
        // Ajouter d'autres handlers...
    } catch (error) {
        console.error('Erreur:', error);
    }
});
```

---

## 📊 Statistiques et Monitoring

```javascript
// Voir les stats du captcha
const captchaStats = captchaManager.getStats();
console.log(`Captchas actifs: ${captchaStats.activeCount}`);
console.log(`Utilisateurs vérifiés: ${captchaStats.verifiedCount}`);

// Voir les stats des settings
const settingsStats = settingsManager.getAllStats();
console.log(`Serveurs configurés: ${settingsStats.guilds}`);
```

---

## 🔒 Sécurité

- Les captchas expirent après 10 minutes (configurable)
- Limite de 5 tentatives par captcha
- Les données sont stockées dans `data.json`
- Validation des permissions pour les commandes admin

---

## 📝 Exemple d'Utilisation Complet

```javascript
// Créer un captcha pour un nouvel utilisateur
const userId = '123456789';
const guildId = '987654321';

// Vérifier si le captcha est activé
if (settingsManager.getCaptchaEnabled(guildId)) {
    // Obtenir le type de captcha
    const type = settingsManager.getCaptchaType(guildId);
    
    // Créer l'embed
    const embed = captchaManager.createCaptchaEmbed(userId, type);
    const buttons = captchaManager.createCaptchaButtons();
    
    // Envoyer le message
    await channel.send({ embeds: [embed], components: [buttons] });
    
    // Plus tard, vérifier la réponse
    const response = 'réponse_utilisateur';
    const result = captchaManager.verifyCaptcha(userId, response, type);
    
    if (result.success) {
        // Marquer comme vérifiés
        captchaManager.markVerified(userId);
        // Donner le rôle vérifiés
        await member.roles.add(settingsManager.getGuildSettings(guildId).verifiedRole);
    }
}
```

---

## 🚀 Commandes Slash d'Administration

```bash
# Synchroniser les commandes
/reload

# Voir le statut
/stats

# Configuration rapide
/settings view
```

---

## 📞 Support

Pour toute question ou problème:
- Discord: https://discord.gg/lvcreations
- GitHub: [LvCreations Bot]

**Version:** 2.1.0  
**Dernière mise à jour:** 31/01/2026
