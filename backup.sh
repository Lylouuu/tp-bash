
#!/bin/bash

set -Eeuo pipefail

# Dossier à sauvegarder
DOSSIER="tp-bash/data"

# Dossier de destination des sauvegardes
DESTINATION="backups"

# Vérifier que le dossier existe
if [ ! -d "$DOSSIER" ]; then
    echo "Erreur : le dossier $DOSSIER n'existe pas." >&2
    exit 1
fi

# Créer le dossier de sauvegarde
mkdir -p "$DESTINATION"

# Ajouter la date et l'heure au nom de l'archive
DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE="$DESTINATION/backup_$DATE.tar.gz"

# Créer l'archive
tar -czf "$ARCHIVE" "$DOSSIER"

echo "Sauvegarde créée : $ARCHIVE"

# Supprimer les sauvegardes de plus de 7 jours
find "$DESTINATION" -type f -name "backup_*.tar.gz" -mtime +7 -exec rm {} \;

echo "Nettoyage des anciennes sauvegardes terminé."
