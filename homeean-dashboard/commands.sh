echo -e "${COLOR_ORANGE}Installiere homeean Dashboard${FORMAT_END}"

if ! [ -x "$(command -v composer)" ]; then
  echo "composer not found, installing composer"
  curl -sS https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/local/bin/composer
fi

if [ ! -e /var/www/dashboard ]; then
    git clone https://github.com/homeean/dashboard.git
    cd dashboard
    echo "installing dependencies"
    composer install --no-interaction --quiet
    mv example-config.json config.json
    mv example-style.css style.css
    mv example-script.js script.js
    cd ..
    sudo mv dashboard /var/www/dashboard

    echo "create webserver config"

cat > homeean_dashboard << EOF
server {
    listen 8022;

    root /var/www/dashboard;

    index index.html index.htm index.php;

    server_name homeean_dashboard;

    location / {
        try_files \$uri \$uri/ /index.php\$is_args\$args;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
    }
}
EOF
    sudo mv homeean_dashboard /etc/nginx/sites-available
    sudo ln -s /etc/nginx/sites-available/homeean_dashboard /etc/nginx/sites-enabled/homeean_dashboard

    echo "restart nginx"
    sudo service nginx restart
else
    echo "homeean dashboard already installed, fetching updates"
    cd /var/www/dashboard
    git pull
    echo "updating dependencies"
    composer update --no-interaction --quiet
fi

cd ~