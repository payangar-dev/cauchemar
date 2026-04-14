# UI et HUD

## Résumé

Cauchemar n'a **aucune interface qui se superpose au monde**. Tout ce que le joueur voit est **diégétique** : l'UI est projetée sur la visière de sa combinaison, et l'inventaire est un sac à dos physique qu'il pose devant lui pour accéder à son contenu. Ce choix fondamental sert le pilier d'honnêteté du monde : le joueur ne voit rien que son personnage ne verrait. Et la visière elle-même est un objet du monde, qui peut être perturbée, endommagée, ou détruite — privant le joueur de ses informations vitales.

## Principes de design

- **Aucun HUD classique** : pas de superposition 2D, pas de barre de vie flottante, pas de minimap, pas d'icônes accrochées aux coins de l'écran.
- **Tout est diégétique** : chaque information affichée a une source physique dans le monde (la visière, le sac, un terminal du vaisseau).
- **Minimalisme** : la visière ne surcharge pas le joueur d'information. Elle affiche l'essentiel. Les détails s'obtiennent en regardant le monde, en écoutant, en ouvrant le sac.
- **L'UI peut être perdue** : casser la visière = perdre les informations qu'elle affichait. Le joueur doit alors lire les symptômes réels de son corps et de son environnement.
- **Cohérent avec le pilier d'honnêteté** : l'interface ne "ment" jamais. Si elle affiche une information, elle est affichée parce qu'un capteur physique de la combinaison la produit.

---

## La visière comme HUD

La visière de la combinaison est l'unique surface d'affichage du jeu. Elle est transparente et projette les informations directement dans le champ de vision du joueur — comme un casque de pilote ou une armure high-tech. Tout ce qui est affiché l'est parce qu'un module de la combinaison le calcule.

### Visière de base (sans upgrades)

Un joueur avec une combinaison de base, aucune amélioration installée, voit sur sa visière :

- **Boussole** : affichage discret en haut du champ de vision, indique les points cardinaux.
- **Silhouette corporelle** : petite silhouette stylisée, discrète, en périphérie du champ de vision. Les zones blessées s'éclairent en rouge. **Pas de chiffre, pas de barre de vie.** Le joueur sait *où* il est touché, pas *combien* il lui reste.
- **Indicateur de communication active** : quand un coéquipier parle, un petit témoin apparaît sur la visière (nom ou identifiant, sans transcription par défaut).
- **Bip du vaisseau** : ce n'est pas un élément visuel, c'est un **son spatial** produit par la combinaison. Documenté ici pour rappel : l'orientation vers le vaisseau reste audio tant que le joueur n'a pas installé le tracker.

C'est tout. Aucune indication de direction vers le vaisseau, aucun tracker, aucune vision augmentée, aucune liste d'inventaire, aucun objectif de mission affiché.

### Visière avec upgrades

Chaque module installé ajoute son propre affichage à la visière. Ces upgrades sont déjà décrits dans [03a_combinaison.md](03_joueur/03a_combinaison.md). Rappel de ce qui apparaît sur la visière :

| Module | Ce qu'il affiche |
|---|---|
| **Tracker** | Flèche directionnelle vers le vaisseau, sans distance. |
| **Vision nocturne** | Remplace le rendu en vision amplifiée (vert/gris). |
| **Vision thermique** | Surcouche thermique (chaleur visible). |
| **Scanner** | Pendant un scan : réticule de visée, barre de progression d'exposition, confirmation de collecte. |
| **Lampe torche** | Faisceau lumineux projeté dans le monde (pas un élément UI). |
| **Module de communication** | Indicateur de qualité du signal, niveau de grésillement. |
| **Caméra embarquée** | Petit témoin "enregistrement actif" (pour que le joueur sache que son flux est retransmis au vaisseau). |
| **Protections** | Témoin d'exposition à un danger actif (chaleur, toxique, radiation, bio) uniquement quand la menace est détectée. |

### États de la visière

La visière suit les mêmes états que tout autre module de combinaison (voir [03a_combinaison.md](03_joueur/03a_combinaison.md)) :

#### Fonctionnelle

Tout s'affiche normalement.

#### Perturbée (temporaire)

Conditions environnementales qui brouillent l'affichage. Les causes sont les mêmes que pour les autres modules (eau, froid, chaleur, interférences, spores).

- **Parasites visuels** : lignes horizontales, scintillements, statique.
- **Informations intermittentes** : la boussole oscille, la silhouette de santé disparaît puis revient, le tracker perd sa cible.
- **Effet cumulé** : si la visière est perturbée ET un autre module (micro, caméra) aussi, le joueur a plusieurs sources d'incertitude simultanées.

L'effet disparaît quand le joueur quitte la condition.

#### Endommagée (persistant jusqu'à réparation)

Dégât physique (impact, attaque de créature, chute). La visière porte des **fissures visibles** dans le champ de vision du joueur — des lignes qui ne disparaissent pas. Ces fissures deviennent des **zones mortes** où les informations du HUD sont masquées ou illisibles. La boussole peut être coupée en deux. La silhouette santé peut être amputée d'un côté. Certains modules affichés deviennent aléatoires ou corrompus.

La visière endommagée doit être réparée à la station.

#### Détruite

La visière ne projette plus aucune information. Le joueur perd :

- La boussole visuelle.
- La silhouette de santé (il ne voit plus où il est touché).
- L'affichage du tracker, du scanner, de toutes les visions augmentées.
- L'indicateur de communication (il entend encore les voix si le module micro est fonctionnel, mais il n'a plus de repère visuel du speaker).
- Les témoins de protection et d'enregistrement.

Il lui reste ce que son **corps** lui dit : la vision normale du monde, le son spatial du bip vaisseau, sa propre respiration, sa douleur localisée (quand il est touché), son boitement, sa vue floue si la tête est blessée. Tous les symptômes documentés dans [03b_blessures_et_mort.md](03_joueur/03b_blessures_et_mort.md) deviennent la seule source d'information du joueur sur son propre état.

C'est la traduction littérale du pilier d'honnêteté : quand l'UI disparaît, les symptômes restent — parce qu'ils étaient réels depuis le début.

---

## L'inventaire comme sac à dos physique

L'inventaire n'est pas un menu. C'est un **sac à dos** physique que le joueur porte dans le dos. Pour y accéder, il doit le **poser devant lui** et l'ouvrir. Les objets à l'intérieur sont des **objets 3D réels**, manipulables — comme dans The Forest ou The Long Dark.

### Poser et ouvrir le sac

1. Le joueur déclenche l'action "poser le sac".
2. Une **animation** le voit retirer le sac de son dos et le poser au sol devant lui.
3. Le sac ouvert révèle son contenu : chaque slot contient un objet 3D que le joueur peut prendre en main, manipuler, déplacer.
4. Pendant toute la durée où le sac est ouvert, le joueur est **immobile**. Il ne peut pas marcher, courir, ni interagir avec autre chose que le sac et son contenu.
5. Le monde continue à tourner pendant ce temps. **Aucune pause.** Les créatures patrouillent, les bruits arrivent, le temps passe.
6. Le joueur referme le sac et le remet sur son dos en déclenchant l'action correspondante. Animation symétrique.

### Abandonner le sac

Le joueur peut **s'interrompre pendant qu'il utilise son sac**. Il se relève, laisse le sac ouvert au sol, et part. Il peut ainsi fuir une menace soudaine.

- Le sac **reste au sol**, ouvert, avec tout son contenu. Il **persiste indéfiniment** pendant la mission.
- Un joueur sans sac ne peut plus **rien stocker**. Il ne peut porter que ce qu'il tient dans ses **mains** (une ou deux, selon la taille de l'objet).
- Le joueur peut revenir récupérer son sac plus tard — s'il le retrouve.

### Retrouver un sac abandonné : le bip

La combinaison peut émettre à distance un **signal de localisation** vers le sac. C'est une commande accessible depuis la visière.

- Le sac se met à **biper** à intervalles réguliers. Bip audio, spatialisé.
- Le joueur peut suivre le son pour retrouver son sac.
- Comme tout son dans Cauchemar, le bip est un **son réel dans le monde**. Les créatures l'entendent aussi. Les autres joueurs l'entendent aussi.
- Activer le bip est un **arbitrage** : je retrouve mon sac plus vite, mais je signale sa position à tout ce qui écoute dans un rayon significatif.
- Le joueur peut désactiver le bip à tout moment depuis la visière.

### Porter le sac d'un autre

Un joueur peut **ramasser le sac d'un coéquipier** (abandonné, ou celui d'un joueur mort). Le transporter occupe les **deux mains** — comme porter un corps (voir [03b_blessures_et_mort.md](03_joueur/03b_blessures_et_mort.md)).

- Le poids du sac transporté **s'ajoute** au poids du sac que le porteur a sur son dos, et ralentit le joueur en conséquence.
- Le porteur ne peut pas interagir avec d'autres objets, utiliser d'outils, ou ouvrir de portes sans lâcher le sac qu'il transporte.
- Le porteur peut **déposer** le sac au sol à tout moment pour libérer ses mains.
- Transférer le contenu d'un sac transporté vers son propre sac nécessite de **poser les deux sacs** et d'ouvrir le sien — même animation, même vulnérabilité.

### Partir en mission sans sac

Il n'y a **aucune restriction** au départ. Un joueur peut choisir de partir sans sac :

- Il ne peut rien stocker et porte seulement ce qu'il tient dans ses mains.
- Il est plus **léger** — donc potentiellement plus rapide et plus endurant.
- C'est une option valide pour les missions de sauvetage où la vitesse prime, ou pour un joueur qui joue un rôle de "relais" (amener des consommables à un autre joueur au milieu de la mission).

### Retour à la station sans sac

Un joueur qui revient à la station **sans son sac** (abandonné ou perdu) en récupère un **nouveau gratuitement** pour la mission suivante. Le sac en lui-même n'est pas une ressource rare. Ce qu'il contenait, en revanche, est perdu à jamais.

### Le sac et la mort

- Si le joueur meurt **avec son sac sur le dos** : le sac reste attaché au corps. Récupérer le corps au vaisseau = récupérer le sac et son contenu (voir [03b_blessures_et_mort.md](03_joueur/03b_blessures_et_mort.md)).
- Si le joueur meurt **alors que son sac est abandonné ailleurs** : le sac reste où il est. Le corps est ailleurs. Les coéquipiers peuvent récupérer l'un, l'autre, ou les deux — ce sont deux objectifs distincts.
- Un sac abandonné est **plus précieux que le corps lui-même** en termes de matériaux et de consommables, mais le corps contient toujours la combinaison (upgrades) et la puce neurale (transfert de conscience possible).

---

## Accès aux autres informations

Le reste des informations du jeu n'est pas affiché sur la visière. Chaque catégorie a son propre accès physique.

| Information | Où et comment y accéder |
|---|---|
| **Inventaire** | Poser et ouvrir le sac. |
| **Base de données (fiches, notes)** | Terminal physique au **vaisseau** ou à la **station**. Pas consultable sur le terrain. |
| **Craft** | Terminal physique au vaisseau (consommables) ou à la station (craft complet). |
| **Sélection de mission** | Interface physique à la station. |
| **Scan planétaire** | Console physique du vaisseau. |
| **Caméras des coéquipiers** | Écrans physiques dans le cockpit du vaisseau. |
| **Magasin (consommables, réparations)** | Interface physique à la station. |

Ces interfaces physiques sont des objets du monde : des écrans, des terminaux, des boutons, des leviers. Le joueur s'approche, interagit, lit les informations. Il n'y a **jamais** un menu flottant au-dessus du monde.

---

## Option de confort : profondeur du HUD

Un HUD fixé directement à la visière peut causer de la fatigue oculaire ou du motion sickness chez certains joueurs. Les paramètres du jeu proposent une option de **profondeur projetée** :

- **Collé à la visière** : le HUD est littéralement sur la surface de la visière, tout près des yeux.
- **Projeté à distance** : le HUD apparaît comme s'il était projeté à ~1 mètre devant le joueur, ce qui est plus confortable pour la plupart des yeux.

Les deux modes sont fonctionnellement équivalents et n'affectent pas le gameplay.

---

## Interactions avec les autres systèmes

- **Combinaison** ([03a_combinaison.md](03_joueur/03a_combinaison.md)) : la visière est un module de la combinaison. Ses états (fonctionnelle, perturbée, endommagée, détruite) suivent les règles globales des modules. Chaque upgrade installé ajoute des affichages à la visière.
- **Blessures** ([03b_blessures_et_mort.md](03_joueur/03b_blessures_et_mort.md)) : la silhouette de santé s'éclaire aux zones blessées. Quand la visière est détruite, le joueur doit lire les symptômes réels de son corps pour connaître son état.
- **Inventaire** ([03c_inventaire.md](03_joueur/03c_inventaire.md)) : les slots et le poids s'appliquent au contenu du sac physique. Le sac est le réceptacle concret du système d'inventaire.
- **Navigation** ([03d_navigation.md](03_joueur/03d_navigation.md)) : la boussole, le tracker, et le signal audio du vaisseau sont les seuls outils d'orientation, tous médiés par la combinaison.
- **Design sonore** ([09_design_sonore.md](09_design_sonore.md)) : le bip du sac abandonné est un son réel, spatialisé, audible par les créatures comme par les joueurs.
- **Faune consciente** ([07b_especes_conscientes.md](07_faune/07b_especes_conscientes.md)) : les espèces conscientes peuvent interagir physiquement avec un sac abandonné (le retourner, déplacer son contenu, l'utiliser comme appât). Les animaux attirés par un matériau vivant à l'intérieur peuvent venir y fouiller.
- **Multijoueur** ([08_multijoueur.md](08_multijoueur.md)) : un sac ouvert au sol est visible et accessible aux coéquipiers. Le transfert de matériaux de main à main passe par le sac physique.

---

## Points ouverts

- Format exact du sac ouvert : grille de slots 3D, ou disposition libre (les objets posés n'importe où dans un volume) ?
- Le joueur peut-il accrocher des objets à l'extérieur du sac (sur les côtés) pour un accès rapide, au prix d'une détectabilité accrue ?
- Un joueur peut-il utiliser un objet directement dans le sac (ex: boire un stimulant sans le sortir) ou doit-il toujours le prendre en main d'abord ?
- L'animation de pose du sac est-elle interruptible à tout moment, ou seulement après un court délai de "mise en place" ?
- La silhouette santé affiche-t-elle les états "perturbé" internes (infection parasitaire stade 1, empoisonnement léger) ou uniquement les blessures physiques visibles ?
- Le bip du sac a-t-il une portée fixe, ou est-elle modulable (bip faible pour une localisation courte, bip fort pour une longue portée au prix d'une détection plus large) ?
- Quand le joueur tient un objet en main (sans le stocker), est-il affiché physiquement dans la main du personnage (toujours visible pour les coéquipiers) ou dans une "main invisible" ?
- Quels sons la visière produit-elle quand elle est endommagée (grésillements électroniques, bips d'erreur) ?
- La fissure visible d'une visière endommagée est-elle réparable sur le terrain avec un matériau trouvé, ou uniquement à la station ?
