#!/bin/bash
# Backup diario de Flowise (base de datos + carpetas principales)
# Conserva 7 días de backups, uno por día de la semana (se sobreescriben cada semana).
# Autor: tusuarioadmin

# ==== CONFIGURACIÓN ====
USER="tusuarioadmin"
HOME_DIR="/home/$USER"
BACKUP_DIR="$HOME_DIR/backups"

# Rutas importantes de Flowise
DB_PATH="$HOME_DIR/.flowise/database.sqlite"
FLOWISE_DIR="$HOME_DIR/Flowise"
FLOWISE_DATA="$HOME_DIR/.flowise"

# ==== PREPARAR DIRECTORIO DE BACKUP ====
mkdir -p "$BACKUP_DIR"

# Día de la semana (1=Lunes ... 7=Domingo)
DAY=$(date +%u)

# Nombre del archivo (ej: flowise-backup-1.tar.gz)
BACKUP_FILE="$BACKUP_DIR/flowise-backup-$DAY.tar.gz"

# ==== CREAR BACKUP ====
tar -czf "$BACKUP_FILE" \
    "$DB_PATH" \
    "$FLOWISE_DIR" \
    "$FLOWISE_DATA"

# ==== PERMISOS SEGUROS ====
chown $USER:$USER "$BACKUP_FILE"
chmod 600 "$BACKUP_FILE"

echo "✅ Backup completado: $BACKUP_FILE"
