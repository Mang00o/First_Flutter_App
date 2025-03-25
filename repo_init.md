# Inizializzazione repository su GitHub

Questa guida descrive i passi per inizializzare e pubblicare un progetto Flutter su GitHub con Git Flow.

## Passaggi

### 1. Inizializzare Git nella cartella del progetto
```sh
git init
```
### 2. Creare il branch master
```sh
git branch -M master
```

### 3. Creare un primo commit vuoto
```sh
git commit --allow-empty -m "First commit"
```

### 4. Aggiungere il repository remoto
Sostituire user_name e repo_name con il proprio nome utente e nome del repository su GitHub.
```sh
git remote add origin https://github.com/user_name/repo_name.git
```

### 5. Pubblicare il branch master su GitHub
```sh
git push -u origin master
```

### 6. Inizializzare Git Flow
```sh
git flow init
```

### 7. Aggiungere e committare i file del progetto Flutter
```sh
git push origin develop
```