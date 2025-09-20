#!/bin/bash
# Flowise Backup Script

# Configuración
USER_HOME="/home/admintuusario"
BACKUP_DIR="$USER_HOME/backups"
FLOWISE_DIR="$USER_HOME/Flowise"
FLOWISE_DATA_DIR="$USER_HOME/.flowise"
DAY_OF_WEEK=$(date +%w) # 0=Domingo ... 6=Sábado

# Crear carpeta de backups si no existe
mkdir -p $BACKUP_DIR

# Nombre del archivo
BACKUP_FILE="$BACKUP_DIR/flowise-backup-$DAY_OF_WEEK.tar.gz"

# Ejecutar backup (Flowise + .flowise + base de datos)
tar -czf $BACKUP_FILE $FLOWISE_DIR $FLOWISE_DATA_DIR

echo "Backup creado en: $BACKUP_FILE"
