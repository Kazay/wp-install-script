 #! bin/bash

 generalMenu() {
    echo -e "";
    echo -e "+-----------------------+";
    echo -e "| * | \e[7mWPCLiner\e[27m menu     |";
    echo -e "+---+-------------------+";
    echo -e "| 1 | Install wordpress |";
    echo -e "| 2 | Manage themes     |";
    echo -e "| 3 | Manage plugins    |";
    echo -e "| 4 | exit              |";
    echo -e "+-----------------------+";
    printf "\n";
    read -p "What do you want to do? " currentOpt;
 }

 readInput() {
     if [ $currentOpt == 1 ]
        then
            bash ./data/scriptWPInstall.sh;
    elif [ $currentOpt == 2 ]
        then
            bash ./data/scriptThemeWP.sh;
    elif [ $currentOpt == 3 ]
        then
            bash ./data/scriptPluginWP.sh;
    elif [ $currentOpt == 4 ]
        then
            echo "Bye";
            exit 1;
    else 
        echo "Incorrect input";
    fi
 }


while [ currentOpt != "" ]
do
    generalMenu;
    readInput;
done


