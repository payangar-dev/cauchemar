# Blessures et mort

## Résumé

Le système de blessures et de mort est un des piliers de la terreur dans Cauchemar. La mort n'est pas un interrupteur on/off : c'est une **dégradation progressive**. Un joueur passe de sain à blessé, de blessé à critique, de critique à agonisant, puis mort. Chaque étape réduit ses capacités et augmente sa détectabilité, créant une spirale de vulnérabilité. Les soins sont rares et coûteux. La mort est définitive — sauf si les coéquipiers trouvent une **machine de transfert de conscience** et un **corps receveur** dans le niveau, permettant une réanimation risquée.

## Principes de design

- La blessure n'est pas juste une barre de vie qui baisse. Elle a des **conséquences mécaniques précises** selon la zone touchée.
- Les soins complets n'existent qu'à la station. En mission, on peut au mieux **stabiliser** une blessure, pas la guérir.
- Un joueur blessé n'est pas juste affaibli pour lui-même : il **affecte le groupe** (il ralentit tout le monde, il fait du bruit, il attire les créatures).
- La mort est **définitive pour la mission** sauf réanimation par transfert de conscience (rare, risqué, coûteux en temps et en bruit).
- Le joueur mort peut continuer en spectateur ou retourner à la station en attendant.
- Le retour à la station guérit **toujours** complètement. Il n'y a pas de blessures persistantes entre les missions.

---

## États du joueur

### Sain

Le joueur a toutes ses capacités. Vitesse normale, pas de bruit involontaire, tous les modules fonctionnent (sous réserve de leur propre état).

### Blessé

Le joueur a subi une ou plusieurs blessures. Chaque blessure est **localisée** et a des effets spécifiques.

### Critique

Le joueur a subi des blessures graves. Les effets se cumulent. Le joueur est fortement diminué, laisse des traces visibles (sang au sol), et émet des sons involontaires (gémissements, respiration lourde).

### En agonie

Le joueur a reçu un coup fatal (sous certaines conditions, voir plus bas). Il est au sol, **immobile**, mais **conscient**. Il peut voir et entendre son environnement. Il peut potentiellement communiquer (chuchoter dans le micro s'il en a un). Un **timer** défile. Si le timer expire, le joueur meurt. Si un coéquipier intervient avec un **consommable de sauvetage** (acheté à la station) avant la fin du timer, le joueur peut être relevé.

### Mort

Le joueur est éliminé pour le reste de la mission. Il ne peut plus agir sur le monde. Il passe en mode **spectateur** : il peut voir le flux caméra d'un coéquipier vivant (si celui-ci a une caméra embarquée fonctionnelle). Voir la section "Post-mort" plus bas.

---

## Blessures localisées

Chaque blessure est associée à une zone du corps et a des effets spécifiques :

### Jambe

- **Effet mouvement** : boiterie. La course est impossible ou très ralentie. La vitesse de marche est réduite.
- **Effet bruit** : la jambe blessée fait du bruit (traînement, craquement) audible par les créatures.
- **Effet gameplay** : la fuite n'est plus une option viable. Le joueur doit se cacher s'il est repéré. S'il est loin du vaisseau, le retour est long et exposé.

### Bras

- **Effet interaction** : les manipulations sont ralenties. Ouvrir une porte, ramasser un objet, utiliser un outil prend plus de temps.
- **Effet gameplay** : chaque interaction est une fenêtre d'exposition plus longue. Le joueur passe plus de temps immobile et vulnérable pendant qu'il interagit avec l'environnement.

### Torse

- **Effet santé** : saignement. Le joueur perd progressivement de la santé si la blessure n'est pas stabilisée (bandage, cautérisation).
- **Effet endurance** : l'endurance est réduite. Le joueur se fatigue plus vite en courant.
- **Effet détectabilité** : le saignement laisse des **traces de sang au sol**, visibles par les autres joueurs ET par les créatures. Le joueur signale son passage.

### Tête

- **Effet vision** : la vision est altérée. Flou, distorsion, assombrissement des bords.
- **Effet audio** : les sons sont déformés. Le joueur a du mal à localiser les sources sonores. Acouphènes possibles.
- **Effet gameplay** : le joueur perd ses deux outils principaux de survie (la vue et l'ouïe). C'est la blessure la plus déstabilisante parce qu'elle compromet la capacité du joueur à percevoir les menaces.

---

## Cumul des blessures

Les blessures se cumulent. Un joueur avec une jambe blessée ET un bras blessé subit les deux effets simultanément : il boite ET il interagit lentement. Un joueur avec un torse blessé ET une tête blessée saigne ET ne voit plus correctement — il ne sait même pas dans quelle direction il saigne.

---

## Soins

### Par défaut : aucun soin disponible

Un joueur sans consommable ni matériau de soin ne peut rien faire contre ses blessures. Il doit survivre avec ses handicaps jusqu'au retour à la station.

### Soins improvisés sur le terrain

Des soins partiels peuvent être réalisés avec des matériaux trouvés ou craftés sur le terrain. Ces soins **ne restaurent pas les capacités** — ils réduisent les effets secondaires (détectabilité, saignement, bruit).

#### Cautérisation

- **Nécessite** : une source de chaleur (briquet, câble chaud, flamme).
- **Effet** : stoppe le saignement (plus de traces de sang au sol).
- **Coût** : le joueur **crie de douleur**. C'est une alerte sonore massive qui attire toutes les créatures à portée.
- **Dilemme** : saigner en silence ou cautériser et se faire repérer.

#### Bandage de fortune

- **Nécessite** : du tissu (vêtements déchirés, tissu trouvé dans l'environnement, bandage crafté au vaisseau).
- **Effet** : stoppe le saignement ET réduit le bruit de la blessure (plus de gémissements audibles, la jambe cassée est moins bruyante).
- **Limites** : ne restaure PAS la mobilité. Le joueur est toujours entravé dans ses mouvements. Le bandage retire la détectabilité, pas le handicap.

### Consommables achetés/craftés à la station

Des consommables plus efficaces peuvent être achetés ou craftés à la station et emportés en mission :

- **Stimulant / remède** : restaure partiellement ou totalement les capacités (permet de recourir, de manipuler normalement). Plus puissant que les soins improvisés.
- **Kit anti-agonie** : le seul moyen de relever un joueur en état d'agonie. Sans ce consommable, un joueur en agonie ne peut pas être sauvé et mourra quand le timer expirera.
- Ces consommables sont **rares et chers**. Le joueur doit choisir avant la mission combien il en emporte, sans savoir s'il en aura besoin.

### Soin complet : la station

Le retour à la station guérit **toujours** et **totalement** le joueur. Toutes les blessures disparaissent. C'est le seul soin garanti et gratuit du jeu.

---

## L'état d'agonie

### Déclenchement

L'agonie ne se déclenche **pas systématiquement** à chaque mort. Certains coups fatals tuent directement, d'autres laissent le joueur à l'agonie. Cela doit rester **imprévisible** pour garder l'impact émotionnel.

#### Situations qui peuvent déclencher l'agonie

- Griffure ou coup violent (le monstre frappe et s'éloigne).
- Chute de hauteur (assez haute pour être fatale, mais pas un gouffre).
- Attaque interrompue (le monstre est distrait pendant qu'il achève le joueur).
- Empoisonnement / toxine (mort lente).

#### Situations qui entraînent la mort directe

- Le joueur est dévoré (la créature ne lâche pas prise).
- Le joueur est écrasé (effondrement, piétinement).
- Le joueur tombe dans un gouffre / de très haut.
- Attaque d'une espèce **consciente** — les espèces conscientes comprennent que la cible est encore vivante. Elles **achèvent** le joueur, ou pire, l'utilisent comme appât.

#### Mort définitive (puce neurale détruite — réanimation impossible)

Certaines morts détruisent la **puce à la nuque**, rendant tout transfert de conscience impossible :

- Le joueur se fait **dévorer la tête** (créature qui cible la tête/nuque).
- La nuque est **écrasée ou arrachée**.
- **Décapitation** ou destruction massive de la tête.

Ces morts sont les plus **punitives** du jeu : non seulement le joueur est mort, mais même si les coéquipiers trouvent une machine et un corps receveur, le transfert **échouera**. Le corps n'a plus de puce lisible. C'est la perte totale — pas de réanimation, et si le corps n'est pas récupéré, perte de la combinaison aussi.

### Comportement en agonie

- Le joueur est au sol, **immobile**. Il ne peut pas se déplacer.
- Le joueur est **conscient**. Il voit et entend son environnement.
- Le joueur peut potentiellement **communiquer** (chuchoter via le micro, si le module est fonctionnel).
- Un **timer** défile (durée à définir, probablement 60 à 120 secondes).
- Le joueur peut donner des informations à ses coéquipiers : "Le monstre est parti vers le nord", "Je vois une porte à ma gauche".

### Sauvetage de l'agonie

- Nécessite un **kit anti-agonie** (consommable acheté/crafté à la station).
- Un coéquipier doit se rendre physiquement auprès du joueur agonisant et utiliser le kit.
- L'utilisation du kit prend du temps (le coéquipier est immobile et vulnérable pendant l'opération).
- Le joueur sauvé est relevé mais dans un état **critique** (blessures multiples, fortement diminué).

### L'appât (espèces conscientes)

Les espèces conscientes peuvent exploiter l'état d'agonie. Au lieu d'achever le joueur, elles le laissent au sol intentionnellement, sachant que d'autres joueurs viendront le sauver. La créature se cache à proximité et attend. Le joueur agonisant peut potentiellement voir la créature embusquée et prévenir ses coéquipiers — s'il a un micro et s'ils sont à portée de communication.

---

## Réanimation par transfert de conscience

### La machine de transfert

### La puce neurale

Chaque joueur porte une **puce implantée à la nuque** qui contient l'intégralité de sa conscience. C'est cette puce qui permet le transfert : la machine lit le contenu de la puce du corps source et l'écrit sur la puce du corps receveur. Le corps receveur possède aussi une puce (tous les humains dans cet univers en ont une).

Cette technologie a une implication majeure sur la mort : **si la puce est détruite, la mort est définitive et la réanimation est impossible**. Toute blessure qui détruit la nuque ou la tête rend le transfert impossible :

- Un joueur dont la tête est dévorée par une créature → **mort définitive**, pas de réanimation possible.
- Un joueur dont la nuque est écrasée ou arrachée → **mort définitive**.
- Une chute la tête la première, un écrasement → si la puce est intacte, la réanimation reste possible.

Cela ajoute un gradient de mort : certaines morts sont récupérables (le corps est endommagé mais la puce est intacte), d'autres sont **irrévocables** (la puce est détruite). Les joueurs et les coéquipiers ne savent pas toujours si la puce est intacte — ils le découvrent en plaçant le corps dans la machine (échec du transfert si la puce est détruite).

### La machine de transfert

La machine de transfert de conscience est un dispositif trouvable dans les niveaux (dans des structures, des installations abandonnées, des vaisseaux crashés). Elle ressemble à une **salle de cryogénisation** avec deux emplacements (deux lits/capsules) :

- **Emplacement 1 — Corps source** : le corps du joueur mort dont on veut transférer la conscience (puce source).
- **Emplacement 2 — Corps receveur** : un corps trouvé dans le niveau, dont la puce recevra la conscience du joueur.

La machine n'est pas un objet transportable. Elle est **fixe** dans le monde. Les joueurs doivent amener le corps du joueur mort jusqu'à la machine.

### Trouver un corps receveur

Des corps de personnes décédées peuvent être trouvés dans le niveau : dans des structures, près de crashs, dans des grottes, à côté de campements abandonnés. Ces corps sont dans des **états variables** :

- Certains sont relativement intacts.
- D'autres ont des blessures : bras cassé, jambe manquante, blessures au torse.
- Certains sont **parasités** (le parasite est encore dans le corps, dormant, en attente d'un hôte vivant).

L'état du corps receveur est **partiellement visible** à l'oeil nu :
- Un bras manquant est visible.
- Une jambe cassée est visible.
- Un parasitage n'est pas forcément visible (l'infection peut être interne).

### Processus de réanimation

1. **Trouver la machine** dans le niveau.
2. **Trouver un corps receveur** (ou en utiliser un déjà placé dans la machine — certaines machines contiennent déjà un corps receveur dans l'emplacement 2).
3. **Amener le corps du joueur mort** jusqu'à la machine (porter le corps = lent, bruyant, mains occupées).
4. **Placer le corps receveur** dans l'emplacement 2 (si pas déjà en place). À ce moment, la machine affiche un **pourcentage** représentant l'état global du corps receveur.
5. **Placer le corps source** (joueur mort) dans l'emplacement 1.
6. **Lancer le transfert**. Le processus :
   - **Prend du temps** (plusieurs dizaines de secondes — les joueurs doivent protéger la zone).
   - **Fait du bruit** (la machine est bruyante — attire les créatures).
   - Est **irréversible** une fois lancé.
7. Le joueur est **réanimé** dans le corps receveur.

### Le pourcentage du corps receveur

Quand le corps receveur est placé dans la machine, un pourcentage s'affiche. Ce pourcentage représente l'**état global** du corps :

| Pourcentage | État du corps | Ce que ça implique |
|---|---|---|
| **90-100%** | Quasi intact | Le joueur est réanimé en bon état. |
| **60-80%** | Blessures mineures | Blessures localisées (bras cassé, blessure au torse). Le joueur est réanimé blessé. |
| **30-50%** | Blessures graves | Blessures multiples, membres manquants. Le joueur est réanimé dans un état critique. |
| **10-20%** | Très endommagé | Blessures graves, multiples membres manquants. Le joueur est réanimé mais dans un état terrible. |

Le pourcentage reflète **uniquement l'état physique** du corps. Il ne détaille pas les blessures individuelles et **ne donne aucune information sur un éventuel parasitage**. Un corps à 100% peut être parasité. Un corps à 30% peut être sain. Le parasitage est **invisible** pour la machine — seul un scanner (si le joueur en a un et prend le temps de scanner le corps) pourrait potentiellement donner un indice, sans garantie.

### Risques de la réanimation

#### Blessures héritées

Le joueur réanimé **hérite des blessures du corps receveur**. Si le corps avait un bras cassé, le joueur réanimé a un bras cassé. Si le corps a une jambe manquante, le joueur se retrouve avec une jambe manquante. Ces blessures suivent les règles normales du système de blessures (voir section Blessures localisées).

#### Parasitage

Si le corps receveur était **parasité**, le joueur réanimé est infecté. L'infection suit la progression normale des parasites (voir [07c_parasites.md](../07_faune/07c_parasites.md)) :

- Le joueur ne s'en rend **pas compte immédiatement**. Le stade 1 (contamination) est subtil.
- Avec le temps, les symptômes apparaissent et s'aggravent.
- Sans traitement (consommable anti-parasitaire), le joueur finira par être **possédé**.
- L'horreur : le soulagement de la réanimation se transforme en cauchemar quand le joueur réalise que son nouveau corps est habité.

#### Dégradation des modules (non applicable)

La **combinaison est transférée** du corps source au corps receveur. Le joueur réanimé conserve **tous ses upgrades** de combinaison. La combinaison peut avoir été endommagée pendant la mission (avant la mort), mais elle n'est pas affectée par le transfert lui-même.

### Ce que ça crée comme gameplay

**Le dilemme du corps** : les joueurs trouvent une machine et deux corps receveurs. Un à 75%, un à 35%. Ils ont un coéquipier mort. Le 75% est probablement safe mais basique. Le 35% est risqué mais c'est le seul disponible. Ou bien : le 75% est peut-être parasité (impossible à savoir avec certitude), le 35% est clairement abîmé mais visiblement sain.

**La quête de réanimation** : un joueur meurt. Les autres doivent maintenant trouver une machine ET un corps receveur tout en survivant, en portant le corps du mort (lent, bruyant), et en protégeant la zone pendant le transfert. C'est une **mission dans la mission**.

**Le piège de la réanimation** : le joueur est réanimé, soulagé. Quelques minutes plus tard, des mouvements involontaires commencent. "Pourquoi je fais ça ?" Le parasite se réveille. Les coéquipiers qui ont risqué leur vie pour la réanimation réalisent qu'ils ont ramené quelque chose d'autre que leur ami.

**La machine occupée** : les joueurs trouvent une machine avec un corps receveur déjà en place. C'est tentant : pas besoin de chercher un corps. Mais qui l'a mis là ? Et pourquoi ? Est-ce un piège d'une espèce consciente ?

---

## Post-mort

### Spectateur

Un joueur mort passe en mode spectateur. Il peut :

- **Voir le flux caméra** d'un coéquipier vivant (si celui-ci a une caméra embarquée fonctionnelle).
- **Communiquer** via le voice chat (les joueurs morts peuvent toujours parler dans le chat vocal — à définir si c'est limité ou non).

Le joueur mort ne peut pas :

- Se déplacer dans le monde.
- Interagir avec quoi que ce soit.
- Voir des choses que les joueurs vivants ne voient pas (pas de "mode fantôme").

### Retour à la station

Le joueur mort peut retourner à la station (transition automatique ou manuelle, à définir). À la station, il peut :

- Préparer la prochaine mission.
- Consulter la base de données.
- Gérer son inventaire (ce qu'il avait au conteneur de la station).

Il doit attendre que la mission en cours se termine ou qu'une nouvelle mission soit lancée pour rejouer.

---

## Le corps

Le corps d'un joueur mort reste **physiquement** dans le monde. Il a plusieurs valeurs :

### La combinaison

Si le corps est ramené au vaisseau, la combinaison (et tous ses upgrades) est sauvée. Si le corps est abandonné, la combinaison est perdue. C'est souvent la raison principale de risquer une récupération.

### Les matériaux

Les matériaux que le joueur avait dans son inventaire **tombent au sol** à sa mort. Ils sont récupérables par les autres joueurs indépendamment du corps. On peut prendre les matériaux sans porter le corps.

### Les données de scan

Les données de scan non déchiffrées sont stockées dans la combinaison. Récupérer le corps = récupérer les données. Abandonner le corps = perdre les données.

### Porter le corps

Porter le corps d'un joueur mort a des conséquences :

- Le porteur est **ralenti** (poids supplémentaire significatif).
- Le porteur a les **mains occupées** (il ne peut pas ouvrir de portes facilement, interagir avec des objets, ou utiliser des outils).
- Le porteur fait **plus de bruit** (effort physique).
- Le corps peut **laisser des traces** (sang).

---

## Interactions avec les autres systèmes

- **Combinaison** : les blessures peuvent endommager les modules de la combinaison. La perte du corps = perte de la combinaison. La réanimation transfère la combinaison au nouveau corps.
- **Inventaire** : les matériaux tombent au sol à la mort. Le butin d'un joueur mort a de la valeur.
- **Faune** : les espèces animales et conscientes interagissent différemment avec les joueurs blessés et agonisants. Les animaux peuvent sentir le sang. Les espèces conscientes utilisent les agonisants comme appât.
- **Parasites** : le transfert de conscience dans un corps parasité déclenche le cycle d'infection normal. Les parasites sont le danger principal de la réanimation.
- **Multijoueur** : la blessure, la mort et la réanimation créent les dilemmes sociaux les plus forts du jeu (sauver ou abandonner, récupérer le corps ou fuir, réanimer dans un corps risqué ou pas).
- **Génération** : les machines de transfert et les corps receveurs sont placés dans le monde lors de la génération (dans les structures, crashs, installations).

---

## Points ouverts

- Durée exacte du timer d'agonie (60 secondes ? 90 secondes ? 120 secondes ? Variable selon la cause ?).
- Le joueur agonisant peut-il être déplacé (traîné) par un coéquipier SANS kit anti-agonie, juste pour le mettre à l'abri ?
- Faut-il porter le corps à un ou deux joueurs ? Un brancard craftable ?
- Le joueur mort en spectateur a-t-il accès au voice chat librement, ou est-ce limité (pour éviter qu'il donne trop d'informations en tant que "caméra" supplémentaire) ?
- Y a-t-il un coût supplémentaire à la mort au-delà de la perte de combinaison/butin (perte de crédits ? Malus temporaire ?) ?
- Fréquence d'apparition des machines de transfert dans les niveaux générés (rare ? Une par mission ? Dépend du type de mission/planète ?).
- Un joueur peut-il être réanimé plusieurs fois dans la même mission (si plusieurs machines et corps sont disponibles) ?
- Le pourcentage du corps receveur indique-t-il spécifiquement le risque de parasitage, ou est-ce volontairement opaque ?
- Un joueur réanimé qui meurt à nouveau : son corps "transféré" peut-il être utilisé comme source pour un second transfert ?
- L'apparence physique du joueur change-t-elle après le transfert (il est dans un corps différent) ?
- Le corps receveur pré-placé dans une machine : est-ce un placement aléatoire de la génération ou un piège potentiel d'une espèce consciente ?
- La machine nécessite-t-elle de l'énergie pour fonctionner (batterie, alimentation) ?
- Les blessures "membre manquant" (bras, jambe) sont-elles permanentes pour la mission ou soignables à la station ?
