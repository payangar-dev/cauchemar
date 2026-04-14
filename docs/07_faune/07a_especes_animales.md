# Espèces animales

## Résumé

Les espèces animales sont des créatures régies par l'**instinct**. Elles n'ont pas de conscience, pas de stratégie, pas de ruse. Leur comportement est dicté par leurs besoins biologiques (manger, dormir, se reproduire, défendre leur territoire) et par leurs réactions aux stimuli (bruit, lumière, odeur, mouvement). Une fois que le joueur comprend les règles d'une espèce animale, son comportement devient **prévisible** — mais cette prévisibilité ne le rend pas inoffensif.

## Principes de design

- Les espèces animales sont **dangereuses mais honnêtes**. Elles ne tendent pas de pièges, ne manipulent pas, ne s'adaptent pas aux tactiques du joueur.
- Leurs comportements sont basés sur des **stimuli et des réponses**. Si le joueur comprend les stimuli, il peut prédire les réponses.
- Elles génèrent une **peur viscérale et directe** : la peur du prédateur. Pas de la manipulation psychologique — juste la terreur brute de se retrouver face à quelque chose de plus rapide, plus fort, et plus mortel.
- Chaque espèce animale a des **règles de vie** cohérentes : territoire, cycle jour/nuit, sensibilités, régime alimentaire. Ces règles sont des **indices** que le joueur peut apprendre.
- Les espèces animales sont le **premier pallier de terreur** du jeu. Les joueurs débutants les craignent. Les joueurs expérimentés les respectent mais savent les éviter.

---

## Comportements de base

### Territorialité

Chaque espèce territoriale a une **zone** assignée dans le monde généré. Elle patrouille cette zone, la défend contre les intrus (joueurs et autres créatures), et ne s'en éloigne pas volontairement.

- Le joueur qui identifie les limites d'un territoire peut le **contourner**.
- Pénétrer dans un territoire déclenche une réaction (alerte, menace, attaque) selon l'agressivité de l'espèce.
- Quitter le territoire met souvent fin à la poursuite (l'animal ne suit pas au-delà de sa zone).

### Cycle jour/nuit

Les espèces animales suivent le cycle jour/nuit de la planète :

| Cycle | Comportement |
|---|---|
| **Diurne** | Active de jour, dort la nuit. Le joueur peut traverser son territoire de nuit sans risque (si silencieux). |
| **Nocturne** | Dort le jour, chasse la nuit. C'est le type le plus dangereux : quand la nuit tombe, elles sortent. |
| **Crépusculaire** | Active à l'aube et au crépuscule. Brèves fenêtres de danger extrême, puis calme. |
| **Permanent** | Active en permanence, pas de cycle de repos. Moins commune, toujours dangereuse. |

### Réaction aux stimuli

| Stimulus | Réaction typique |
|---|---|
| **Bruit fort** (course, cri, porte, objet lâché) | Alerte → investigation → poursuite si le joueur est repéré. |
| **Bruit léger** (marche, respiration) | Alerte si à courte distance. Ignoré à distance. |
| **Lumière** (lampe torche) | Variable selon l'espèce. Certaines fuient la lumière. D'autres sont attirées. |
| **Mouvement** | Détection visuelle. Le joueur immobile est souvent ignoré (dépend de l'espèce). |
| **Odeur** (sang, matériau vivant, nourriture) | Attraction à distance. L'espèce se dirige vers la source. |

### Modes de chasse

| Mode | Description | Danger pour le joueur |
|---|---|---|
| **Embuscade** | La créature attend immobile dans une zone et attaque quand une proie passe à proximité. | Le joueur ne la voit pas venir. La surprise est totale. |
| **Poursuite** | La créature repère une proie et la poursuit sur une distance. | Course-poursuite. L'endurance et la vitesse du joueur sont mises à l'épreuve. |
| **Territoire** | La créature ne chasse pas activement mais attaque tout ce qui entre dans sa zone. | Prévisible si le territoire est identifié. Fatal si le joueur entre par accident. |
| **Meute** | Plusieurs individus chassent ensemble, encerclent la proie. | Le plus dangereux. Courir ne sert à rien si on est encerclé. |

---

## Simulation

Les espèces animales sont simulées en permanence dans la zone de mission, même quand aucun joueur n'est à proximité.

### Activités hors interaction avec les joueurs

- **Patrouille** : l'animal se déplace dans son territoire selon un schéma semi-aléatoire.
- **Repos** : l'animal dort dans un lieu de repos (tanière, nid, zone abritée). Pendant le repos, il est moins réactif mais peut être réveillé par un bruit fort.
- **Chasse de proies naturelles** : l'animal chasse d'autres créatures (faune passive ou prédateurs plus petits). Cela crée des sons de combat et de mort dans l'environnement — des sons **réels** que le joueur peut entendre et interpréter.
- **Alimentation** : l'animal mange. Il est potentiellement moins attentif pendant ce temps.

### Interactions entre créatures

Les créatures ne vivent pas dans un monde centré sur le joueur. Elles forment un **écosystème** où les espèces interagissent entre elles de la même manière qu'elles interagissent avec les joueurs. Le joueur est un intrus dans cet écosystème, pas son centre.

**Principe fondamental** : les règles physiques du monde s'appliquent à **toutes les entités de la même manière** — joueurs et créatures. Une créature qui tombe de trop haut se blesse ou meurt. Une créature frappée par une météorite meurt. Une créature qui entre dans une zone de lave ou toxique subit les mêmes dégâts qu'un joueur (sauf résistance propre à l'espèce). Le monde ne triche pour personne.

De même, une créature ne distingue pas "joueur" de "autre créature" au niveau de ses stimuli de base. Elle perçoit du **bruit**, du **mouvement**, une **odeur**, une **menace** ou une **proie**. Ce qu'elle perçoit peut être un joueur, une autre créature, ou un événement du monde. Ses réactions émotionnelles et comportementales suivent les mêmes règles quel que soit la source du stimulus.

**Conséquences concrètes** :

- **Prédation inter-espèces** : un prédateur peut chasser une créature plus petite. Le joueur peut observer un prédateur traquer une proie — les sons de cette chasse sont réels et informatifs ("quelque chose chasse dans cette direction").
- **Conflits territoriaux** : deux créatures territoriales dont les zones se chevauchent peuvent s'affronter. Le joueur peut entendre ou voir ce conflit à distance.
- **Fuite face à un prédateur supérieur** : une créature qui détecte un prédateur plus dangereux qu'elle fuit. Le joueur peut voir une créature fuir et comprendre que quelque chose de pire approche.
- **Réactions en chaîne** : un prédateur attaque une proie → la proie crie → d'autres créatures réagissent au cri (fuite, curiosité, alerte) → le joueur entend tout ça et doit interpréter ce qui se passe.
- **Charognage** : les charognards sont attirés par les cadavres d'autres créatures, pas seulement par les cadavres humains.
- **Compétition alimentaire** : deux prédateurs sur la même proie peuvent s'affronter ou l'un peut fuir devant l'autre.

**Ce que le joueur en tire** :

Le joueur observe l'écosystème pour apprendre. Un prédateur qui fuit soudainement = quelque chose de plus dangereux arrive. Un silence soudain dans la forêt = un prédateur approche et les proies se taisent. Des cris de chasse au loin = une zone dangereuse. L'écosystème est une source d'**information indirecte** sur les menaces.

### Réactions aux événements du monde

- **Crash de vaisseau** : les animaux réagissent au bruit et à la perturbation. Certains fuient, d'autres sont attirés.
- **Météo** : certains animaux se mettent à l'abri pendant les tempêtes. D'autres deviennent plus actifs.
- **Présence d'une espèce consciente** : les animaux peuvent fuir un prédateur plus grand qu'eux.
- **Combat entre créatures** : les sons et les mouvements d'un combat attirent les charognards et alertent les créatures proches.

---

## Exemples d'archétypes

Ces exemples illustrent la diversité possible. Les espèces réelles du jeu seront conçues indépendamment.

### Le prédateur nocturne solitaire

- Dort le jour dans une tanière souterraine.
- Sort la nuit, patrouille un large territoire.
- Chasse à l'embuscade : attend immobile, attaque au passage.
- Sensible à la lumière vive (fuit si lampe torche à courte distance).
- Mais : en groupe, ne fuit plus la lumière.

### Le charognard territorial

- Actif en permanence.
- Vit autour des cadavres, des crashs, des zones de mort.
- N'attaque pas en premier, mais défend agressivement son "repas".
- Le joueur qui fouille un crash sans vérifier peut se retrouver face à un groupe de charognards.

### Le prédateur de meute diurne

- Actif de jour, en groupes de 3-6.
- Chasse par encerclement : si un individu repère le joueur, il alerte la meute.
- Rapide en terrain ouvert (prairie, désert).
- Le joueur doit briser l'encerclement ou trouver un espace étroit où la meute ne peut pas manoeuvrer.

### La créature souterraine

- Vit exclusivement dans les grottes et tunnels.
- Aveugle (pas de détection visuelle). Se fie au **son** et aux **vibrations**.
- Le joueur immobile et silencieux est invisible pour elle.
- Extrêmement dangereuse dans les passages étroits.

---

## Architecture IA

### Modèle émotionnel (socle commun à toute la faune)

Chaque créature animale possède les variables émotionnelles suivantes, qui évoluent en temps réel en réponse aux stimuli de l'environnement :

| Variable | Description | Rôle |
|---|---|---|
| **Colère** (0-100) | Hostilité envers les menaces perçues (joueurs, autres créatures, intrusions) | Détermine la tendance à l'agression |
| **Peur** (0-100) | Niveau de menace perçue (prédateur supérieur, bruit inconnu, dégâts reçus) | Détermine la tendance à la fuite |
| **Faim** (0-100) | Besoin de se nourrir | Pousse à chasser (proies naturelles, autres créatures, ou joueurs selon le régime) |
| **Énergie** (0-100) | Fatigue, capacité d'action | Décroît avec l'activité, pousse au repos quand basse |
| **Territorial** (0-100) | Réaction à l'intrusion dans le territoire | Monte quand une entité (joueur OU créature) entre dans la zone |
| **Curiosité** (0-100) | Intérêt pour les stimuli nouveaux | Pousse à observer et investiguer avant de réagir |

Les valeurs initiales, les seuils de réaction, et les modificateurs de stimuli sont **propres à chaque espèce**. C'est ce qui rend chaque espèce unique dans ses réactions.

### Règles décisionnelles de base

Les règles suivantes s'appliquent à toute la faune. Les émotions dominantes déterminent la tendance comportementale :

- **Peur >= Colère** → tendance à fuir
- **Colère > Peur** → tendance à attaquer
- **Curiosité** dominante → tendance à observer
- **Énergie < 20** → tendance au repos
- **Faim > 80** → tendance à chasser
- **Territorial > 70** ET intrus dans le territoire (joueur OU autre créature) → agressivité accrue

### Stimuli et modification des émotions

Chaque espèce a une **table de stimuli** propre qui définit comment les événements modifient ses variables émotionnelles. Exemple générique :

| Stimulus | Colère | Peur | Curiosité | Faim |
|---|---|---|---|---|
| Bruit fort (course, coup de feu) | +10 | +20 | +10 | — |
| Bruit léger (marche) | — | — | +15 | — |
| Lumière vive | Variable par espèce | Variable par espèce | +5 | — |
| Odeur de sang | +10 | — | +10 | +40 |
| Joueur qui court | +15 | — | — | — |
| Coup reçu | +30 | +20 | — | — |
| Mort d'un congénère | +20 | +30 | — | — |
| Joueur immobile | -5 | -5 | -10 | — |

Les valeurs de cette table sont spécifiques à chaque espèce. Une espèce sensible à la lumière aura +40 Peur à "lumière vive", tandis qu'une espèce attirée par la lumière aura +30 Curiosité et +20 Colère.

### Couche décisionnelle : Behavior Tree

Les espèces animales utilisent un **behavior tree classique** dont les branches sont activées en fonction de l'état émotionnel dominant. Le behavior tree est scripté par espèce et déterministe : une fois que le joueur comprend les règles d'une espèce, il peut prédire son comportement.

```
BEHAVIOR TREE (espèce animale):
│
├→ [Peur dominante] → Fuir, se cacher dans la tanière
├→ [Colère dominante] → Charger, poursuivre, attaquer
├→ [Curiosité dominante] → Approcher, observer, reculer
├→ [Faim dominante] → Chasser des proies, charognage
├→ [Territorial déclenché] → Menacer, défendre la zone
└→ [Énergie basse] → Repos, retour tanière
```

Les transitions entre états sont fluides grâce aux variables émotionnelles continues. La créature ne "switch" pas brutalement de curieuse à agressive — sa colère monte progressivement jusqu'à dépasser la curiosité.

### Mémoire

Les espèces animales ont une **mémoire courte**, limitée à la mission en cours :
- Dernière position connue d'une entité détectée — joueur ou autre créature (se dégrade avec le temps)
- Dernière source de bruit (se dégrade en quelques dizaines de secondes)
- Pas de mémoire des tactiques des joueurs
- Pas de rancune entre missions

### Pas de planification

Les espèces animales **ne planifient pas**. Elles réagissent à leur état émotionnel et à leurs stimuli. Pas de GOAP, pas de HTN, pas de combinaison d'actions stratégiques. Le behavior tree gère tout.

### Fuzziness (bruit contrôlé)

Un léger aléatoire est ajouté aux décisions pour éviter que le comportement soit 100% mécanique. Par exemple, une créature en état "curieux" ne fera pas exactement les mêmes mouvements d'approche à chaque fois. Ce bruit est subtil — le joueur perçoit le pattern global mais ne peut pas prédire chaque micro-décision.

---

## Interactions avec les autres systèmes

- **Design sonore** : les animaux produisent des sons réels (pas, grognements, cris de chasse). Le joueur peut identifier une espèce par son son.
- **Scanner** : les espèces animales peuvent être scannées pour alimenter la base de données.
- **Blessures** : un joueur blessé qui saigne attire les animaux sensibles à l'odeur du sang.
- **Matériaux** : certains matériaux (vivants, odorants) attirent ou repoussent certaines espèces.
- **Cycle jour/nuit** : le comportement des animaux change radicalement entre le jour et la nuit.
- **Biomes** : chaque espèce est associée à un ou plusieurs biomes.

---

## Points ouverts

- Nombre d'espèces animales au lancement.
- Existe-t-il une faune passive non dangereuse (herbivores, insectes) qui peuple le monde et le rend vivant ?
- Le joueur peut-il utiliser des leurres biologiques (phéromones, nourriture) pour manipuler le comportement animal ?
- Chaîne alimentaire : combien de niveaux ? (proie passive → prédateur moyen → prédateur apex → espèce consciente ?)
- Les créatures laissent-elles des cadavres quand elles sont tuées par d'autres créatures ? (Impact sur le charognage et l'écosystème)
- Les combats entre créatures peuvent-ils blesser/tuer un joueur qui se trouve au milieu ? (Dommages collatéraux)
