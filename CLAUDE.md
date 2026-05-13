# Cauchemar — Game Design Document

## Projet

Cauchemar est un jeu d'horreur coopératif (1-8 joueurs) avec des missions sur des planètes générées procéduralement. Le joueur est impuissant face aux menaces : pas d'armes, fuir ou se cacher uniquement.

## Structure du dépôt

Le dépôt est organisé en trois espaces principaux :

- `game/` — Projet Godot 4 (contient `project.godot`). Toute la logique, les scènes et les assets importés par Godot vivent ici.
- `source_assets/` — Fichiers sources bruts (`.blend`, `.psd`, audio non compressé, références…) **hors** du projet Godot, pour ne pas alourdir son pipeline d'import. Exportés vers `game/` sous forme utilisable (`.gltf`, `.png`, `.ogg`).
- `docs/` — Documentation de design (GDD).

### Organisation du projet Godot (`game/`)

Le code et les assets sont organisés **par feature** (domaine gameplay), pas par type de fichier. Chaque feature contient tout ce qui lui est propre : scènes, scripts, modèles, textures, sons, classes `Resource` et instances `.tres`. Pas de dossier central `scripts/`, `assets/`, `resources/`, `autoloads/` — chaque chose vit dans la feature à laquelle elle appartient.

- `game/addons/` — Plugins Godot (emplacement imposé par l'éditeur).
- `game/player/` — Joueur : combinaison, visière/HUD diégétique, inventaire, navigation.
- `game/creatures/` — Faune : animaux, espèces conscientes, parasites.
- `game/sandbox/` — Scènes de test / prototypage (dev uniquement, hors build final).

De nouvelles features seront ajoutées au fur et à mesure (ex : `world/`, `missions/`, `ship_station/`, `systems/`…). Un dossier `shared/` ne sera créé que si une ressource est vraiment partagée entre plusieurs features. Les autoloads sont des scripts vivant dans leur feature, simplement référencés dans `project.godot`.

## Documentation de design

Toute la documentation de design du jeu se trouve dans `docs/`. Voici la structure :

### Vue d'ensemble
- `docs/00_vision.md` — Vision du jeu, piliers de design, références, principes transversaux

### Structure et progression
- `docs/01_structure_de_jeu.md` — Les 3 espaces (station, vaisseau, mission), boucle de jeu, portail, décollage
- `docs/02_missions.md` — Types de missions (cargo, sauvetage, scientifique, investigation), temps imparti, événements dynamiques, pacing, récompenses

### Le joueur
- `docs/03_joueur/03a_combinaison.md` — Combinaison modulaire, modules (visière, comm, protection), états (fonctionnel/perturbé/endommagé/détruit), perte à la mort
- `docs/03_joueur/03b_blessures_et_mort.md` — Blessures localisées, agonie, mort, réanimation par transfert de conscience (machine + corps receveur), post-mort spectateur, récupération du corps, soins
- `docs/03_joueur/03c_inventaire.md` — Slots, poids/vitesse, matériaux physiques, matériaux dangereux, conteneurs (vaisseau/station)
- `docs/03_joueur/03d_navigation.md` — Boussole, signal vaisseau, tracker, scan de terrain, pas de carte, limites de zone

### Économie
- `docs/04_economie/04a_credits.md` — Gains par mission, bonus collectif, dépenses (consommables, réparations, scans)
- `docs/04_economie/04b_materiaux.md` — Types de matériaux, dangers (brûlant/toxique/radioactif/fragile/vivant), découverte, localisation
- `docs/04_economie/04c_craft.md` — Arbre hiérarchique, craft station vs vaisseau, recettes

### Système de connaissance
- `docs/05_connaissance/05a_scanner.md` — Scanner de visière, scanner planétaire, scan différé, déchiffrage, scans multiples
- `docs/05_connaissance/05b_base_de_donnees.md` — Fiches d'espèces, fiches planétaires, complétude progressive, notes manuelles des joueurs

### Planètes et génération
- `docs/06_planetes/06a_proprietes.md` — Rotation/cycle jour-nuit, atmosphère, météo, événements planétaires
- `docs/06_planetes/06b_generation.md` — Pipeline de génération (7 couches), zone finie, limites naturelles, taille
- `docs/06_planetes/06c_biomes.md` — Forêt, prairie, montagne, marécage, désert, toundra, volcanique

### Faune
- `docs/07_faune/07a_especes_animales.md` — Comportement instinctif, territorialité, stimuli, cycles, modes de chasse, simulation
- `docs/07_faune/07b_especes_conscientes.md` — Intelligence, apprentissage, manipulation, imitation, traque, exploitation de l'agonie, interaction technologie
- `docs/07_faune/07c_parasites.md` — Vecteurs d'infection, progression (contamination → possession), types de possession, traitement

### Systèmes transversaux
- `docs/08_multijoueur.md` — Coop 1-8, portail, décollage, communication, rôle émergent au vaisseau, récupération des corps, caméras
- `docs/09_design_sonore.md` — Sons honnêtes uniquement, ambiance vs gameplay, son spatial, bruit du joueur, son comme outil de survie
- `docs/10_ui_hud.md` — UI diégétique sur la visière, minimalisme, états de la visière (perturbée/endommagée/détruite), sac à dos physique abandonnable, bip de localisation

## Qualité du code GDScript

- Le formatage et le linting GDScript sont gérés par **gdtoolkit** (`gdformat` + `gdlint`), exécutés automatiquement à chaque commit via le hook **pre-commit** (`.pre-commit-config.yaml`).
- La même chaîne est rejouée en CI (`.github/workflows/ci.yml`) sur chaque PR.
- **Ne pas tenter d'installer gdtoolkit, Python ou pipx en local** pour valider manuellement : le hook s'en charge au moment du commit, et la CI confirme.

## Conventions de la documentation

- Chaque document suit la structure : Résumé → Principes de design → Description détaillée → Interactions → Points ouverts
- Les "Points ouverts" en fin de document listent les décisions de design non encore prises
- Les références croisées entre documents utilisent des liens relatifs markdown
- Les informations de design confirmées sont présentées comme des faits. Les hypothèses sont marquées comme "à définir".

## Règles de design fondamentales

Ces règles s'appliquent à **tout** travail sur le projet :

1. Le joueur est **impuissant** : pas d'armes, pas de combat. Fuir ou se cacher.
2. **Aucun son factice** : chaque son a une source réelle dans le monde.
3. **Jamais de mur invisible** : les limites sont toujours du terrain naturel.
4. **Jamais de distance en mètres** affichée au joueur.
5. **Jamais de carte** : le joueur s'oriente par ses sens et ses outils.
6. Les soins complets se font **uniquement à la station**. Retour station = guérison totale.
7. La connaissance est **toujours incomplète** : le scanner, la base de données, le scan planétaire ne disent jamais tout.
8. La mort en mission est **définitive** sauf réanimation par transfert de conscience (machine trouvable dans le niveau + corps receveur, risqué et bruyant).
9. La géographie **ne persiste pas** entre les missions (monde régénéré). Seules les propriétés planétaires persistent.
10. Les **règles physiques s'appliquent à tous** : joueurs et créatures subissent le même monde (chutes, météorites, lave, pièges). Les résistances varient par espèce, mais personne n'est exempt.
