# Scanner

## Résumé

Le scanner est le principal outil de collecte d'information du joueur. Il existe sous deux formes : le **scanner de visière** (upgrade de combinaison, utilisé sur le terrain pour scanner créatures et matériaux) et le **scanner planétaire** (upgrade du vaisseau, utilisé depuis l'orbite pour obtenir des informations sur une planète). Les deux partagent un principe fondamental : les résultats ne sont **jamais immédiats ni complets**. Le scanner collecte des données brutes qui doivent être déchiffrées, et la base de données consultée peut être incomplète.

## Principes de design

- Le scanner ne supprime **jamais** l'incertitude en temps réel. Il la repousse au vaisseau.
- Les résultats sont toujours **potentiellement incomplets**. Le joueur ne peut jamais être sûr d'avoir toutes les informations.
- Scanner est un **acte risqué** : il faut viser, maintenir, et rester exposé.
- La connaissance se construit **collectivement et progressivement** : chaque scan enrichit la base de données du groupe.

---

## Scanner de visière (upgrade de combinaison)

### Installation

Le scanner est un module installé sur la **visière** de la combinaison. Il n'est pas disponible par défaut : le joueur doit le crafter ou l'acheter et l'installer à la station.

### Utilisation sur le terrain

1. Le joueur **vise** la cible (créature ou matériau).
2. Le joueur **maintient** le scan pendant un temps d'exposition (quelques secondes).
3. Pendant ce temps, le joueur est **immobile et exposé**. Il ne peut pas courir, se cacher, ou interagir avec autre chose.
4. À la fin du scan, une **donnée brute** est collectée et stockée dans la combinaison.
5. Le joueur reçoit une confirmation visuelle/sonore que le scan est réussi. Mais il ne voit **pas** le résultat.

### Données brutes

Les données collectées par le scanner sont des **données brutes non lisibles**. Le joueur sait qu'il a scanné quelque chose, mais il ne sait pas **ce que** le scan a révélé. Les données doivent être **déchiffrées** pour devenir des informations utiles.

### Déchiffrage

Les données brutes peuvent être déchiffrées dans les conditions suivantes :

- **Au vaisseau** : le joueur retourne au vaisseau pendant la mission et utilise les systèmes de bord pour déchiffrer.
- **À la station** : le joueur retourne à la station à la fin de la mission.
- **Via la récupération de la combinaison** : si le joueur meurt, un coéquipier peut récupérer son corps (et donc sa combinaison) et ramener les données au vaisseau.

Si le joueur meurt et que son corps n'est pas récupéré, les données brutes sont **perdues**.

### Résultats du scan

Le scan consulte une **base de données qui peut être incomplète**. Les résultats varient selon l'espèce ou le matériau scanné :

- Certaines entrées sont bien documentées (beaucoup d'informations disponibles).
- D'autres sont très pauvres (juste le type de créature, rien de plus).
- Les champs manquants sont clairement marqués comme "DONNÉES INSUFFISANTES".

### Scans multiples

Scanner la **même espèce plusieurs fois** (ou dans des conditions différentes) peut compléter progressivement la fiche :

- 1er scan : informations de base (taille, type, classification).
- 2e scan : informations supplémentaires (sensibilités, régime alimentaire).
- 3e scan (dans un contexte différent, ex: de nuit) : comportements contextuels.
- Scans supplémentaires : détails de plus en plus fins.

Chaque scan n'est pas garanti d'apporter de nouvelles informations. La base de données a un **plafond** d'informations disponibles par espèce, et ce plafond varie selon l'espèce.

### Scanner endommagé

Si le module scanner est **endommagé** :
- Le temps de scan est **augmenté** (le joueur doit rester exposé plus longtemps).
- Les données peuvent être **corrompues** (informations manquantes ou erronées dans la fiche déchiffrée).

Si le module scanner est **détruit** :
- Le scan est **impossible** jusqu'à réparation à la station.

---

## Scanner planétaire (upgrade du vaisseau)

### Installation

Le scanner planétaire est un module installé sur le **vaisseau**. C'est une upgrade du vaisseau, pas de la combinaison.

### Utilisation

Le scanner planétaire est utilisé **depuis l'orbite** ou **depuis la station**, avant de se poser sur une planète. Son utilisation coûte des **crédits** à chaque scan.

### Résultats

Le scanner planétaire fournit des informations à l'échelle de la **planète** :

| Information | Précision |
|---|---|
| **Matériaux** | "Matériaux détectés : [liste partielle]" — certains matériaux connus (si déjà découverts par des joueurs), d'autres marqués comme "non identifiés". |
| **Météo** | Conditions météorologiques possibles sur la planète (tempêtes, pluie, brouillard...). Potentiellement incomplet. |
| **Cycle jour/nuit** | Durée approximative du jour et de la nuit. |
| **Formes de vie** | "Formes de vie détectées" — pas de noms d'espèces. Juste la présence de vie, potentiellement avec un niveau d'activité ("activité faible", "activité significative", "activité élevée"). |
| **Événements** | Événements planétaires possibles (météores, éruptions). Potentiellement incomplet. |

### Limites du scanner planétaire

- Les informations sur la faune sont **volontairement floues**. Le scan dit "formes de vie détectées", pas "il y a 3 Rampeurs nocturnes et 1 Parasite alpha".
- Les matériaux non encore découverts par aucun joueur apparaissent comme "non identifiés".
- Les informations peuvent être **incomplètes** : le scan ne détecte pas tout. Certaines données marquées comme absentes pourraient simplement n'avoir pas été détectées.

### Enrichissement par les joueurs

Le scan planétaire est enrichi par les découvertes des joueurs :
- Un joueur qui découvre un matériau sur une planète → ce matériau apparaît désormais comme "confirmé" dans le scan planétaire de cette planète.
- Un joueur qui scanne une espèce sur une planète → le scan planétaire peut mentionner "prédateur confirmé" au lieu de simplement "formes de vie détectées".
- Les notes ajoutées par les joueurs sont accessibles via le scan planétaire.

---

## Interactions avec les autres systèmes

- **Combinaison** : le scanner de visière est un module de la combinaison. Il peut être endommagé ou détruit.
- **Connaissance** : les scans alimentent la base de données (voir [05b_base_de_donnees.md](05b_base_de_donnees.md)).
- **Matériaux** : le scanner révèle les propriétés et les dangers des matériaux.
- **Faune** : le scanner révèle les caractéristiques des créatures (comportement, sensibilités, etc.).
- **Planètes** : le scanner planétaire fournit les informations préalables sur une planète.
- **Économie** : le scan planétaire coûte des crédits.

---

## Points ouverts

- Durée exacte du temps de scan pour le scanner de visière (2 secondes ? 5 secondes ? Variable selon la cible ?).
- Le scanner fait-il du bruit ? (Si oui, scanner = se signaler aux créatures.)
- Le scanner peut-il fonctionner dans l'obscurité totale, ou faut-il voir la cible ?
- Portée du scanner : faut-il être près de la cible ou peut-on scanner à distance ?
- Le coût en crédits du scan planétaire est-il fixe ou variable selon la planète ?
- Peut-on scanner les mêmes matériaux plusieurs fois pour obtenir plus d'informations, comme pour les créatures ?
