#!/bin/bash

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

cd /home/nsx;
cp -rf /vagrant/nsx_home/* /home/nsx/
chown -R nsx:nsx /home/nsx

cd /home/nsx/neoface-cloud-wrapper-develop;
/usr/local/bin/composer install;
chown -R nsx:nsx /home/nsx

cd /var/www
mv html html.`date +'%Y%m%d%H%M%S'`
cp -rf /vagrant/html .

cd /var/www/html/manage
/usr/local/bin/composer install
chown -R nsx:nsx /var/www/html;

cd /var/www;
mv shtml shtml.`date +'%Y%m%d%H%M%S'`
cp -rf /vagrant/shtml .
chown -R nsx:nsx /var/www/shtml
asdasdasd
cd /var/www/shtml
sudo -u nsx /usr/local/bin/composer install
npm install --save-dev  cross-env
npm run dev
ln -s /var/www/shtml/public/upload_photo /var/www/html/signage1/
ln -s /var/www/shtml/public/upload_photo /var/www/html/signage2/
ln -s /var/www/shtml/public/upload_photo /var/www/html/signage4/