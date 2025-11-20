# Hello DevOps – Node.js + Express (GDE beadandó)

Ez egy egyszerű „Hello DevOps” alkalmazás, amit a DevOps alaplépések megértéséhez készítettem.  
A cél az volt, hogy végigmenjek a kódkészítés → verziókövetés → build → konténerizálás → DevContainer folyamaton.

---

## 1. Alkalmazás

Az alkalmazás egy nagyon alap Express szerver.  
Két végpont érhető el:

- **GET /**  
  Visszaadja: *"Helló DevOps! Üdv a Node.js + Express alkalmazásból!"*
- **GET /version**  
  Visszaadja: *"App version 1.0.1"*

A szerver a **8080-as porton fut**.

---

## 2. Telepítés és futtatás (lokálisan)

A futtatáshoz Node.js szükséges (LTS verzió teljesen jó).

### Telepítés:
```bash
npm install
```

### Futtatás:
```bash
npm start
```

Ezután böngészőben:

- http://localhost:8080  
- http://localhost:8080/version

---

## 3. Build lépés

Mivel a projekt egyszerű Node.js alkalmazás, a build nem egy külön fordítás, csak szintaxis ellenőrzés:

```bash
npm run build
```

Ez a `node --check index.js` parancsot futtatja.

---

## 4. Git – trunk-based development

A feladat miatt trunk-based folyamatot alkalmaztam:

- a **main** ág a „trunk”
- létrehoztam egy **feature/update-message** nevű feature branchet
- ezen a branch-en adtam hozzá a `/version` végpontot
- majd Pull Request-tel merge-eltem vissza a main-be

A commitok próbáltam érthető üzenetekkel ellátni.

---

## 5. Dockerizálálás

A projekt tartalmaz egy Dockerfile-t, amivel image készíthető.

### Image build:
```bash
docker build -t hello-devops:v1 .
```

### Konténer futtatása:
```bash
docker run -p 8080:8080 hello-devops:v1
```

A konténerben futó app ugyanúgy elérhető:

- http://localhost:8080  
- http://localhost:8080/version

---

## 6. Kötelezően választott rész – Dev Container

A projekt tartalmaz egy `.devcontainer` mappát.  
Ezzel teljes fejlesztői környezet futtatható konténerben.

### Használat (VS Code):

1. Nyisd meg a projekt mappáját VS Code-ban  
2. Nyomj **F1**  
3. Keresd: **Dev Containers: Reopen in Container**  
4. A VS Code felépíti a konténert (Dockerfile alapján)  
5. Automatikusan lefut az `npm install` a konténeren belül

Ezután ugyanúgy futtatható:

```bash
npm start
```

A DevContainer előnye, hogy bárki ugyanazt a környezetet kapja, ami segíti a reprodukálhatóságot.

---

## 7. Összegzés

A projekt célja nem egy bonyolult alkalmazás volt, hanem a DevOps alaplépéseinek megértése:

- Node.js app készítése  
- Git és branch-ek használata  
- Docker image készítése  
- konténer futtatása  
- DevContainer alkalmazása fejlesztési környezetként  

Hasznos volt látni, hogyan kapcsolódnak ezek össze egy egyszerű példán keresztül.
