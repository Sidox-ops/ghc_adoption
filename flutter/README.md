# ghc_adoption

A new Flutter project.

## Etapes intermédiaires

Génération de data statiques json avec GHC avec les prompts suivants :
    - "génère un fichier json liste des films et leurs propriétés"
    - "complétion de la liste avec la propriété imageUrl et les liens pris sur internet"
    - "finalement juste en tapant "imageUrl" l'auto-complétion propose des liens qu'on testera à l'affichage"

Passons à l'affichage de la liste des films :
    Bonnes pratiques :
        - Création d'une class modèle pour les films avec le prompt : "@workspace crée moi la classe movie basée sur les éléments de movie.json"
        - "@workspace Crée un provider movies_provider.dart pour fournir la liste de films du fichier movies.json"
            - Erreur : "Sorry, but I can only assist with programming related questions"
            - Malgré les tentatives de correction et de variation toujours le même problème
            - On change d'approche :
                - Dans le folder /data on crée un fichier movies_provider.dart et la class MoviesProvider
                - Dans l'input inline on entre :
                    - "en te basant sur movies.json dans le folder crée un provider qui retourne la liste de movies"
                        - sauf que ici pas de @workspace donc pas possible de prendre en compte le fichier movies.json ou movie_model.dart
        - Retour dans le chat @workspace : "@workspace ajoute dans la classe MoviesProviderune méthode qui charge movies.json et retourne la liste de Movie"


Un peu de custom plus tard :

    - on demande pour créer la page detail : "@workspace comment créer le widget details qui recoit movie en argument"
