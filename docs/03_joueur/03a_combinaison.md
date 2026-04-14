# La combinaison

## Résumé

La combinaison est l'équipement central du joueur. C'est un système modulaire que le joueur améliore au fil des missions en y installant des upgrades. La combinaison porte les modules de vision, de communication, de protection et de détection. Elle est le reflet de la progression du joueur : un joueur expérimenté n'est pas "plus fort", il est "mieux équipé". La combinaison peut être endommagée, perturbée par l'environnement, et surtout : elle peut être **perdue** si le joueur meurt et que son corps n'est pas récupéré.

## Principes de design

- La combinaison **ne rend pas plus puissant**. Elle rend moins vulnérable, moins aveugle, moins sourd, moins isolé.
- Chaque module peut être **endommagé** (dégâts physiques, permanents jusqu'à réparation) ou **perturbé** (conditions environnementales, temporaires).
- La perte de la combinaison est la **punition la plus lourde** du jeu en termes de progression. C'est ce qui motive la récupération des corps.
- Les upgrades de combinaison se font **uniquement à la station**. Pas de modification sur le terrain ni au vaisseau.
- La réparation des modules endommagés se fait **uniquement à la station** (coûte des crédits et/ou des matériaux).

---

## Modules de la combinaison

### Visière

La visière est le module frontal de la combinaison. Elle accueille les upgrades visuels et de détection.

| Upgrade | Description | Effet |
|---|---|---|
| **Vision nocturne** | Amplification de la lumière résiduelle | Permet de voir dans l'obscurité avec un rendu vert/gris. Ne fonctionne pas dans le noir total (il faut un minimum de lumière). |
| **Vision thermique** | Détection des signatures de chaleur | Permet de détecter les êtres vivants (chauds) à travers l'obscurité et partiellement à travers les obstacles fins. Inutile dans les environnements très chauds (tout est chaud) ou très froids (tout est froid). |
| **Lampe torche** | Source de lumière intégrée à la visière | Éclaire devant le joueur. Consomme de l'énergie (batterie). Signale la position du joueur aux créatures. Faisceau diffusé dans le brouillard/spores (rétrodiffusion, réduit la visibilité au lieu de l'améliorer). |
| **Scanner** | Dispositif d'analyse | Permet de scanner les créatures et les matériaux pour collecter des données brutes (à déchiffrer). Nécessite de viser la cible et de maintenir le scan pendant un temps d'exposition. Voir [05a_scanner.md](../05_connaissance/05a_scanner.md). |
| **Tracker** | Indicateur directionnel du vaisseau | Affiche sur la visière la direction du vaisseau. Ne donne pas la distance. Ne fonctionne pas hors de portée du signal. |

### Communication

Les modules de communication gèrent les interactions entre le joueur et le vaisseau, ainsi qu'entre les joueurs.

| Upgrade | Description | Effet |
|---|---|---|
| **Micro** | Captation audio du joueur | Permet aux autres joueurs et au vaisseau d'entendre le joueur. Qualité dégradée par l'eau, la distance, les interférences. |
| **Caméra embarquée** | Flux vidéo vers le vaisseau | Permet aux joueurs au vaisseau (et aux joueurs morts en spectateur) de voir ce que le joueur voit. Peut être endommagée, brouillée, détruite. |
| **Module de communication** | Radio | Permet de communiquer à distance avec les autres joueurs et le vaisseau. Portée et clarté dépendent de la qualité du module et de la distance. |

### Protection

Les modules de protection permettent de manipuler des matériaux dangereux ou d'évoluer dans des environnements hostiles.

| Upgrade | Description | Effet |
|---|---|---|
| **Protection thermique** | Isolation contre la chaleur | Permet de manipuler des matériaux brûlants sans se blesser. Réduit les dégâts des environnements chauds. |
| **Protection chimique** | Isolation contre les toxines et acides | Permet de manipuler des matériaux toxiques ou corrosifs. Réduit les dégâts des atmosphères toxiques et des pluies acides. |
| **Protection radiation** | Blindage contre les radiations | Permet de manipuler des matériaux radioactifs. Réduit les dégâts des zones irradiées (crash de vaisseau, certains environnements). |
| **Bio-confinement** | Conteneur biologique intégré | Permet de transporter des matériaux vivants sans risque de parasitage, de bruit ou d'évasion. |

### Autres modules potentiels

- **Réserve d'oxygène** : pour les environnements à atmosphère irrespirable (à définir).
- **Blindage** : réduction des dégâts physiques (à définir — attention à ne pas contredire le pilier d'impuissance).

---

## États des modules

Chaque module peut être dans l'un des états suivants :

### Fonctionnel

Le module fonctionne normalement. Pas de malus, pas de dégradation.

### Perturbé (temporaire)

L'environnement interfère avec le fonctionnement du module. L'effet disparaît quand le joueur quitte la zone ou la condition qui cause la perturbation.

| Condition environnementale | Modules affectés | Effet |
|---|---|---|
| **Eau / immersion** | Micro : grésille, son inaudible. Caméra : image brouillée par les gouttes/l'eau. Vision nocturne : parasites. Thermique : lectures perturbées. Lampe : faisceau diffusé dans l'eau. |
| **Froid extrême** | Caméra : givre sur l'objectif, image partiellement obstruée. Vision nocturne : ralentie (temps d'adaptation augmenté). Thermique : faussée (tout apparaît froid, perte de contraste). |
| **Chaleur intense** | Vision nocturne : saturée (trop de lumière infrarouge). Thermique : inutile (tout apparaît chaud, aucun contraste). |
| **Zone d'interférence** | Micro : coupures intermittentes. Caméra : statique, lignes horizontales. Vision nocturne : scintillements. Thermique : scintillements. Communication : coupures, portée réduite. Tracker : instable ou inopérant. |
| **Spores / brouillard dense** | Caméra : opacité partielle. Vision nocturne : portée réduite. Lampe : rétrodiffusion (le joueur se signale sans rien voir). |

### Endommagé (permanent jusqu'à réparation)

Le module a subi un dégât physique (impact, chute, attaque de créature). Il fonctionne partiellement mais avec des défauts permanents jusqu'à réparation à la station.

| Module | Effet quand endommagé |
|---|---|
| **Vision nocturne** | Zones mortes dans le champ de vision (trous noirs). Scintillements aléatoires. |
| **Vision thermique** | Zones mortes. Faux positifs (signatures fantômes). |
| **Lampe torche** | Clignote de manière imprévisible. Peut s'éteindre temporairement. |
| **Scanner** | Temps de scan augmenté. Données parfois corrompues (informations manquantes dans la fiche). |
| **Tracker** | Direction imprécise (oscille au lieu de pointer). |
| **Micro** | Grésillements permanents. Le joueur est parfois inaudible pour les autres. |
| **Caméra** | Lignes de fracture sur l'image. Zones noires. Coupures intermittentes. |
| **Communication** | Portée réduite. Coupures fréquentes. |
| **Protections** | Protection réduite (le joueur subit quand même une partie des dégâts). |
| **Bio-confinement** | Risque de fuite du matériau vivant confiné. |

### Détruit

Le module est inutilisable. Il doit être réparé à la station (coût plus élevé que la réparation d'un module endommagé). Il ne fournit plus aucune fonctionnalité.

Cas particulier : la **caméra détruite** coupe le flux vers le vaisseau. Les joueurs au vaisseau et les joueurs morts en spectateur ne peuvent plus voir ce joueur. Le joueur lui-même est toujours vivant, mais il est "invisible" pour l'équipe.

---

## Perte de la combinaison

### Corps récupéré (ramené au vaisseau)

- La combinaison est **sauvée**. Tous les upgrades sont conservés.
- Les modules endommagés ou détruits pendant la mission doivent être réparés à la station (coût de réparation).
- Les données de scan stockées dans la combinaison sont récupérables (peuvent être déchiffrées).

### Corps non récupéré (abandonné sur la planète)

- La combinaison est **perdue**. Tous les upgrades sont perdus.
- Le joueur repart avec une combinaison de base (sans aucun upgrade).
- Les données de scan stockées dans la combinaison sont **perdues**.
- C'est la punition la plus sévère du jeu. Cela peut représenter des heures de progression en craft et en crédits.

---

## La combinaison de base (sans upgrades)

Un joueur sans aucun upgrade dispose de :

- **Visière basique** : vision normale. Pas de vision nocturne, pas de thermique, pas de lampe, pas de scanner, pas de tracker.
- **Communication basique** : voix de proximité uniquement (courte portée). Pas de micro pour le vaisseau, pas de caméra, pas de radio longue portée.
- **Aucune protection** : les matériaux dangereux blessent directement.
- **Boussole** : toujours disponible, fait partie de la combinaison de base. Indique les points cardinaux.
- **Signal du vaisseau** : toujours disponible. Bip sonore dont l'intensité diminue avec la distance. Pas de direction, pas de distance précise.

Un joueur avec une combinaison de base peut participer à une mission. Il sera simplement **très vulnérable** : aveugle la nuit, injoignable par l'équipe, sans protection contre les matériaux dangereux, sans moyen de scanner quoi que ce soit.

---

## Interactions avec les autres systèmes

- **Économie** : les upgrades coûtent des crédits et/ou des matériaux craftés. La réparation coûte des crédits et/ou des matériaux.
- **Craft** : certains upgrades nécessitent des composants craftés à partir de matériaux récupérés en mission.
- **Blessures** : les blessures et la mort interagissent avec la combinaison (perte si corps non récupéré).
- **Connaissance** : le scanner est un module de la combinaison. Les données de scan sont stockées dans la combinaison.
- **Faune** : les espèces conscientes peuvent potentiellement interagir avec la combinaison (récupérer la caméra d'un joueur mort, fixer l'objectif, couvrir la caméra).

---

## Points ouverts

- Combien de slots de modules la combinaison a-t-elle ? Peut-on tout équiper en même temps ou faut-il choisir ?
- La vision nocturne et la vision thermique sont-elles mutuellement exclusives (même slot sur la visière) ou cumulables ?
- Y a-t-il un système d'énergie / batterie global pour la combinaison, ou chaque module a-t-il sa propre autonomie ?
- Le blindage (réduction de dégâts physiques) est-il envisageable sans contredire le pilier d'impuissance ? (Un joueur blindé qui "encaisse" un coup de monstre casse la peur.)
- Les modules de protection sont-ils des upgrades permanents ou des consommables à durée limitée ?
