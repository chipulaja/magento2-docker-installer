#!/bin/sh

#create project
chown www-data:www-data /var/www/ -R
su www-data -s /bin/sh -c "cd /var/www && composer create-project --repository=https://repo.magento.com/ magento/project-community-edition magento2"

#install magento
su www-data -s /bin/sh -c "cd /var/www/magento2 && php bin/magento setup:install \
  --use-rewrites 1 \
  --base-url $BASE_URL \
  --db-host $DB_HOST \
  --db-name $DB_NAME \
  --db-user $DB_USER \
  --db-password $DB_PASSWORD \
  --admin-user $ADMIN_USER \
  --admin-password $ADMIN_PASSWORD \
  --admin-email $ADMIN_EMAIL \
  --admin-firstname $ADMIN_FIRSTNAME \
  --admin-lastname $ADMIN_LASTNAME"

#setup cron index
su www-data -s /bin/sh -c "cd /var/www/magento2 && php bin/magento cron:install \
  && php bin/magento cron:run --group index"