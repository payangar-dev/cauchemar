# Recherche : Generation procedurale de creatures

Ce document est un rapport de recherche technique sur l'etat de l'art de la generation procedurale de creatures pour jeux video, avec un focus sur l'application a Cauchemar (horreur cooperative, Godot Engine, creatures uniques par planete).

---

## 1. Generation procedurale de mesh/modeles 3D de creatures

### 1.1 Approche classique : assemblage modulaire de parties (No Man's Sky)

No Man's Sky est la reference industrielle la plus proche de notre besoin. Son systeme fonctionne par **composition modulaire** :

- Les artistes creent des **silhouettes de base** (templates) : lezard, rat, poisson, vache, etc. — des centaines de types.
- Chaque type a des **descriptor pools** : des bibliotheques de pieces (tetes, pattes, queues, appendices) tagguees par type (`legs`, `arms`, `head`, etc.).
- Le moteur **combine aleatoirement** les pieces avec des valeurs de probabilite predefinies pour chaque combinaison.
- Le **squelette sous-jacent est ajuste** pour que la creature assemblee paraisse realiste.
- Les textures suivent la meme strategie modulaire : plusieurs textures par piece, combinees pour le diffuse final. Deux creatures geometriquement identiques peuvent avoir des couleurs et motifs completement differents.
- **Superformula de Johan Gielis** : utilisee pour decrire des formes biologiques avec quelques parametres ajustables.
- Le systeme de tags permet d'assigner des affinites comportementales : les creatures sont attirees par les objets qu'elles "aiment" et evitent ceux qu'elles n'aiment pas.

**Forces** : extremement scalable (doubler les assets multiplie les combinaisons par centaines), controle artistique fort, performant en runtime.
**Faiblesses** : les creatures sont des recombinaisons, pas des formes veritablement nouvelles. La diversite depend du volume d'assets.

### 1.2 Approche Spore : metaballs + rigblocks

Le systeme de Spore (documente par Chris Hecker, SIGGRAPH 2008) est la reference academique la plus detaillee :

**Mesh par surfaces implicites (metaballs) :**
- La peau utilise une **surface implicite blobby** (metaballs) : definie par une fonction mathematique, pas par des points.
- Formule : `f_i(p) = s_i[(p-c_i)^2/R_i^2 - 1]^4` — polynome d'ordre 4 en distance carree, pour des derivees continues (evite les discontinuites d'eclairage des polynomes d'ordre 2).
- Les metaballs spheriques sont distribues le long des membres et du torse.
- Quand on etire un membre, **des metaballs supplementaires sont ajoutes automatiquement** pour maintenir une surface lisse.
- La tessellation utilise l'algorithme de Moore & Warren (Graphics Gems III) pour eviter les triangles degeneres du Marching Cubes naif.
- **Feature emergente** : l'absence de groupes de metaballs cree des membranes entre les membres — exploite pour les ailes de chauve-souris.

**Rigblocks (pieces pre-fabriquees) :**
- Les formes complexes (mains, bouches, epines) sont des **rigblocks** : pieces 3D artisanales avec des degres de liberte predefinis (scale, stretch, transform).
- Systeme hybride : metaballs pour la forme generale + rigblocks pour les details.

**Systeme de texture automatique :**
- UV unwrapping automatique en **10ms** sur hardware minimum : inondation de triangles par direction cardinale (+x, -x, +y, -y, +z, -z), projection sur plans, packing en zig-zag.
- **Peinture par particules** : des particules se deplacent en coordonnees barycentriques sur la surface du mesh, "peignant" en temps reel. Trois couches : base coat, motif principal, detail.
- Systeme de peinture 3D hardware-accelere : raycasting pour detection, inondation de triangles dans le rayon du pinceau, multi-canaux (diffuse, specular, gloss, emissive, bump).

**Animation procedurale :**
- Architecture en **canaux** : chaque canal (bras, pieds, etc.) a des queries specifiant quelles parties du corps recoivent l'animation.
- **Regles de generalisation** : "ground relative" synchronise le contact des pieds au sol ; echelle proportionnelle a la longueur des membres.
- **Logique de branchement** : le systeme selectionne les animations adaptees a la morphologie (graspers vs bouches).
- **Jiggles physiques** : mouvement passif par simulation physique des parties non-animees.
- **IA comportementale** : adaptation v1.5 du systeme de Behavior Trees de Halo (Bungie), classifie comme FSM ameliore avec meilleure scalabilite.

### 1.3 Approche parametrique (Rune Skovbo Johansen, 2021-2024)

Travail d'un developpeur indie sur des creatures procedurales 100% parametriques :

- **Rectangles extrudes multi-segmentes** : chaque composant (torse, pattes, pieds, cou, tete, machoire, queue, oreilles) est un rectangle extrude.
- **106 parametres de haut niveau** (consolides depuis 503 parametres bas-niveau) generent toutes les variations.
- **Gradient descent automatique** : un outil capture des silhouettes multi-angles du modele de reference et du modele procedural, genere des Signed Distance Fields (SDF), et minimise la difference iterativement.
- **Placement automatique des joints** : epaules, hanches, genoux, cou positionnes par correlations anatomiques etudiees sur des references reelles.
- **Contrainte fondamentale** : toute valeur aleatoire des 106 parametres doit toujours produire une creature valide.

### 1.4 Outils d'IA pour la generation de modeles 3D (2025-2026)

L'etat de l'art a considerablement avance. Les outils majeurs :

**Tripo3D (meilleur overall pour le jeu)** :
- Genere des meshes propres, compatibles moteur, avec textures PBR optimisees.
- Algorithme 3.0 beta (aout 2025) : generation en **10 secondes**, topologie propre, geometrie nette, segmentation intelligente des parties.
- **Controle explicite du polycount** et de la densite du mesh : high-res et low-poly pour LOD.
- **Auto-rigging IA** : genere une hierarchie de joints standardisee et des skin weights en un clic. Fonctionne sur humanoides et creatures.
- Export GLB, FBX avec presets d'animation.
- **API REST** disponible pour integration pipeline.

**Meshy (meilleur pour textures, API robuste)** :
- API REST bien documentee, **50+ taches simultanees** sans downtime.
- Modele Meshy-6 (2025-2026).
- Rigging et animation automatiques avec 500+ animations game-ready (marche, saut, etc.).
- Export direct vers Blender, Unity, Unreal, **Godot**.
- **Limitation** : fidelite 70-80% sur les modeles organiques (creatures), necessite souvent du nettoyage manuel.

**Shap-E (OpenAI, open-source MIT)** :
- Genere des parametres de fonctions implicites, rendues en meshes textures ou NeRF.
- Generation en **13 secondes** depuis un prompt texte.
- **Limitations serieuses** : resolution et detail faibles, difficulte avec les attributs multiples, qualite inferieure aux concurrents commerciaux.
- Necessite GPU Nvidia. Utile comme point de depart a raffiner, pas pour production.

**Sparc3D (open source)** :
- Meshes haute resolution, personnalisable via ComfyUI ou Hugging Face.
- Moins poli que les solutions commerciales, necessite plus d'intervention manuelle.

**Verdict pour Cauchemar** : Tripo3D ou Meshy via API pourraient generer des modeles de base a partir de descriptions, mais la topologie pour l'animation reste "hit or miss" sur les creatures. L'approche la plus fiable pour un jeu commercial reste **l'assemblage modulaire** (style No Man's Sky) avec eventuellement un pipeline IA pour generer les pieces de base de la bibliotheque.

### 1.5 Rigging automatique par IA : UniRig (SIGGRAPH 2025)

UniRig est une avancee majeure pour le rigging procedural :

- **Architecture** : transformeur autoregressif (style GPT) a deux etapes.
- **Etape 1 — Prediction du squelette** : le modele predit autoregressivement une hierarchie squelettique topologiquement valide via "Skeleton Tree Tokenization".
- **Etape 2 — Prediction du skinning** : mecanisme "Bone-Point Cross Attention" pour determiner les poids d'influence par vertex.
- **Dataset d'entrainement** : Rig-XL, 14 000+ modeles rigges couvrant bipedes, quadrupedes, oiseaux, insectes, objets statiques.
- **Amelioration** : 215% de precision par rapport aux solutions existantes.
- **Formats** : entree .obj, .fbx, .glb, .vrm → sortie .fbx, .glb (modeles rigges).
- **Exigences** : Python 3.11+, PyTorch 2.3.1+, GPU 8GB VRAM minimum.
- **Open source**, developpe par VAST-AI Research (equipe Tripo).

**Application Cauchemar** : UniRig pourrait rigger automatiquement des creatures generees proceduralement, meme des morphologies non-standard. Le pipeline serait : generer le mesh → passer dans UniRig → obtenir un squelette et des weights → animer.

---

## 2. Animation procedurale

### 2.1 Inverse Kinematics (IK) — l'outil fondamental

**FABRIK (Forward And Backward Reaching Inverse Kinematics)** est l'algorithme dominant pour l'animation procedurale de creatures :

- **Principe** : evite les angles de rotation et les matrices. Trouve la position de chaque joint en localisant un point sur une ligne.
- **Avantages** : converge en peu d'iterations, faible cout computationnel, poses visuellement realistes.
- **Superieur a CCD** (pas de probleme de clumping) et plus rapide que Jacobian Transpose.
- **Manipule directement les positions des joints** tout en maintenant les contraintes de longueur des liens.
- Ideal pour la locomotion procedurale : definir des "targets" (effectors) pour les pieds, et les joints sont automatiquement resolus.
- **Two-bone IK** : utilise pour poser les jambes pendant la locomotion et les bras pour la prehension.

### 2.2 Locomotion procedurale (style Rain World)

Rain World est la reference pour l'animation procedurale creature en jeu :

**Systeme de points connectes :**
- "J'ai un tas de points dans l'espace et je les connecte a certaines distances... si vous avez 10 points connectes les uns aux autres, ils agissent comme une armature." — Joar Jakobsson (GDC 2016)
- Par-dessus, une "paper doll" : des parties visuelles assembles pour former la silhouette.
- Chaque membre a son propre **poids, amplitude de mouvement**, comme un vrai corps.
- Les creatures sont **souples et pliables**, navigant n'importe quel environnement.

**Animation procedurale du slugcat (Rain World: The Watcher)** :
- Le modele est constitue de "deux morceaux spheriques verrouilles a distance fixe", avec rotation et roulement libres.
- Les membres et queues sont des superpositions cosmetiques animees proceduralement selon les inputs du joueur.
- Qualite "glissante, liquide" : rebonds sur les murs, glissements au sol, compression dans les tunnels.
- Les interactions creature-creature emergent naturellement du systeme : vautours piegos par des algues, charognards utilisant des spore puffs, lezards utilisant de l'acide.

### 2.3 Animation basee sur la physique

**Cascadeur (2025.3)** :
- Logiciel d'animation IA + physique. Analyse la physique (momentum, gravite, force) et genere une version physiquement accurate.
- **Support quadrupede** officiellement ajoute en 2025.3 avec Quick Rigging Tool.
- AI Inbetweening : genere automatiquement le mouvement entre deux poses.
- Export vers moteurs de jeu.

**Simulation musculaire (Source of Madness)** :
- Unity ML-Agents pour le mouvement muscle par IA : les creatures procedurales sont animees par un **reseau neuronal** qui apprend le mouvement physique.
- Les monstres sont crees aleatoirement et animes par ML-Agents, sans animations pre-faites.
- Le "Monster Stitcher" assemble des parties, puis le reseau neuronal apprend a faire bouger la creature resultante.

**Karl Sims (1994, fondateur du domaine)** :
- Creatures 3D en blocs articules, co-evolution morphologie + controleur par algorithme genetique.
- Reseau neuronal artificiel traite les inputs de capteurs virtuels et agit sur des muscles virtuels.
- Les creatures evoluent pour nager, marcher, sauter, suivre, ou se battre pour un objet.
- **Co-evolution** : la morphologie et le comportement s'adaptent simultanement.

### 2.4 Animation procedurale dans Godot (specifique a Cauchemar)

Godot 4 fournit les outils necessaires :

**Skeleton3D API pour creation runtime :**
- `add_bone(name)` : creer des os programmatiquement
- `set_bone_parent(bone_index, parent_index)` : etablir la hierarchie
- `set_bone_pose_position(bone_index, position)` : positionner
- `set_bone_pose_rotation(bone_index, quaternion)` : rotation
- `set_bone_rest(bone_index, transform)` : pose de repos
- `set_bone_global_pose(bone_index, transform)` : pose globale
- SurfaceTool : `set_weights(array)` et `set_bones(array)` pour assigner les poids de skinning aux vertices.

**Mesh procedural :**
- **ArrayMesh** : plus rapide, API plus bas-niveau. Ideal pour les meshes statiques complexes.
- **SurfaceTool** : abstraction au-dessus d'ArrayMesh, avec `generate_normals()` et `index()` automatiques.
- **ImmediateMesh** : style OpenGL immediate mode, ideal pour la geometrie qui change chaque frame (debug, previsualization).
- **MeshDataTool** : post-traitement de meshes existants.

**Marching Cubes dans Godot** :
- Extension Godot disponible : `daltoncoder/marching-cubes-godot`.
- Asset Library : "Marching Cubes" (asset #3597).
- Utilisable pour generer des meshes a partir de metaballs/champs scalaires en temps reel.

---

## 3. Generation procedurale de traits, stats et ecosystemes

### 3.1 Dwarf Fortress : Forgotten Beasts — reference de generation textuelle

Le systeme de Dwarf Fortress est la reference pour la generation procedurale de creatures avec traits coherents :

**Pipeline de generation (Lua)** :
1. **Nommage** : selection d'un schema de nom parmi 4 schemas valides.
2. **Forme corporelle** : choix d'un animal ou d'une forme aleatoire, puis une "quirk" (deviation drastique).
3. **Materiau** : de fragile (eau, cendre, vapeur, neige) a devastateur (fer, acier, feu).
4. **Capacites speciales** : secretions toxiques, morsures empoisonnees, crache de globs, souffle de feu, boules de feu, sang toxique, toiles, nuages de poussiere mortels — chacun avec des symptomes generes aleatoirement.
5. **Taille** : minimum 10 000 000 (unite DF).
6. **Competences** : lutte, morsure, saisie, frappe, combat melee, esquive, conscience situationnelle — toutes au niveau 6.

**Variations de forme** :
- Blob (partie unique, accumulation rapide de degats)
- Ver/limace/nematode (lent, organes internes vulnerables)
- Quadrupede/humanoide (menace moyenne)
- Insecte/araignee (membres redondants problematiques)

**Principe cle** : la composition materielle determine directement la menace. Une creature en acier est une menace terminale, une en cendre meurt au premier coup.

### 3.2 Ecosystem (jeu Steam) : evolution par ADN synthetique

Le jeu "Ecosystem" est la reference la plus avancee pour les ecosystemes proceduraux :

**Genome numerique** :
- L'ADN encode **tout** : structure squelettique, processeurs mentaux (cerveau), performances de combat.
- Le cerveau est un **pipeline computationnel** : chaque instant, les donnees des organes sensoriels traversent un reseau de neurones et contractent un muscle specifique.

**Evolution par selection naturelle :**
- Mutation : les enfants different legerement de leurs parents, de maniere heritable.
- Selection naturelle : les creatures qui trouvent mieux la nourriture, les partenaires, et evitent mieux les predateurs deviennent plus communes.

**Physique et mouvement :**
- Pas d'animations pre-faites. Les creatures **appliquent du torque a leurs articulations** pour pousser contre l'eau.
- L'evolution produit une enorme variete de formes corporelles et de styles de nage.

**Ecologie et detection :**
- La vision d'un predateur depend de : largeur/hauteur du cone de vision, difference de couleur proie/environnement, mouvement ou immobilite, lumiere et brouillard.
- Ces facteurs declenchent des courses aux armements evolutives entre especes.

### 3.3 Techniques de balancement pour creatures procedurales

**Systeme de contraintes :**
- Definir des regles : une creature ne peut pas avoir plus de X membres, un predateur doit avoir au moins un organe sensoriel offensif, etc.
- Toute valeur aleatoire des parametres doit produire une creature valide.

**Randomisation ponderee :**
- Assigner des poids differents aux resultats possibles pour influencer la probabilite d'occurrence.
- Les combinaisons dangereuses (haute vitesse + haute resistance) ont des poids plus faibles.

**Balancement par frequence :**
- Au lieu d'ajuster les capacites directement, ajuster la **frequence de spawn** : les creatures puissantes sont rares, les faibles sont communes.
- S'integre naturellement avec un systeme d'ecosysteme.

**Interpolation de templates :**
- Selectionner 2-3 templates de reference et interpoler lineairement avec des poids aleatoires entre 0 et 1.
- Garantit que le resultat est toujours "entre" des configurations connues comme valides.

**Budget de points :**
- Chaque creature a un budget de points total (determine par le danger souhaite).
- Chaque trait coute des points : grande taille (cher), vitesse elevee (cher), bonne vision (moyen), sens olfactif (pas cher).
- Le budget empeche les creatures d'etre bonnes en tout.

### 3.4 Application a Cauchemar : schema propose

Pour des creatures uniques par planete avec des traits coherents :

```
PIPELINE DE GENERATION DE CREATURE :
1. Seed planete → generateur deterministe
2. Selection biome → pool de templates morphologiques adaptes
3. Selection niche ecologique → predateur/charognard/embuscade/meute + regime alimentaire
4. Generation morphologique → assemblage de parties + parametres + contraintes
5. Derivation sensorielle → la morphologie determine les sens (yeux → vision, grandes oreilles → audition, antennes → olfaction)
6. Generation comportementale → les sens + la niche determinent l'IA
7. Generation visuelle → mesh + texture + materiaux
8. Balancement → budget de points + contraintes + frequence de spawn
```

---

## 4. Textures et materiaux generes par IA

### 4.1 Ubisoft CHORD : le standard open-source (SIGGRAPH Asia 2025)

**CHORD (Chain of Rendering Decomposition)** est le modele de reference pour la generation PBR :

**Pipeline en 3 etapes :**
1. **Generation de texture** : cree des textures 2D seamless/tileable depuis des prompts ou references (modeles de diffusion).
2. **Estimation de materiaux CHORD** : convertit la texture en maps PBR completes par decomposition chainee — **base color, normal, height, roughness, metalness**.
3. **Upscaling** : ameliore la resolution 1024 de CHORD a **2K/4K** pour production.

**Disponibilite** : open source, nodes ComfyUI, poids du modele publics. Licence Ubisoft Machine Learning (Research-Only - Copyleft).

### 4.2 Stable Diffusion pour textures PBR

**Workflow detaille (Casey Primozic)** :

- **Modele** : Stable Diffusion XL
- **Parametres cles** : Sampling Euler, 60 steps, 1024x1024, CFG Scale 6.5 (critique), **Tiling active** (les images changent significativement avec le tiling active).
- **Scaling** : outil custom combine 4 textures 1K similaires en un resultat 4K seamless, plutot que l'upscaling traditionnel.
- **Maps PBR** : generees par Poly (IA, genere normal/height/AO/metalness/roughness depuis l'image) ou SmartNormap (programmatique, qualite inferieure).
- **Tiling avance** : algorithme hex-tiling via Three.JS pour un tiling infini sans repetition.

### 4.3 Outils commerciaux

**Scenario** (mis a jour mars 2026) :
- Modeles specialises : Realistic Textures 2.0, Hand-Painted Textures, Lineart Textures, modeles custom (10-50 images d'entrainement).
- Parametres : Texture Count 1-8, Sampling Steps (28 pour Flux), Guidance (~3.5 Flux, ~6 SDXL).
- Maps PBR completes : height, normal, metallic, edge, ambient occlusion — alignees pour fonctionner ensemble.
- Previsualization 3D integree : test sur sphere, plan, cube, cylindre.
- Export vers Unity/Unreal.

**3D AI Studio** :
- Generateur PBR gratuit : normal, roughness, height maps depuis une image.

**WithPoly** :
- Materiaux complets : color map, normal map, height map, AO map, roughness map.

### 4.4 Deep Style Transfer pour textures de creatures (Source of Madness)

Source of Madness utilise le **Deep Style Transfer** dans son pipeline de textures :
- Permet d'habiller les creatures et le monde dans differents skins/styles avec differentes proprietes tout en gardant la coherence.
- Le style est "bake" dans le pipeline de textures, pas applique en post-process.

### 4.5 Application a Cauchemar

**Approche recommandee :**
- **Generation offline** : utiliser CHORD ou Stable Diffusion XL pour generer des **bibliotheques de textures PBR** (peau, ecailles, chitine, membrane, os, chair) taguees par type de surface.
- **Assemblage runtime** : combiner les textures selon la morphologie de la creature generee, avec variation de teinte/saturation per-planete via shader.
- **Texture procedurale par shader** : pour les details (veines, cicatrices, taches), des shaders proceduraux dans Godot sont plus performants que des textures pre-generees.
- **Deep Style Transfer** optionnel : pour donner a chaque planete un "style" visuel distinct affectant toutes les creatures.

---

## 5. Jeux existants avec creatures procedurales : analyse technique

### 5.1 No Man's Sky

| Aspect | Detail technique |
|---|---|
| **Methode** | Composition modulaire : templates (silhouettes artistes) + descriptor pools (pieces taggees) + assemblage probabiliste |
| **Squelette** | Ajuste dynamiquement a la morphologie assemblee |
| **Textures** | Modulaires, multiples par piece, combinees pour le diffuse final |
| **Comportement** | Tags → affinites → attraction/repulsion d'objets tagges |
| **Scalabilite** | Doubler les assets multiplie les combinaisons par centaines |
| **Algorithme** | Superformula de Gielis pour les formes biologiques |

### 5.2 Spore

| Aspect | Detail technique |
|---|---|
| **Mesh** | Metaballs (surface implicite, polynome ordre 4) + Rigblocks (pieces artisanales) |
| **Tessellation** | Moore & Warren (Graphics Gems III), evite les artefacts de Marching Cubes |
| **UV** | Automatique en 10ms : inondation par direction cardinale, projection planaire, packing zig-zag |
| **Texture** | Particules en coordonnees barycentriques, 3 couches (base, motif, detail) |
| **Animation** | Canaux + queries + regles de generalisation + jiggles physiques |
| **IA** | Behavior Trees (adaptation Halo v1.5), FSM ameliore |
| **Retargeting** | "Real-time Motion Retargeting to Highly Varied User-Created Morphologies" (SIGGRAPH 2008) |

### 5.3 Rain World

| Aspect | Detail technique |
|---|---|
| **Animation** | Points connectes dans l'espace + paper doll visuelle par-dessus |
| **Physique** | Chaque membre a poids et amplitude de mouvement propres |
| **Creature** | Souple, pliable, navigue n'importe quel environnement |
| **Ecosysteme** | Comportements emergents : predation, piege, utilisation d'outils par l'IA |
| **Design** | "Knowledge-based gameplay" : le joueur apprend les mecaniques par essai-erreur |

### 5.4 Dwarf Fortress (Forgotten Beasts)

| Aspect | Detail technique |
|---|---|
| **Generation** | Script Lua : `build_procgen_creature()` depuis des composants aleatoires |
| **Forme** | Animal de base + quirk (deviation) + materiau + capacite speciale |
| **Materiau** | De vapeur (inoffensif) a acier (devastateur) — determine directement la puissance |
| **Attaques** | Syndromes generes aleatoirement avec symptomes uniques |
| **Taille** | Minimum 10M unites DF, pas de maximum |

### 5.5 Source of Madness

| Aspect | Detail technique |
|---|---|
| **Mesh** | Monster Stitcher : bibliotheques de parties + setups de configuration |
| **Animation** | Unity ML-Agents : reseau neuronal apprend le mouvement physique de la creature generee |
| **Textures** | Deep Style Transfer bake dans le pipeline |
| **Permutations** | Theoriquement des milliards de combinaisons |
| **Approche** | 100% procedurale : pas de creature pre-concue, tout est aleatoire |

### 5.6 Ecosystem (jeu Steam)

| Aspect | Detail technique |
|---|---|
| **Genome** | ADN numerique encode morphologie + structure cerebrale |
| **Cerveau** | Pipeline neuronal : organes sensoriels → neurones → contraction musculaire |
| **Physique** | Torque aux articulations, poussee contre l'eau — pas d'animations |
| **Evolution** | Mutation heritable + selection naturelle reelle |
| **Ecologie** | Detection visuelle parametrique (cone, couleur, mouvement, lumiere) |

### 5.7 Creatures (serie de jeux, 1996-2001)

| Aspect | Detail technique |
|---|---|
| **Cerveau** | Un des premiers jeux commerciaux avec reseaux neuronaux et biochimie simulee |
| **Sens** | Simulation de vue, ouie, toucher |
| **Organes** | Determines par la genetique, mutation et blessure peuvent les rendre non-fonctionnels |
| **Evolution** | Genetique heritable avec mutation |

---

## 6. Lien entre forme physique et comportement IA

### 6.1 Etat de la recherche

C'est le domaine le plus prometteur et le moins explore commercialement. La recherche montre clairement que **morphologie et comportement sont difficiles a separer conceptuellement** (Lai, 2021, Computer Graphics Forum).

**Karl Sims (1994)** a demontre que quand on co-evolue morphologie et controleur neuronal :
- Des capteurs (contact, photosenseurs) sont integres aux joints.
- Le reseau neuronal recoit ces inputs et produit des torques.
- La morphologie et le comportement co-evoluent : une creature avec de longues pattes evolue naturellement un pattern de marche adapte.
- **Probleme identifie** : le "body-brain mismatch" — chez les enfants, meme si les parents ont des corps et cerveaux bien adaptes, la recombinaison genetique peut produire un corps incompatible avec son controleur.

**Spore (2008)** : "chaque choix que le joueur fait pour designer l'apparence de son organisme affecte comment il bouge ou interagit avec les autres."

**Ecosystem** : "le cerveau est defini comme un systeme dynamique qui prend les inputs des capteurs et sort des valeurs appliquees comme torque aux joints du corps" — lien direct morphologie → detection → comportement.

### 6.2 Application a Cauchemar : schema morphologie → comportement

C'est une opportunite design majeure pour le jeu, directement alignee avec les principes de design existants (les animaux sont honnetes, stimulus → reponse, le joueur peut apprendre les regles). Voici un schema concret :

**Table de derivation sensorielle :**

| Trait morphologique | Capacite IA derivee | Implication gameplay |
|---|---|---|
| Grands yeux | Vision etendue (large cone, longue portee) | Le joueur doit se cacher derriere des obstacles |
| Pas d'yeux | Aucune detection visuelle | Le joueur peut etre en pleine vue s'il est silencieux |
| Grandes oreilles / organes acoustiques | Detection sonore superieure (large rayon, haute sensibilite) | Le joueur doit marcher accroupi, eviter de casser des objets |
| Antennes / appendices olfactifs | Detection d'odeur (sang, materiaux vivants) a longue distance | Les blessures saignantes deviennent mortellement dangereuses |
| Vibrisses / poils sensoriels | Detection de vibrations au sol (pas, course) | L'immobilite est la seule protection |
| Membres longs / corps effile | Vitesse de deplacement elevee | La fuite en ligne droite est inutile |
| Corps massif / trapu | Vitesse faible mais degats et resistance eleves | Le joueur peut le distancer mais pas le bloquer |
| Multiples membres | Capacite d'escalade, passage par des ouvertures | Les passages etroits ne sont plus surs |
| Ailes / membranes | Deplacement aerien, patrouille en hauteur | Le joueur ne peut pas se cacher sur les toits |
| Bioluminescence | Illumination de zone — la creature est sa propre source de lumiere | Le joueur la voit venir, mais elle elimine l'obscurite protectrice |
| Coloration cryptique | Camouflage environnemental | La creature est invisible jusqu'au dernier moment |
| Mandibules / dents elongees | Mode d'attaque embuscade (one-shot grapple) | Detection de la menace avant qu'elle ne soit en range |
| Queue prehensile | Capacite a attraper dans un rayon etendu | Distance de securite augmentee necessaire |

**Implementation technique proposee :**

```gdscript
# Pseudo-code GDScript pour derivation morphologie → IA
class CreatureTraits:
    var eye_size: float      # 0.0 = pas d'yeux, 1.0 = yeux enormes
    var ear_size: float      # 0.0 = pas d'oreilles, 1.0 = oreilles enormes
    var nose_size: float     # 0.0 = pas d'olfaction, 1.0 = olfaction extreme
    var leg_length: float    # affecte vitesse
    var body_mass: float     # affecte resistance et vitesse inverse
    var limb_count: int      # affecte modes de deplacement
    var has_wings: bool
    var has_bioluminescence: bool
    var camouflage: float    # 0.0 = aucun, 1.0 = parfait

func derive_ai_parameters(traits: CreatureTraits) -> AIConfig:
    var config = AIConfig.new()
    config.vision_range = lerp(0.0, MAX_VISION, traits.eye_size)
    config.vision_cone = lerp(30.0, 180.0, traits.eye_size)
    config.hearing_range = lerp(0.0, MAX_HEARING, traits.ear_size)
    config.hearing_sensitivity = traits.ear_size
    config.smell_range = lerp(0.0, MAX_SMELL, traits.nose_size)
    config.move_speed = traits.leg_length * (1.0 / max(traits.body_mass, 0.1))
    config.can_climb = traits.limb_count >= 6
    config.can_fly = traits.has_wings
    config.detection_by_light = not traits.has_bioluminescence
    config.stealth_rating = traits.camouflage
    return config
```

### 6.3 LLMs pour generation de descriptions et lore

Les LLMs (GPT, Claude, etc.) peuvent etre utilises dans le pipeline de generation :
- **Input** : parametres morphologiques generes + biome + niche ecologique.
- **Output** : nom d'espece, description pour la base de donnees du scanner, details ecologiques, avertissements.
- **Usage dans CALYPSO** (D&D) : les LLMs generent des rencontres, brainstorment des idees, mais peuvent halluciner (ailes sur des creatures sans ailes).
- **Pour Cauchemar** : utiliser le LLM **en pre-generation** (pas en runtime) pour creer les fiches du scanner et les descriptions que le joueur decouvre progressivement. La generation deterministe garantit que les descriptions correspondent toujours a la creature reelle.

---

## 7. Synthese et recommandations pour Cauchemar

### 7.1 Architecture recommandee

```
PIPELINE COMPLET :

[PHASE 1 : PRE-GENERATION (serveur/offline)]
Seed planete
    → Parametres planetaires (biomes, atmosphere, gravite, luminosite)
    → Generateur d'ecosysteme :
        → Nombre d'especes (3-8 par planete)
        → Niche de chaque espece (predateur apex, meute, embuscade, charognard, etc.)
        → Budget de points par espece (determine par niche + difficulte planete)
    → Generateur morphologique par espece :
        → Selection template de base (quadrupede, insectoide, serpentin, amorphe, etc.)
        → Parametres morphologiques (106+ parametres style Rune Johansen)
        → Assemblage de pieces (style No Man's Sky, bibliotheque d'assets)
        → Contraintes de validite (toute combinaison doit etre valide)
    → Derivation sensorielle (morphologie → capacites de detection)
    → Derivation comportementale (sens + niche → parametres IA)
    → Generation mesh (assemblage modulaire + metaballs pour jointures)
    → Auto-rigging (UniRig ou systeme custom)
    → Generation texture (bibliotheque PBR + variations par shader)
    → Generation fiche scanner (LLM optionnel)

[PHASE 2 : RUNTIME (client Godot)]
Seed planete (identique pour tous les joueurs)
    → Regeneration deterministe des memes creatures
    → Skeleton3D + ArrayMesh proceduraux
    → Animation procedurale : FABRIK IK + locomotion + physics jiggles
    → IA basee sur les parametres derives de la morphologie
    → Comportements emergents (stimulus → reponse)
```

### 7.2 Pile technologique recommandee

| Composant | Outil/Technique | Raison |
|---|---|---|
| **Mesh creatures** | Assemblage modulaire (pieces artisanales) + jointures par metaballs/marching cubes | Controle artistique + variete infinie. Fiabilite prouvee (No Man's Sky) |
| **Rigging** | UniRig (open source, SIGGRAPH 2025) ou rigging procedural custom dans Godot via Skeleton3D API | Automatique, gere les morphologies non-standard |
| **Animation** | FABRIK IK + locomotion procedurale (foot placement + gaits parametriques) | Performant, adaptatif a toute morphologie. Reference : Rune Johansen |
| **Textures** | Bibliotheque PBR pre-generee (CHORD/Stable Diffusion) + variation par shader runtime | Qualite PBR sans cout runtime de generation |
| **Traits/Stats** | Systeme de contraintes + budget de points + derivation morphologie → IA | Balance garantie, coherence physique → comportement |
| **IA comportement** | Behavior Trees (Godot natif) avec parametres derives de la morphologie | Lisible, debuggable, scalable. Reference : Spore |
| **Ecosysteme** | Niches predefinies + frequence de spawn + interactions predateur/proie | Ecosystemes credibles sans simulation evolutive runtime |
| **Mesh dans Godot** | ArrayMesh + SurfaceTool pour generation statique, ImmediateMesh pour debug | API native Godot, pas de dependance externe |
| **Lore/descriptions** | LLM en pre-generation (optionnel) | Fiches scanner riches sans ecriture manuelle de milliers de descriptions |

### 7.3 Risques et mitigations

| Risque | Impact | Mitigation |
|---|---|---|
| Creatures generees qui paraissent generiques/similaires | Reduit l'horreur et l'interet | Garantir au minimum 1 trait visuellement unique et saillant par espece (bioluminescence, nombre de membres aberrant, materiau inhabituel) |
| Performance du mesh procedural en multijoueur | Lag/stutter quand les creatures sont generees | Pre-generer les meshes au chargement de la mission, pas en runtime dynamique |
| Rigging automatique qui produit des deformations aberrantes | Brise l'immersion | Tester rigoureusement sur toutes les combinaisons de templates + fallback sur des squelettes pre-definis par template |
| Animations procedurales non-naturelles (uncanny valley) | Plus ridicule qu'effrayant | Privilegier des mouvements lents et deliberes (plus facile a reussir en IK, plus effrayant) |
| Desequilibre des creatures (trop fortes ou trop faibles) | Frustration ou ennui | Budget de points strict + tests automatises sur les combinaisons extremes |
| Synchronisation multijoueur des creatures procedurales | Creatures differentes entre les clients | Meme seed → generation deterministe identique sur tous les clients |

---

## Sources

### Generation de mesh et modeles 3D
- [Procedural creature progress 2021-2024 - Rune Johansen](https://blog.runevision.com/2025/01/procedural-creature-progress-2021-2024.html)
- [How the Spore Creature Creator Works - Rempton Games](https://remptongames.com/2022/08/07/how-the-spore-creature-creator-works/)
- [My Liner Notes for Spore - Chris Hecker](https://chrishecker.com/My_Liner_Notes_for_Spore)
- [What the code of No Man's Sky says about procedural generation - Game Developer](https://www.gamedeveloper.com/programming/what-the-code-of-i-no-man-s-sky-i-says-about-procedural-generation)
- [Procedural Creature Generation and Animation for Games - Alex Christo (MSc Thesis)](https://nccastaff.bournemouth.ac.uk/jmacey/MastersProject/MSc22/01/ProceduralCreatureGenerationandAnimationforGames.pdf)

### Outils IA de generation 3D
- [Best AI 3D Model Generators for Game Developers 2025 - The Tool Nerd](https://www.thetoolnerd.com/p/the-best-ai-3d-model-generators-for)
- [Can AI Generate Game-Ready 3D Models in 2026? - 3D AI Studio](https://www.3daistudio.com/3d-generator-ai-comparison-alternatives-guide/can-ai-generate-game-ready-3d-models)
- [Tripo3D Features - AI Auto-Rigging](https://www.tripo3d.ai/features/ai-auto-rigging)
- [Meshy AI API Platform](https://www.meshy.ai/api)
- [OpenAI Shap-E - GitHub](https://github.com/openai/shap-e)

### Rigging automatique
- [UniRig: One Model to Rig Them All (SIGGRAPH 2025) - GitHub](https://github.com/VAST-AI-Research/UniRig)
- [VAST/Tripo Introduces UniRig](https://www.tripo3d.ai/blog/unrig-automated-3d-rigging)

### Animation procedurale
- [GDC Vault - Rain World Animation Process](https://www.gdcvault.com/play/1023475/Animation-Bootcamp-Rainworld-Animation)
- [Exploring procedural design in Rain World: The Watcher - Unity](https://unity.com/blog/exploring-procedural-design-rain-world)
- [Recreating Rain World's 2D Procedural Animation - Merxon22](https://medium.com/@merxon22/recreating-rainworlds-2d-procedural-animation-part-1-4d882f947e9f)
- [FABRIK: A fast, iterative solver for Inverse Kinematics](https://andreasaristidou.com/FABRIK)
- [An Introduction to Procedural Animations - Alan Zucconi](https://www.alanzucconi.com/2017/04/17/procedural-animations/)
- [Cascadeur - AI-Assisted Animation](https://cascadeur.com/)

### Textures et materiaux IA
- [Ubisoft CHORD Model - ComfyUI Nodes](https://blog.comfy.org/p/ubisoft-open-sources-the-chord-model)
- [Ubisoft CHORD - GitHub](https://github.com/ubisoft/ubisoft-laforge-chord)
- [Generating 4K PBR Textures Using Stable Diffusion XL - Casey Primozic](https://cprimozic.net/notes/posts/generating-textures-for-3d-using-stable-diffusion/)
- [AI Texture Generation for Game-Ready PBR Materials - Scenario](https://www.scenario.com/blog/ai-texture-generation)

### Ecosystemes et creatures evolutives
- [Ecosystem Game](https://www.ecosystem-game.com/)
- [Karl Sims - Evolved Virtual Creatures (1994)](https://www.karlsims.com/evolved-virtual-creatures.html)
- [Virtual Creature Morphology - A Review (Lai, 2021)](https://onlinelibrary.wiley.com/doi/10.1111/cgf.142661)
- [Forgotten Beast - Dwarf Fortress Wiki](https://dwarffortresswiki.org/index.php/Forgotten_beast)

### Creatures procedurales dans les jeux horror
- [Source of Madness - Procedural Monsters](https://premortem.games/2022/06/13/fear-the-procedural-generated-monsters-of-source-of-madness/)

### Godot Engine
- [Procedural Geometry - Godot Documentation](https://docs.godotengine.org/en/stable/tutorials/3d/procedural_geometry/index.html)
- [Skeleton3D - Godot Documentation](https://docs.godotengine.org/en/stable/classes/class_skeleton3d.html)
- [Marching Cubes for Godot - GitHub](https://github.com/daltoncoder/marching-cubes-godot)
- [Metaballs for mesh generation - Godot Forum](https://forum.godotengine.org/t/metaballs-for-mesh-generation-spore-creature-creator/92992)
- [Procedural Generation of Skeleton3D - Godot Forum](https://forum.godotengine.org/t/procedural-generation-of-skeleton3d/83911)

### LLMs et generation de contenu
- [Large Language Models and Games: A Survey and Roadmap](https://arxiv.org/html/2402.18659v1)
- [Procedural Content Generation via Generative AI](https://arxiv.org/html/2407.09013v1)
