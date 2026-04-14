# Biomes

## Résumé

Les biomes définissent le type d'environnement dans lequel une mission se déroule. Chaque planète possède un ou plusieurs biomes. Lors de la génération d'une mission, le biome est sélectionné en fonction du point choisi sur la planète. Chaque biome a ses propres caractéristiques visuelles, sa faune associée, ses matériaux spécifiques, ses dangers, et ses implications gameplay (type de cachettes disponibles, visibilité, navigation).

## Principes de design

- Chaque biome crée une **expérience de peur différente** : claustrophobie en forêt, agoraphobie en prairie, vertige en montagne.
- Le biome détermine les **options de survie** du joueur : types de cachettes, chemins de fuite, repères visuels.
- Un joueur habitué à un biome sera **déstabilisé** dans un autre : ses réflexes ne s'appliquent plus.
- Les biomes sont des **écosystèmes cohérents** : la faune, la flore, les matériaux et les conditions sont liés logiquement.

---

## Liste des biomes

### Forêt

- **Visuel** : arbres denses, canopée qui filtre la lumière, sous-bois, mousse, champignons.
- **Visibilité** : moyenne de jour (les arbres bloquent la vue à distance), très faible de nuit.
- **Cachettes** : troncs creux, buissons denses, derrière les arbres, sous les racines.
- **Navigation** : difficile. Peu de repères à distance. Le joueur peut facilement tourner en rond.
- **Sons d'ambiance** : craquements de branches, vent dans les feuilles, oiseaux (si faune passive), gouttes de pluie sur la canopée.
- **Danger spécifique** : les créatures peuvent se cacher aussi bien que le joueur. La végétation dense masque les mouvements. Les embuscades sont fréquentes.
- **Matériaux typiques** : bois, plantes médicinales, champignons, résine, fibres végétales.
- **Bordure** : végétation de plus en plus dense jusqu'à devenir impénétrable. Arbres tombés, ronces.

### Prairie / Plaine

- **Visuel** : herbes hautes, terrain plat ou vallonné, ciel ouvert.
- **Visibilité** : élevée de jour (on voit loin), variable selon la hauteur de l'herbe.
- **Cachettes** : très rares. Se coucher dans les herbes hautes, derrière des rochers isolés.
- **Navigation** : facile. Beaucoup de repères à distance (montagnes, structures).
- **Sons d'ambiance** : vent dans les herbes, insectes, craquement de tiges.
- **Danger spécifique** : le joueur est **très exposé**. Peu d'endroits pour se cacher. Les créatures aussi voient loin. Si une créature te repère, la fuite en terrain ouvert est une course de vitesse pure.
- **Matériaux typiques** : plantes, minerais de surface, insectes (matériaux vivants).
- **Bordure** : crevasses, rivières larges, descente vers un océan, changement brutal de biome.

### Montagne

- **Visuel** : rochers, pentes, falaises, passages étroits, grottes.
- **Visibilité** : variable. Vue dégagée en hauteur, nulle dans les passages et les gorges.
- **Cachettes** : crevasses, surplombs, derrière les rochers, grottes.
- **Navigation** : complexe. Beaucoup de verticalité. Les passages ne sont pas évidents. Le joueur peut se retrouver bloqué par une falaise.
- **Sons d'ambiance** : vent fort, pierres qui roulent, écho.
- **Danger spécifique** : les chutes. Un joueur poussé ou surpris près d'un rebord peut tomber (blessure jambe, blessure grave, ou mort directe selon la hauteur). Les passages étroits sont des **kill zones** : pas d'esquive possible.
- **Matériaux typiques** : minerais, cristaux, métaux rares (en altitude ou en profondeur).
- **Bordure** : falaises verticales, éboulis infranchissables, parois rocheuses.

### Marécage

- **Visuel** : eau stagnante, boue, végétation basse et éparse, brume, arbres morts.
- **Visibilité** : faible (brume permanente, végétation irrégulière).
- **Cachettes** : derrière les arbres morts, dans les roseaux, sous la surface de l'eau (risqué — modules perturbés).
- **Navigation** : très difficile. Le terrain est trompeur : ce qui semble solide peut être de la boue profonde. Le joueur s'enfonce et ralentit.
- **Sons d'ambiance** : bulles dans l'eau, insectes, clapotis, branches qui craquent dans l'eau.
- **Danger spécifique** : l'eau perturbe la plupart des modules de la combinaison. Le joueur ralentit dans la boue. Les créatures aquatiques ou semi-aquatiques sont chez elles. Le terrain lui-même est un ennemi.
- **Matériaux typiques** : plantes aquatiques, composants chimiques (gaz des marais), organismes vivants, boue spéciale.
- **Bordure** : eau de plus en plus profonde, boue qui enlise complètement.

### Désert

- **Visuel** : sable, rochers, dunes, soleil intense ou froid intense (désert chaud ou froid).
- **Visibilité** : très élevée de jour. Mirages possibles (fausses informations visuelles). Tempêtes de sable réduisent drastiquement la visibilité.
- **Cachettes** : quasi inexistantes en surface. Derrière des dunes (temporaire). Structures ensablées. Grottes souterraines.
- **Navigation** : trompeuse. Les dunes se ressemblent toutes. Sans boussole, le joueur est perdu en quelques minutes.
- **Sons d'ambiance** : vent, sable qui glisse, silence pesant.
- **Danger spécifique** : l'exposition. Pas de couvert, pas de cachette évidente. La chaleur/le froid affecte les modules. Les tempêtes de sable arrivent sans prévenir et coupent toute visibilité. Les créatures désertiques s'enfouissent dans le sable.
- **Matériaux typiques** : minerais cristallins, fossiles, matériaux vitrifiés, composants rares en profondeur.
- **Bordure** : tempête de sable permanente, dunes instables qui s'effondrent, terrain impossible.

### Toundra / Glaciaire

- **Visuel** : neige, glace, terrain plat ou vallonné, ciel bas, formations de glace.
- **Visibilité** : bonne si ciel dégagé. Nulle en blizzard.
- **Cachettes** : formations de glace, congères, crevasses (dangereuses).
- **Navigation** : les traces dans la neige sont visibles (le joueur ET les créatures laissent des traces). Glace glissante (risque de chute).
- **Sons d'ambiance** : vent glacial, craquements de glace, silence.
- **Danger spécifique** : le froid affecte les modules (vision nocturne ralentie, thermique faussée). Les traces dans la neige rendent le joueur **traçable** par les créatures. Le blizzard est dévastateur (visibilité nulle, froid intense). La glace peut céder sous le poids.
- **Matériaux typiques** : cristaux de glace, minerais gelés, organismes cryogéniques.
- **Bordure** : crevasses profondes, glace trop fine, blizzard permanent.

### Volcanique

- **Visuel** : roche noire, lave (refroidie ou active), vapeur, cendres, geysers.
- **Visibilité** : variable. Fumée et vapeur réduisent la visibilité. Lueur de lave de nuit.
- **Cachettes** : formations de lave refroidie, tubes de lave, rochers.
- **Navigation** : dangereuse. Zones de chaleur extrême, fissures, geysers imprévisibles.
- **Sons d'ambiance** : grondements souterrains, sifflements de vapeur, craquements de roche.
- **Danger spécifique** : la chaleur. Les matériaux brûlants sont omniprésents. La vision thermique est inutile (tout est chaud). Les geysers peuvent jaillir sans prévenir. La lave active est mortelle.
- **Matériaux typiques** : minerais volcaniques, métaux rares formés par la chaleur, cristaux de basalte.
- **Bordure** : coulées de lave actives, fissures profondes émettant de la chaleur mortelle.

---

## Biomes multiples dans une même zone

Certaines zones de mission pourraient contenir des **transitions de biomes** — par exemple, une zone de forêt qui descend vers un marécage, ou une prairie qui mène à des montagnes. Cela dépend de la planète et de la taille de la zone.

Les transitions de biomes sont des **zones de gameplay intéressantes** : les règles changent progressivement, les créatures d'un biome ne suivent pas forcément dans l'autre, et le joueur doit adapter sa stratégie.

---

## Interactions avec les autres systèmes

- **Génération** : le biome est le paramètre principal de la génération de terrain.
- **Faune** : chaque biome a ses espèces associées.
- **Matériaux** : chaque biome a ses matériaux spécifiques.
- **Combinaison** : les conditions du biome affectent les modules (eau, froid, chaleur, sable).
- **Navigation** : chaque biome a ses propres défis de navigation et ses repères.
- **Design sonore** : chaque biome a son ambiance sonore propre.

---

## Points ouverts

- Combien de biomes au lancement du jeu ?
- Des biomes "exotiques" sont-ils prévus (cristallin, organique/chair, spatial/astéroïde) ?
- La génération peut-elle mixer des biomes dans une même zone, ou est-ce un seul biome par mission ?
- Comment gérer les transitions de biome de manière naturelle ?
- Les biomes ont-ils une influence sur la difficulté de la mission (un marécage est-il intrinsèquement plus dur qu'une prairie) ?
