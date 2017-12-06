#! /bin/bash

menu() {
   echo -e "";
    echo -e "+----------------------+";
    echo -e "| * | \e[34mtheme\e[0m menu       |";
    echo -e "+---+------------------+";
    echo -e "| 1 | show your list   |";
    echo -e "| 2 | search a theme   |";
    echo -e "| 3 | add a theme      |";
    echo -e "| 4 | delete a theme   |";
    echo -e "| 5 | activate a theme |";
    echo -e "| 6 | exit             |";
    echo -e "+----------------------+";
    printf "\n";
    read -p "What do you want to do? " currentOpt;

}

readInput() {
if [ $currentOpt == 1 ]
    then
        echo "Themes actually installed:"
        wp theme list;
elif [ $currentOpt == 2 ]
    then
        read -p "Which theme do you want to search? " theme;
        wp theme search $theme;
elif [ $currentOpt == 3 ]
    then
        read -p "Theme slug name: " theme;
        wp theme is-installed $theme;
        echo $?
        if [ $? == 1 ]
        then
            echo "This theme is already installed or doesn't exist.";
        else
            wp theme install $theme;
        fi
elif [ $currentOpt == 4 ]
    then
        wp theme list;
        read -p "Which theme do you want to delete? " theme;
        wp theme delete $theme;
elif [ $currentOpt == 5 ]
    then
        wp theme list;
        read -p "Which theme do you want to activate? " theme;
        wp theme activate $theme;
elif [ $currentOpt == 6 ]
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


    