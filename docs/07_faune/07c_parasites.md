# Parasites

## Résumé

Les parasites sont une catégorie spécifique de faune qui ne se contente pas d'attaquer le joueur de l'extérieur : ils **pénètrent** dans la combinaison ou dans le corps du joueur. Ils représentent une menace unique parce qu'ils transforment le joueur lui-même en source de danger pour le groupe. Un joueur parasité peut devenir bruyant, imprévisible, et dans le cas extrême, **possédé** — ce qui signifie que le monstre est maintenant l'un des coéquipiers.

## Principes de design

- Les parasites exploitent la **confiance entre les joueurs**. Un joueur parasité est-il encore un allié ?
- L'infection est **progressive**. Le joueur voit les symptômes s'aggraver et sait ce qui l'attend.
- La possession est le **stade terminal** et le plus terrifiant. Elle transforme un jeu coop en jeu de méfiance.
- Les parasites doivent rester **rares et mémorables**. Une infection par mission banalisée l'horreur.
- Les parasites interagissent avec le système de **matériaux vivants** : transporter un organisme vivant sans bio-confinement = risquer une infection.

---

## Vecteurs d'infection

### Matériaux vivants sans bio-confinement

Le vecteur principal. Un joueur qui transporte un organisme vivant sans module de bio-confinement risque que l'organisme :
1. S'échappe de l'inventaire.
2. Pénètre dans la combinaison.
3. Infecte le joueur.

### Contact direct avec une créature parasite

Certaines créatures sont des parasites de nature. Elles ne chassent pas pour tuer : elles chassent pour **infecter**. Un contact physique (attaque, morsure, contact accidentel) peut déclencher l'infection.

### Environnement contaminé

Certaines zones peuvent être infestées de spores ou de larves parasites. Traverser ces zones sans protection peut déclencher l'infection.

---

## Progression de l'infection

L'infection est progressive et ses stades sont visibles (pour le joueur infecté et potentiellement pour les coéquipiers attentifs) :

### Stade 1 : Contamination

- Le joueur est infecté mais les symptômes sont **légers**.
- **Effets** : légers tremblements de la vue, gêne occasionnelle.
- **Détectabilité** : quasi invisible pour les coéquipiers. Le joueur peut ne pas réaliser immédiatement qu'il est infecté.
- **Durée** : variable (quelques minutes).

### Stade 2 : Développement

- Le parasite se développe dans le corps du joueur.
- **Effets** :
  - Mouvements involontaires (le personnage fait un pas de côté, tourne la tête).
  - Sons involontaires (gémissements, murmures).
  - Modules de la combinaison perturbés (le parasite interfère avec l'électronique).
  - Vision qui se dégrade par moments.
- **Détectabilité** : les coéquipiers commencent à remarquer un comportement étrange. "Pourquoi tu fais des bruits bizarres ?" "Pourquoi tu t'es arrêté ?"
- **Durée** : plusieurs minutes.

### Stade 3 : Conflit

- Le joueur lutte contre le parasite.
- **Effets** :
  - Perte de contrôle intermittente (le personnage marche dans une direction pendant 2-3 secondes sans que le joueur puisse l'arrêter).
  - Douleur (effets visuels et sonores intenses).
  - Le joueur peut attirer les prédateurs involontairement (sons, mouvements erratiques).
  - La caméra (si équipée) montre un flux perturbé aux observateurs du vaisseau.
- **Détectabilité** : évidente pour les coéquipiers. Le joueur est clairement en difficulté.
- **Durée** : quelques minutes avant le stade final.

### Stade 4 : Possession (si non traité)

- Le parasite prend le contrôle total du joueur.
- **Effets** :
  - Le joueur **perd le contrôle** de son personnage.
  - Le personnage est maintenant contrôlé par l'IA du parasite.
  - Le comportement du personnage possédé dépend du type de parasite (agressif, furtif, ou piège — voir plus bas).
- **Conséquences pour le joueur** : équivalent à la mort. Le joueur passe en mode spectateur.
- **Conséquences pour le groupe** : un coéquipier est maintenant un **ennemi**. Il connaît la position des autres joueurs, il est dans leur espace de confiance.

---

## Types de possession

### Possession agressive

Le personnage possédé attaque les autres joueurs. Il se comporte comme un prédateur. Les coéquipiers doivent fuir leur propre allié.

### Possession furtive

Le personnage possédé continue d'agir "normalement" pendant un temps. Il suit le groupe, parle (sons déformés), imite le comportement d'un coéquipier. Les joueurs attentifs remarquent des anomalies (mouvements saccadés, voix qui sonne faux, comportement incohérent). Mais sous stress, la différence peut être subtile.

### Possession piège

Le personnage possédé se dirige vers le vaisseau ou vers un point stratégique. Il attire les autres joueurs vers un piège. Le parasite utilise la confiance du groupe pour les regrouper avant de frapper.

---

## Traitement

### Prévention

- **Bio-confinement** (module de combinaison) : empêche l'infection par les matériaux vivants.
- **Protection chimique** : réduit le risque d'infection par les spores et l'environnement contaminé.
- **Vigilance** : ne pas transporter de matériau vivant sans protection. Éviter les zones contaminées.

### Soin de l'infection (avant possession)

- **Consommable anti-parasitaire** : à acheter/crafter à la station. Stoppe l'infection à n'importe quel stade avant la possession.
- **Coût** : utilise un slot d'inventaire et est consommé. Le joueur doit l'avoir prévu avant la mission.
- **Temps d'utilisation** : le joueur (ou un coéquipier) doit administrer le traitement. Quelques secondes d'immobilité et de vulnérabilité.

### Après la possession

- Le joueur est considéré comme **mort** (mode spectateur).
- Le corps possédé est toujours dans le monde. Les coéquipiers doivent le fuir ou le neutraliser (à définir — peuvent-ils "tuer" le possédé ? Que se passe-t-il pour la combinaison ?).
- Si le possédé est neutralisé et que le corps est récupéré : la combinaison est-elle sauvée ou irrémédiablement compromise par le parasite ? (À définir.)

---

## Interactions avec les autres systèmes

- **Matériaux vivants** : le vecteur d'infection principal. Transporter un organisme sans bio-confinement = risque de parasitage.
- **Combinaison** : le bio-confinement est le module de protection. L'infection perturbe les modules de la combinaison.
- **Blessures/Mort** : la possession est un état de mort spécial.
- **Multijoueur** : la possession transforme la dynamique de groupe. La méfiance s'installe. "Est-ce que Jules agit bizarrement ou c'est moi qui suis parano ?"
- **Design sonore** : les sons du joueur infecté (gémissements, murmures involontaires) sont des sons réels produits par le corps infecté.
- **Base de données** : les parasites ont des fiches dans la base de données, mais ces fiches sont souvent les plus incomplètes (les joueurs infectés n'ont généralement pas le temps de scanner).

---

## Points ouverts

- Le joueur possédé voit-il ce que le parasite fait avec son corps (spectateur de son propre corps) ou est-il en mode spectateur classique (caméra d'un coéquipier) ?
- Comment les coéquipiers "neutralisent"-ils un possédé ? Violence physique ? Un outil spécifique ?
- La combinaison d'un joueur possédé puis neutralisé est-elle récupérable ?
- Le parasite peut-il se propager du possédé aux coéquipiers (infection en chaîne) ?
- La possession furtive : combien de temps avant que ça devienne évident ? Le joueur possédé "parle"-t-il dans le voice chat (sons déformés) ?
- Comment le jeu communique-t-il clairement au joueur qu'il est en train d'être infecté (UI, effets visuels, sons) sans casser l'immersion ?
