sudo apt-get install nginx php-fpm -y

sudo sed -i -e 's/index index.html index.htm/index index.php index.html index.htm/g' /etc/nginx/sites-enabled/default

sudo sed -i -e '56s/#//g' /etc/nginx/sites-enabled/default
sudo sed -i -e '57s/#//g' /etc/nginx/sites-enabled/default
sudo sed -i -e '60s/#//g' /etc/nginx/sites-enabled/default
sudo sed -i -e '63s/#//g' /etc/nginx/sites-enabled/default

cat > ~/index.php << EOF
        <?php echo phpinfo(); ?>
EOF

sudo mv ~/index.php /var/www/html/index.php
sudo /etc/init.d/nginx reload