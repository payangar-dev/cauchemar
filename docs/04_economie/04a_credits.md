# Crédits

## Résumé

Les crédits sont la monnaie du jeu. Ils sont gagnés en accomplissant des missions et dépensés à la station pour acheter des consommables, payer des réparations, financer des scans planétaires, et potentiellement acheter certains composants. Les crédits ne sont **pas partagés** : chaque joueur gagne ses propres crédits en fonction de sa participation et de sa survie.

## Principes de design

- Les crédits récompensent la **survie**, pas juste la complétion de l'objectif. Un joueur qui meurt pendant la mission ne touche rien.
- Le bonus collectif encourage la **coopération** et le fait d'attendre les autres joueurs.
- Les crédits sont un outil de préparation, pas de puissance. Ils permettent de mieux se préparer, pas de devenir plus fort.

---

## Gains de crédits

### Récompense de mission

Chaque mission réussie (objectif accompli + retour à la station) donne une récompense en crédits.

- Seuls les joueurs **revenus vivants** à la station reçoivent des crédits.
- Un joueur mort pendant la mission, même si l'objectif est accompli, ne reçoit **rien**.
- Un joueur qui a quitté la mission (via le vaisseau) avant la complétion de l'objectif : à définir (reçoit-il une partie ? Rien ?).

### Bonus collectif

Un bonus est appliqué en fonction du **ratio de joueurs revenus vivants par rapport au nombre de joueurs partis en mission** :

- **Tous les joueurs revenus** : bonus maximum (à définir, ex: +50% de la récompense de base).
- **Majorité revenue** : bonus moyen (ex: +25%).
- **Minorité revenue** : bonus faible ou nul (ex: +10% ou 0%).
- **Un seul survivant** : pas de bonus.

Ce système crée une pression sociale positive : les joueurs ont intérêt à attendre et à protéger les autres. Déclencher le décollage en laissant des coéquipiers = perdre le bonus pour tout le monde.

### Autres sources potentielles de crédits

À définir :
- Prime de découverte d'espèce (première entrée dans la base de données) ?
- Prime de sauvetage (récupération du corps d'un coéquipier) ?
- Vente de matériaux excédentaires à la station ?

---

## Dépenses de crédits

### À la station

| Dépense | Description |
|---|---|
| **Consommables** | Bandages, stimulants, kits anti-agonie, boosts d'endurance, etc. |
| **Réparation de modules** | Réparer les modules endommagés ou détruits de la combinaison. |
| **Scan planétaire** | Payer pour un scan d'une planète depuis le vaisseau (révèle matériaux, météo, cycle jour/nuit, formes de vie). |
| **Composants de craft** | Acheter certains composants de base pour le craft (si le joueur ne veut pas les récolter lui-même). À définir. |
| **Upgrades du vaisseau** | Scanner planétaire, scan de terrain, amélioration du conteneur. |

### Économie de la peur

Les crédits créent une **boucle d'anxiété** :
- Pour gagner des crédits, il faut **survivre aux missions**.
- Pour survivre plus facilement, il faut **dépenser des crédits** (meilleure préparation, consommables).
- Mais les consommables sont **consommés** même si rien ne se passe — un kit anti-agonie acheté et jamais utilisé est de l'argent gaspillé.
- Le joueur doit **parier** sur ce qui va se passer avant chaque mission.

---

## Interactions avec les autres systèmes

- **Missions** : les crédits sont la récompense principale des missions.
- **Combinaison** : la réparation et certains upgrades coûtent des crédits.
- **Craft** : certains composants de craft peuvent être achetés avec des crédits.
- **Connaissance** : le scan planétaire est une dépense de crédits qui fournit de l'information.

---

## Points ouverts

- Montants précis des récompenses de mission et des coûts (nécessite un tableau d'équilibrage économique).
- Les crédits peuvent-ils être transférés entre joueurs ?
- Y a-t-il un système d'inflation (les missions plus dangereuses rapportent plus) ?
- Peut-on vendre des matériaux contre des crédits ?
- Les pourcentages exacts du bonus collectif.
