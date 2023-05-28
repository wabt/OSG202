#!/bin/bash

display_current_directory() {
    pwd
    read -p "Hit <Enter> to continue."
}

list_files_in_directory() {
    read -p "Please enter the directory path: " directory
    if [[ -d "$directory" ]]; then
        ls -l "$directory"
    else
        echo "$directory is not a directory."
    fi
    read -p "Hit <Enter> to continue."
}

display_date_and_time() {
    date
    read -p "Hit <Enter> to continue."
}

display_file_type() {
    read -p "Please enter file name: " filename
    if [[ -e "$filename" ]]; then
        if [[ -f "$filename" ]]; then
            echo "$filename is an ordinary file."
        elif [[ -d "$filename" ]]; then
            echo "$filename is a directory."
        else
            echo "$filename exists but is neither an ordinary file nor a directory."
        fi
    else
        echo "$filename does not exist."
    fi
    read -p "Hit <Enter> to continue."
}

execute_command() {
    read -p "Please enter a command to be executed: " command
    eval "$command"
    read -p "Hit <Enter> to continue."
}

display_menu() {
    echo "*********************************************************************"
    echo "Please choose from the following options; type the option"
    echo "number and hit the <Enter> key."
    echo "a or A To display the current directory"
    echo "b or B To list names of the files in a given directory"
    echo "c or C To display today's date and time"
    echo "d or D To display whether a file is a simple file or directory"
    echo "e or E To execute a command line."
    echo "q or Q To exit the program."
    echo "*********************************************************************"
}

while true; do
    clear
    display_menu

    read -p "Enter your choice and hit <Enter>: " choice
    echo

    case "$choice" in
        a|A)
            display_current_directory
            ;;
        b|B)
            list_files_in_directory
            ;;
        c|C)
            display_date_and_time
            ;;
        d|D)
            display_file_type
            ;;
        e|E)
            execute_command
            ;;
        q|Q)
            echo "Bye now!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac

    read -p "Hit <Enter> to continue."
done

