# Propriétés des planètes

## Résumé

Chaque planète est un objet persistant avec des propriétés fixes : rotation (cycle jour/nuit), atmosphère, biomes disponibles, matériaux possibles, faune native, et événements planétaires. Ces propriétés ne changent pas entre les missions. En revanche, le **terrain** de chaque mission est généré aléatoirement à partir de ces propriétés — le joueur ne retrouvera jamais la même géographie, mais il retrouvera les mêmes matériaux, les mêmes espèces, et les mêmes conditions.

## Principes de design

- La planète est un **cadre persistant** : le joueur apprend à connaître une planète au fil des missions.
- Le terrain est **éphémère** : chaque mission est une surprise géographique, même sur une planète connue.
- Les propriétés de la planète créent des **conditions de jeu uniques** : une planète à nuit longue n'est pas la même expérience qu'une planète à rotation rapide.
- Les planètes sont des **écosystèmes cohérents** : la faune, les matériaux, la météo et les biomes sont liés de manière logique.

---

## Propriétés persistantes

### Rotation et cycle jour/nuit

Chaque planète a sa propre **vitesse de rotation**, ce qui détermine la durée du jour et de la nuit.

| Type de rotation | Jour | Nuit | Impact gameplay |
|---|---|---|---|
| **Rapide** | 5-10 min | 3-8 min | Alternances fréquentes. Le joueur doit planifier ses actions autour des cycles courts. Les transitions sont fréquentes et prévisibles. |
| **Normale** | 15-25 min | 15-25 min | Rythme équilibré. Assez de temps pour explorer de jour, assez de nuit pour créer de la tension. |
| **Lente** | 30+ min | 30+ min | Longues périodes. Le joueur commence de jour et la nuit peut durer plus longtemps que la mission. Terreur par la durée. |
| **Verrouillée (marée)** | Permanent (un côté) | Permanent (autre côté) | Pas de cycle. Le point de mission détermine si c'est le jour permanent ou la nuit permanente. La frontière lumière/ombre est une zone de transition. |

Le cycle jour/nuit impacte directement :
- La **faune** : espèces nocturnes, diurnes, crépusculaires.
- La **visibilité** : de nuit, sans lampe ou vision nocturne, le joueur est pratiquement aveugle.
- Les **matériaux** : certains matériaux ne sont accessibles ou visibles qu'à certaines heures (plantes bioluminescentes la nuit, cristaux qui reflètent le soleil le jour).

### Atmosphère

L'atmosphère de la planète détermine les conditions de respiration et les effets environnementaux.

| Type | Effet |
|---|---|
| **Respirable** | Pas d'impact particulier. Le joueur peut évoluer normalement. |
| **Fine** | Endurance réduite. Le joueur se fatigue plus vite en courant. Effets d'altitude. |
| **Toxique** | Nécessite une protection chimique ou une durée d'exposition limitée. Sans protection, dégâts progressifs (torse). |
| **Irrespirable** | Nécessite une réserve d'oxygène (à définir). Sans réserve, mort rapide. |

### Biomes disponibles

Chaque planète a un ou plusieurs biomes qui définissent les types de terrain pouvant être générés lors d'une mission. Voir [06c_biomes.md](06c_biomes.md) pour le détail de chaque biome.

### Matériaux possibles

Chaque planète a un pool de matériaux qui peuvent être trouvés lors des missions. Ce pool est enrichi par les découvertes des joueurs (voir [05b_base_de_donnees.md](../05_connaissance/05b_base_de_donnees.md)).

### Faune native

Chaque planète a un pool d'espèces qui peuplent ses biomes. La répartition des espèces dépend des biomes, du cycle jour/nuit, et des conditions environnementales.

### Météo possible

Chaque planète a un ensemble de conditions météorologiques possibles. La météo peut changer en cours de mission.

| Météo | Effet |
|---|---|
| **Claire** | Pas d'impact. Bonne visibilité. |
| **Pluie** | Réduit la visibilité. Perturbe les modules (caméra mouillée). Couvre les bruits de pas. |
| **Brouillard** | Visibilité très réduite. Lampe torche inutile (rétrodiffusion). Le joueur peut se perdre. |
| **Tempête de sable/poussière** | Visibilité quasi nulle. Dégâts aux modules (abrasion). Bruit ambiant fort (couvre les sons de créatures). |
| **Pluie acide** | Dégâts progressifs sans protection chimique. Force le joueur à se mettre à couvert. |
| **Orage** | Éclairs (éclairage intermittent dans la nuit). Tonnerre (couvre les sons). Risque de foudre ? |
| **Neige/blizzard** | Froid extrême. Visibilité réduite. Traces dans la neige (détectabilité). Modules affectés par le froid. |

### Événements planétaires

Événements rares et potentiellement catastrophiques propres à la planète :

- **Chutes de météores** : annoncées avec un délai. Impact dévastateur sur une zone.
- **Éruptions volcaniques** : coulées de lave, pluie de cendres, gaz toxiques.
- **Séismes** : effondrement de structures et de grottes. Nouveaux passages, anciens chemins bloqués.
- **Marées** : sur les planètes côtières, montée des eaux qui inonde certaines zones.

---

## Interactions avec les autres systèmes

- **Génération** : les propriétés de la planète sont les paramètres d'entrée du pipeline de génération.
- **Faune** : les espèces sont liées aux biomes et aux conditions de la planète.
- **Matériaux** : les matériaux disponibles dépendent de la planète.
- **Scanner planétaire** : révèle une partie des propriétés avant la mission.
- **Base de données** : les fiches planétaires stockent les propriétés découvertes.
- **Missions** : le type de mission et la planète déterminent ensemble l'expérience de jeu.

---

## Points ouverts

- Nombre total de planètes au lancement du jeu.
- Combien de biomes par planète en moyenne ?
- Les planètes ont-elles une gravité variable (impact sur les sauts, les chutes) ?
- Les propriétés des planètes sont-elles fixes dès la création de la session ou évoluent-elles (saisons, dégradation) ?
- Y a-t-il des planètes "spéciales" liées à une progression narrative ?
