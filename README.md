# CoinCoinsInsolites Application Mobile

## Choix de la technologie et de l'approche

Le projet a été fait en Flutter car ce framework permet, avec un seul code, de déployer sur iOS et Android. Etant une technologie nouvelle, il y a eu la volonté de certain de monter en
compétence dessus.


## Fonctionnalité de l'application

* Création d'un utilisateur via l'API
* Connexion avec un utilisateur via l'API
* Lors de la connexion ou de la création gestion des champs et du type de donnée saisie.
* i18N opérationnelle en anglais et en français en détection automatique de la langue
* Intégration de l'API Google Maps
* Ajout de Pins dans Maps
* Mise en place du front de la gallerie photo
* Intégration de l'appareil photo


## Architecture du projet

Les Autorisations Android se strouve dans android/app/src/main/AndroidManifest.xml

Les Autorisations iOS n'ont pas été faite car nous n'avons pas eu de Mac à disposition

A la racine du projet il y a le dossier i18n/ qui contient les 2 fichiers json utilisé pour retranscrire l'application dans la langue local du téléphone

Tout le code se trouve dans le dossier lib/

* api: Dossier contenant les différentes action pour faire un CRUD pour les users et les places et un fichier contenant une bibliothèque de constante pour définir les routes vers l'API pour les requettes http

* controller: Contient les controllers pour la connexion et le menu

* i18n: Fichiers qui permet de détecter et de choisir le type de fichier json à utiliser pour la langue des textes

* library: Bibliothèque de widget personnel avec des paramètres personnalisés

* model: Modele qui représente le contenu d'un utilisateur ou d'une place dans la bdd

* page: Dossier contenant les pages d'affichage une fois connecté à l'application

* main: Fichier d'execution de l'application

Les dependences sont gérer à la racine du projet dans le pubspec.yaml

## Ce qu'il reste à faire

* Envoyer les modifications du profil utilisateur dans la table de l'utilisateur correspondant 
* Enregistrer la photo que l'on prend au format svg et l'enregistrer dans la bdd
* Enregister les coordonnées du pins de google map dans la bdd
* Récupérer les photos svg que l'utilisateur a et les affichers dans sa gallery d'image
* Afficher les différents lieux répertoriés dans la BDD

Pour mettre à jour un utilisateur il faut disposer de l'id de l'utilisateur avec lequel on s'est connecté. Pas réussi à le récupérer - Manque de temps pour résoudre cette problématique
Après derrière la compréhension des requêtes http est comprise, il faut s'accorder avec l'API sur ce qui est décidé avec qui fait quoi.

Ici par exemple:

* Post : Créer et Mettre à jour
* Get : Lecture
* Delete : Delete

Même problématique rencontré pour créer et mettre à jour un Lieu Insolite

## Répartition des tâches

Mael :

* i18N
* Relecture de Code

Geoffrey :

* Implémentation de la page Profil (70%)
* Création des constantes pour l'API web
* Création des models User et Place
* Requêtes api Place
* Affichage des Lieux Insolites dans la page Lieux Insolites

Pierre : 

* Implementation de l'api Google Map
* Liaison avec l'API web et la BDD
* Intégration de l'appareil photo
* Requêtes API User
* Implémentation du Front pour : 
    - La page de Connexion
    - le menu de navigation
    - la page Profil (30%)
    - la gallery d'image
    - la liste des Lieux Insolites
* i18N
* icône de l'application
* Relecture et factorisation du code

## Aucun problème en particulier rencontré hormis le manque de temps