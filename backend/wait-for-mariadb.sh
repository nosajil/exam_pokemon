#!/bin/sh

# Attendre que MariaDB soit prêt
until nc -z -v -w30 mariadb 3306
do
  echo "Waiting for MariaDB to be ready..."
  sleep 1
done

# Exécuter la commande donnée (par exemple démarrer le backend)
echo "MariaDB is ready. Starting the backend..."
exec "$@"
