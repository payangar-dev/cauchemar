# Multijoueur

## Résumé

Cauchemar est un jeu **coopératif** pour 1 à 8 joueurs. La coopération n'est pas une mécanique imposée — c'est un **choix permanent** avec des conséquences. Les joueurs peuvent s'entraider, se protéger, partager des ressources, guider les autres depuis le vaisseau. Mais ils peuvent aussi abandonner un coéquipier, décoller sans attendre les retardataires, prendre le butin d'un mort sans ramener son corps. Le jeu crée des **dilemmes sociaux organiques** qui émergent des mécaniques, pas de scripts.

## Principes de design

- La coopération est un **choix**, pas une obligation. Les mécaniques récompensent la coopération (bonus collectif) mais ne l'imposent pas.
- Les dilemmes sociaux émergent **naturellement** des systèmes de jeu. Pas besoin de scripts ou de votes forcés.
- Le jeu est jouable en **solo** (mais beaucoup plus dangereux et stressant).
- Aucun rôle n'est **prescrit**. Les rôles (explorateur, opérateur au vaisseau, porteur de butin...) émergent de la situation et des choix des joueurs.
- La **confiance** entre joueurs est une ressource aussi précieuse que les matériaux.

---

## Rejoindre et quitter une mission

### Rejoindre en cours de mission

- N'importe quel joueur à la station peut rejoindre une mission en cours via le **portail de téléportation** (station → vaisseau).
- Le joueur arrive au vaisseau, pas directement sur le terrain.
- Il n'a aucun contexte sur la situation actuelle : il doit communiquer avec les joueurs sur le terrain pour comprendre la situation. "Où vous êtes ? C'est quoi ce bruit ?"
- Rejoindre en cours de route est utile pour : renforcer un groupe en difficulté, ramener des consommables, prendre le relais d'un joueur mort.

### Quitter la mission

- La seule façon de quitter est de **retourner au vaisseau et de décoller**.
- N'importe quel joueur au vaisseau peut déclencher le décollage.
- Le décollage est **immédiat et irréversible** (pas de timer d'annulation — à définir).
- Tous les joueurs encore sur la planète sont **abandonnés**.

---

## Le décollage — le dilemme central

Le décollage est la mécanique sociale la plus puissante du jeu :

### Scénarios typiques

**Le décollage de panique** : un joueur revient au vaisseau poursuivi par une créature. Dans la panique, il déclenche le décollage. Les trois autres joueurs sont encore dans les grottes.

**Le décollage calculé** : le groupe a le butin, trois joueurs sur quatre sont au vaisseau. Le quatrième est loin et ne répond plus à la radio. Attendre = risquer le butin et trois vies. Partir = abandonner un coéquipier.

**Le décollage de trahison** : un joueur décide de partir avec le butin commun déposé dans le conteneur du vaisseau, laissant les autres sans ressources et coincés sur la planète.

### Conséquences du décollage

Pour ceux qui partent :
- Ils retournent à la station avec le contenu du conteneur du vaisseau et leur inventaire.
- Ils reçoivent les crédits de mission (si l'objectif est accompli).
- Le bonus collectif est réduit proportionnellement aux joueurs abandonnés.

Pour ceux qui restent :
- Ils sont coincés sur la planète.
- Ils doivent attendre qu'un joueur revienne avec le vaisseau (depuis la station, en relançant le vaisseau vers la même planète — à définir).
- Ils gardent leur inventaire personnel et leur combinaison (tant qu'ils sont vivants).
- S'ils meurent en attendant, les règles normales de mort s'appliquent.

---

## La communication

### Voice chat

Le voice chat est le principal moyen de communication entre les joueurs. Son fonctionnement dépend de l'équipement :

| Situation | Ce qui se passe |
|---|---|
| **Proximité (sans module comm)** | Les joueurs proches s'entendent. Portée limitée. |
| **Avec module de communication** | Communication à plus longue portée. Qualité dépend de la distance et du signal. |
| **Avec micro (vers le vaisseau)** | Le joueur est entendu au vaisseau (flux audio couplé au flux caméra). |
| **Hors signal** | Plus de communication radio. Seule la proximité fonctionne. |
| **Module endommagé** | Grésillements, coupures. Le joueur est partiellement inaudible. |

### Implications pour l'horreur

- Le voice chat est un **vecteur de terreur sociale** : entendre un coéquipier crier de peur, supplier qu'on l'attende, ou soudainement se taire.
- Les espèces conscientes qui imitent les voix créent du doute dans les communications.
- Un joueur hors signal est **isolé**. Personne ne l'entend, personne ne peut le guider.
- Les joueurs morts peuvent-ils encore parler dans le voice chat ? (À définir — impact majeur sur le gameplay.)

---

## Le rôle émergent au vaisseau

Il n'existe aucun rôle prescrit dans le jeu. Mais la conception du vaisseau permet naturellement à un joueur de rester à bord pour aider les autres :

### Ce qu'il peut faire

- **Surveiller les caméras** : voir ce que voient les joueurs équipés de caméras sur le terrain.
- **Guider** : donner des directions, signaler des dangers vus sur les caméras.
- **Crafter** : préparer des consommables pour les joueurs qui reviennent au vaisseau.
- **Déchiffrer** : analyser les données de scan rapportées par les joueurs.
- **Coordonner** : savoir où est chaque joueur (via les caméras) et organiser le groupe.
- **Décider du décollage** : c'est lui qui est au vaisseau. C'est lui qui a le doigt sur le bouton.

### Ce qui rend ce rôle terrifiant

- **Voir sans pouvoir agir** : il voit un coéquipier traqué sur la caméra et ne peut rien faire physiquement.
- **La caméra qui coupe** : un flux se brouille, puis c'est le noir. Le joueur est-il mort ou la caméra est-elle juste endommagée ?
- **Le dilemme du décollage** : trois joueurs sont au vaisseau, un est encore dehors. Le monstre approche du vaisseau. Décoller maintenant ou attendre ?

### Pourquoi rester au vaisseau

- Le joueur est blessé et veut quand même contribuer (note : les blessures disparaissent entre les missions, mais pendant une mission un joueur blessé peut choisir de rester au vaisseau plutôt que de repartir sur le terrain).
- Le joueur est débutant et préfère observer.
- Le groupe estime que la coordination est nécessaire pour cette mission.
- La combinaison du joueur est trop basique pour être utile sur le terrain.

---

## Les caméras et le mode spectateur

### Caméras des joueurs vivants (vue depuis le vaisseau)

- Si un joueur a une **caméra embarquée** fonctionnelle, son flux est visible au vaisseau.
- Le flux montre ce que le joueur voit (vue subjective).
- La qualité du flux dépend de l'état de la caméra (endommagée = image dégradée, détruite = écran noir).
- Un joueur au vaisseau peut basculer entre les flux des différents joueurs.

### Mode spectateur (joueurs morts)

- Un joueur mort peut voir le flux caméra d'un coéquipier vivant.
- Il ne peut choisir que parmi les joueurs ayant une caméra fonctionnelle.
- Il ne peut pas se déplacer librement dans le monde (pas de mode fantôme).
- Il peut communiquer par voice chat (limitations à définir).

---

## Récupération des corps

La récupération du corps d'un coéquipier mort est une mécanique sociale forte :

### Motivations

- **Sauver la combinaison** : la combinaison et ses upgrades sont sauvés si le corps est ramené au vaisseau.
- **Récupérer le butin** : les matériaux tombés au sol à la mort sont récupérables (indépendamment du corps).
- **Récupérer les données de scan** : les scans non déchiffrés sont dans la combinaison.
- **Bonus moral** : renforcer la cohésion du groupe.

### Risques

- Le corps est peut-être dans une zone dangereuse (c'est là que le joueur est mort).
- Les espèces conscientes utilisent les corps comme appât.
- Porter le corps ralentit le porteur, occupe ses mains, fait du bruit.
- Le corps peut saigner et laisser des traces.

### Choix à faire

- Récupérer le corps ET le butin (le plus complet, le plus risqué).
- Récupérer juste le butin (les matériaux au sol) et abandonner le corps (moins risqué, mais la combinaison est perdue).
- Abandonner tout (sécurité maximale, perte maximale).

---

## Architecture réseau

### Modèle : Hybride (joueur hôte + serveur dédié)

Le jeu utilise une architecture **client-serveur autoritaire**. Le serveur (qu'il tourne sur la machine d'un joueur ou sur une machine dédiée) fait autorité sur l'état du monde. Les clients envoient leurs inputs et reçoivent l'état synchronisé.

**Le code est identique** dans les deux modes. Seul le point d'entrée change :
- **Mode joueur hôte** : un joueur lance une partie. Sa machine exécute le serveur ET son client simultanément. Les autres joueurs se connectent à lui.
- **Mode serveur dédié** : une machine sans joueur exécute le serveur. Tous les joueurs sont des clients à égalité.

### Mode joueur hôte

- Un joueur crée la session. Sa machine héberge.
- Les autres joueurs rejoignent via un code de session, une invitation, ou un système de lobby.
- **Avantage** : gratuit, simple, fonctionne en LAN.
- **Inconvénient** : l'hôte a 0ms de latence (léger avantage). Si l'hôte quitte, la session se termine.
- Le solo est une session joueur hôte avec 1 joueur. Pas de mode solo séparé.

### Mode serveur dédié

- Serveur sans interface graphique, exécutable séparé.
- Hébergeable par la communauté (sur leurs propres machines ou chez des hébergeurs).
- Potentiellement hébergé par l'éditeur pour du matchmaking public.
- **Avantage** : stable, équitable, la session persiste si un joueur quitte.

### Ce que le serveur fait autorité sur

| Système | Autorité |
|---|---|
| **Position et état des joueurs** | Le serveur valide les mouvements (anti-triche basique) |
| **IA des créatures** | Entièrement simulée côté serveur. Les clients ne connaissent que les créatures dans leur voisinage. |
| **État du monde** | Objets, matériaux, portes, conteneurs — le serveur fait autorité. |
| **Blessures et mort** | Le serveur calcule les dégâts et les blessures. |
| **Inventaire** | Le serveur valide les opérations d'inventaire. |
| **Décollage du vaisseau** | Le serveur gère la transition. |

### Ce que les clients gèrent localement

| Système | Côté client |
|---|---|
| **Rendu graphique et audio** | Chaque client fait son propre rendu. |
| **Prédiction de mouvement** | Le client prédit le mouvement local pour un feeling réactif, le serveur corrige. |
| **Voice chat** | Peer-to-peer entre les clients (pas besoin de passer par le serveur). |
| **UI / HUD** | Entièrement local. |

---

## Interactions avec les autres systèmes

- **Blessures/Mort** : la mort crée les dilemmes de récupération. L'agonie crée les dilemmes de sauvetage.
- **Combinaison** : la valeur de la combinaison motive la récupération des corps.
- **Économie** : le bonus collectif récompense la coopération. Les crédits individuels récompensent la survie personnelle.
- **Parasites** : la possession transforme un allié en menace. La méfiance s'installe.
- **Navigation** : un joueur au vaisseau qui guide les autres est un avantage immense.
- **Design sonore** : le voice chat, les sons des coéquipiers (cris, respiration, silence soudain) sont des vecteurs d'émotion.

---

## Points ouverts

- Le décollage a-t-il un timer d'annulation ("décollage dans 10 secondes" annulable) ou est-il instantané ?
- Comment les joueurs abandonnés sont-ils récupérés ? Le vaisseau peut-il retourner sur la même planète/mission ?
- Les joueurs morts peuvent-ils parler dans le voice chat librement, ou est-ce limité ?
- Y a-t-il un système de vote pour le décollage (au lieu de laisser un seul joueur décider) ?
- Y a-t-il un système anti-grief (pour éviter qu'un joueur déclenche systématiquement le décollage pour troller) ?
- Migration d'hôte : si l'hôte quitte en mode joueur hôte, la session est-elle transférée à un autre joueur ou perdue ?
- Matchmaking public : prévu ? Si oui, nécessite des serveurs dédiés hébergés par l'éditeur.
- Comment les joueurs trouvent les parties ? Lobby, code d'invitation, liste de serveurs, intégration Steam/plateforme ?
- Tick rate du serveur : 20, 30 ou 60 ticks/seconde ? (Impact sur la réactivité et la charge réseau)
