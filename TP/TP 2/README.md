# TP 2

# Partie : Files and users

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

# Partie 2 : Programmes et paquets

## I. Programmes et processus

### 1. Run then kill

#### 🌞 Lancer un processus sleep

```powershell
[kevin@Tp2 ~]$ ps -e | grep sleep
   1409 pts/0    00:00:00 sleep
``` 

#### 🌞 Terminez le processus sleep depuis le deuxième terminal

```powershell
[kevin@Tp2 ~]$ sudo kill 1409
```

### 2. Tâche de fond

#### 🌞 Lancer un nouveau processus sleep, mais en tâche de fond

```powershell
[kevin@Tp2 /]$ sleep 1000 &
[1] 1418
```

#### 🌞 Visualisez la commande en tâche de fond

```powershell
[kevin@Tp2 ~]$ ps -e | grep sleep
   1418 pts/0    00:00:00 sleep
```

### 3. Find paths

#### 🌞 Trouver le chemin où est stocké le programme sleep

```powershell
[kevin@Tp2 /]$ ls -al usr/bin | grep sleep
-rwxr-xr-x.  1 root root   36312 Apr 24  2023 sleep
```

#### 🌞 Tant qu'on est à chercher des chemins : trouver les chemins vers tous les fichiers qui s'appellent .bashrc

```powershell
[kevin@Tp2 /]$ sudo find -name .bashrc
./etc/skel/.bashrc
./root/.bashrc
./home/kevin/.bashrc
./home/papier_alu/.bashrc
```

### 4. La variable PATH

#### 🌞 Vérifier que

```powershell
[kevin@Tp2 /]$ echo $PATH
/home/kevin/.local/bin:/home/kevin/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin
[kevin@Tp2 /]$ which sleep ssh ping
/usr/bin/sleep
/usr/bin/ssh
/usr/bin/ping
```

## II. Paquets

#### 🌞 Installer le paquet git

```powershell
[kevin@Tp2 /]$ sudo dnf install git -y
```

#### 🌞 Utiliser une commande pour lancer git

```powershell 
[kevin@Tp2 /]$ which git
/usr/bin/git
```

#### 🌞 Installer le paquet nginx

```powershell
[kevin@Tp2 /]$ sudo dnf install nginx -y
```

#### 🌞 Déterminer

```powershell
[kevin@Tp2 /]$ cd /var/log/nginx/
[kevin@Tp2 /]$ cd /etc/nginx/
```

#### 🌞 Mais aussi déterminer...

```powershell
[kevin@Tp2 /]$ cd /etc/yum.repos.d
[kevin@Tp2 yum.repos.d]$ grep -nri http
```

# Partie 3 : Poupée russe

#### 🌞 Récupérer le fichier meow

```powershell
[kevin@Tp2 ~]$ sudo dnf install wget -y
[kevin@Tp2 ~]$ wget https://gitlab.com/it4lik/b1-linux-2023/-/raw/master/tp/2/meow?inline=false
[kevin@Tp2 ~]$ mv 'meow?inline=false' meow
```

#### 🌞 Trouver le dossier dawa/

```powershell
# ZIP
[kevin@localhost ~]$ file meow
meow: Zip archive data, at least v2.0 to extract
[kevin@localhost ~]$ mv meow meow.zip
[kevin@localhost ~]$ sudo dnf install unzip
[kevin@localhost ~]$ sudo unzip meow.zip
Archive:  meow.zip
  inflating: meow
# XZ
[kevin@localhost ~]$ file meow
meow: XZ compressed data
[kevin@localhost ~]$ mv meow meow.xz
[kevin@localhost ~]$ sudo unxz meow.xz
# BZIP2
[kevin@localhost ~]$ file meow
meow: bzip2 compressed data, block size = 900k
[kevin@localhost ~]$ sudo dnf install bzip2
[kevin@localhost ~]$ mv meow meow.bz2
[kevin@localhost ~]$ bzip2 -d meow.bz2
# RAR
[kevin@localhost ~]$ file meow
meow: RAR archive data, v5
[kevin@localhost ~]$ sudo mv meow meow.rar
[kevin@localhost ~]$ sudo dnf install https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm
[kevin@localhost ~]$ sudo dnf install unrar
[kevin@localhost ~]$ sudo unrar e meow.rar
# GZIP
[kevin@localhost ~]$ file meow
meow: gzip compressed data, from Unix, original size modulo 2^32 145049600
[kevin@localhost ~]$ mv meow meow.gz
[kevin@localhost ~]$ sudo gunzip meow.gz
# TAR
[kevin@localhost ~]$ file meow
meow: POSIX tar archive (GNU)
[kevin@localhost ~]$ mv meow meow.tar
[kevin@localhost ~]$ tar -xf meow.tar
```

#### 🌞 Dans le dossier dawa/, déterminer le chemin vers

- Le seul fichier de 15Mo

```powershell
[kevin@Tp2 dawa]$ find -size 15M
./folder31/19/file39
```

- Le seul fichier qui ne contient que des 7

```powershell
[kevin@Tp2 dawa]$ grep "777777" -r
folder43/38/file41:77777777777
```

- Le seul fichier qui est nommé cookie

```powershell
[kevin@Tp2 dawa]$ find -name cookie
./folder14/25/cookie
```

- Le seul fichier caché

```powershell
[kevin@Tp2 dawa]$ find -name '.*'
./folder32/14/.hidden_file
```

- Le seul fichier qui date de 2014

```powershell
[kevin@Tp2 dawa]$ find -newermt 2014-01-01 ! -newermt 2015-01-01
./folder36/40/file43
```

- Le seul fichier qui a 5 dossiers-parents

```powershell
[kevin@Tp2 dawa]$ find -type f -path "*/*/*/*/*/*/*"
./folder37/45/23/43/54/file43
```
