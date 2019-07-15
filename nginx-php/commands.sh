echo -e "${COLOR_ORANGE}Installiere NGINX und PHP${FORMAT_END}"
sudo apt-get install nginx php-fpm -y

cat > ~/default << EOF
server {
	listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.php index.html index.htm index.nginx-debian.html;

	server_name _;

	location / {
        try_files \$uri \$uri/ =404;
    }

	location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }
}
EOF

sudo rm /etc/nginx/sites-enabled/default
sudo mv -f ~/default /etc/nginx/sites-available/default
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

cat > ~/index.php << EOF
        <?php echo phpinfo(); ?>
EOF

sudo mv -f ~/index.php /var/www/html/index.php
sudo /etc/init.d/nginx reload