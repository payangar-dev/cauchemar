# Matériaux

## Résumé

Les matériaux sont des ressources physiques récoltées sur les planètes pendant les missions. Ils servent au craft de consommables, de composants, et d'upgrades. Chaque planète a ses propres matériaux, certains communs et d'autres rares. Les matériaux ne sont pas connus d'avance : le joueur doit les découvrir par l'exploration ou le scan. Certains matériaux sont **dangereux** à manipuler sans l'upgrade de protection adapté. Les matériaux sont des objets physiques dans le monde avec un poids, une position, et des propriétés interactives.

## Principes de design

- Les matériaux sont la **motivation principale de l'exploration**. Le joueur va sur des planètes dangereuses parce qu'il a besoin de matériaux spécifiques.
- Les matériaux sont **physiques** : ils occupent un espace dans le monde, ils ont un poids, ils peuvent être lâchés, ramassés, et ils tombent au sol à la mort du joueur.
- Tous les matériaux sont **récupérables sans protection**, mais avec un **risque** proportionnel au danger. Le jeu ne bloque jamais l'accès — il demande si le joueur est prêt à en payer le prix.
- Les matériaux créent des **chaînes de risque** : pour crafter un objet avancé, il faut un composant qui nécessite un matériau rare qui se trouve sur une planète dangereuse.

---

## Propriétés des matériaux

Chaque matériau a les propriétés suivantes :

| Propriété | Description |
|---|---|
| **Nom** | Identifiant du matériau (inconnu du joueur tant qu'il n'est pas découvert/scanné). |
| **Poids** | Affecte la vitesse de déplacement du joueur. |
| **Rareté** | Commun, peu commun, rare, très rare. Détermine la fréquence d'apparition. |
| **Danger** | Type de danger associé (aucun, brûlant, toxique, radioactif, fragile, vivant). |
| **Planètes** | Sur quelles planètes/biomes le matériau peut être trouvé. |
| **Usages** | Quelles recettes de craft utilisent ce matériau. |

---

## Types de matériaux par danger

### Inoffensifs

La majorité des matériaux sont inoffensifs. Ils peuvent être ramassés, portés et déposés sans risque particulier. Le seul coût est le slot d'inventaire et le poids.

### Brûlants

- Matériaux à haute température (minerais volcaniques, métaux en fusion refroidis incomplètement).
- **Sans protection** : brûlent les mains du joueur dès la saisie. Les dégâts sont progressifs tant que l'objet est en main. Il faut le lâcher rapidement ou le déposer dans un conteneur. Cause une blessure aux bras.
- **Avec protection thermique** : manipulation normale.

### Toxiques / Corrosifs

- Matériaux qui émettent des émanations toxiques ou qui corrodent au contact.
- **Sans protection** : empoisonnement progressif au contact. Peut affecter la vision (toxines), causer des blessures au torse (inhalation), ou des blessures aux bras (contact).
- **Avec protection chimique** : manipulation normale.

### Radioactifs

- Matériaux émettant des radiations.
- **Sans protection** : irradiation progressive. Effets à long terme pendant la mission (nausées, vision trouble, faiblesse). Peut causer des blessures multiples (torse, tête).
- **Avec protection radiation** : manipulation normale.

### Fragiles

- Matériaux qui se brisent facilement (cristaux, spécimens biologiques délicats, composants électroniques sensibles).
- **Sans protection** : le matériau se **casse et est perdu définitivement** si le joueur court, tombe, subit un impact, ou est bousculé. Le joueur doit marcher pour les transporter.
- **Avec conteneur stabilisé** : le joueur peut courir et subir des impacts sans risque pour le matériau.
- **Dilemme spécifique** : un joueur portant un matériau fragile qui entend un monstre approcher doit choisir entre lâcher le matériau pour courir, ou se cacher immédiatement.

### Vivants

- Organismes vivants : plantes carnivores, insectes, parasites, créatures minuscules, échantillons biologiques actifs.
- **Sans protection** :
  - **Bruit** : l'organisme fait du bruit (cris, grattements, vibrations), attirant les prédateurs de la zone.
  - **Mouvement** : l'organisme se débat dans l'inventaire, potentiellement visible par les créatures.
  - **Attraction** : certains prédateurs sont spécifiquement attirés par l'organisme (proie naturelle).
  - **Attaque** : l'organisme peut mordre, piquer, ou griffer le joueur à travers l'inventaire.
  - **Parasitage** : cas le plus grave. L'organisme peut s'échapper de l'inventaire, pénétrer dans la combinaison, et infecter le joueur. Voir [07c_parasites.md](../07_faune/07c_parasites.md).
- **Avec bio-confinement** : l'organisme est scellé dans un conteneur biologique. Pas de bruit, pas de mouvement, pas d'attraction, pas de risque de parasitage.

---

## Découverte des matériaux

Les matériaux ne sont pas connus d'avance par les joueurs. Ils doivent être **découverts** :

### Découverte visuelle

Le joueur voit un matériau dans l'environnement. Il ne sait pas ce que c'est ni s'il est dangereux. Il peut :
- Le ramasser à l'aveugle (risque de danger non anticipé).
- Le scanner d'abord (s'il a un scanner de visière), mais le résultat n'est lisible qu'après déchiffrage.

### Découverte par scan

Le scanner de visière permet de collecter des données brutes sur un matériau. Après déchiffrage (au vaisseau ou à la station), le joueur obtient des informations sur le matériau : nom, propriétés, dangers, usages potentiels. Les informations peuvent être incomplètes (voir [05a_scanner.md](../05_connaissance/05a_scanner.md)).

### Persistance des découvertes

Quand un joueur découvre un matériau sur une planète (et que cette connaissance est ramenée avec succès), l'information est ajoutée à la base de données :
- Le scan planétaire de cette planète mentionnera désormais ce matériau comme confirmé.
- Tous les joueurs de la session bénéficient de cette découverte.
- La géographie exacte n'est pas enregistrée (chaque mission génère un monde différent), mais le fait que ce matériau EXISTE sur cette planète est persistant.

---

## Localisation des matériaux

Les matériaux se trouvent dans différents contextes :

| Contexte | Exemples | Risque associé |
|---|---|---|
| **Surface** | Roches, plantes, minerais affleurants | Faible (exposition aux prédateurs de surface) |
| **Souterrain** | Cristaux, champignons, minerais profonds | Élevé (grottes sombres, créatures souterraines, navigation difficile) |
| **Structures** | Composants, batteries, technologies | Variable (dépend de ce qui occupe la structure) |
| **Cadavres humains** | Batteries, outils, composants technologiques | Élevé (si des humains sont morts ici, c'est qu'il y a probablement une menace) |
| **Débris/crashes** | Métaux rares, composants avancés, carburant | Variable (radiation, toxicité, créatures attirées par le crash) |
| **Sur/dans des créatures** | Échantillons biologiques, sécrétions, parasites | Très élevé (il faut s'approcher d'une créature vivante) |

---

## Interactions avec les autres systèmes

- **Inventaire** : les matériaux occupent des slots et ont un poids.
- **Craft** : les matériaux sont les ingrédients du système de craft.
- **Scanner** : le scanner permet d'identifier les matériaux et leurs dangers.
- **Combinaison** : les protections de la combinaison déterminent si un matériau dangereux peut être manipulé sans risque.
- **Blessures** : les matériaux dangereux causent des blessures spécifiques.
- **Planètes** : chaque planète a son propre pool de matériaux.
- **Connaissance** : la découverte de matériaux enrichit la base de données et le scan planétaire.

---

## Points ouverts

- Liste précise des matériaux (nécessite une table de données complète).
- Combien de matériaux par planète ? Combien de matériaux uniques au total ?
- Les matériaux bruts peuvent-ils être combinés sur le terrain, ou uniquement au vaisseau/station ?
- Y a-t-il des matériaux "universels" présents sur toutes les planètes, ou chaque matériau est-il exclusif à certaines planètes ?
- Le poids exact de chaque matériau et son impact sur la vitesse.
