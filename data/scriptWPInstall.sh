#! /bin/bash

red=`tput setaf 1`;
white=`tput sgr0`;

InstallWpCli() {
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    php wp-cli.phar --info;
    if [ "$?" != 0 ]
    then
        echo "${red}ERROR${white}: installation failure.";
        select retry in "Retry" "Abort";
        do
            case $retry in
            "Retry" ) InstallWpCli;;
            "Abort" ) echo "Bye"; exit 1;;
            esac
        done
    fi
    echo "wp-cli installed";
}

echo "Wordpress CLI installer";
InstallWpCli;
chmod 777 wp-cli.phar;
sudo mv wp-cli.phar /usr/local/bin/wp;
echo "wp-cli.phar moved to /usr/local/bin and renamed wp.";
echo "Use wp to execute wp-cli commands.";

echo "wp core download";
echo "Language :";
select locale in "English" "French"
    do
        case $locale in
        "English" ) language="en_US";break;;
        "French" ) language="fr_FR";break;;
        esac
    done
wp core download --path="/var/www/html/" --locale="$language" --version=latest --force;

echo "Database connection";
read -p "Database name: " dbname;
read -p "Database user: " dbuser;
read -s -p "Database password: " dbpass;

wp config create --dbname=$dbname --dbuser=$dbuser --dbpass=$dbpass;

echo "Wordpress installation";
read -p "Wordpress title: " title;
read -p "Admin username: " admin_user;
read -s -p "Admin password: " admin_pw;
read -p "Admin email: " admin_email;
read -p "Localhost url: " host;

wp core install --url=$host --title=$title --admin_user=$admin_user --admin_password=$admin_pw --admin_email=$admin_email --skip-email;

sudo service apache2 restart;