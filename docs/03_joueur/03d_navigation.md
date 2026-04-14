# Navigation

## Résumé

Le joueur n'a pas de carte, pas de minimap, pas de marqueur de position. Il doit s'orienter en utilisant ses sens, sa boussole, et le signal du vaisseau. Ce choix de design est intentionnel : le sentiment d'être perdu, de ne pas savoir où l'on est, est un **vecteur de terreur fondamental**. La navigation peut être améliorée par des upgrades (tracker sur la visière, scan de terrain depuis le vaisseau), mais elle ne devient jamais triviale.

## Principes de design

- **Jamais de carte complète**. Même avec tous les upgrades, le joueur n'a pas accès à une carte du terrain.
- **Jamais de distance en mètres**. Aucun système du jeu n'affiche une distance numérique.
- **Jamais de minimap**. Le joueur doit regarder le monde, pas un coin de son écran.
- **Jamais de marqueur sur le monde** (waypoint flottant). Le joueur ne peut pas "marquer" un objectif et suivre une flèche.
- Le joueur doit **construire une carte mentale** du terrain en explorant. Cette compétence s'améliore avec l'expérience du joueur (pas du personnage).

---

## Outils de navigation

### Par défaut (aucun upgrade)

#### Boussole

- **Toujours disponible**. Fait partie de la combinaison de base.
- Indique les **points cardinaux** (Nord, Sud, Est, Ouest).
- Affichage discret sur la visière (ou instrument physique consulté par le joueur — à définir).
- La boussole est le seul outil de navigation garanti. Un joueur qui se rappelle que "le vaisseau est au sud-ouest" peut toujours retrouver son chemin.

#### Signal du vaisseau

- **Toujours disponible** tant que le joueur est à portée du signal.
- Se manifeste par un **bip sonore** dont l'intensité diminue avec la distance au vaisseau.
- Le bip ne donne **pas de direction**. Il dit seulement "tu es près" ou "tu es loin".
- Plus le joueur s'éloigne, plus le bip s'espace et s'atténue.
- **Hors de portée** : le bip disparaît complètement. Le joueur sait qu'il est allé trop loin.
- Le signal du vaisseau est aussi un **indicateur de zone** : quand il disparaît, le joueur est probablement à la limite de la zone de mission (perte de signal de tous les modules de la combinaison).

#### Les sens

Le joueur doit utiliser ce qu'il voit et entend pour s'orienter :

- **Repères visuels** : une montagne au loin, un grand arbre, la mer à l'horizon, la fumée du vaisseau (si visible), la position du soleil ou des lunes.
- **Repères sonores** : le bruit d'une rivière, le vent qui vient d'une direction constante, les sons de la faune qui indiquent un biome particulier.
- **Traces** : les propres traces de pas du joueur dans la boue, la neige, ou le sable. Les traces des coéquipiers. Les traces de sang d'un joueur blessé. Attention : les traces ne persistent pas indéfiniment (vent, pluie).

### Avec tracker (upgrade de visière)

- Affiche sur la visière la **direction du vaisseau**.
- Sous forme d'un indicateur directionnel (flèche, point sur un arc de cercle, ou autre représentation — à définir).
- Ne donne toujours **pas de distance**.
- Ne fonctionne **pas hors de portée du signal** (même limitation que le bip sonore).
- Le tracker ne remplace pas la navigation : il indique juste la direction de la base. Le joueur sait où est le vaisseau, mais pas comment y arriver (obstacles, terrain impraticable entre lui et le vaisseau).

### Avec scan de terrain (upgrade du vaisseau)

- Utilisable **avant de sortir du vaisseau**, au début de la mission.
- Fournit des **directions approximatives** vers des points d'intérêt détectés par le scan :
  - "Structure détectée au nord-est."
  - "Cavité souterraine probable à l'ouest."
  - "Étendue d'eau au sud."
- Les informations sont **vagues** : des directions, pas des distances. Des types, pas des détails.
- Ce n'est pas une carte. C'est un **briefing** avant la sortie.
- Les informations ne sont pas affichées en temps réel sur la visière. Le joueur doit les retenir ou les communiquer au groupe.

---

## Navigation en intérieur et en souterrain

Dans les bâtiments et les grottes, la navigation est encore plus difficile :

- La boussole fonctionne toujours (sauf si interférences magnétiques — rare, spécifique à certaines planètes).
- Le signal du vaisseau peut être **atténué** par l'épaisseur de roche ou de structure (le bip est plus faible en souterrain).
- Le tracker peut être **instable** en souterrain (interférences, perte intermittente du signal).
- Les repères visuels extérieurs ne sont plus visibles.
- Le joueur doit se fier aux repères intérieurs : architecture, marquages, objets distinctifs, sa propre mémoire.

---

## Se perdre

Se perdre est une mécanique de gameplay à part entière, pas un bug :

- Un joueur perdu est un joueur **stressé**. Il ne sait pas où il est, il ne sait pas d'où vient le bruit, il ne sait pas si le vaisseau est par là ou par là.
- Un joueur perdu est un joueur **lent**. Il hésite, s'arrête, rebrousse chemin. Il passe plus de temps exposé.
- Un joueur perdu est un joueur **isolé**. S'il n'a pas de communication, personne ne peut le guider.
- Se retrouver après s'être perdu est un **soulagement** immense — un moment de gameplay émotionnel fort.

### Le joueur au vaisseau comme guide

Si un joueur est resté au vaisseau et qu'il a accès aux caméras des joueurs sur le terrain, il peut jouer le rôle de **guide** :
- "Tu es face au nord, le vaisseau est derrière toi."
- "Je vois une porte sur ta droite, essaie par là."

Ce rôle émergent est particulièrement utile quand un joueur est perdu en souterrain sans repères.

---

## Limites de la zone de mission

Le joueur ne connaît pas les limites de la zone. Il les découvre en rencontrant :

- Du **terrain impraticable** : falaises, mer, forêt impénétrable, marécage profond, éboulis. Le type d'obstacle dépend du biome et de la planète.
- La **perte de signal** : quand le bip du vaisseau disparaît et que les modules de communication coupent, le joueur sait qu'il est à la limite.
- Du **brouillard dense** (certaines planètes) : la visibilité tombe à zéro. Le joueur peut y entrer, mais il ne voit plus rien et risque de tourner en rond.

Les limites ne sont jamais des murs invisibles. Elles sont toujours justifiées par l'environnement et cohérentes avec le biome de la planète.

---

## Interactions avec les autres systèmes

- **Combinaison** : le tracker est un module de visière. Le signal du vaisseau fait partie de la combinaison de base.
- **Design sonore** : le bip du vaisseau est un son réel dans le monde. Le joueur doit tendre l'oreille pour le capter, surtout en environnement bruyant ou quand il est loin.
- **Multijoueur** : le joueur au vaisseau peut guider les autres. Les joueurs sur le terrain peuvent se suivre mutuellement.
- **Blessures** : une blessure à la tête dégrade l'audition — le bip du vaisseau peut devenir inaudible. Une blessure à la jambe ralentit, ce qui allonge le trajet retour.
- **Génération** : le terrain est généré avec des limites naturelles. Le générateur doit produire des limites cohérentes et des repères visuels exploitables.

---

## Points ouverts

- La boussole est-elle affichée en permanence sur la visière ou le joueur doit-il la consulter (action) ?
- Certaines planètes pourraient-elles perturber la boussole (champ magnétique intense) ?
- Les joueurs peuvent-ils laisser des marqueurs physiques dans le monde (cailloux, marquage au couteau sur un arbre) pour retrouver leur chemin ?
- Le scan de terrain est-il une information ponctuelle (au début de la mission) ou peut-il être re-consulté ?
- Le signal du vaisseau est-il un bip générique ou peut-il être personnalisé (pour distinguer plusieurs vaisseaux dans un futur mode multijoueur étendu) ?
