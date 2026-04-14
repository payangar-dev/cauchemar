# Vision du jeu — Cauchemar

## Résumé

Cauchemar est un jeu d'horreur coopératif en ligne pour 1 à 8 joueurs. Les joueurs incarnent des opérateurs envoyés sur des planètes hostiles pour accomplir des missions variées (récupération de cargo, sauvetage, collecte scientifique, investigation). Le jeu repose sur un principe fondamental : **le joueur est impuissant face aux menaces**. Il ne peut pas combattre. Il ne peut que fuir, se cacher, et survivre assez longtemps pour retourner au vaisseau.

## Piliers de design

### 1. L'impuissance

Le joueur n'a aucune arme. Aucun moyen de tuer les créatures. La seule réponse face à une menace est la fuite ou la dissimulation. Ce principe ne doit jamais être compromis. Chaque système du jeu doit renforcer ce sentiment de vulnérabilité.

### 2. L'honnêteté du monde

Le monde ne triche pas. Si le joueur entend des pas, quelque chose fait réellement des pas. Si un matériau est dangereux, il l'est vraiment et il y a une raison physique à ce danger. Les murs invisibles n'existent pas. Les sons factices n'existent pas. Le joueur peut faire confiance à ses sens — et c'est précisément ce qui rend chaque stimulus terrifiant, car il sait que tout ce qu'il perçoit est réel.

### 3. La connaissance comme progression

Le joueur ne devient pas plus fort au fil du temps. Il devient **moins ignorant**. La progression passe par la compréhension du monde : quelles espèces peuplent quelle planète, quels matériaux sont dangereux, quelles conditions attirent quels prédateurs. La connaissance est le véritable trésor, et elle peut être perdue si le joueur meurt sans que sa combinaison soit récupérée.

### 4. La tension sociale

Le jeu coopératif n'est pas une garantie de sécurité. Les mécaniques du jeu créent naturellement des dilemmes entre joueurs : qui reste au vaisseau ? Est-ce qu'on attend le retardataire ? Est-ce qu'on risque sa vie pour récupérer le corps d'un coéquipier ? Est-ce qu'on décolle en laissant les autres ? La coopération est un choix, pas une obligation, et chaque choix a un coût.

### 5. L'émergence

Les situations mémorables ne sont pas scriptées. Elles émergent de l'interaction entre les systèmes : un joueur blessé qui ralentit le groupe, un matériau vivant qui attire un prédateur au pire moment, un vaisseau qui décolle par panique. Le jeu fournit les conditions, les joueurs créent les histoires.

## Expérience émotionnelle visée

L'émotion cible n'est pas le "fun" au sens classique. C'est la **terreur contrôlée** — le "negative pleasure" qui vient de survivre à quelque chose d'effrayant. Le joueur doit ressentir :

- **Avant la mission** : l'appréhension. "Qu'est-ce qui nous attend ?"
- **Pendant l'exploration** : la paranoïa. "Ce bruit, c'était quoi ?"
- **Pendant une rencontre** : la panique. "Cours. Cache-toi. Ne fais pas de bruit."
- **Pendant le retour** : l'urgence. "Le vaisseau est encore loin."
- **Après la mission** : le soulagement. "On a survécu." Et l'envie d'y retourner.

## Références

| Jeu | Ce qu'on en retient |
|---|---|
| **Lethal Company** | Structure mission/vaisseau/hub, horreur coop, perte d'équipement à la mort |
| **Alien: Isolation** | IA imprévisible du monstre, son comme outil de survie, impuissance totale |
| **Amnesia: The Dark Descent** | Système de santé mentale, vision limitée, pas d'armes |
| **Phasmophobia** | Coop avec rôles émergents, outils d'investigation, base de données à compléter |
| **Outlast** | Caméra comme seul outil, course-poursuite, environnements claustrophobes |
| **Silent Hill 2** | Horreur psychologique, symbolisme, narration par l'environnement |
| **Deep Rock Galactic** | Coop avec rôles différenciés, génération procédurale de grottes, exploration |

## Principes de design transversaux

Ces règles s'appliquent à TOUS les systèmes du jeu :

1. **Rien n'est gratuit** — chaque action a un coût (bruit, temps, ressource, risque).
2. **Rien n'est bloqué** — le joueur peut toujours tenter quelque chose, mais le risque augmente sans la bonne préparation.
3. **L'information est incomplète** — le scanner, la base de données, le scan planétaire : tout est partiel. Le joueur doit compléter par l'expérience.
4. **La mort a un poids** — mourir fait perdre des crédits, potentiellement la combinaison et ses upgrades, le butin, et les données de scan non déchiffrées.
5. **Les systèmes interagissent** — les blessures affectent le mouvement, le mouvement affecte le bruit, le bruit attire les créatures, les créatures causent des blessures. Tout est connecté.
6. **Pas de murs invisibles, pas de sons factices, pas de distances en mètres** — le monde est honnête et immersif.
7. **Les règles physiques s'appliquent à tous** — joueurs et créatures sont soumis au même monde. Une créature peut mourir d'une chute, d'une météorite, d'un piège, de la lave. Chaque espèce a ses propres résistances (une créature volcanique résiste à la chaleur, une créature volante ne subit pas les chutes), mais personne n'est exempt des lois du monde.
