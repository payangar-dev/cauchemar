# Génération procédurale

## Résumé

Chaque mission génère un **monde unique** sur une planète donnée. La génération suit un pipeline en couches : terrain, hydrographie, souterrain, structures, événements, puis faune. Le résultat est une zone de mission finie, fermée naturellement par le terrain, dans laquelle les créatures sont simulées en permanence. Deux missions sur la même planète produisent des mondes géographiquement différents, mais avec les mêmes matériaux, espèces, et conditions planétaires.

## Principes de design

- Le terrain doit être **accessible** aux joueurs. Pas de génération impraticable au centre de la zone.
- Les limites de zone sont **naturelles** : terrain impraticable, mer, falaises, forêt dense, brouillard. Jamais de mur invisible.
- La zone doit être **finie et simulable** : assez petite pour simuler toute la faune en permanence, assez grande pour que l'exploration soit significative.
- La génération doit être **cohérente avec le biome** : un biome forêt produit des arbres et de la végétation, pas des dunes de sable.
- Chaque monde généré est **éphémère** : il n'existe que pendant la mission. Rien de géographique ne persiste.

---

## Pipeline de génération

### Étape 1 : Sélection du point sur la planète

- Une mission est associée à une planète. Le système choisit un **point** sur cette planète.
- Ce point détermine le **biome** de la mission (parmi les biomes disponibles de la planète).
- Sur une planète à rotation verrouillée, le point détermine aussi si la mission se déroule sur la **face éclairée** ou la **face sombre**.
- La position dans le cycle jour/nuit au début de la mission est déterminée par l'heure planétaire au moment de l'atterrissage.

### Étape 2 : Génération du terrain

- Le terrain est généré selon le **biome** sélectionné.
- Le terrain inclut : relief (plat, vallonné, montagneux), végétation, sol (terre, roche, sable, boue, neige).
- La zone de mission a une **taille définie** (variable selon le type de mission).
- Les **bordures** de la zone sont constituées de terrain impraticable, cohérent avec le biome :
  - Forêt : végétation impénétrable, arbres tombés, ronces.
  - Montagne : falaises, parois verticales, éboulis.
  - Prairie : crevasses, rivières larges, pente vers l'océan.
  - Marécage : eau profonde, boue qui enlise.
  - Désert : tempête de sable permanente en bordure, dunes instables.
  - Planète brumeuse : brouillard impénétrable (le joueur peut y entrer mais ne voit rien et se perd).

### Étape 3 : Génération de l'hydrographie

- Placement des éléments aquatiques : lacs, rivières, ruisseaux, mer côtière.
- L'eau est un **élément de gameplay** :
  - Perturbe les modules de la combinaison (micro, caméra, vision nocturne).
  - Peut bloquer des chemins ou forcer des détours.
  - Peut cacher des dangers (créatures aquatiques, profondeur soudaine).
  - Sert de barrière naturelle en bordure de zone.
  - Les traces du joueur sont effacées dans l'eau (avantage furtivité).

### Étape 4 : Génération du souterrain

- Placement de grottes, tunnels, cavernes, et réseaux souterrains.
- Le souterrain est une **zone de danger accru** :
  - Toujours sombre (pas de cycle jour/nuit en souterrain).
  - Navigation difficile (pas de repères extérieurs, signal du vaisseau atténué).
  - Créatures souterraines spécifiques.
  - Matériaux rares souvent en profondeur.
- Les entrées de grottes sont des **points de décision** : entrer en souterrain change radicalement le gameplay (de l'exploration de surface à la claustrophobie).
- Les grottes peuvent avoir plusieurs entrées/sorties, ou être des culs-de-sac.

### Étape 5 : Génération des structures

- Placement de bâtiments et d'installations **si la planète en a**.
- Certaines planètes n'ont **aucune structure** : pas de bâtiment, pas de porte, pas de placard. Le joueur doit se cacher derrière des éléments naturels.
- Types de structures possibles :
  - Installations humaines abandonnées (laboratoires, entrepôts, habitations).
  - Structures aliens (architecture non humaine, fonction inconnue).
  - Épaves de vaisseaux posées là depuis longtemps.
  - Structures naturelles (formations rocheuses en arche, arbres creux géants).

### Étape 6 : Placement des événements

Les événements peuvent être **pré-placés** ou **dynamiques** :

#### Événements pré-placés

- Vaisseaux crashés (anciens, intégrés au décor).
- Campements abandonnés.
- Débris technologiques.
- Zones de danger statiques (zone irradiée, zone toxique, champ de spores).

Ces éléments sont des sources de **loot**, de **lore**, et de **danger**. Un vaisseau crashé attire les créatures (source de nourriture passée) et peut être contaminé (radiation, fuite de carburant).

#### Événements dynamiques

- Vaisseau qui **crash en cours de mission**. Bruit d'impact énorme, fumée visible au loin. Crée une nouvelle source de loot et de danger. Toutes les créatures de la zone réagissent au crash.
- Chute de météores, tempête soudaine, séisme.
- Les événements dynamiques doivent rester **rares et contrôlés**. Ils ne doivent pas survenir à chaque mission. Quand ils surviennent, ils doivent être mémorables.

### Étape 7 : Placement de la faune

- Les créatures sont placées dans la zone selon :
  - Le **biome** (espèces associées au biome).
  - Les **conditions actuelles** (jour/nuit, météo).
  - Les **territoires** (chaque créature territoriale a une zone assignée).
  - La **densité** (plus de créatures dans certaines zones que d'autres).
- Les créatures sont des **entités simulées en permanence**. Elles patrouillent, chassent, dorment, et se déplacent même quand aucun joueur n'est à proximité.
- Les créatures ne traversent pas les bordures impraticables de la zone (les mêmes obstacles qui bloquent les joueurs bloquent la plupart des créatures, sauf exceptions : créatures volantes au-dessus des falaises, créatures aquatiques dans l'eau...).

---

## Taille de la zone de mission

La taille de la zone peut varier selon le type de mission et d'autres facteurs :

| Facteur | Impact sur la taille |
|---|---|
| **Type de mission** | Sauvetage : petite (action concentrée). Scientifique : grande (besoin de diversité). Investigation : moyenne. Cargo : variable. |
| **Nombre de joueurs** | Plus de joueurs pourrait justifier une zone plus grande (à définir). |
| **Difficulté** | Les zones plus grandes impliquent plus de créatures simulées et plus de distance au vaisseau. |

La zone doit être :
- **Assez grande** pour que l'exploration soit significative (pas traversable en 2 minutes).
- **Assez petite** pour que toute la faune soit simulable en permanence sans problème de performance.
- **Assez variée** pour contenir des zones d'intérêt, des cachettes, des points de danger, et des passages entre eux.

---

## Interactions avec les autres systèmes

- **Planètes** : les propriétés de la planète (biomes, rotation, atmosphère) sont les paramètres d'entrée de la génération.
- **Faune** : les créatures sont placées et simulées dans la zone générée.
- **Navigation** : le terrain généré détermine les repères visuels, les obstacles, et les bordures.
- **Matériaux** : les matériaux sont placés dans la zone selon le biome et les conditions.
- **Missions** : le type de mission influence la taille et la composition de la zone.

---

## Points ouverts

- Taille précise des zones de mission (en km² ou en distance de marche).
- Algorithmes de génération : Perlin noise pour le terrain ? Wave Function Collapse pour les structures ? L-systems pour les grottes ?
- Comment garantir que la zone générée est **jouable** (pas de cul-de-sac total entre le vaisseau et l'objectif) ?
- Le vaisseau se pose toujours au même type d'endroit (zone dégagée en bordure) ou sa position est aussi aléatoire ?
- Les structures sont-elles générées par des modèles préfabriqués assemblés, ou entièrement procédurales ?
- Performance : combien de créatures peuvent être simulées simultanément ?
