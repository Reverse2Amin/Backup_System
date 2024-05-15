Hier ist das aktualisierte Readme basierend auf dem neuesten Code:

---

# Backup-Verwaltungsprogramm

Dieses Backup-Verwaltungsprogramm ermöglicht es dem Benutzer, Backups zu erstellen, zu löschen, aufzulisten und nach bestimmten Dateien in den Backups zu suchen. Es bietet eine einfache Benutzeroberfläche über die Kommandozeile.

## Voraussetzungen

- Bash
- unzip (für die Funktion "Bestimmtes File in Backup suchen")

## Anleitung

1. Führen Sie das Skript in Ihrer Bash-Umgebung aus.
2. Das Skript führt Sie durch ein Menü mit verschiedenen Optionen zur Verwaltung von Backups.
3. Wählen Sie eine der verfügbaren Optionen aus, indem Sie die entsprechende Zahl eingeben.
4. Folgen Sie den Anweisungen für jede Option.

## Funktionen

1. **Backup erstellen**: Erstellt ein Backup eines angegebenen Verzeichnisses.
2. **Backup löschen**: Löscht ein vorhandenes Backup aus dem Backup-Verzeichnis.
3. **Backup auflisten**: Zeigt alle vorhandenen Backups im Backup-Verzeichnis an.
4. **Bestimmtes File in Backup suchen**: Sucht nach einer bestimmten Datei in den vorhandenen Backups und zeigt an, in welchem Backup sie gefunden wurde.
5. **Hilfe anzeigen**: Zeigt eine Hilfe mit einer Übersicht über die verfügbaren Optionen an.
6. **Programm beenden**: Beendet das Backup-Verwaltungsprogramm.

## Hinweise

- Das Backup-Verzeichnis wird standardmässig im Home-Verzeichnis des Benutzers erstellt, falls es noch nicht vorhanden ist.
- Wenn eine Datei im Backup gefunden wird, wird nur angezeigt, in welchem Backup sie gefunden wurde. Es werden keine Dateien extrahiert.
