# PugLife – lokale Browser-Speicherung

Diese Version verwendet keine Cloud, keine Anmeldung, keine E-Mail-Adresse und kein Passwort.

Die drei Speicherstände werden lokal im Browser gespeichert. Dabei nutzt PugLife `localStorage` und bei Bedarf `IndexedDB` als Reserve.

Die Spielstände bleiben auf demselben Gerät im selben Browser erhalten. Sie werden nicht automatisch auf andere Geräte übertragen.

Spielstände können verloren gehen, wenn Browser- oder Website-Daten gelöscht werden, der private Modus verwendet wird, ein anderer Browser benutzt wird oder sich die GitHub-Pages-Adresse ändert.

Über „Backup kopieren“ kann zusätzlich ein Sicherungscode erstellt werden.

## GitHub Pages

Lade `index.html` in das Hauptverzeichnis deines Repositorys und aktiviere:

**Settings → Pages → Deploy from a branch → main → / (root)**
