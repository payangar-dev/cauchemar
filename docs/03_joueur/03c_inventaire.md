# Inventaire

## Résumé

Chaque joueur possède un inventaire personnel limité en nombre de slots. Les matériaux sont des objets **physiques** dans le monde : ils ont un poids qui affecte la vitesse du joueur, ils tombent au sol quand le joueur meurt, et ils peuvent avoir des propriétés dangereuses. La gestion de l'inventaire est un exercice de **calcul risque/récompense permanent** : chaque objet ramassé a de la valeur, mais chaque objet porté ralentit le joueur et le rend plus vulnérable.

## Principes de design

- L'inventaire est limité en **slots**, pas en poids. Mais le poids affecte la **vitesse de déplacement**.
- Les matériaux sont **physiques** : ils existent dans le monde, peuvent être posés, ramassés, lâchés, et ils tombent au sol à la mort du joueur.
- Rien n'est bloqué : le joueur peut ramasser n'importe quel matériau, même dangereux, même sans l'upgrade adapté. Mais il y a toujours un **risque**.
- L'inventaire crée des **dilemmes en temps réel** : lâcher du butin pour courir, ou courir lentement et risquer de se faire attraper.

---

## Slots d'inventaire

- L'inventaire du joueur est composé d'un nombre limité de **slots** (nombre exact à définir).
- Chaque matériau ou objet occupe **un slot** (ou potentiellement plus pour les gros objets — à définir).
- Quand l'inventaire est plein, le joueur doit **choisir** : ignorer un nouveau matériau, lâcher quelque chose, ou faire un aller-retour au vaisseau pour déposer.
- Les consommables (bandages, stimulants, kits anti-agonie) occupent aussi des slots d'inventaire.

---

## Poids et vitesse

Le nombre de slots n'est pas le seul facteur : le **poids** des objets portés affecte directement la vitesse de déplacement du joueur.

- Chaque matériau a un poids propre (certains matériaux sont légers, d'autres très lourds).
- Plus le poids total porté est élevé, plus le joueur est **lent** (marche et course).
- Un joueur chargé au maximum est significativement plus lent qu'un joueur à vide.
- L'endurance (durée de course avant épuisement) peut aussi être affectée par le poids.

### Conséquences gameplay

- **Choix de butin** : le joueur doit évaluer si un matériau vaut le ralentissement. Un minerai rare mais lourd rend le retour au vaisseau plus dangereux.
- **Lâcher en urgence** : en pleine course-poursuite, le joueur peut lâcher des objets pour retrouver sa vitesse. Les objets lâchés restent au sol et sont récupérables (par le joueur plus tard, par un coéquipier, ou perdus si personne ne revient).
- **Répartition dans le groupe** : les joueurs peuvent se répartir la charge. Un joueur porte le butin lourd, les autres le protègent. Ou chacun porte un peu — mais tout le monde est ralenti.
- **Le retour au vaisseau chargé** : le moment le plus dangereux de la mission. L'objectif est accompli, l'inventaire est plein, le joueur est lent. C'est à ce moment-là que les rencontres sont les plus terrifiantes.

---

## Matériaux physiques dans le monde

### Objets au sol

Les matériaux existent physiquement dans le monde. Ils peuvent être :

- **Trouvés** : posés dans l'environnement (sur une étagère, dans un conteneur, au sol, sur un cadavre humain).
- **Lâchés** : le joueur dépose volontairement un objet au sol.
- **Droppés** : à la mort d'un joueur, tout son inventaire tombe au sol à l'endroit de sa mort.

Les objets au sol restent là indéfiniment pendant la durée de la mission. Ils ne disparaissent pas.

### Matériaux dangereux

Tous les matériaux sont récupérables, même sans l'upgrade de protection adapté. Mais certains matériaux sont dangereux et le risque varie selon le type de danger :

#### Brûlant / Toxique / Radioactif

- **Sans protection** : le matériau blesse directement le joueur dès qu'il le prend en main. Les dégâts sont progressifs tant que le joueur tient l'objet. Il doit le **lâcher le plus vite possible** avant d'être blessé trop gravement — idéalement en le déposant dans le conteneur du vaisseau ou en le donnant à un joueur protégé.
- **Avec protection** (upgrade de combinaison correspondant) : le joueur peut manipuler le matériau sans dégâts.
- **Dilemme** : le joueur voit un matériau rare mais brûlant. Il peut le prendre, courir en se brûlant, et le déposer au vaisseau. Mais il aura une blessure aux mains (bras) pour le reste de la mission.

#### Fragile

- **Sans protection** : le matériau se **casse et est perdu** si le joueur court. Le joueur doit marcher pour le transporter intact.
- **Avec protection** (conteneur stabilisé) : le joueur peut courir sans risquer de casser le matériau.
- **Dilemme** : le joueur porte un matériau fragile et entend un monstre approcher. Il ne peut pas courir sans le casser. Il doit se cacher, poser le matériau et courir, ou accepter de le perdre.

#### Vivant

- **Sans protection** : le matériau vivant est un organisme. Il peut :
  - **Faire du bruit** : attire les prédateurs dans la zone.
  - **Bouger** : se débattre, tenter de s'échapper de l'inventaire.
  - **Attirer des prédateurs** : certains prédateurs sont attirés par l'organisme spécifiquement.
  - **Attaquer le joueur** : morsure, piqûre.
  - **Parasiter le joueur** : pénétrer dans la combinaison, infecter le joueur, mener potentiellement à une **possession** (voir [07c_parasites.md](../07_faune/07c_parasites.md)).
- **Avec protection** (bio-confinement) : l'organisme est confiné dans un conteneur biologique intégré à la combinaison. Il ne fait pas de bruit, ne bouge pas de manière perceptible, ne peut pas s'échapper ni parasiter le joueur.
- **Dilemme** : les matériaux vivants sont souvent nécessaires pour les missions scientifiques ou pour crafter des consommables spéciaux. Les transporter sans bio-confinement, c'est transporter une bombe à retardement.

---

## Stockage

### Inventaire du joueur

- **Personnel** : chaque joueur a son propre inventaire.
- **Limité** en slots.
- **Persistant entre les missions** : les objets dans l'inventaire du joueur restent entre les missions.
- **Risqué** : partir en mission avec des matériaux dans son inventaire = risquer de les perdre en cas de mort.

### Conteneur du vaisseau

- **Partagé** : accessible par tous les joueurs de la mission.
- **Limité** en capacité (potentiellement upgradeable).
- **Temporaire** : au retour à la station, le contenu est transféré dans le conteneur de la station.
- **Sécurisé** : les matériaux dans le conteneur du vaisseau sont protégés (sauf si le vaisseau lui-même est menacé — point ouvert).

### Conteneur de la station

- **Partagé** : accessible par tous les joueurs de la session.
- **Illimité** en capacité.
- **Permanent** : les matériaux y restent aussi longtemps que la session existe.
- **Safe** : aucun risque de perte.

---

## Flux des matériaux

```
TERRAIN (trouvé / récolté)
│
├→ Inventaire du joueur
│   ├→ Conservé dans l'inventaire (risqué si le joueur meurt)
│   ├→ Déposé au conteneur du vaisseau (libère un slot)
│   ├→ Donné à un autre joueur
│   ├→ Lâché au sol (récupérable)
│   └→ Droppé au sol à la mort du joueur (récupérable par les autres)
│
├→ Conteneur du vaisseau (via dépôt)
│   └→ Transféré automatiquement au conteneur de la station au retour
│
└→ Conteneur de la station
    └→ Utilisé pour le craft ou le stockage permanent
```

---

## Interactions avec les autres systèmes

- **Poids → Vitesse** : système de blessures et de fuite. Un joueur chargé ne peut pas courir efficacement.
- **Matériaux dangereux → Blessures** : un matériau brûlant cause une blessure au bras.
- **Matériaux vivants → Faune** : un organisme dans l'inventaire peut attirer les prédateurs ou parasiter le joueur.
- **Mort → Drop** : tous les matériaux tombent au sol à la mort du joueur. Les matériaux sont récupérables indépendamment du corps.
- **Scanner → Identification** : le scanner permet de savoir si un matériau est dangereux AVANT de le ramasser (mais les résultats ne sont lisibles qu'après déchiffrage).

---

## Points ouverts

- Nombre exact de slots d'inventaire.
- Les consommables occupent-ils les mêmes slots que les matériaux, ou y a-t-il des slots dédiés ?
- Peut-on échanger/donner des matériaux directement entre joueurs sur le terrain ?
- Les objets lâchés au sol restent-ils visibles indéfiniment pendant la mission, ou y a-t-il un timer de despawn ?
- L'inventaire du joueur est-il visible par les autres (peuvent-ils voir ce que le joueur porte) ?
- Le cargo de mission (récupération de marchandise) occupe-t-il des slots d'inventaire ou est-ce un système séparé (porté à la main, sur le dos) ?
