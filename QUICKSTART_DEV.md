# 🚀 Démarrage Rapide - LvCreations Bot

## 5 Minutes pour Démarrer

### 1. Installation
```bash
# Cloner le projet
git clone <repo-url>
cd LvCreations-Bot

# Installer les dépendances
npm install

# Créer le fichier .env
cp .env.example .env

# Éditer .env avec vos credentials
```

### 2. Configuration (.env)
```env
# Discord Bot
TOKEN=votre_token_bot
GUILD_ID=id_de_votre_serveur
CLIENT_ID=id_de_votre_application

# Optional
DEBUG=false
```

### 3. Démarrer le Bot
```bash
node src/index.js
```

### 4. Commandes Rapides
```
/help - Voir toutes les commandes
/rank - Voir votre niveau
/userinfo - Infos utilisateur
/ping - Tester la latence
```

### 5. Configuration Initiale
```
1. Ajouter le bot au serveur
2. Exécuter /setup welcome (optionnel)
3. Exécuter /setup autorole (optionnel)
4. C'est prêt!
```

---

## Structure du Projet en 1 Minute

```
src/
├── index.js          ← Bot principal (43+ commandes)
├── embeds.js         ← Embeds professionnels
├── storage.js        ← Sauvegarde JSON
├── utils.js          ← 60+ fonctions utilitaires
├── advanced.js       ← 50+ systèmes avancés
├── config.js         ← Configuration
└── protections.js    ← Anti-spam, anti-raid, etc.

Fichiers documentations:
├── FEATURES_V2_1.md      ← Nouvelles fonctionnalités
├── GUIDE_COMPLET.md      ← Guide d'utilisation détaillé
├── BEST_PRACTICES.md     ← Standards de code
├── ROADMAP_v2_2.md       ← Améliorations futures
└── IMPROVEMENTS_TODO.md  ← Tâches à faire
```

---

## Les 10 Commandes Essentielles

| Commande | Description |
|----------|-------------|
| `/help` | Voir toutes les commandes |
| `/rank` | Votre niveau XP |
| `/userinfo` | Infos sur vous |
| `/serverinfo` | Infos du serveur |
| `/botinfo` | Infos du bot |
| `/play <musique>` | Jouer une musique |
| `/kick @user` | Expulser un utilisateur |
| `/ban @user` | Bannir un utilisateur |
| `/leaderboard` | Top 10 des meilleurs |
| `/ping` | Latence du bot |

---

## Les 5 Modules Importants

### 1. **utils.js** - 60+ Fonctions
```javascript
utils.formatNumber(1234567)      // "1,234,567"
utils.formatDuration(3600000)    // "1h"
utils.capitalize("hello")        // "Hello"
utils.isValidEmail("a@b.com")   // true
utils.getRandomInt(1, 10)       // 1-10
```

### 2. **advanced.js** - Systèmes Avancés
```javascript
advanced.addReputation(userId, 10)
advanced.badgeSystem              // 10 types de badges
advanced.getRandomQuiz()          // Quiz aléatoire
advanced.createTag(userId, name, content)
```

### 3. **embeds.js** - Embeds Pro
```javascript
createSuccessEmbed('Titre', 'Message')
createErrorEmbed('Erreur', 'Problème')
createWarningEmbed('Attention', 'Info')
createInfoEmbed('Info', 'Détail')
```

### 4. **storage.js** - Données Persistantes
```javascript
storage.get('users')
storage.set('users', data)
storage.getLevel(userId)
storage.setLevel(userId, level)
```

### 5. **protections.js** - Sécurité
```javascript
// Anti-spam, anti-raid, anti-ads
// Automatique et configurable
```

---

## Ajouter Votre Première Commande (10 min)

### Étape 1: Créer le Commande Builder
```javascript
// Dans src/index.js ligne ~100
new SlashCommandBuilder()
  .setName('hello')
  .setDescription('Dis bonjour')
  .addUserOption(opt =>
    opt.setName('user')
      .setDescription('Utilisateur')
      .setRequired(true)
  ),
```

### Étape 2: Ajouter l'Handler
```javascript
// Trouver "InteractionCreate" event
if (commandName === 'hello') {
  const user = interaction.options.getUser('user');
  const embed = createSuccessEmbed(
    'Salut!',
    `Bonjour ${user.username}! 👋`
  );
  return interaction.reply({ embeds: [embed] });
}
```

### Étape 3: Redémarrer
```bash
npm run reload
# ou relancer le bot
```

### Voilà! ✅

---

## Modifier une Commande Existante

### Exemple: Améliorer /ping
```javascript
// Dans src/index.js ligne ~2000
if (commandName === 'ping') {
  const ping = client.ws.ping;
  const uptime = utils.formatDuration(client.uptime);
  const embed = createInfoEmbed(
    '🏓 Pong!',
    `Latence: **${ping}ms**\nUptime: **${uptime}**`
  );
  return interaction.reply({ embeds: [embed] });
}
```

---

## Ajouter une Fonction Utilitaire

### Étape 1: Dans src/utils.js
```javascript
myNewFunction: (param1, param2) => {
  // Votre logique
  return result;
}
```

### Étape 2: Utiliser dans une Commande
```javascript
const result = utils.myNewFunction(arg1, arg2);
```

### C'est tout! 🎉

---

## Déboguer (Debug Mode)

### Activer les Logs
```bash
# .env
DEBUG=true

# Puis relancer
node src/index.js
```

### Voir les Logs du Bot
```
/logs
```

### Exécuter du Code
```
/eval client.users.cache.size
/eval await guild.members.fetch()
```

---

## Erreurs Communes

### ❌ "Token invalide"
```
→ Vérifier le token dans .env
→ Vérifier que le bot est créé sur Discord Dev Portal
```

### ❌ "Commande non reconnue"
```
→ Redémarrer le bot: /reload
→ Attendre quelques minutes (cache Discord)
```

### ❌ "Pas de permission"
```
→ Donner les permissions au bot dans le serveur
→ Vérifier que le rôle du bot est au-dessus des autres
```

### ❌ "Erreur 404 ou 403"
```
→ Vérifier les IDs (GUILD_ID, CLIENT_ID)
→ Vérifier les permissions du bot
→ Vérifier que le bot est dans le serveur
```

---

## Ressources Utiles

- [Discord Developer Portal](https://discord.com/developers/applications)
- [Discord.js Documentation](https://discord.js.org/)
- [Comment Obtenir un Token](https://discord.com/developers/docs/intro)
- [Guide Complet (ce dossier)](./GUIDE_COMPLET.md)
- [Best Practices](./BEST_PRACTICES.md)

---

## Commandes Utiles

### Développement
```bash
npm start              # Démarrer le bot
npm run reload         # Redémarrer (si implement)
npm run dev            # Mode développement
npm test              # Lancer les tests
npm run lint          # Vérifier le code
```

### Gestion
```bash
npm install           # Installer dépendances
npm update            # Mettre à jour
npm audit fix         # Corriger vulnérabilités
```

---

## Architecture Rapide

```
Bot reçoit une commande
    ↓
InteractionCreate event
    ↓
Vérifier les permissions
    ↓
Exécuter la logique
    ↓
Formater avec embeds
    ↓
Envoyer la réponse
    ↓
Logger l'action
```

---

## Prochaines Étapes

1. ✅ **Première Commande** - Ajouter `/hello`
2. **Amélioration** - Modifier `/ping`
3. **Fonction Helper** - Ajouter dans utils.js
4. **Gestion d'Erreur** - Tester les erreurs
5. **Déploiement** - Mettre en ligne

---

## Support & Questions

- 📖 Lire [GUIDE_COMPLET.md](./GUIDE_COMPLET.md)
- 💡 Consulter [BEST_PRACTICES.md](./BEST_PRACTICES.md)
- 🎯 Voir les [IMPROVEMENTS_TODO.md](./IMPROVEMENTS_TODO.md)
- 📚 Discord.js Docs: https://discord.js.org/

---

**Happy Coding! 🚀**

*Version: 2.1 | Dernière mise à jour: 2024*
