# Flowise Backup Script

Este proyecto contiene un script en **Bash** para automatizar el backup de **Flowise** en un servidor Linux.

## 📌 Características
- Crea un **backup diario** de:
  - La base de datos SQLite de Flowise
  - Archivos de configuración
  - Carpeta principal de la aplicación
- Guarda un archivo de backup por cada día de la semana (7 en total).
- Los archivos se **sobrescriben automáticamente** la semana siguiente.
- Los backups se almacenan comprimidos en formato `.tar.gz`.

## 📂 Estructura del proyecto
```
flowise-backup/
├── flowise-backup.sh   # Script de backup
└── README.md           # Documentación
```

## ⚙️ Instalación
1. Clonar el repositorio en tu servidor:
   ```bash
   git clone https://github.com/tusuarioadmin/flowise-backup.git
   cd flowise-backup
   ```

2. Dar permisos de ejecución al script:
   ```bash
   chmod +x flowise-backup.sh
   ```

3. (Opcional) Mover el script a `/usr/local/bin` para ejecutarlo desde cualquier lugar:
   ```bash
   sudo cp flowise-backup.sh /usr/local/bin/flowise-backup
   ```

## 🚀 Uso
Ejecutar el backup manualmente:
```bash
./flowise-backup.sh
```

Los backups se guardarán en:
```
/home/adminarkanatech/backups/
```

Cada archivo tendrá el nombre:
```
flowise-backup-0.tar.gz   # Domingo
flowise-backup-1.tar.gz   # Lunes
flowise-backup-2.tar.gz   # Martes
...
flowise-backup-6.tar.gz   # Sábado
```

## ⏰ Automatización con Cron
Para que el backup se ejecute automáticamente todos los días a las **2:00 AM**:

1. Editar el cron del usuario:
   ```bash
   crontab -e
   ```

2. Agregar la línea:
   ```
   0 2 * * * /home/adminarkanatech/flowise-backup.sh >> /home/adminarkanatech/backups/backup.log 2>&1
   ```

Esto generará un backup diario y guardará logs en `backup.log`.

---

## 🔄 Restaurar un Backup
Para restaurar un backup:
```bash
tar -xzf flowise-backup-X.tar.gz -C /
```
*(reemplaza `X` por el número del día que quieras restaurar).*

---

## 📜 Licencia
Este proyecto está bajo la licencia MIT. Eres libre de usarlo, modificarlo y distribuirlo.
