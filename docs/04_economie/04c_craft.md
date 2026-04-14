# Craft

## Résumé

Le système de craft est **hiérarchique** : les objets finaux sont craftés à partir de composants, qui eux-mêmes peuvent être craftés à partir de matériaux bruts. Cette structure en arbre crée des **chaînes de dépendance** qui motivent l'exploration de planètes variées et la collecte de matériaux spécifiques. Le craft est possible à la station (accès complet) et au vaisseau (consommables uniquement).

## Principes de design

- Le craft est le **lien entre l'exploration et la progression**. Les matériaux collectés en mission deviennent des outils de survie.
- La structure hiérarchique crée une **profondeur** : pour crafter un objet avancé, il faut planifier plusieurs missions sur des planètes différentes.
- Le craft au vaisseau (consommables uniquement) permet de s'adapter **pendant** la mission, pas juste avant.
- Le craft ne doit pas être une corvée. Les recettes doivent être logiques et les matériaux traçables.

---

## Structure hiérarchique

Le craft suit un arbre descendant à plusieurs niveaux :

```
OBJET FINAL (upgrade, outil, consommable avancé)
│
├── Composant A (crafté)
│   ├── Matériau brut 1 (récolté sur planète X)
│   └── Matériau brut 2 (récolté sur planète Y)
│
├── Composant B (crafté OU trouvé)
│   ├── Matériau brut 3 (récolté sur planète Z)
│   └── Matériau brut 4 (récolté sur planète X)
│
└── Matériau brut 5 (récolté directement, pas de craft)
```

### Exemple concret

```
LAMPE TORCHE (upgrade de visière)
│
├── Batterie
│   ├── Trouvée sur un cadavre humain (planète avec présence humaine passée)
│   └── OU craftée :
│       ├── Minerai conducteur (planète volcanique)
│       └── Composant chimique (planète marécageuse)
│
└── Boîtier optique
    ├── Lentille (matériau transparent, planète cristalline ?)
    └── Coque (métal léger, planète montagneuse ?)
```

Chaque feuille de l'arbre est une **raison d'aller sur une planète**. La lampe torche n'est pas achetée : elle est le résultat de plusieurs missions, chacune avec ses propres dangers.

---

## Lieux de craft

### Station (craft complet)

À la station, le joueur a accès à **toutes les recettes** de craft :

- **Upgrades de combinaison** : tous les modules (vision nocturne, thermique, lampe, scanner, tracker, protections, communications, caméra, micro, bio-confinement...).
- **Composants intermédiaires** : batteries, boîtiers, circuits, lentilles, conteneurs...
- **Consommables** : bandages, stimulants, kits anti-agonie, boosts d'endurance, leurres sonores...
- **Upgrades du vaisseau** : scanner planétaire, scan de terrain, amélioration du conteneur...

Le craft à la station utilise les matériaux du **conteneur de la station** et/ou de l'**inventaire du joueur**.

### Vaisseau (consommables uniquement)

Au vaisseau, pendant une mission, le joueur peut crafter des **consommables de terrain** :

- **Bandages** : à partir de tissu trouvé dans l'environnement ou apporté.
- **Boosts d'endurance** : à partir de plantes ou de composants chimiques.
- **Autres consommables simples** : torches improvisées, leurres basiques, etc.

Le craft au vaisseau utilise les matériaux du **conteneur du vaisseau** et/ou de l'**inventaire du joueur**.

Les upgrades de combinaison et les composants avancés ne peuvent **pas** être craftés au vaisseau. Cela force le joueur à planifier avant la mission.

---

## Recettes et découverte

### Recettes connues vs inconnues

À définir :
- Les recettes sont-elles toutes connues dès le départ (le joueur sait ce qu'il peut crafter mais n'a pas les matériaux) ?
- Ou les recettes sont-elles découvertes progressivement (via la base de données, les scans, l'expérimentation) ?

### Logique des recettes

Les recettes doivent être **intuitives** : un joueur qui voit les composants d'une recette doit pouvoir deviner à quoi elle sert. Batterie + lentille = lampe torche, pas mystère.

---

## Interactions avec les autres systèmes

- **Matériaux** : les matériaux sont les ingrédients du craft. Leur rareté et leur localisation déterminent la difficulté de craft.
- **Crédits** : certains composants peuvent être achetés avec des crédits au lieu d'être craftés (raccourci coûteux).
- **Combinaison** : les upgrades de combinaison sont des objets craftés.
- **Planètes** : les matériaux nécessaires au craft orientent le choix des missions et des planètes à visiter.
- **Connaissance** : le scanner peut révéler les usages d'un matériau, ce qui aide à planifier le craft.

---

## Points ouverts

- Liste complète des recettes de craft (nécessite une table de données).
- Les recettes sont-elles connues dès le départ ou découvertes progressivement ?
- Temps de craft : instantané ou prend du temps réel (exposant le joueur au vaisseau) ?
- Peut-on démonter un objet crafté pour récupérer une partie des matériaux ?
- Y a-t-il un atelier de craft au vaisseau (interface physique dans le vaisseau) ou est-ce fait via un menu ?
