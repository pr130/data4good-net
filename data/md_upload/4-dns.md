# DNS
## Erklärung

### Synonyme & Übersetzungen

Deutsche Übersetzung: Domain-Namen-System

### Definition

Das DNS (Domain Name System) ist wie ein riesiges Telefonbuch für das Internet. Es enthält Einträge (en: Records) für alle Internetadressen (de: Domäne, en: Domain, z.B. google.com oder civic-data.de). Das DNS verwendet die Records, um für Domains Informationen (z.B. IP-Adressen) nachzuschlagen, die Computer verstehen. Das DNS ist ein weltweit verteiltes Netz aus [Servern](https://civic-data.de/selbstlernmaterial/#server), das speziell für diese Aufgabe existiert .

### Beispiele

Damit ein Browser Google finden kann, wird die folgende IP-Adresse, quasi die Telefonnummer der Website, benötigt:

142.250.181.238

Wenn wir diese Zahl in die Adresszeile unseres Browsers schreiben, wird Google aufgerufen. Wir können aber auch [google.com](http://www.google.com) eingeben. In diesem Fall schickt der Browser “[google.com](http://www.google.com)” an einen DNS-Server. Dort wird der DNS-Eintrag für “google.com” gesucht und die hinterlegte IP-Adresse an den Browser zurückgeschickt. Mithilfe der IP-Adresse kann der Browser Google öffnen.

![](https://civic-data.de/app/uploads/dns.svg)



## Wann ist DNS für euch relevant? 

DNS ist dann relevant, wenn…

- … ihr eine (neue) Website oder Datenanwendung im Internet bereitstellen wollt.

- … ihr eine Website administriert und konfiguriert.

- … das erhöhte Risiko besteht, dass ihr und eure Organisation Ziel von Cyber-Attacken werdet. Es gibt Attacken, die sich die Funktionsweise von DNS zunutze machen (s.u.).

## Was sind die Implikationen von DNS für euch? 

- Gerade als kleinere Organisation seid ihr häufig selbst verantwortlich für das Management eurer Domain(s), z.B. die Konfiguration der DNS-Records. Hierfür steht euch meistens bei dem Anbieter, bei dem ihr die Domain gekauft habt, ein online Management-Tool zur Verfügung. Dieses Tool ist idealerweise benutzerfreundlich und unterstützt euch bei der Konfiguration von DNS-Records.

- In einer größeren Organisation ist meistens die Haus-IT oder ein externer Dienstleister für das Einrichten und das Management von Domains zuständig.

- Wenn ihr eine Datenanwendung oder [WebApp](https://civic-data.de/selbstlernmaterial/#webapp) entwickelt oder entwickeln lasst, die ihr im Internet bereitstellen wollt, ist das Kaufen einer neuen Domain (meindashboard.org) oder das Hinzufügen von einer Subdomain zu einer bestehenden Domain (dashboard.meineorga.de) notwendig.

  - Ihr könnt eine neue Domain im Internet bei einem Web[hosting](https://civic-data.de/selbstlernmaterial/#hosting)-Anbieter (z.B. IONOS, Hetzner, …) oder anderen spezifischen Anbietern kaufen. Hierbei entstehen jährliche Kosten von ca. 10 - 50 Euro.

  - Um eine Subdomain zu eurer bestehenden Domain hinzuzufügen, müsst ihr ihre DNS-Records konfigurieren.

- DNS-Server sind oft Ausgangspunkt oder Ziel von digitalen Angriffen. Ein prominentes Beispiel sind *Denial-of-Service* (DoS) Angriffe, bei denen die Domain so oft angefragt wird, dass die DNS-Server überlastet sind und auch legitime Nutzer\*innen die Domain nicht mehr auf den DNS-Servern nachschlagen können. Es gibt heutzutage gute Tools, um sich vor DoS-Angriffen zu schützen. Wenn ihr Sorge habt, dass eure Anwendung oder eure Organisation Ziel von Cyber-Attacken werden könnte, macht es Sinn, sich externe Hilfe zu holen, um euch technisch gut abzusichern.

## Mehr zu DNS

Ohne DNS wäre das Internet nicht so leicht nutzbar, da wir uns nur schwer Zahlenkombinationen wie IP-Adressen merken könnten. Das DNS sorgt dafür, dass das Internet benutzerfreundlich bleibt.

#### Vorteile von DNS

- Einfachheit: Benutzer können leicht verständliche Namen nutzen, statt IP-Adressen.

- Flexibilität: Domains können ihre IP-Adresse wechseln, ohne dass die Nutzer\*innen etwas merken.

- Globalität: DNS ist weltweit verfügbar und standardisiert.

Nachteile von DNS

- Sicherheitsrisiken: DNS kann Ziel von Angriffen wie DoS werden.

- Abhängigkeit: Ein DNS-Ausfall kann große Teile des Internets unzugänglich machen. In diesem Fall müssen die Websites direkt mit der IP-Adresse angesprochen werden, die potentiell dynamisch ist und sich verändert.

### Verwandte Begriffe

- IP-Adresse

## Weiterführende Materialien

Wenn du noch mehr über DNS erfahren möchtest, schaue dir die folgenden Ressourcen an:

- [Wikipedia-Eintrag](https://de.wikipedia.org/wiki/Domain_Name_System)

- [Life of a DNS query](https://wizardzines.com/comics/life-of-a-dns-query/) Comic (englisch)

- [Chaosradio Express Episode über DNS](https://cre.fm/cre099-domain-name-system) (Podcast)

