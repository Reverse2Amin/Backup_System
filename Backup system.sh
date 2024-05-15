#!/bin/bash

select_backup_dir() {
    clear
    if [ -d "$HOME/backup" ]; then
        echo "Es gibt bereits ein Backup-Verzeichnis im Home-Verzeichnis: $HOME/backup"
        echo "Drücken Sie eine beliebige Taste, um fortzufahren..."
        read -n 1 -s
        backup_dir="$HOME/backup"
    else
        backup_dir="$HOME/backup"
        mkdir -p "$backup_dir"
        echo "Backup-Verzeichnis wurde im Home-Verzeichnis erstellt: $backup_dir"
        echo "Drücken Sie eine beliebige Taste, um fortzufahren..."
        read -n 1 -s
    fi
}

select_backup_dir

menu() {
    clear
    cat << "EOF"


  ____             _                
 | __ )  __ _  ___| | ___   _ _ __  
 |  _ \ / _` |/ __| |/ / | | | '_ \ 
 | |_) | (_| | (__|   <| |_| | |_) |
 |____/ \__,_|\___|_|\_\\__,_| .__/ 
                             |_|    


EOF
    echo " -----------------------------------------"
    echo " | 1. Backup erstellen                    |"
    echo " | 2. Backup löschen                      |"
    echo " | 3. Backup auflisten                    |"
    echo " | 4. Bestimmtes File in Backup suchen    |"
    echo " | 5. Hilfe anzeigen                      |"
    echo " | 6. Beenden                             |"
    echo " ------------------------------------------"
    echo "Wähle eine Option (1-6): "
    read choice
}

while true; do
    menu

    case $choice in
        1)
            create_backup() {
                clear
                read -p "Bitte geben Sie den Quellpfad ein: " source_path
                if [ -d "$source_path" ]; then
                    backup_date=$(date +'%Y-%m-%d-%H-%M-%S')
                    zip_filename="backup$backup_date.zip"
                    zip -r "$backup_dir/$zip_filename" "$source_path"
                    echo "Backup erfolgreich erstellt."
                else
                    echo "Ungültiger Quellpfad."
                fi
                read -n 1 -s -r -p "Drücken Sie eine beliebige Taste, um zum Hauptmenü zurückzukehren..."
            }
            create_backup
            ;;
        2)
            delete_backup() {
                clear
                echo "Backups auflisten:"
                backups=("$backup_dir"/*)
                if [ ${#backups[@]} -eq 0 ]; then
                    echo "Keine Backups vorhanden."
                else
                    echo "0. Zurück zum Hauptmenü"
                    for ((i=0; i<${#backups[@]}; i++)); do
                        echo "$(($i + 1)). ${backups[i]}"
                    done
                    read -p "Welches Backup möchten Sie löschen? (Geben Sie die Nummer ein): " choice
                    if [ $choice -eq 0 ]; then
                        return
                    elif [ $choice -ge 1 ] && [ $choice -le ${#backups[@]} ]; then
                        rm "${backups[$(($choice - 1))]}"
                        echo "Backup ${backups[$(($choice - 1))]} erfolgreich gelöscht."
                    else
                        echo "Ungültige Auswahl."
                    fi
                fi
                read -n 1 -s -r -p "Drücken Sie eine beliebige Taste, um zum Hauptmenü zurückzukehren..."
            }
            delete_backup
            ;;
        3)
            read_backup(){
                clear
                ls -1 "$backup_dir" | tr '\n' '\n\n'
                read -n 1 -s -r -p "Drücken Sie eine beliebige Taste, um zum Hauptmenü zurückzukehren..."
            }
            read_backup
            ;;
        4)
            search_file() {
                clear
                read -p "Bitte geben Sie den Dateinamen ein, den Sie suchen möchten: " filename
                found=false
                for backup in "$backup_dir"/*.zip; do
                    if unzip -l "$backup" | grep -q "$filename"; then
                        echo "Datei '$filename' gefunden im Backup: $backup"
                        found=true
                    fi
                done
                if ! $found; then
                    echo "Datei '$filename' wurde in keinem Backup gefunden."
                fi
                read -n 1 -s -r -p "Drücken Sie eine beliebige Taste, um zum Hauptmenü zurückzukehren..."
            }
            search_file
            ;;
        5)
            show_help() {
                clear
                echo "Backup-Programm"
                echo "================"
                echo "Optionen:"
                echo "1. Backup erstellen"
                echo "2. Backups auflisten"
                echo "3. Einzelnes Backup löschen"
                echo "4. Nach Datei in Backups suchen"
                echo "5. Hilfe anzeigen"
                echo "6. Programm beenden"
                read -n 1 -s -r -p "Drücken Sie eine beliebige Taste, um zum Hauptmenü zurückzukehren..."
            }
            show_help
            ;;
        6)
            echo "bye."; exit;;
        *)
            echo "Ungültige Eingabe. Bitte geben Sie eine Zahl von 1 bis 6 ein."
            ;;
    esac
done
