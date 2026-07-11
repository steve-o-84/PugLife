# PugLife

PugLife ist ein browserbasiertes virtuelles Mops-Spiel. Dieses Paket ist für GitHub Pages vorbereitet und unterstützt:

- drei lokale Speicherstände
- automatische Zeitberechnung
- lokale Speicherung als Fallback
- optionale Cloud-Spielstände über Supabase
- Anmeldung mit E-Mail und Passwort
- Synchronisierung auf mehreren Geräten
- Row Level Security: Spieler sehen nur ihre eigenen Daten

## 1. Dateien auf GitHub hochladen

Erstelle ein Repository, zum Beispiel `puglife`, und lade **den Inhalt dieses Ordners** hoch.  
`index.html` muss direkt im Hauptverzeichnis des Repositorys liegen.

## 2. Supabase-Datenbank einrichten

1. Erstelle ein kostenloses Supabase-Projekt.
2. Öffne den **SQL Editor**.
3. Führe den vollständigen Inhalt von `supabase-setup.sql` aus.
4. Öffne **Authentication > Providers > Email**.
5. Aktiviere E-Mail/Passwort. Du kannst die E-Mail-Bestätigung aktiviert lassen.
6. Öffne im Projekt den Bereich **Connect** beziehungsweise **API Keys**.
7. Kopiere:
   - Project URL
   - Publishable Key
8. Trage beide Werte in `config.js` ein.

Wichtig: Verwende ausschließlich den **Publishable Key**. Ein Secret Key oder
`service_role`-Schlüssel darf niemals in GitHub oder im Browsercode stehen.

## 3. GitHub Pages aktivieren

1. Öffne im Repository **Settings > Pages**.
2. Wähle unter **Build and deployment** als Source **GitHub Actions**.
3. Öffne den Tab **Actions** und warte, bis „Deploy PugLife to GitHub Pages“ erfolgreich ist.
4. Danach erscheint die öffentliche Adresse, normalerweise:
   `https://DEIN-NAME.github.io/puglife/`

## Speicherung

Ohne Anmeldung speichert PugLife lokal im Browser.  
Nach der Anmeldung werden die drei Speicherstände zusätzlich in Supabase gespeichert.

Beim ersten Anmelden:
- vorhandene Cloud-Spielstände werden auf das Gerät geladen;
- existiert in einem Slot noch kein Cloud-Spielstand, wird der lokale Stand hochgeladen.

## Updates veröffentlichen

Ersetze bei späteren Versionen `index.html` und lade die Änderung in den `main`-Branch.
Die GitHub Action veröffentlicht die Website automatisch neu.

## Sichtbare Zeitaktualisierung

Während das Spiel geöffnet ist, werden Uhrzeit, Tagesfortschritt und Bedürfnisse alle fünf Sekunden neu berechnet und angezeigt.

## Plattformübergreifende Aktualisierung

Die sichtbare Spielschleife verwendet `requestAnimationFrame()` und aktualisiert
Zeit, Tagesfortschritt und Bedürfnisse ungefähr alle fünf Sekunden. Ein zusätzlicher
Watchdog-Timer greift ein, falls ein Browser die Animationsschleife drosselt.
Beim Wechseln zurück zur Seite wird die vergangene Zeit sofort nachberechnet.
Die Statuswerte werden als ganze Zahlen angezeigt.
