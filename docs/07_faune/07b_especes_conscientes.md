# Espèces conscientes

## Résumé

Les espèces conscientes sont des créatures dotées d'**intelligence**. Elles ne se contentent pas de réagir à des stimuli : elles **observent, apprennent, planifient, et manipulent**. Elles peuvent tendre des pièges, imiter des sons, utiliser l'environnement à leur avantage, communiquer entre elles, et exploiter les comportements des joueurs. Là où les espèces animales génèrent une peur viscérale du prédateur, les espèces conscientes génèrent une **peur psychologique** — la peur de l'autre, de l'intelligence hostile, de ce qui vous observe et qui **comprend**.

## Principes de design

- Les espèces conscientes sont **imprévisibles**. Elles ne suivent pas de patterns fixes. Leur comportement s'adapte.
- Elles exploitent les **mécaniques du jeu** contre les joueurs : les cachettes, les communications, le système de caméra, les coéquipiers.
- Elles génèrent une terreur **psychologique**, pas juste physique. Le joueur ne sait pas juste qu'il est en danger — il sait qu'il est **observé et étudié**.
- Elles doivent rester **rares**. Les rencontrer doit être un événement. Si chaque planète a une espèce consciente, elles deviennent banales.
- Elles doivent être clairement **différentes** des espèces animales dans leur comportement, pour que le joueur ressente immédiatement que quelque chose a changé.

---

## Capacités

### Apprentissage

Les espèces conscientes peuvent apprendre des comportements des joueurs :

- Si les joueurs se cachent toujours sous les tables, la créature vérifie sous les tables en premier.
- Si les joueurs fuient toujours vers le vaisseau, la créature peut patrouiller la route du vaisseau.
- Si les joueurs utilisent la lumière pour effrayer les animaux, la créature n'est pas affectée (elle comprend que c'est un outil, pas une menace).

L'apprentissage peut fonctionner :
- **En temps réel** au sein d'une mission (la créature observe et s'adapte pendant la mission).
- **Entre les missions** sur la même planète (la créature se "souvient" des tactiques des joueurs — à définir, pourrait être trop punitif).

### Manipulation de l'environnement

Les espèces conscientes peuvent interagir avec l'environnement de manière intelligente :

- **Bloquer des sorties** : fermer des portes, pousser des objets devant des passages.
- **Éteindre les lumières** : plonger une zone dans l'obscurité avant d'attaquer.
- **Créer du bruit** : faire tomber un objet dans une direction pour attirer les joueurs vers un piège.
- **Ouvrir des portes** : les portes fermées ne sont pas un obstacle.
- **Détruire des cachettes** : retourner des tables, ouvrir des placards, arracher des planches.
- **Manipuler un sac abandonné** : un sac à dos laissé au sol par un joueur (voir [10_ui_hud.md](../10_ui_hud.md)) peut être retourné, déplacé, ou utilisé comme appât. La créature comprend qu'un joueur viendra probablement le récupérer et peut tendre une embuscade à proximité.

### Imitation

Certaines espèces conscientes peuvent **imiter des sons** :

- Imiter la voix d'un joueur ("À l'aide !", "Par ici, c'est safe").
- Imiter un son de l'environnement pour tromper (faux bruit de pas dans une direction, silence dans une autre).
- Imiter les sons du vaisseau ou d'un module de communication.

L'imitation vocale en coop est **dévastateur** : un joueur entend un appel à l'aide et ne sait pas si c'est un coéquipier ou la créature. Le doute détruit la confiance dans les communications.

**Règle importante** : l'imitation doit rester dans le cadre du design sonore honnête. La créature **produit réellement** ces sons. Ce n'est pas un son factice — c'est un son réel émis par une entité réelle. Le joueur peut théoriquement distinguer l'imitation de l'original (petite différence de timbre, de rythme, d'intonation). Mais sous stress, cette distinction est quasi impossible.

### Communication

Les espèces conscientes peuvent communiquer entre elles :

- Alerter d'autres individus de la présence des joueurs.
- Coordonner des manoeuvres d'encerclement.
- Partager des informations sur les tactiques des joueurs.

Un groupe d'espèces conscientes est exponentiellement plus dangereux qu'un individu seul.

### Traque

Les espèces conscientes ne se contentent pas de réagir — elles **traquent activement** :

- Elles suivent les joueurs à distance, observant sans attaquer.
- Elles attendent le moment optimal pour frapper (joueur isolé, blessé, chargé, dans un cul-de-sac).
- Elles peuvent suivre pendant plusieurs minutes, construisant la terreur par leur **présence silencieuse**.

### Exploitation de l'agonie

Les espèces conscientes comprennent que les joueurs viennent chercher leurs camarades blessés ou agonisants :

- Au lieu d'achever un joueur en agonie, elles le **laissent comme appât**.
- Elles se cachent à proximité et attendent que les coéquipiers viennent au secours.
- Le joueur agonisant peut potentiellement voir l'embuscade et prévenir les autres (s'il a un micro, s'il ose parler).

### Interaction avec la technologie

Les espèces conscientes peuvent comprendre, au moins partiellement, la technologie des joueurs :

- **Caméra** : elles peuvent fixer l'objectif de la caméra d'un joueur mort (terreur pour les spectateurs). Elles peuvent couvrir ou détruire une caméra.
- **Combinaison** : elles peuvent récupérer une combinaison d'un joueur mort et la déplacer (piège).
- **Lumière** : elles comprennent que la lampe torche est un outil, pas une partie du joueur.
- **Vaisseau** : certaines espèces conscientes pourraient comprendre que le vaisseau est la base des joueurs et s'en approcher, voire tenter d'y entrer.

### Interactions avec les autres créatures

Comme les espèces animales, les espèces conscientes font partie de l'écosystème et interagissent avec les autres créatures. Mais leur intelligence ajoute une dimension supplémentaire :

- **Domination** : une espèce consciente peut dominer les espèces animales de la zone. Les animaux la fuient, la contournent, ou se soumettent. Le joueur qui voit la faune locale se comporter anormalement (silence soudain, fuite collective dans une direction) peut en déduire qu'une espèce consciente est dans les parages.
- **Exploitation** : une espèce consciente peut **utiliser** les espèces animales à son avantage. Effrayer un prédateur pour le pousser vers les joueurs. Attirer des charognards sur un cadavre pour créer une diversion. Utiliser les cris d'une proie pour masquer ses propres mouvements.
- **Prédation stratégique** : contrairement aux animaux qui chassent par instinct, une espèce consciente pourrait chasser d'autres créatures de manière stratégique — pas seulement pour se nourrir, mais pour contrôler le territoire, éliminer une menace, ou créer une situation favorable.
- **Réactions différenciées** : une espèce consciente ne réagit pas aux joueurs et aux animaux de la même manière. Elle reconnaît les joueurs comme des entités **différentes** (porteurs de technologie, comportement de groupe organisé, vaisseau). Les animaux sont des éléments de l'environnement qu'elle peut exploiter. Les joueurs sont des cibles qu'elle étudie.

---

## Différences clés avec les espèces animales

| Aspect | Animal | Consciente |
|---|---|---|
| **Réaction au joueur** | Stimulus → réponse | Observation → planification → action |
| **Cachettes** | Le joueur se cache, l'animal passe | La créature vérifie les cachettes |
| **Lumière** | Fuit ou est attirée (instinct) | Comprend que c'est un outil |
| **Agonie du joueur** | L'animal part après le coup fatal | Laisse le joueur en appât |
| **Portes** | L'animal ne peut pas ouvrir les portes | La créature ouvre les portes |
| **Apprentissage** | Aucun. Mêmes patterns. | S'adapte aux tactiques des joueurs |
| **Communication** | Cris basiques (alerte) | Communication structurée, coordination |
| **Prévisibilité** | Prévisible une fois compris | Imprévisible. Change de tactique. |

---

## Peur générée

La peur d'une espèce consciente n'est pas la même que celle d'un animal :

- **Animal** : "Il est là. Il va me tuer si je ne cours pas." → Peur **réactive**.
- **Consciente** : "Il sait que je suis là. Il attend. Il a un plan." → Peur **proactive**. Le joueur a peur avant même que quelque chose se passe.

Le joueur qui réalise qu'il fait face à une espèce consciente et non à un animal change **complètement** de comportement : les tactiques qui marchaient ne marchent plus. Se cacher sous une table ? Elle va vérifier. Courir vers le vaisseau ? Elle connaît le chemin. Utiliser la lumière ? Elle s'en fiche.

---

## Rareté et impact

Les espèces conscientes doivent rester **rares** pour maximiser leur impact :

- Toutes les planètes n'en ont pas.
- Quand il y en a, il peut n'y avoir qu'un **seul individu** (ou très peu).
- Leur présence n'est pas forcément annoncée. Le joueur peut commencer à soupçonner qu'il ne fait pas face à un simple animal quand :
  - Les cachettes habituelles ne fonctionnent plus.
  - Les portes qu'il a fermées sont ouvertes.
  - Il entend la voix d'un coéquipier qui est dans la direction opposée.

---

## Architecture IA

### Modèle émotionnel (socle commun + extensions)

Les espèces conscientes possèdent le même socle émotionnel que les espèces animales (Colère, Peur, Faim, Énergie, Territorial, Curiosité) plus des **variables supplémentaires** propres à l'intelligence :

| Variable | Description | Rôle |
|---|---|---|
| **Patience** (0-100) | Capacité à attendre le moment optimal | Haute = embuscades élaborées, traque longue. Basse = assauts directs. |
| **Malice** (0-100) | Tendance à manipuler et piéger | Haute = utilisation d'appâts, imitation vocale, pièges. Basse = approche frontale. |

Les valeurs de Patience et Malice varient **par individu** au sein d'une même espèce, créant des rencontres différentes même avec le même type de créature.

### Émotions et planification

Contrairement aux espèces animales dont les émotions activent directement des branches de behavior tree, chez les espèces conscientes les émotions **paramètrent un planificateur**. Les variables émotionnelles modifient les **coûts des actions** dans le système de planification (GOAP ou HTN) :

- Patience haute → coût de "attendre / observer" bas → le planificateur préfère les embuscades
- Malice haute → coût de "piéger / imiter" bas → le planificateur préfère la manipulation
- Colère haute → coût de "attaquer" bas → le planificateur préfère l'assaut direct
- Peur haute (rare) → coût de "fuir" bas → la créature se replie

Le même monstre dans le même contexte mais avec des émotions différentes construira un **plan entièrement différent**.

### Couche décisionnelle : GOAP ou HTN

Les espèces conscientes utilisent un **système de planification** (GOAP — Goal-Oriented Action Planning, ou HTN — Hierarchical Task Networks) en remplacement du behavior tree simple des espèces animales.

**Chaque espèce consciente a une liste d'actions** qui représentent ses capacités. Le planificateur compose automatiquement des séquences d'actions pour atteindre son objectif actuel. Les actions disponibles dépendent de l'espèce : une espèce avec des mains peut ouvrir des portes, une espèce vocale peut imiter des sons, etc.

Chaque action a :
- Des **préconditions** (ce qui doit être vrai pour l'exécuter)
- Des **effets** (ce qui change dans le monde après exécution)
- Un **coût** (dynamique, influencé par les émotions)

Le planificateur trouve la séquence de coût minimal pour atteindre l'objectif. Les plans émergent des combinaisons d'actions — des comportements que le designer n'a jamais explicitement scriptés peuvent apparaître naturellement.

### Director AI (pacing)

Un système de pacing global (inspiré d'Alien: Isolation) supervise les espèces conscientes :

- **Jauge de menace** par joueur : monte quand la créature est proche, visible, en poursuite. Descend quand la créature est loin.
- **Tension trop haute trop longtemps** → le Director force la créature "en coulisse" (dans les conduits, hors de vue). La créature obéit sans "savoir" pourquoi.
- **Tension trop basse** → le Director ramène la créature vers la zone des joueurs.
- Objectif : maintenir un rythme **tension → terreur → repos → tension**, jamais de submersion ni d'ennui.

### Mémoire et apprentissage

Les espèces conscientes ont une **mémoire complète de la mission** :

- **Compteurs de comportement joueur** : nombre de fois que les joueurs se sont cachés dans un placard, ont utilisé la lumière, ont fui vers le vaisseau, etc.
- **Seuils de déverrouillage** : quand un compteur dépasse un seuil, de nouveaux comportements sont activés dans le planificateur (nouvelles actions débloquées ou coûts réduits). Le joueur perçoit que la créature "apprend".
- **Positions connues** : dernière position vue/entendue de chaque joueur, avec dégradation temporelle.
- **Mémoire des interactions** : dégâts reçus, tentatives de fuite des joueurs, directions de fuite habituelles.

L'apprentissage est réinitialisé entre les missions (chaque monde est régénéré). La créature commence "neuve" à chaque mission.

### Fuzziness (bruit contrôlé)

Comme pour les espèces animales, un aléatoire contrôlé est ajouté aux décisions. Mais pour les espèces conscientes, le bruit est plus subtil : il porte sur le **timing** (la créature attend un peu plus ou un peu moins avant d'agir) et sur le **choix entre plans de coût similaire** (si deux plans ont un coût proche, le choix est partiellement aléatoire). Le joueur ne peut jamais être sûr de ce que la créature va faire, même s'il comprend ses capacités.

---

## Interactions avec les autres systèmes

- **Design sonore** : l'imitation vocale et la manipulation sonore sont des outils des espèces conscientes. Tous les sons restent "réels" (la créature produit physiquement ces sons).
- **Combinaison/Caméra** : les espèces conscientes interagissent avec la technologie des joueurs.
- **Multijoueur** : l'exploitation de l'agonie, l'imitation vocale, et la traque créent les situations sociales les plus tendues du jeu.
- **Base de données** : les fiches des espèces conscientes sont parmi les plus incomplètes — leur comportement est difficile à cataloguer.
- **Blessures/Agonie** : la mécanique d'appât est spécifique aux espèces conscientes.
- **Navigation** : les espèces conscientes peuvent apprendre les routes des joueurs et les intercepter.

---

## Points ouverts

- Combien d'espèces conscientes au lancement ?
- Les espèces conscientes peuvent-elles réellement entrer dans le vaisseau ?
- Peuvent-elles utiliser des outils ou des armes ?
- Comment éviter que l'apprentissage rende le jeu injouable (la créature connaît TOUTES les tactiques des joueurs) ? Limiter la mémoire ? Nombre max de comportements déverrouillables ?
- Les espèces conscientes peuvent-elles communiquer avec les joueurs (pas juste imiter, mais tenter un échange) ?
- GOAP ou HTN ? Le choix technique final dépendra des tests de prototypage.
- Le Director AI est-il unique par espèce consciente ou global pour toute la mission ?
