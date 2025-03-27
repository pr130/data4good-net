# Datenbank
## Erklärung

### Synonyme & Übersetzungen

Englische Übersetzung: database

### Definition

Eine Datenbank ist ein strukturierter Speicherort für Daten, damit diese schnell und einfach wieder abgerufen und bearbeitet werden können. Eine Datenbank speichert unterschiedliche Daten und verknüpft sie miteinander.

Eine Datenbank eines gemeinnützigen Vereins könnte z.B. je eine Tabelle für die Vereinsmitglieder, die empfangenen Spenden und die aktuellen Projekte, die der Verein unterstützt, enthalten.

Man kann zwischen verschiedenen Arten von Datenbanken unterscheiden, z.B. relationalen [SQL](https://civic-data.de/selbstlernmaterial/#sql)-Datenbanken und NoSQL Datenbanken. Mehr dazu lernst du im Abschnitt [Mehr zu Datenbanken](#mehr-zu-datenbanken).

### Beispiele

Beispiele für Datenbanken sind unter anderem:

- Vereinsmitglieder-Datenbank (Liste aller Vereinsmitglieder mit Kontaktdaten)

- Spendendatenbank für NGOs

- Projektdatenbank aller laufenden und abgeschlossenen Projekte inkl. Status, Verantwortlicher Person, etc.

## Wann sind Datenbanken für euch relevant? 

Datenbanken sind dann relevant, wenn…

- Wenn ihr ständig wachsende Datenmengen speichern müsst (z.B. Personendaten, Projektdaten usw.)

- Wenn ihr eine [WebApp](https://civic-data.de/selbstlernmaterial/#webapp) oder eine andere komplexere Datenanwendung programmieren (lassen) möchtet

- Wenn ihr viele Tabellen habt, die komplex miteinander verbunden werden sollen

- Wenn ihr für eure Daten präzise Zugriffsrechte benötigt (z.B. jedes Team kann nur auf seine eigenen Daten zugreifen)

- Wenn ihr Regeln für die automatische Überprüfung der Datenqualität verwenden wollt (z.B. Prüfung, ob eine Postleitzahl als Zahl eingegeben wurde und 5 Ziffern hat)

- Wenn sehr große Datenmengen schnell ausgewertet werden sollen (z.B. in Form einer [Datenanalyse](https://civic-data.de/selbstlernmaterial/#datenanalyse))

## Was sind die Implikationen von Datenbanken für euch? 

- Die meisten Datenbanken benötigen einen [Server](https://civic-data.de/selbstlernmaterial/#server). Für das [Hosting](https://civic-data.de/selbstlernmaterial/#hosting) des Servers in der [Cloud](https://civic-data.de/selbstlernmaterial/#cloud) und ggfs. für Lizenzen für die Datenbank oder das [Datenbank-Management-System](https://civic-data.de/selbstlernmaterial/#dbms) fallen Kosten an.

- Für Betrieb, Wartung etc. sind in der Regel Kenntnisse der Programmiersprache [SQL](https://civic-data.de/selbstlernmaterial/#sql) notwendig, sowie ein generelles Verständnis derartiger Technologien

- Ihr müsst sicherstellen, dass die Speicherung von personenbezogenen Daten in eurer Datenbank DSGVO-konform erfolgt (z.B. durch Einwilligung der Personen)

- Die Bedeutung von Datensicherheit nimmt zu, wenn ihr Daten in einer gehosteten Datenbank speichert.

## Mehr zu Datenbanken

Die am weitesten verbreitete Art von Datenbanken sind die relationalen Datenbanken. Diese speichern Daten in Tabellen, die miteinander verknüpft werden. Die Meta-Informationen, wie die Tabellen aussehen und wie sie miteinander verknüpft sind, nennt man Schema.

![](https://civic-data.de/app/uploads/datenbank-schema.svg)



Das hier ist ein Beispielschema für die Datenbank eines gemeinnützigen Vereins. Es werden Daten über Mitglieder, Spenden und Projekte gespeichert (wie z.B. der Name, die E-Mail-Adresse und das Beitrittsdatum eines Mitglieds) und die einzelnen Tabellen sind über die jeweiligen IDs miteinander verknüpft.

Zum Management und zur Abfrage von relationalen Datenbanken verwendet man die Programmiersprache [SQL](https://civic-data.de/selbstlernmaterial/#sql) (Structured Query Language).

Für spezielle Anwendungsfälle gibt es auch unterschiedliche Arten von nicht-relationalen (auch: NoSQL) Datenbanken, die nicht auf dem tabellarischen Schema von relationalen Datenbanken beruhen. Diese werden zum Beispiel für die Speicherung von Fotos oder Daten aus sozialen Netzwerken verwendet.

### Vorteile von Datenbanken

- Schneller Zugriff auf große Datenmengen, für deren Größe Excel, Google Sheets etc. nicht mehr ausgelegt ist

- Die festgelegte Struktur der Datenbank ist ist vorteilhaft für Anwendungen, die mit den Daten arbeiten

- Gezielte Filterung und Abfrage von Informationen

- Gleichzeitiges Arbeiten mehrerer Personen an denselben Daten, wobei sichergestellt ist, dass auch alle mit demselben Stand der Daten arbeiten

### Nachteile von Datenbanken

- Keine (benutzerfreundliche) grafische Benutzeroberfläche für Dateneingabe und -pflege

- Erfordert technisches Wissen (Einrichtung, Administration)

- Laufende Kosten für [Hosting](https://civic-data.de/selbstlernmaterial/#hosting) oder [Cloud](https://civic-data.de/selbstlernmaterial/#cloud)-Services

- Laufende Wartung von Datenbank-[Servern](https://civic-data.de/selbstlernmaterial/#server) ist ggf. nötig, um Datensicherheit zu gewährleisten

### Verwandte Begriffe

- Für die Erstellung und Verwaltung einer Datenbank benötigt ihr ein Datenbank-Management-System ([DBMS](https://exampl.com/dbms)). Häufig wird der Begriff Datenbank synonym verwendet für das verwendete DBMS.

- Ein [Data Warehouse](https://civic-data.de/selbstlernmaterial/#data-warehouse) ist ein Datenbanksystem, das speziell für betriebswirtschaftliche Analysen eingesetzt wird und aufbereitete Daten enthält

- Ein [Data Lake](https://civic-data.de/selbstlernmaterial/#data-lake) ist ein Speichersystem für alle möglichen Arten von Daten, hauptsächlich eingesetzt zum Speichern von noch nicht aufbereiteten Daten (sog. Rohdaten)

## Weiterführende Materialien

Wenn du noch mehr über Datenbanken erfahren möchtest, schaue dir die folgenden Ressourcen an:

- [Wikipedia Eintrag](https://de.wikipedia.org/wiki/Datenbank)

- [What is a database?](https://www.youtube.com/watch?v=hRulZhTtUTg) (YouTube, englisch)

- [Database vs Data Warehouse vs Data Lake | What is the Difference?](https://www.youtube.com/watch?v=-bSkREem8dM) (YouTube, englisch)

- [Datenbank Grundlagen einfach erklärt](https://www.youtube.com/watch?v=-LJYaXfR2X4) (YouTube, deutsch)

