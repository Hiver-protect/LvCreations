# 📚 Guide Complet - LvCreations Bot v2.1

## 📑 Table des matières
1. [Démarrage Rapide](#démarrage-rapide)
2. [Commandes Utilisateur](#commandes-utilisateur)
3. [Commandes Modération](#commandes-modération)
4. [Commandes Fun](#commandes-fun)
5. [Commandes Admin](#commandes-admin)
6. [Systèmes Avancés](#systèmes-avancés)
7. [Guide Développeur](#guide-développeur)

---

## 🚀 Démarrage Rapide

### Installation
```bash
npm install
node src/index.js
```

### Configuration
Créez un fichier `.env` :
```env
TOKEN=votre_token_discord
GUILD_ID=id_du_serveur
CLIENT_ID=id_de_l_application
```

---

## 👤 Commandes Utilisateur

### Profil & Statistiques
| Commande | Description | Exemple |
|----------|-------------|---------|
| `/userinfo` | Infos détaillées utilisateur | `/userinfo @utilisateur` |
| `/serverinfo` | Statistiques du serveur | `/serverinfo` |
| `/botinfo` | Infos sur le bot | `/botinfo` |
| `/rank` | Affiche votre niveau XP | `/rank` |
| `/leaderboard` | Top 10 des meilleurs XP | `/leaderboard` |
| `/memberslist` | Liste des membres récents | `/memberslist` |
| `/serverstat` | Stats détaillées du serveur | `/serverstat` |

### Divertissement
| Commande | Description | Exemple |
|----------|-------------|---------|
| `/8ball` | Boule de cristal | `/8ball Vais-je gagner?` |
| `/dice` | Jeter les dés | `/dice` |
| `/flip` | Pile ou Face | `/flip` |
| `/randomquiz` | Quiz aléatoire | `/randomquiz` |
| `/joke` | Blague aléatoire | `/joke` |
| `/meme` | Meme aléatoire | `/meme` |

### Musique
| Commande | Description | Exemple |
|----------|-------------|---------|
| `/play` | Jouer une musique | `/play Titre chanson` |
| `/skip` | Passer à la suivante | `/skip` |
| `/stop` | Arrêter la musique | `/stop` |
| `/queue` | Voir la file d'attente | `/queue` |
| `/nowplaying` | Chanson actuelle | `/nowplaying` |

---

## 🛡️ Commandes Modération

### Sanction
| Commande | Description | Exemple |
|----------|-------------|---------|
| `/kick` | Expulser un utilisateur | `/kick @utilisateur` |
| `/ban` | Bannir un utilisateur | `/ban @utilisateur` |
| `/timeout` | Mute temporaire | `/timeout @utilisateur 1h` |
| `/clear` | Supprimer des messages | `/clear 10` |
| `/warn` | Avertir un utilisateur | `/warn @utilisateur Spam` |

### Canaux & Rôles
| Commande | Description | Exemple |
|----------|-------------|---------|
| `/setreactionrole` | Ajouter rôle réaction | `/setreactionrole` |
| `/slowmode` | Slow mode du canal | `/slowmode 5s` |

---

## 🎮 Commandes Fun

### Amusement
| Commande | Description |
|----------|-------------|
| `/randomfact` | Fait aléatoire |
| `/quote` | Citation célèbre |
| `/riddle` | Énigme aléatoire |
| `/generatename` | Générer un pseudonyme |

---

## ⚙️ Commandes Admin

### Gestion du Bot
| Commande | Description | Permissions |
|----------|-------------|------------|
| `/reload` | Redémarrer le bot | Admin |
| `/poweroff` | Arrêter le bot | Admin |
| `/eval` | Exécuter du code | Admin |
| `/logs` | Afficher les logs | Admin |
| `/protection` | Gérer les protections | Admin |

### Protections
```
- /protection anti-spam enable/disable
- /protection anti-raid enable/disable
- /protection anti-ads enable/disable
- /protection profanity enable/disable
```

---

## 🎯 Systèmes Avancés

### Système de Niveaux
- Gagnez de l'XP en discutant
- Montez en niveau progressivement
- Débloquez des rôles et avantages
- Consultez votre rank avec `/rank`

### Système de Réputation (advanced.js)
```javascript
// Ajouter de la réputation
advanced.addReputation(userId, points);

// Consulter la réputation
advanced.getReputation(userId);

// Top réputations
advanced.getTopReputations();
```

### Système de Badges
- 🏅 Helper - Aidez les autres
- 🎖️ Supporter - Supportez le bot
- 👑 Admin - Administrateur
- 🛡️ Moderator - Modérateur
- ⭐ Veteran - Ancien membre
- 🔥 Active - Très actif
- ✅ Verified - Compte vérifié
- 💜 Boosted - Booster du serveur
- 💻 Developer - Développeur
- 🎨 Artist - Artiste

### Système de Réalisations
```javascript
// Ajouter une réussite
advanced.addAchievement(userId, achievementType);

// Types disponibles: level10, level50, talkative, friendly, etc.
```

### Système de Quiz
```javascript
// Obtenir un quiz aléatoire
const quiz = advanced.getRandomQuiz();
// Retourne: { question, answers, correct }
```

### Système de Tags
```javascript
// Créer un tag
advanced.createTag(userId, tagName, content);

// Consulter un tag
advanced.getTag(tagName);

// Lister tous les tags
advanced.listTags();

// Supprimer un tag
advanced.deleteTag(tagName);
```

### Système de Cooldown
```javascript
// Créer un cooldown
advanced.createCooldown(userId, command, duration);

// Vérifier le cooldown existant
advanced.cooldown.get(`${userId}-${command}`);
```

### Filtre Profanité
```javascript
// Vérifier si un message contient de la profanité
if (advanced.containsProfanity(message)) {
  // Supprimer le message
}
```

---

## 💻 Guide Développeur

### Structure du Projet
```
src/
├── index.js          # Bot principal (2500+ lignes)
├── embeds.js         # Embeds professionnels
├── storage.js        # Gestion JSON
├── config.js         # Configuration
├── protections.js    # Systèmes de protection
├── utils.js          # 60+ fonctions utilitaires
└── advanced.js       # 50+ systèmes avancés
```

### Modules Utilitaires (utils.js)

#### Formatage
```javascript
utils.formatDuration(ms);          // "2h 30m 15s"
utils.formatNumber(1234567);       // "1,234,567"
utils.formatDate(date);            // "DD/MM/YYYY HH:mm"
utils.capitalize("hello");         // "Hello"
utils.truncate("texte long", 5);   // "texte..."
```

#### Validation
```javascript
utils.isValidUrl(url);
utils.isValidEmail(email);
utils.isValidHexColor(color);
utils.isValidDiscordId(id);
utils.isEmpty(value);
```

#### Permissions
```javascript
utils.hasPermission(member, permission);
utils.canModerate(modMember, targetMember);
utils.isAdmin(member);
utils.isMod(member);
```

#### Mathématiques
```javascript
utils.getRandomInt(min, max);
utils.percentage(value, total);
utils.calculateLevel(xp);
utils.calculateXpNeeded(level);
```

#### Discord
```javascript
utils.getMentionUserId(mention);
utils.getRoleColor(role);
utils.getStatus(user);
utils.getStatusEmoji(user);
utils.getTopMembers(guild, limit);
utils.sortMembers(members);
```

#### Embeds
```javascript
utils.createMiniEmbed(title, description, color);
utils.createTable(headers, rows);
utils.createFields(data);
utils.addFieldIfExists(embed, name, value, inline);
utils.createBar(value, max, length);
```

#### Manipulation de Chaînes
```javascript
utils.removeMarkdown(text);
utils.escapeMarkdown(text);
utils.containsProfanity(text);
utils.toUpperCase(text);
utils.toLowerCase(text);
utils.reverse(text);
```

#### Arrays
```javascript
utils.unique(array);
utils.chunk(array, size);
utils.flatten(array);
utils.groupBy(array, key);
utils.shuffle(array);
utils.getRandomElement(array);
```

#### Timing
```javascript
utils.sleep(ms);
utils.debounce(func, delay);
utils.throttle(func, delay);
utils.isTimeInRange(time, start, end);
```

#### Gestion d'Erreurs
```javascript
utils.tryCatch(func);
utils.safeSend(channel, message);
utils.safeEdit(message, content);
utils.safeDelete(message);
```

#### Autres
```javascript
utils.createCache(ttl);
```

### Modules Avancés (advanced.js)

#### Réputation
```javascript
advanced.addReputation(userId, points);
advanced.getReputation(userId);
advanced.getTopReputations(limit);
```

#### Badges
```javascript
advanced.badgeSystem = {
  helper: { name: 'Helper', emoji: '🏅' },
  supporter: { name: 'Supporter', emoji: '🎖️' },
  // ... 8 autres badges
};
```

#### Réalisations
```javascript
advanced.getUserAchievements(userId);
advanced.addAchievement(userId, type);
```

#### Quiz
```javascript
advanced.getRandomQuiz();
// Retourne: { question, answers, correct }
```

#### Réponses Auto
```javascript
advanced.keywordResponses; // Objet avec clé/réponse
```

#### Comptes à Rebours
```javascript
advanced.createCountdown(targetTime);
```

#### Embeds Spécialisés
```javascript
advanced.createProgressEmbed(title, current, max, color);
advanced.createListEmbed(title, items, color);
advanced.createComparisonEmbed(title, data1, data2, color);
```

#### Tags
```javascript
advanced.createTag(userId, name, content);
advanced.getTag(name);
advanced.deleteTag(name);
advanced.listTags();
```

#### Cooldown
```javascript
advanced.createCooldown(userId, command, duration);
advanced.cooldown;
```

#### Statistiques
```javascript
advanced.createStatisticsEmbed(data);
```

#### Évaluation
```javascript
advanced.rating;
```

### Ajouter une Nouvelle Commande

```javascript
// 1. Dans le SlashCommandBuilder
new SlashCommandBuilder()
  .setName('macommande')
  .setDescription('Description de ma commande')
  .addStringOption(option =>
    option.setName('param')
      .setDescription('Paramètre')
      .setRequired(true)
  ),

// 2. Dans l'interaction handler
if (commandName === 'macommande') {
  const param = interaction.options.getString('param');
  
  const embed = createSuccessEmbed('Titre', 'Message');
  return interaction.reply({ embeds: [embed] });
}
```

### Ajouter une Fonction Utilitaire

```javascript
// Dans src/utils.js
maFonction: (params) => {
  // Logique
  return result;
}

// Exporter dans module.exports
module.exports = { ..., maFonction };
```

### Gestion des Erreurs
```javascript
try {
  // Code
} catch (error) {
  const embed = createErrorEmbed('Erreur', error.message);
  return interaction.reply({ embeds: [embed], ephemeral: true });
}
```

---

## 🔒 Sécurité

### Bonnes Pratiques
1. ✅ Vérifier les permissions avant chaque action
2. ✅ Valider les entrées utilisateur
3. ✅ Utiliser les IDs String au lieu de Number
4. ✅ Gérer les erreurs correctement
5. ✅ Utiliser AsyncFunction pour eval
6. ✅ Limiter les appels API
7. ✅ Logger tous les événements importants

### Protections Actives
- Anti-spam
- Anti-raid
- Anti-publicités
- Filtre profanité
- Rate limiting par cooldown

---

## 📊 Statistiques

- **Commandes:** 49+
- **Fonctions Utilitaires:** 60+
- **Systèmes Avancés:** 50+
- **Lignes de Code:** 2500+
- **Performance:** Optimisée avec cache TTL

---

## 📝 Logs et Débogage

### Accéder aux Logs
```bash
/logs
```

### Ajouter un Log
```javascript
addLog('Message de log');
```

### Exécuter du Code
```bash
/eval client.users.cache.size
```

---

## 🤝 Support

- 📧 Contactez le support
- 🌐 Visitez le site web
- 💬 Rejoignez le serveur Discord

---

**Version:** 2.1
**Dernière Mise à Jour:** 2024
