#!/bin/bash
set -Eeuo pipefail

REPO_URL="$1"
DOSSIER="projet_test"
LOG="$(pwd)/ci.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG"
}

if [ -z "$REPO_URL" ]; then
    log "Erreur : aucune URL de dépôt fournie."
    exit 1
fi

if [ -d "$DOSSIER/.git" ]; then
    log "Mise à jour du dépôt..."
    cd "$DOSSIER"
    git pull
else
    log "Clonage du dépôt..."
    git clone "$REPO_URL" "$DOSSIER"
    cd "$DOSSIER"
fi

log "Exécution des tests..."

# Simulation des tests
if [ -d .git ]; then
    log "Tests simulés réussis."
    exit 0
else
    log "Échec des tests."
    exit 1
fi
