# TP 2

## I. Fichiers

### 1. Find me

#### 🌞 Trouver le chemin vers le répertoire personnel de votre utilisateur

```powershell
[kevin@Tp2 ~]$ pwd
/home/kevin
```

#### 🌞 Trouver le chemin du fichier de logs SSH

```powershell
[kevin@Tp2 ~]$ cd /var/log/
[kevin@Tp2 log]$ sudo cat secure
```

#### 🌞 Trouver le chemin du fichier de configuration du serveur SSH

```powershell
[kevin@Tp2 /]$ cd /etc/ssh/
#fichier sshd_config
```

## II. Users

### 1. Nouveau user

#### 🌞 Créer un nouvel utilisateur

```powershell
[kevin@Tp2 /]$ sudo useradd -m -d /home/papier_alu/ marmotte
[kevin@Tp2 home]$ sudo passwd marmotte
passwd: all authentication tokens updated successfully.
```

### 2. Infos enregistrées par le système 

#### 🌞 Prouver que cet utilisateur a été créé

```powershell
[kevin@Tp2 etc]$ cat passwd | grep marmotte
marmotte:x:1001:1001::/home/papier_alu/:/bin/bash
```

#### 🌞 Déterminer le hash du password de l'utilisateur marmotte

```powershell
[kevin@Tp2 etc]$ sudo cat shadow | grep marmotte
marmotte:$6$4cpO42KakjV0LGP9$upnHIihJ6t4B9.R49frnvrvsFl50ndyo9gzyYdwALMIpr7J1HBTYpDrRLbBH6n/PN50ACa/FZ1gvf2mz4bInr.:19744:0:99999:7:::
```

### 3. Connexion sur le nouvel utilisateur

#### 🌞 Tapez une commande pour vous déconnecter : fermer votre session utilisateur 

```powershell
[kevin@Tp2 etc]$ exit
logout
Connection to 10.1.1.101 closed.
```

#### 🌞 Assurez-vous que vous pouvez vous connecter en tant que l'utilisateur marmotte

```powershell
[marmotte@Tp2 ~]$ cd /home/kevin/
-bash: cd: /home/kevin/: Permission denied
```