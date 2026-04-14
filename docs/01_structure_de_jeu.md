# Structure de jeu

## Résumé

Le jeu s'organise autour de trois espaces distincts : la **station spatiale** (hub safe), le **vaisseau** (transport et base opérationnelle en mission), et la **zone de mission** (planète hostile). Ces trois espaces ont des rôles, des mécaniques et des niveaux de danger différents. Le joueur passe cycliquement de l'un à l'autre selon une boucle de gameplay bien définie.

## Principes de design

- La station est le seul endroit **totalement safe** du jeu.
- Le vaisseau est un espace **relativement safe** mais limité, qui sert de point d'ancrage pendant la mission.
- La zone de mission est l'espace de **danger**, où toutes les mécaniques de survie s'activent.
- Le passage entre ces espaces est toujours **significatif** : il y a un coût ou un risque associé à chaque transition.

---

## La station spatiale

### Fonction

La station est le hub central du jeu. C'est l'espace de préparation, de récupération et de progression. Le joueur y est en sécurité totale.

### Ce que le joueur peut faire à la station

- **Sélectionner une mission** : choisir parmi les missions disponibles, consulter les informations planétaires (si scan planétaire disponible).
- **Gérer sa combinaison** : installer des upgrades, réparer les modules endommagés. Les upgrades de combinaison ne peuvent être faits QU'à la station.
- **Crafter** : accès complet à toutes les recettes de craft (consommables, composants, upgrades).
- **Gérer son inventaire** : stocker des matériaux dans le conteneur de la station (capacité illimitée), préparer son inventaire pour la prochaine mission.
- **Consulter la base de données** : lire les fiches d'espèces, les données planétaires, les notes des joueurs.
- **Acheter** : dépenser des crédits pour des consommables, des réparations, des scans planétaires.
- **Se soigner** : le retour à la station guérit **toujours** complètement le joueur. Il n'y a pas de blessures persistantes entre les missions.

### Le conteneur de la station

- Capacité : **illimitée**.
- Contenu : partagé entre **tous les joueurs de la session**.
- Alimentation : reçoit automatiquement le contenu du conteneur du vaisseau au retour de mission.
- Les joueurs peuvent y déposer ou y retirer des matériaux librement.

---

## Le vaisseau

### Fonction

Le vaisseau est le moyen de transport entre la station et les planètes. Pendant une mission, il sert de base opérationnelle : point de retour, atelier de craft, poste de surveillance, et zone de stockage temporaire.

### Caractéristiques

- Le vaisseau se pose sur la zone de mission. Il est le **point de départ et d'arrivée** de chaque mission.
- Le vaisseau ne se pilote pas vraiment. Le joueur lance le décollage et le vaisseau part automatiquement.

### Le portail de téléportation

- Le vaisseau contient un système de portail de téléportation.
- La téléportation ne fonctionne que dans **un seul sens** : de la station vers le vaisseau.
- Cela permet à des joueurs de **rejoindre une mission en cours** en se téléportant depuis la station.
- Pour **quitter** la mission, il faut physiquement retourner au vaisseau et décoller. Il n'y a pas de téléportation retour.

### Le décollage

- **N'importe quel joueur** présent au vaisseau peut lancer le décollage à tout moment.
- Lorsque le vaisseau décolle, tous les joueurs encore sur la planète sont **abandonnés**. Ils restent coincés sur la planète.
- Les joueurs abandonnés doivent attendre qu'un joueur revienne avec le vaisseau pour être récupérés (ou une autre solution à définir).
- Cette mécanique crée un **dilemme social permanent** : attendre les retardataires ou sauver sa peau.

### Ce que le joueur peut faire au vaisseau (pendant la mission)

- **Crafter des consommables** : bandages, boosts d'endurance, et autres consommables de terrain. Pas d'upgrades de combinaison.
- **Déposer des matériaux** dans le conteneur du vaisseau pour libérer de l'espace d'inventaire.
- **Déchiffrer les scans** : les données brutes collectées par le scanner de visière peuvent être déchiffrées au vaisseau.
- **Surveiller les caméras** : si les joueurs sur le terrain ont des caméras embarquées, leurs flux sont visibles au vaisseau.
- **Communiquer** : servir de relais pour les joueurs sur le terrain (si les modules de communication le permettent).

### Le conteneur du vaisseau

- Capacité : **limitée** (potentiellement upgradeable).
- Contenu : partagé entre tous les joueurs de la mission.
- Au retour à la station, le contenu est transféré automatiquement dans le conteneur de la station.
- Pendant la mission, les joueurs peuvent y déposer et retirer des matériaux.

### Upgrades du vaisseau

Le vaisseau peut être amélioré. Les upgrades confirmés :
- **Scanner planétaire** : permet de scanner une planète depuis l'orbite pour obtenir des informations (matériaux, météo, cycle jour/nuit, formes de vie). Coûte des crédits à l'utilisation.
- **Scan de terrain** : révèle des points d'intérêt et des directions approximatives avant de déployer les joueurs. Pas de carte complète.
- **Conteneur amélioré** : augmente la capacité de stockage du vaisseau (à confirmer).

---

## La zone de mission

### Fonction

C'est le terrain de jeu principal. Un monde généré procéduralement sur une planète, où les joueurs accomplissent leur objectif de mission tout en survivant à la faune locale.

### Caractéristiques

- Chaque mission génère un **monde unique**. Même sur la même planète, deux missions auront des terrains différents.
- La zone est **finie** et délimitée naturellement (terrain impraticable, mer, falaises, forêt dense, brouillard...). Jamais de mur invisible.
- Le joueur n'a **pas de carte**. Il s'oriente avec sa boussole, le signal du vaisseau, et ses sens.
- Les créatures sont simulées en permanence dans la zone, même quand aucun joueur n'est à proximité.
- Le cycle jour/nuit est actif et impacte la faune et la visibilité.
- Des événements dynamiques peuvent survenir en cours de mission (crash de vaisseau, météores, tempêtes...).

Voir [02_missions.md](02_missions.md) pour les types de missions et [06b_generation.md](06_planetes/06b_generation.md) pour le pipeline de génération.

---

## Boucle de jeu

```
STATION (safe)
│
├→ Préparation : combi, craft, inventaire, choix de mission
│
└→ VAISSEAU → ZONE DE MISSION
   │
   │  Exploration, objectif, collecte, survie
   │  ├→ Aller-retours possibles vaisseau ↔ terrain
   │  ├→ Joueurs peuvent rejoindre via portail
   │  └→ Événements dynamiques possibles
   │
   └→ DÉCOLLAGE → STATION
      │
      ├→ Conteneur vaisseau → conteneur station
      ├→ Crédits distribués (vivants uniquement + bonus ratio)
      ├→ Connaissances partagées (scans déchiffrés)
      ├→ Soins complets automatiques
      └→ Cycle recommence
```

---

## Interactions entre les espaces

| Depuis | Vers | Comment | Restrictions |
|---|---|---|---|
| Station | Vaisseau | Portail de téléportation | Sens unique, à tout moment pendant une mission |
| Vaisseau | Zone de mission | À pied, en sortant du vaisseau | Libre |
| Zone de mission | Vaisseau | À pied, en revenant au vaisseau | Il faut retrouver le vaisseau |
| Vaisseau | Station | Décollage | N'importe quel joueur au vaisseau peut déclencher |
| Station | Zone de mission | Impossible directement | Doit passer par le vaisseau |
| Zone de mission | Station | Impossible directement | Doit repasser par le vaisseau puis décoller |

---

## Points ouverts

- Que se passe-t-il quand tous les joueurs sont morts sur la planète et que personne n'est au vaisseau ? La mission échoue automatiquement ? Un timer avant échec ?
- Le vaisseau est-il toujours un espace safe pendant la mission, ou certaines créatures (conscientes notamment) pourraient-elles s'en approcher voire y entrer ?
- Peut-on améliorer la capacité du conteneur du vaisseau, et si oui, comment (crédits, craft, matériaux) ?
- Comment fonctionne la récupération des joueurs abandonnés ? Le même vaisseau revient ? Un autre joueur doit lancer une nouvelle mission ?
