# Missions

## Résumé

Les missions sont le coeur du gameplay. Chaque mission se déroule sur une planète, dans un monde généré procéduralement. Les joueurs ont un objectif à accomplir (récupérer du cargo, sauver quelqu'un, collecter un échantillon, enquêter sur un crash) tout en survivant à la faune locale et aux conditions environnementales. Certaines missions ont un temps imparti, d'autres non — mais des événements dynamiques peuvent créer de l'urgence à tout moment.

## Principes de design

- Chaque type de mission crée un **rythme de peur différent** : l'urgence du sauvetage n'est pas la même que la lenteur oppressante de l'investigation.
- Les missions sans limite de temps ne sont pas pour autant sans danger : le cycle jour/nuit et les événements dynamiques créent leur propre pression.
- L'objectif de la mission n'est que la **raison d'être là**. La vraie expérience, c'est tout ce qui se passe autour : les rencontres, les découvertes, les choix de survie.
- La mission est considérée comme terminée quand les joueurs décollent. Pas quand l'objectif est rempli.

---

## Types de missions

### Récupération de marchandise

- **Temps imparti** : Non.
- **Objectif** : Retrouver et ramener au vaisseau des cargaisons perdues ou dispersées sur la zone de mission.
- **Pacing** : Exploration → localisation du cargo → collecte → retour au vaisseau chargé.
- **Tension principale** : Le retour au vaisseau. Le joueur est encombré par le cargo, donc plus lent, moins agile, plus vulnérable. Le poids du cargo affecte sa vitesse de déplacement. Chaque trajet cargo → vaisseau est un moment d'exposition.
- **Gameplay spécifique** : Le cargo peut être dispersé sur plusieurs points de la zone. Les joueurs doivent décider s'ils font plusieurs allers-retours ou s'ils tentent de tout porter en une fois. Le cargo pourrait avoir des propriétés dangereuses (matières toxiques, conteneurs instables...).

### Sauvetage

- **Temps imparti** : Oui. Le ou les survivants ont un temps de survie limité.
- **Objectif** : Localiser et ramener au vaisseau des survivants (PNJ ou joueurs abandonnés lors d'une mission précédente, à définir).
- **Pacing** : Urgence dès le départ. Pas le temps d'explorer, de scanner, de fouiller. Il faut trouver le survivant avant le timer.
- **Tension principale** : La pression temporelle force des prises de risque. Les joueurs coupent à travers des zones dangereuses au lieu de les contourner. Ils courent au lieu de marcher silencieusement. Ils n'ont pas le temps de vérifier si un matériau est dangereux avant de le ramasser.
- **Gameplay spécifique** : Le survivant pourrait être blessé (il faut le porter, ce qui ralentit). Il pourrait être dans une zone particulièrement dangereuse (pourquoi il est coincé). Les joueurs pourraient devoir choisir entre sauver le survivant et sauver le butin qu'il avait sur lui.

### Mission scientifique

- **Temps imparti** : Non.
- **Objectif** : Récupérer un échantillon d'une espèce spécifique, collecter des données sur la faune locale, ou prélever un matériau particulier.
- **Pacing** : Lent et méthodique. Observer, scanner, comprendre l'environnement, puis agir avec précaution.
- **Tension principale** : Le joueur doit s'approcher **volontairement** du danger. Pour prélever un échantillon d'un prédateur, il faut être près du prédateur. Pour collecter une plante dans le territoire d'une espèce consciente, il faut entrer dans ce territoire.
- **Gameplay spécifique** : Les missions scientifiques sont le meilleur vecteur pour compléter la base de données. Le scanner est particulièrement utile ici. Le joueur peut apprendre les comportements des espèces, découvrir des interactions entre espèces, trouver des appâts ou des répulsifs. Ces missions récompensent la patience et l'observation plutôt que la vitesse.

### Investigation de crash

- **Temps imparti** : Non.
- **Objectif** : Enquêter sur un crash de vaisseau ou une installation abandonnée. Comprendre ce qui s'est passé. Récupérer des données, des boîtes noires, des journaux de bord.
- **Pacing** : Le plus atmosphérique des types de mission. Lent, oppressant, avec une montée progressive de la tension. Le joueur reconstitue une histoire à travers les indices — et comprend progressivement que ce qui a causé le crash est probablement encore là.
- **Tension principale** : La narration environnementale. Les traces de sang, les portes défoncées, les messages d'urgence. Le joueur sait qu'il marche dans les pas de gens qui n'ont pas survécu. Et il commence à rencontrer ce qui les a tués.
- **Gameplay spécifique** : Les zones de crash contiennent du loot de valeur (technologie, matériaux rares, données). Mais elles sont souvent le territoire d'une créature qui s'y est installée. Le joueur doit fouiller méthodiquement tout en restant prêt à fuir.

---

## Temps et urgence

### Missions sans temps imparti

Les missions scientifiques, de récupération de cargo et d'investigation n'ont pas de timer par défaut. Le joueur peut rester aussi longtemps qu'il le souhaite. Mais cela ne signifie pas qu'il n'y a aucune pression :

- Le **cycle jour/nuit** change la dangerosité de la zone. Une exploration facile de jour peut devenir un cauchemar de nuit.
- Les **ressources limitées** de la combinaison (batterie de lampe, etc.) créent une pression naturelle.
- Les **événements dynamiques** peuvent créer un temps imparti soudain.

### Missions avec temps imparti

Les missions de sauvetage ont un timer fixé dès le début. Le timer est connu des joueurs. Quand il expire, l'objectif échoue (le survivant meurt), mais les joueurs peuvent toujours retourner au vaisseau.

### Événements dynamiques créant de l'urgence

Même dans une mission sans temps imparti, des événements peuvent surgir en cours de route :

- **Chute de météores** : annoncée avec un délai ("Impact dans X minutes"). Les joueurs doivent quitter la zone ou trouver un abri.
- **Tempête** : réduit la visibilité, perturbe les modules de la combinaison, peut être dangereuse selon le type (tempête de sable, pluie acide...).
- **Crash de vaisseau** (événement dynamique) : un vaisseau s'écrase sur la zone en cours de mission. Crée une opportunité de loot et modifie la topographie, mais attire les créatures et génère des dangers (radiation, feu, toxicité).
- **Changement de comportement de la faune** : un événement (saison de reproduction, migration, prédateur alpha qui arrive) peut rendre la zone soudainement beaucoup plus dangereuse.

Les événements dynamiques doivent rester **rares et contrôlés**. Ils ne doivent pas survenir à chaque mission, pour garder leur impact. Quand ils surviennent, ils doivent être significatifs et changer la dynamique de la mission.

---

## Pacing de la terreur par type de mission

```
RÉCUPÉRATION CARGO:
Intensité: ▁▂▂▃▃▅▇▅▃▇█▅▂
            │ explore │ collecte │ retour chargé │
            Calme     Tension    Vulnérabilité max

SAUVETAGE:
Intensité: ▅▇▇█▇█▇▅▃
            │ course contre la montre │ retour │
            Urgence constante         Soulagement

SCIENTIFIQUE:
Intensité: ▁▁▂▂▃▁▂▅▇▇█▅▃▁
            │ observation │ approche │ prélèvement │ retour │
            Calme         Méthode    Peur maximale  Calme

INVESTIGATION:
Intensité: ▁▂▃▃▅▅▇▇█████
            │ découverte progressive │ réalisation │ terreur │
            Atmosphère qui monte      "C'est encore là"
```

---

## Récompenses de mission

### Crédits

- Les crédits sont distribués **individuellement** : seuls les joueurs revenus **vivants** à la station sont payés.
- Un **bonus collectif** est appliqué en fonction du ratio de joueurs revenus vivants par rapport au nombre de joueurs partis :
  - 100% des joueurs revenus : bonus maximum.
  - Plus le ratio baisse, plus le bonus diminue.
  - Si un seul joueur revient : pas de bonus (ou bonus minimal).
- Ce système **encourage** les joueurs à attendre les autres et à coopérer pour le retour.

### Matériaux

- Les matériaux collectés pendant la mission sont individuels (voir [04b_materiaux.md](04_economie/04b_materiaux.md)).
- Les matériaux déposés dans le conteneur du vaisseau sont récupérés par le groupe au retour.
- Les matériaux dans l'inventaire d'un joueur mort et non récupéré sont **perdus**.

### Connaissances

- Les données de scan déchiffrées pendant la mission sont partagées avec tous les joueurs de la session.
- Les connaissances non déchiffrées (stockées dans la combinaison) sont perdues si le joueur meurt et que sa combinaison n'est pas récupérée.
- Les observations manuelles ajoutées par les joueurs à la base de données sont sauvegardées si le joueur revient vivant ou si sa combinaison est récupérée.

---

## Points ouverts

- Faut-il un système de difficulté des missions (facile / moyen / difficile) ou la difficulté est-elle entièrement liée à la planète et au type de mission ?
- Les missions de sauvetage : est-ce qu'on sauve des PNJ ou est-ce qu'on récupère des joueurs abandonnés lors d'une mission précédente ? Les deux ?
- Peut-on échouer l'objectif principal et quand même revenir à la station ? (Oui pour le sauvetage — le survivant meurt mais on survit. Quid des autres types ?)
- Y a-t-il une pénalité pour les missions abandonnées (décollage sans avoir rempli l'objectif) ?
- Comment sont générées/proposées les missions à la station ? Pool aléatoire ? Progression narrative ? Tableau de missions ?
