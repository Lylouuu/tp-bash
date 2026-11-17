
# Réponses aux questions de réflexion – TP 2

### Exercice 2.1 


La commande `chmod 644` attribue les permissions suivantes :
- Propriétaire : lecture et écriture (`rw-`).
- Groupe : lecture uniquement (`r--`).
- Autres utilisateurs : lecture uniquement (`r--`).

Le fichier n'est donc pas exécutable par son propriétaire, car aucun droit d'exécution (`x`) n'est accordé.

### Exercice 2.2 

Les guillemets permettent de protéger la valeur de la variable contre les problèmes liés aux espaces ou aux valeurs vides. Ils garantissent que la variable est interprétée comme un seul argument dans la condition `if`, évitant ainsi certaines erreurs.

### Exercice 2.3 

Sans `set -Eeuo pipefail`, le script peut continuer son exécution même si la commande `tar` échoue. Il risque alors d'afficher un message de réussite alors que la sauvegarde n'a pas été créée correctement.

### Exercice 2.4 

Cron ne s'exécute pas depuis le même répertoire que l'utilisateur et possède un environnement différent de celui du terminal donc les chemins absolus permettent de localiser correctement les scripts et les fichiers, indépendamment du répertoire courant.

### Exercice 2.5 

Pour transformer ce script en un véritable pipeline CI, on pourrait ajouter :
- L'installation des dépendances.
- La compilation du projet.
- L'exécution de tests automatisés.
- L'analyse de la qualité du code.
- La génération de rapports.

Les erreurs peuvent survenir pendant le clonage du dépôt, sa mise à jour, l'installation des dépendances, la compilation ou l'exécution des tests.

Chaque étape doit retourner un code de sortie adapté : `0` en cas de réussite et une valeur différente de `0` en cas d'échec.
