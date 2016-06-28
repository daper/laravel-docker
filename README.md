# Laravel docker proyect

Install docker and docker-compose. You can install docker-compose with pip: `pip install docker-compose`. Make an alias for docker-compose: `alias dc=docker-compose`

Run the following commands:
```sh
dc build
dc up -d

dc exec php70 bash
cd laravel
composer install
php artisan migrate:install
php artisan queue:table
php artisan session:table
php artisan migrate
```

Ensure you have permissions on storage and bootstrap folder.