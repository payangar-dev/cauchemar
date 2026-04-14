# Base de données

## Résumé

La base de données est le système central de connaissance du jeu. Elle accumule tout ce que les joueurs ont appris au fil des missions : fiches d'espèces, propriétés des matériaux, informations planétaires. Elle se construit **collectivement et progressivement** via trois sources : les scans (données déchiffrées), les découvertes visuelles (le joueur voit un matériau), et les **observations manuelles** (le joueur ajoute des notes basées sur son expérience). La base de données est intentionnellement incomplète : elle ne dit jamais tout, et elle ne remplace pas l'expérience de terrain.

## Principes de design

- La base de données est un **outil imparfait**, pas un guide omniscient.
- Elle se construit au fil du temps : la **progression du groupe** se mesure à la complétude de la base de données.
- Les joueurs **contribuent** à la base de données en ajoutant des observations manuelles. Ils ne sont pas de simples consommateurs d'informations.
- La connaissance partagée est la **vraie progression** du jeu. Perdre des données (mort sans récupération de la combinaison) est un revers significatif.
- Les informations de la base de données peuvent être **incomplètes, vagues, ou insuffisantes**. Le joueur doit compléter par l'observation et l'expérience.

---

## Partage de la connaissance

Les connaissances sont partagées avec **tous les joueurs de la session** une fois déchiffrées et rapportées.

### Conditions de partage

Pour qu'une connaissance (scan, observation, découverte) soit ajoutée à la base de données partagée :

1. Le joueur doit **revenir vivant** au vaisseau ou à la station, **OU**
2. La **combinaison** du joueur (portant les données de scan) doit être récupérée par un coéquipier et ramenée au vaisseau.

Si le joueur meurt et que sa combinaison est abandonnée, toutes les données non encore partagées sont **perdues**.

### Accessibilité

- La base de données est consultable à la **station** (interface complète).
- Elle est consultable au **vaisseau** (après déchiffrage des données collectées pendant la mission).
- Elle n'est **pas** consultable sur le terrain (sauf si une upgrade le permet — à définir).

---

## Fiches d'espèces

Chaque espèce rencontrée et scannée a une fiche dans la base de données. La fiche se complète progressivement avec les scans multiples et les observations.

### Structure d'une fiche d'espèce

```
ESPÈCE: [Nom attribué automatiquement ou par les joueurs]
ID: #XXX

CLASSIFICATION:
- Type: [Prédateur / Charognard / Herbivore / Parasite / Inconnu]
- Intelligence: [Animal / Consciente / DONNÉES INSUFFISANTES]
- Taille: [Estimation en mètres ou catégorie]

SENSIBILITÉS:
- Lumière: [Confirmé / Probable / DONNÉES INSUFFISANTES]
- Son: [Confirmé / Probable / DONNÉES INSUFFISANTES]
- Température: [DONNÉES INSUFFISANTES]
- Autre: [DONNÉES INSUFFISANTES]

COMPORTEMENT:
- Mode de chasse: [Embuscade / Poursuite / Meute / DONNÉES INSUFFISANTES]
- Comportement social: [Solitaire / Groupe / DONNÉES INSUFFISANTES]
- Cycle d'activité: [Nocturne / Diurne / Permanent / DONNÉES INSUFFISANTES]
- Territoire: [Fixe / Nomade / DONNÉES INSUFFISANTES]

RÉGIME:
- [Carnivore / Herbivore / Omnivore / DONNÉES INSUFFISANTES]
- Attiré par: [Sang / Bruit / Lumière / Organisme X / DONNÉES INSUFFISANTES]

FAIBLESSES:
- [Lumière vive / Son aigu / Feu / DONNÉES INSUFFISANTES]

HABITAT:
- Planètes: [Liste des planètes où l'espèce a été observée]
- Biomes: [Forêt / Grottes / Marécage / DONNÉES INSUFFISANTES]

NOTES DES JOUEURS:
- [Mission #12] "Semble ignorer les joueurs immobiles."
- [Mission #15] "A fui quand j'ai allumé la lampe torche à courte distance."
- [Mission #18] "ATTENTION: en groupe, ils ne fuient plus la lumière."
```

### Niveaux de complétude

| Niveau | Scans nécessaires | Informations disponibles |
|---|---|---|
| **Non identifié** | 0 | Rien. Le joueur a vu la créature mais ne l'a pas scannée. |
| **Basique** | 1 | Type, taille, classification approximative. |
| **Partiel** | 2-3 | Sensibilités principales, mode de chasse, cycle d'activité. |
| **Détaillé** | 4+ | Comportement social, régime, faiblesses, habitat. |
| **Complet** | Plafond atteint | Toutes les informations disponibles dans la base de données. Certains champs peuvent rester "DONNÉES INSUFFISANTES" même au plafond — la base de données elle-même ne sait pas tout. |

### Scans dans des contextes différents

Scanner la même espèce dans des **conditions différentes** peut révéler des informations que le même contexte ne donnerait pas :

- Scanner de jour vs de nuit → révèle le cycle d'activité.
- Scanner pendant une chasse vs au repos → révèle le mode de chasse.
- Scanner un individu isolé vs un groupe → révèle le comportement social.
- Scanner sur des planètes différentes → révèle les variations comportementales liées à l'environnement.

---

## Observations manuelles des joueurs

### Fonctionnement

Après une mission (ou au vaisseau pendant la mission), un joueur peut **ajouter des notes** à une fiche d'espèce ou de matériau. Ces notes sont du texte libre écrit par le joueur.

### Valeur des notes

- Les notes capturent ce que le scanner ne peut pas mesurer : des **comportements observés**, des **réactions** de la créature à des stimuli spécifiques, des **astuces** de survie.
- Les notes sont la mémoire **collective** du groupe. Elles sont le guide de survie que les joueurs construisent eux-mêmes.
- Les notes peuvent être **fausses** ou **imprécises** (le joueur a mal interprété un comportement). Cela fait partie du jeu : la base de données n'est pas parole d'évangile.

### Exemples de notes utiles

- "L'espèce #7 ne nous a pas attaqués quand on était à plus de 5m. Semble avoir une distance de détection courte."
- "La fleur de soufre trouvée sur KR-447 a attiré l'espèce #3 quand je l'ai lâchée. Utilisable comme appât ?"
- "NE PAS allumer la lampe torche dans les grottes de Vega-9. L'espèce #12 est ATTIRÉE par la lumière, pas repoussée."

---

## Données planétaires

La base de données contient aussi des fiches par planète, enrichies par le scanner planétaire et les découvertes des joueurs.

### Structure d'une fiche de planète

```
PLANÈTE: [Nom ou identifiant]

PROPRIÉTÉS PHYSIQUES:
- Atmosphère: [Respirable / Toxique / Fine / DONNÉES INSUFFISANTES]
- Gravité: [Normale / Faible / Forte / DONNÉES INSUFFISANTES]
- Température moyenne: [DONNÉES INSUFFISANTES]

CYCLE JOUR/NUIT:
- Durée du jour: [Xmin / DONNÉES INSUFFISANTES]
- Durée de la nuit: [Xmin / DONNÉES INSUFFISANTES]
- Particularité: [Rotation verrouillée / Rotation rapide / Normale]

BIOMES OBSERVÉS:
- [Forêt / Prairie / Montagne / Marécage / ...]
- (Enrichi à chaque mission sur cette planète)

MATÉRIAUX CONFIRMÉS:
- Minerai X (confirmé par joueur, mission #5)
- Plante Y (confirmée par scan, mission #8)
- [Autres non identifiés détectés par scanner planétaire]

MÉTÉO POSSIBLE:
- [Tempêtes de sable / Pluie acide / Brouillard dense / ...]

FAUNE:
- Formes de vie détectées: [Oui / Non]
- Niveau d'activité: [Faible / Significatif / Élevé]
- Espèces confirmées: [Liste des espèces scannées sur cette planète]

ÉVÉNEMENTS CONNUS:
- [Chutes de météores signalées / Éruptions possibles / ...]

NOTES DES JOUEURS:
- [Mission #5] "Les grottes au sous-sol contenaient beaucoup de minerai X."
- [Mission #8] "La nuit est très longue, prévoir des batteries supplémentaires."
```

Attention : les notes géographiques ne sont **pas pertinentes** entre les missions car le monde est régénéré à chaque fois. Seules les informations sur les **propriétés de la planète** (matériaux, espèces, conditions) persistent.

---

## Interactions avec les autres systèmes

- **Scanner** : le scanner de visière et le scanner planétaire alimentent la base de données.
- **Missions** : chaque mission est une opportunité d'enrichir la base de données.
- **Matériaux** : la base de données liste les matériaux découverts et leurs propriétés.
- **Faune** : la base de données contient les fiches d'espèces avec tous les comportements connus.
- **Multijoueur** : la base de données est partagée. Les découvertes d'un joueur profitent à tout le groupe.

---

## Points ouverts

- Les notes des joueurs sont-elles modérées/éditables par les autres joueurs, ou chaque joueur ne peut modifier que ses propres notes ?
- Y a-t-il une limite au nombre de notes par fiche ?
- Les noms d'espèces sont-ils attribués automatiquement (ID numérique) ou les joueurs peuvent-ils nommer les espèces ?
- La base de données est-elle consultable sur le terrain (via un upgrade de visière) ou uniquement au vaisseau/station ?
- Les données de la base de données sont-elles liées à une session de jeu ou persistantes entre les sessions ?
