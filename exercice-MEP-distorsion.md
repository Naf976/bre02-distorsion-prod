# Exercice Mise En Production du projet Distorsion

## Le but
L'objectif de cet exercice est de mettre en ligne votre projet Distorsion sur un serveur de production différent de celui de votre IDE.
## Étape 0
- Faites un fork de votre projet de groupe Distorsion sur GitHub, appelez-le `bre02-php-mep-distorsion`
- Clonez le dans le dossier `sites/php` de votre IDE.

## Étape 0 - bis

Créez un compte sur https://www.planethoster.com/fr/World-Lite avec votre adresse e-mail 3WA en choissisant `France + Switzerland` et un nom de domaine format `bre02-VOTRELOGIN-distorsion.go.yj.fr`

Confirmez via SMS votre création de compte.

Et rendez-vous sur `http://bre02-VOTRELOGIN.go.yj.fr` pour vérifier si la page de bienvenue de PlanterHoster s'affiche sur votre nom de domaine.

## Étape 1 - Récupération des sources du projet

Récupérez les sources de votre précédent projet de groupe Distorsion :
- le code source versionné (sans `database.txt`)
- et un export de la base de données

Et installez à nouveau le projet, cette fois dans `bre02-php-mep-distorsion` :
- création d'une nouvelle base de données (en y important les données précédemment exportées)
- remettez en place le code source du projet dans ce nouvel espace
- créez un nouveau fichier `database.txt` adapté à ce nouveau contexte

Enfin assurez-vous que le projet est toujours fonctionnel dans ce nouvel espace de travail.

## Étape 2 - Création du .env

Dans le dossier `./config` de votre projet créez un fichier `.env` et assignez des variables d'environnement équivalentes à celles définies dans votre fichier `database.txt`.

## Étape 3 - Modification de la récupération des informations de connexion

Au lieu de récupérer les informations de connexion à partir du fichier `database.txt`, utilisez vos variables d'environnement à partir de votre fichier `.env`.

Une fois cette opération effectuée, supprimez le fichier database.txt et ajoutez .env dans le fichier .gitignore de votre projet.
## Étape 4 - Configuration du compte FTP PlanetHoster The World

1. Connectez-vous à votre espace PlanetHoster nouvellement créé.
2. Accédez à la gestion de votre hébergement : `Hébergement web` > `Gestion des comptes` > `Cliquez sur la vignette de l'hébergement`.
3. Une fois dans l'espace d'administration de votre hébergement, créez un compte d'accès FTP : `Fichiers` > `Comptes FTP` > `Créer` :
   - Adresse de courriel : `distorsion@votrenomdedomaine`
   - Générez et conservez votre mot de passe.
   - Laissez le répertoire vide.
4. Une fois le compte créé, affichez les informations de connexion en cliquant sur l'icône "i" sur la ligne du compte (cela pourra vous être utile).

## Étape 5 - Configuration de la base de données de production

### Etape 5.1 - Création de la base
1. Toujours dans votre gestion d'hébergement allez dans `Bases de données` > `Bases de données SQL`
2. Créez une nouvelle base :
   - nommée `distorsion` 
   - et cochez `Créer un utilisateur` 
   - pour créer un utilisateur `VOTRELOGIN`
   - générez un mot de passe et conservez-le
   - accordez tous les privilèges à votre utilisateur

### Etape 5.2 - Importation des données
1. Rendez-vous dans `Bases de données` > `PhpMyAdmin`
2. Dans votre export de données (Étape 1), vérifiez si il y a la présence d'url ou de chemin "en dur" (ou toute donnée liée à l'environnement local de votre projet) dans les données de votre base (ex: `https://localhost:8000/` devient `http://bre02-VOTRELOGIN.go.yj.fr/`)
3. Importez dans votre base de données de production les données du projet Distorsion.


## Étape 6 - Dépôt du code source via FileZilla

### Étape 6.1 - Préparation des sources
1. Préparez une version de production de votre code source du projet Distorsion
   - adaptez les données de votre projet au contexte de production (changement des identifiants de connexion à la base de données, adaptation du .env et du code source)

### Étape 6.2 - Transfert  des sources
1. Connectez-vous via vos accès FTP à votre hébergement depuis FileZilla.
2. Transférez manuellement les sources précédemment adaptée au contexte de production vers votre hébergement.
3. Adapter les droits d'accès via l'interface de FileZilla pour éviter que n'importe quel utilisateur puisse consulter les fichiers sensibles. 

## Étape 7 - Testing
Vérifiez que votre application fonctionne correctement (messages d'erreur dans la console, problème d'accès, problème d'affichage, mauvais comportement, ...).

Et quelle se connecte à la bonne base de données (par exemple).

> #### Liens utiles :
> Documentation FileZilla : https://wiki.filezilla-project.org/Documentation

## Étape Bonus - .htaccess
Créez un fichier `.htaccess` à la racine de votre projet en ligne pour le sécuriser d'avantage et réécrire les url `/index.php` en `/`.
> #### Liens utiles pour le bonus :
> Documentation Apache sur le .htaccess : https://httpd.apache.org/docs/2.4/howto/htaccess.html (bon courage)
