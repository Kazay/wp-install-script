#! /bin/bash

menu() {
    echo -e "";
    echo -e "+-------------------------+";
    echo -e "| * | \e[32mplugin\e[0m menu         |";
    echo -e "+---+---------------------+";
    echo -e "| 1 | show your list      |";
    echo -e "| 2 | search a plugin     |";
    echo -e "| 3 | add a plugin        |";
    echo -e "| 4 | delete a plugin     |";
    echo -e "| 5 | activate a plugin   |";
    echo -e "| 6 | deactivate a plugin |";
    echo -e "| 7 | exit                |";
    echo -e "+-------------------------+";
    printf "\n";
    read -p "What do you want to do? " currentOpt;

}

readInput() {
if [ $currentOpt == 1 ]
    then
        echo "Plugins actually installed:"
        wp plugin list;
elif [ $currentOpt == 2 ]
    then
        read -p "Which plugin do you want to search? " plugin;
        wp plugin search $plugin;
elif [ $currentOpt == 3 ]
    then
        read -p "Plugin slug name: " plugin;
        wp plugin is-installed $plugin;
        echo $?
        if [ $? == 1 ]
        then
            echo "This plugin is already installed or doesn't exist.";
        else
            wp plugin install $plugin;
        fi
elif [ $currentOpt == 4 ]
    then
        wp plugin list;
        read -p "Which plugin do you want to delete? " plugin;
        wp plugin delete $plugin;
elif [ $currentOpt == 5 ]
    then
        wp plugin list;
        read -p "Which plugin do you want to activate? " plugin;
        wp plugin activate $plugin;
elif [ $currentOpt == 6 ]
    then
        wp plugin list;
        read -p "Which plugin do you want to deactivate? " plugin;
        wp plugin deactivate $plugin;
elif [ $currentOpt == 7 ]
    then
        echo "Bye";
        exit 1;
else
    echo "Incorrect input.";
fi
}

while [ currentOpt != "" ]
do
    menu;
    readInput;
done


    