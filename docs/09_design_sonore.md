# Design sonore

## Résumé

Le design sonore de Cauchemar repose sur une règle fondamentale : **chaque son a une source réelle dans le monde**. Il n'y a aucun son factice, aucun "jump scare" audio gratuit, aucun bruit de pas sans créature qui marche. Cette honnêteté sonore est le socle de la terreur du jeu : parce que le joueur sait que chaque son est réel, il ne peut **jamais** ignorer un son. Un craquement est peut-être le bois... ou peut-être un pas. Et dans les deux cas, c'est **vrai**.

## Principes de design

- **Aucun son factice**. Si on entend des pas, quelque chose fait réellement des pas. Si on entend une respiration, quelque chose respire réellement.
- Les **sons d'ambiance** sont autorisés (vent, bois qui craque par dilatation thermique, eau qui goutte, parquet qui craque sous la pression) mais ils doivent avoir une **cause physique réaliste** non liée à une entité vivante.
- Le joueur doit pouvoir **faire confiance** à ce qu'il entend. Cette confiance est l'outil le plus puissant du design sonore : elle transforme chaque stimulus auditif en information.
- Le son est le **sens principal** de survie du joueur. Il entend le danger avant de le voir. Tendre l'oreille est un acte de gameplay.
- Les sons des créatures sont **réels et distinctifs**. Avec l'expérience, le joueur apprend à identifier une espèce par son son.

---

## Catégories de sons

### Sons d'ambiance (pas de source vivante)

Sons produits par l'environnement physique, sans lien avec une entité vivante :

- **Vent** : brise, rafales, sifflements dans les passages étroits.
- **Matériaux** : bois qui craque (température), métal qui grince (dilatation), parquet qui craque (pression), pierres qui tombent (érosion).
- **Eau** : gouttes, ruissellement, clapotis, vagues.
- **Végétation** : branches qui frottent, feuilles qui bruissent (vent), herbes qui sifflent.
- **Structures** : grincements de bâtiments, portes qui bougent dans le vent, tuyaux qui vibrent.

Ces sons créent la **texture sonore** du monde. Ils rendent l'environnement vivant et crédible. Mais ils ne sont **jamais** utilisés pour faire sursauter le joueur ou simuler une menace inexistante.

**Point crucial** : certains sons d'ambiance **ressemblent** à des sons de créature (un craquement de bois peut ressembler à un pas, un grincement de métal peut ressembler à un grognement). C'est intentionnel. Le joueur doit apprendre à distinguer les sons d'ambiance des sons de menace. Cette incertitude est une source de paranoïa naturelle et honnête.

### Sons de gameplay (source vivante)

Sons produits par des entités vivantes (créatures, joueurs, organismes) :

- **Pas** : chaque type de créature a un son de pas distinctif (lourd, léger, rapide, traînant, griffes sur le sol).
- **Respiration** : créatures proches qui respirent. Respiration du joueur qui s'accélère sous l'effort.
- **Vocalisations** : grognements, cris, sifflements, hurlements. Chaque espèce a sa signature.
- **Interactions physiques** : griffures sur un mur, porte poussée par une créature, objet renversé.
- **Alimentation** : sons de mastication, de déchirement (une créature qui mange — signe qu'elle est occupée et potentiellement distraite).
- **Combat entre créatures** : sons de lutte entre espèces. Le joueur entend que quelque chose se passe sans en être la cible.

### Sons du joueur

Le joueur lui-même est une source sonore :

| Action du joueur | Son produit | Portée |
|---|---|---|
| **Marche** | Pas légers. Variable selon le sol (herbe, métal, eau, gravier). | Courte |
| **Course** | Pas lourds et rapides. Respiration audible. | Moyenne |
| **Sprint épuisé** | Respiration haletante. Pas lourds et irréguliers. | Longue |
| **Ouverture de porte** | Grincement, claquement. | Moyenne |
| **Manipulation d'objet** | Bruit de l'objet (métal, verre, organique). | Courte |
| **Chute** | Impact proportionnel à la hauteur. | Longue |
| **Blessé (gémissements)** | Sons involontaires. | Courte à moyenne |
| **Agonie** | Respiration faible, gémissements. | Courte |
| **Cautérisation** | Cri de douleur. | Très longue |
| **Matériau vivant dans l'inventaire** | Bruit de l'organisme. | Variable |
| **Jambe cassée (sans bandage)** | Boitement audible, craquements. | Moyenne |

### Sons de la combinaison

Les modules de la combinaison produisent aussi des sons :

- **Bip du vaisseau** : signal sonore qui diminue avec la distance.
- **Scanner** : son de scan en fonctionnement (potentiellement détectable par les créatures).
- **Communication** : grésillements de la radio.
- **Lampe torche** : clic d'allumage (son discret mais réel).
- **Modules endommagés** : grésillements, bips d'erreur.

---

## Le son comme outil de survie

### Écouter pour survivre

Le joueur doit **tendre l'oreille** en permanence :

- Des pas au loin indiquent la direction et la distance d'une créature.
- Le type de pas indique l'espèce (si le joueur a appris à les reconnaître).
- Le rythme des pas indique le comportement (patrouille lente vs chasse active).
- Le silence soudain peut être aussi inquiétant qu'un bruit (une créature qui s'est arrêtée = elle a peut-être détecté le joueur).

### Le bruit comme danger

Le joueur est aussi une **source de bruit** que les créatures détectent :

- Courir fait du bruit → les créatures entendent.
- Ouvrir des portes fait du bruit → les créatures entendent.
- Les matériaux vivants font du bruit → les prédateurs sont attirés.
- Un joueur blessé fait du bruit involontaire → il est plus détectable.

Le joueur doit constamment évaluer le **rapport bruit/bénéfice** de chaque action : courir est plus rapide mais plus bruyant, marcher est silencieux mais lent.

---

## Le son spatial

Le son dans Cauchemar doit être **spatialisé** (3D audio) :

- Le joueur doit pouvoir identifier la **direction** d'un son (gauche, droite, devant, derrière, dessus, dessous).
- La **distance** est perceptible via l'atténuation et la réverbération.
- Les **matériaux** affectent la propagation du son : le son se propage différemment dans une grotte (écho), un bâtiment (résonance), une forêt (absorption), ou un espace ouvert.
- Les **obstacles** bloquent ou atténuent le son : un mur entre le joueur et la créature réduit le volume.

Le joueur équipé d'un casque audio (recommandé) doit pouvoir **localiser les menaces par le son seul**, même dans l'obscurité totale.

---

## Interactions avec les autres systèmes

- **Faune** : chaque espèce a une signature sonore unique. Les sons sont réels (pas de sons de créature sans créature).
- **Faune consciente** : les espèces conscientes peuvent imiter des sons. L'imitation est un son réellement produit par la créature, pas un son factice du jeu.
- **Combinaison** : les modules de la combinaison sont des sources sonores. Le bip du vaisseau, le scanner, la radio.
- **Blessures** : les blessures rendent le joueur bruyant (gémissements, boitement).
- **Inventaire** : les matériaux vivants et fragiles dans l'inventaire font du bruit.
- **Navigation** : le signal du vaisseau (bip) est un son spatial que le joueur utilise pour s'orienter.
- **Multijoueur** : le voice chat est un son réel. Les coéquipiers sont des sources sonores (pas, respiration, paroles).

---

## Points ouverts

- Les créatures entendent-elles le micro réel des joueurs (à la Phasmophobia) ? Si oui, parler dans le micro = se signaler.
- Y a-t-il une bande sonore musicale, ou le jeu est-il entièrement en sons diégétiques (aucune musique) ?
- Comment gérer le son pour les joueurs qui n'ont pas de casque (speakers) ? Le jeu est-il jouable sans audio spatialisé ?
- La propagation du son à travers les matériaux doit-elle être simulée physiquement (coûteux en performance) ou approximée ?
- Les sons d'ambiance varient-ils selon le biome de manière suffisamment distincte pour servir de repère de navigation ?
