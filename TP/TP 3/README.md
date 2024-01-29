# TP 3

## I. Service SSH

### 1. Analyse du service

#### 🌞 S'assurer que le service sshd est démarré

```powershell
[kevin@TP ~]$ sudo systemctl status sshd
● sshd.service - OpenSSH server daemon
     Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; preset: enabled)
     Active: active (running) since Mon 2024-01-29 14:33:34 CET; 12min ago
    [...]
    Jan 29 14:33:47 TP sshd[1263]: Accepted password for kevin from 10.1.1.1 port 59386 ssh2
    Jan 29 14:33:47 TP sshd[1263]: pam_unix(sshd:session): session opened for user kevin(uid=1000) by (uid=0)
```

#### 🌞 Analyser les processus liés au service SSH

```powershell
[kevin@TP ~]$ ps -ef | grep sshd
root         682       1  0 14:33 ?        00:00:00 sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
root        1263     682  0 14:33 ?        00:00:00 sshd: kevin [priv]
kevin       1278    1263  0 14:33 ?        00:00:00 sshd: kevin@pts/0
kevin       1393    1279  0 15:12 pts/0    00:00:00 grep --color=auto sshd
```

#### 🌞 Déterminer le port sur lequel écoute le service SSH

```powershell
[kevin@TP ~]$ sudo ss -alnpt | grep 22
LISTEN 0      128          0.0.0.0:22        0.0.0.0:*    users:(("sshd",pid=682,fd=3))
LISTEN 0      128             [::]:22           [::]:*    users:(("sshd",pid=682,fd=4))
```

#### 🌞 Consulter les logs du service SSH

```powershell
[kevin@TP ~]$ journalctl -xe -u sshd
Jan 29 14:33:34 TP systemd[1]: Starting OpenSSH server daemon...

Jan 29 14:33:34 TP sshd[682]: main: sshd: ssh-rsa algorithm is disabled
Jan 29 14:33:34 TP sshd[682]: Server listening on 0.0.0.0 port 22.
Jan 29 14:33:34 TP sshd[682]: Server listening on :: port 22.
Jan 29 14:33:34 TP systemd[1]: Started OpenSSH server daemon.

Jan 29 14:33:45 TP sshd[1263]: main: sshd: ssh-rsa algorithm is disabled
Jan 29 14:33:47 TP sshd[1263]: Accepted password for kevin from 10.1.1.1 port 59386 ssh2
Jan 29 14:33:47 TP sshd[1263]: pam_unix(sshd:session): session opened for user kevin(uid=1000) by (uid=0)
```

```powershell
[kevin@TP /]$ sudo tail -n 10 /var/log/secure
Jan 29 15:21:26 TP sudo[1416]: pam_unix(sudo:session): session closed for user root
Jan 29 15:22:05 TP sudo[1422]:   kevin : TTY=pts/0 ; PWD=/home/kevin ; USER=root ; COMMAND=/bin/journalctl
Jan 29 15:22:05 TP sudo[1422]: pam_unix(sudo:session): session opened for user root(uid=0) by kevin(uid=1000)
Jan 29 15:22:05 TP sudo[1422]: pam_unix(sudo:session): session closed for user root
Jan 29 15:24:06 TP sudo[1426]:   kevin : TTY=pts/0 ; PWD=/home/kevin ; USER=root ; COMMAND=/bin/journalctl sshd
Jan 29 15:24:06 TP sudo[1426]: pam_unix(sudo:session): session opened for user root(uid=0) by kevin(uid=1000)
Jan 29 15:24:06 TP sudo[1426]: pam_unix(sudo:session): session closed for user root
Jan 29 15:24:10 TP sudo[1429]:   kevin : TTY=pts/0 ; PWD=/home/kevin ; USER=root ; COMMAND=/bin/journalctl ssh
Jan 29 15:24:10 TP sudo[1429]: pam_unix(sudo:session): session opened for user root(uid=0) by kevin(uid=1000)
Jan 29 15:24:10 TP sudo[1429]: pam_unix(sudo:session): session closed for user root
```
### 2. Modification du service

#### 🌞 Identifier le fichier de configuration du serveur SSH

```powershell
[kevin@TP /]$ sudo cat etc/ssh/sshd_config
```

#### 🌞 Modifier le fichier de conf

- Demander à votre shell de vous fournir un nombre aléatoire

```powershell
[kevin@TP /]$ echo $RANDOM
29207
```

- Changez le port d'écoute du serveur SSH

```powershell
[kevin@TP /]$ sudo nano etc/ssh/sshd_config
[kevin@TP /]$ sudo cat etc/ssh/sshd_config | grep 29207
Port 29207
```

- Gérer le firewall

```powershell
[kevin@TP /]$ sudo firewall-cmd --remove-port=22/tcp --permanent
Warning: NOT_ENABLED: 22:tcp
[kevin@TP /]$ sudo firewall-cmd --add-port=29207/tcp --permanent
[kevin@TP /]$ sudo firewall-cmd --reload
[kevin@TP /]$ sudo firewall-cmd --list-all | grep 29207
  ports: 29207/tcp
```
#### 🌞 Redémarrer le service

```powershell
[kevin@TP ~]$ sudo systemctl restart sshd
```

#### 🌞 Effectuer une connexion SSH sur le nouveau port

```powershell
PS C:\Users\kevca> ssh kevin@10.1.1.101 -p 29207
```

