# ✅ Best Practices - LvCreations Bot

## 📋 Standards de Code

### 1. Nommage des Variables

#### ✅ Correct
```javascript
const userData = storage.get('users');
const messageContent = message.content;
const isAdmin = member.permissions.has(PermissionFlagsBits.Administrator);
const formatDuration = (ms) => { };
const MAX_MESSAGE_LENGTH = 2000;
```

#### ❌ Incorrect
```javascript
const u = storage.get('users');
const msg = message.content;
const admin = member.permissions.has(PermissionFlagsBits.Administrator);
const fd = (ms) => { };
const max = 2000;
```

### 2. Fonctions

#### ✅ Correct - Courtes et Spécifiques
```javascript
function validateUserId(userId) {
  return utils.isValidDiscordId(userId);
}

const getTopUsers = (limit = 10) => {
  return storage.get('levels')
    ?.entries()
    .sort((a, b) => b.xp - a.xp)
    .slice(0, limit) || [];
};
```

#### ❌ Incorrect - Trop Longues
```javascript
function doEverything(userId, limit, format, action) {
  // 200+ lignes qui font trop de choses
  // Manipulation de données
  // Validation
  // Formatage
  // API calls
  // etc.
}
```

### 3. Commentaires

#### ✅ Correct
```javascript
// Récupérer les utilisateurs et les trier par XP
const topUsers = getUsersByXP();

// Sécurité: Vérifier admin avant d'exécuter
if (!isAdmin(interaction.member)) {
  return;
}
```

#### ❌ Incorrect
```javascript
// boucle
for (let i = 0; i < 10; i++) {

// var x
let x = 5;

// TODO: fix this
// FIXME: debug
```

---

## 🛡️ Gestion des Erreurs

### ✅ Correct
```javascript
try {
  const user = await guild.members.fetch(userId);
  return user;
} catch (error) {
  console.error(`Erreur récupération utilisateur ${userId}:`, error);
  const embed = createErrorEmbed('Erreur', 'Utilisateur introuvable');
  await interaction.reply({ embeds: [embed], ephemeral: true });
}
```

### ❌ Incorrect
```javascript
const user = await guild.members.fetch(userId); // Pas de try/catch
// ou
try {
  const user = await guild.members.fetch(userId);
} catch (e) {
  // Rien, erreur silencieuse
}
```

---

## 🔒 Sécurité

### 1. Permissions Toujours
```javascript
// ✅ CORRECT - Vérifier les permissions
if (!interaction.member.permissions.has(PermissionFlagsBits.Administrator)) {
  return interaction.reply({ content: '❌ Accès refusé', ephemeral: true });
}

// ❌ INCORRECT - Pas de vérification
client.on('interactionCreate', (interaction) => {
  if (interaction.commandName === 'admin-command') {
    // Exécuter directement
  }
});
```

### 2. Validation des Entrées
```javascript
// ✅ CORRECT
const userId = interaction.options.getString('user');
if (!utils.isValidDiscordId(userId)) {
  return interaction.reply({ content: '❌ ID invalide', ephemeral: true });
}

// ❌ INCORRECT
const userId = interaction.options.getString('user');
// Utiliser directement sans vérifier
```

### 3. Secrets en Variables d'Environnement
```javascript
// ✅ CORRECT
const token = process.env.TOKEN;
const guildId = process.env.GUILD_ID;

// ❌ INCORRECT
const token = 'MzQ2NzQyODQwODQyNzE2NjQy...';
const credentials = { username: 'admin', password: '12345' };
```

---

## 📊 Performance

### 1. Caching
```javascript
// ✅ CORRECT - Utiliser cache
const cache = utils.createCache(60000); // 1 minute TTL
const getUser = (id) => {
  if (cache.has(id)) return cache.get(id);
  const user = fetchUser(id);
  cache.set(id, user);
  return user;
};

// ❌ INCORRECT - Pas de cache
const getUser = (id) => {
  return fetchUser(id); // Appel API à chaque fois
};
```

### 2. Debounce
```javascript
// ✅ CORRECT
const saveData = utils.debounce(() => {
  storage.save();
}, 5000);

client.on('messageCreate', (msg) => {
  // ... process message
  saveData(); // N'appelle save que si pas appelé pendant 5s
});

// ❌ INCORRECT
client.on('messageCreate', (msg) => {
  storage.save(); // Sauvegarde à chaque message!
});
```

### 3. Queries Optimisées
```javascript
// ✅ CORRECT - Utiliser les filtres natifs
const humans = members.filter(m => !m.user.bot).size;

// ❌ INCORRECT - Boucle complète
let humanCount = 0;
for (let i = 0; i < members.size; i++) {
  if (!members[i].user.bot) humanCount++;
}
```

---

## 📝 Logs et Débogage

### 1. Logs Structurés
```javascript
// ✅ CORRECT
addLog(`[MOD] ${interaction.user.tag} a banni ${targetUser.tag} pour ${reason}`);
addLog(`[ERROR] Impossible de charger les données utilisateur ${userId}: ${error.message}`);

// ❌ INCORRECT
addLog('Ban');
addLog('error');
addLog('user error'); // Vague et peu informatif
```

### 2. Niveaux de Log
```javascript
// INFO - Événements normaux
console.log('[INFO] Bot démarré avec succès');

// WARN - Avertissements
console.warn('[WARN] Mute de 10 utilisateurs après le timeout');

// ERROR - Erreurs
console.error('[ERROR] Impossible de se connecter à la base de données');

// DEBUG - Informations de débogage (dev only)
if (process.env.DEBUG) {
  console.debug('[DEBUG] Cache state:', cache);
}
```

---

## 🧪 Tests

### 1. Tester les Fonctions
```javascript
// ✅ CORRECT
function calculateLevel(xp) {
  return Math.floor(Math.sqrt(xp / 100));
}

// Tests
console.assert(calculateLevel(0) === 0);
console.assert(calculateLevel(10000) === 10);
console.assert(calculateLevel(40000) === 20);
```

### 2. Tester les Embeds
```javascript
// ✅ CORRECT
const embed = createSuccessEmbed('Test', 'Message');
console.assert(embed.color === 0x2ECC71); // Vert succès
console.assert(embed.title === 'Test');
console.assert(embed.data.footer.text.includes('LvCreations'));
```

### 3. Tester les Permissions
```javascript
// ✅ CORRECT
function canKick(mod, target) {
  if (!mod.permissions.has(PermissionFlagsBits.KickMembers)) return false;
  if (target.permissions.has(PermissionFlagsBits.Administrator)) return false;
  return mod.roles.highest.position > target.roles.highest.position;
}

// Tests
console.assert(canKick(modMember, normalMember) === true);
console.assert(canKick(normalMember, normalMember) === false);
console.assert(canKick(modMember, adminMember) === false);
```

---

## 📐 Structure de Projet

### ✅ Correct - Modularisé
```
src/
├── index.js              # Bot principal
├── embeds.js             # Constructeurs embeds
├── storage.js            # Gestion données
├── utils.js              # Fonctions utilitaires
├── advanced.js           # Systèmes avancés
├── config.js             # Configuration
├── protections.js        # Systèmes protection
└── commands/             # (futur) Commandes séparées
    ├── moderation.js
    ├── music.js
    ├── fun.js
    └── admin.js
```

### ❌ Incorrect - Monolithique
```
bot.js (5000+ lignes)
  ├── Toutes les commandes
  ├── Tous les événements
  ├── Tous les systèmes
  └── Aucune séparation
```

---

## 🔄 Versioning

### Format Semantic Versioning (semver)
```
MAJOR.MINOR.PATCH

2.1.0
│ │ └─ PATCH: Corrections de bugs (backward compatible)
│ └─── MINOR: Nouvelles features (backward compatible)
└───── MAJOR: Breaking changes

Exemples:
1.0.0 - Version initiale
1.0.1 - Correction de bug
1.1.0 - Nouvelle fonctionnalité
2.0.0 - Changement important (breaking)
```

### Changelog
```markdown
# Version 2.1.0
## Nouvelles Fonctionnalités
- Ajout du système de réputation
- Ajout des badges utilisateur

## Améliorations
- Embeds plus professionnels
- Performance optimisée

## Corrections de Bugs
- Correction du parsing de durée

## Breaking Changes
Aucun
```

---

## 🧹 Code Cleanup

### Avant (❌)
```javascript
const data = storage.get('users');
const arr = [];
for (let i = 0; i < data.length; i++) {
  if (data[i].level > 10) {
    arr.push(data[i]);
  }
}
const sorted = arr.sort((a, b) => b.xp - a.xp);
return sorted;
```

### Après (✅)
```javascript
const getHighLevelUsers = () => {
  const users = storage.get('users') || [];
  return users
    .filter(user => user.level > 10)
    .sort((a, b) => b.xp - a.xp);
};
```

---

## 📚 Documentation

### 1. README
```markdown
# Bot Name
Description courte

## Installation
Étapes d'installation

## Configuration
Variables d'environnement

## Usage
Exemples d'utilisation

## Features
Liste des fonctionnalités

## Support
Comment obtenir de l'aide
```

### 2. JSDoc
```javascript
/**
 * Récupère le niveau d'un utilisateur
 * @param {string} userId - L'ID Discord de l'utilisateur
 * @returns {number} Le niveau de l'utilisateur
 * @throws {Error} Si l'utilisateur n'existe pas
 */
function getLevel(userId) {
  // ...
}
```

### 3. Inline Comments
```javascript
// Pour les logiques complexes uniquement
// Pour expliquer le "pourquoi", pas le "quoi"
// Le code devrait être assez clair pour s'expliquer

// ✅ CORRECT - Explique la raison
// Vérifier admin car seuls les admins peuvent bannir
if (!isAdmin(member)) return;

// ❌ INCORRECT - Redondant
// Vérifier si admin
if (!isAdmin(member)) return;
```

---

## 🚀 Déploiement

### Checklist Avant Déploiement
- [ ] Tous les tests passent
- [ ] Pas d'erreurs de compilation
- [ ] Logs nettoyés
- [ ] Variables d'environnement définies
- [ ] Backups faites
- [ ] Version mise à jour
- [ ] Changelog complété
- [ ] Code revu

### Après Déploiement
- [ ] Vérifier les logs
- [ ] Tester les commandes principales
- [ ] Monitorer les performances
- [ ] Vérifier les erreurs utilisateur

---

## 💡 Tips & Tricks

### 1. Utiliser les Constantes
```javascript
const EMBED_COLOR_SUCCESS = 0x2ECC71;
const EMBED_COLOR_ERROR = 0xFF6B6B;
const TIMEOUT_DURATION = 15000;
const MAX_EMBEDS = 10;
```

### 2. Early Returns
```javascript
// ✅ CORRECT
function process(member) {
  if (!member) return null;
  if (member.user.bot) return null;
  if (member.permissions.has(...)) return null;
  
  // Logique principale
}

// ❌ INCORRECT
function process(member) {
  if (member && !member.user.bot && !member.permissions.has(...)) {
    // Logique principale (imbriquée trop profond)
  }
}
```

### 3. Destructuring
```javascript
// ✅ CORRECT
const { interaction, member } = event;
const { userId, guildId } = interaction;

// ❌ INCORRECT
const userId = event.interaction.userId;
const guildId = event.interaction.guildId;
```

---

## 📖 Ressources Utiles

- [Discord.js Documentation](https://discord.js.org/)
- [JavaScript Best Practices](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
- [Node.js Best Practices](https://nodejs.org/en/docs/)
- [Clean Code Principles](https://www.oreilly.com/library/view/clean-code-a/9780136083238/)

---

**Version:** 1.0
**Dernière Mise à Jour:** 2024
**Auteur:** LvCreations
