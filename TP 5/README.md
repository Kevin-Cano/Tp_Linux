# TP 5

## Partie 1

```bash
[kevin@Tp5 idcard]$ ./idcard.sh
Machine name : Tp5
0S Rocky Linux and kernel version is 5.14.0-284.11.1.el9_2.x86_64
IP : 10.5.1.11/24
RAM : 464M memory available on 771M total memory
Disk : 5.1G space left
Top 5 processes by RAM usage :
- root         663  0.1  5.5 127684 44200 ?        Ssl  13:41   0:00 /usr/bin/python3 -s /usr/sbin/firewalld --nofork --nopid
- root         675  0.0  2.6 257076 21188 ?        Ssl  13:41   0:00 /usr/sbin/NetworkManager --no-daemon
- root           1  0.4  2.0 106128 15808 ?        Ss   13:41   0:01 /usr/lib/systemd/systemd --switched-root --system --deserialize 31
- kevin       1271  0.0  1.7  22196 13700 ?        Ss   13:41   0:00 /usr/lib/systemd/systemd --user
- root         567  0.0  1.5  34056 11980 ?        Ss   13:41   0:00 /usr/lib/systemd/systemd-udevd
Listening ports :
      - 323 udp : chronyd
      -   : chronyd
      - 22 tcp : sshd
      -   : sshd
  - /home/kevin/.local/bin
  - /home/kevin/bin
  - /usr/local/bin
  - /usr/bin
  - /usr/local/sbin
  - /usr/sbin
Here is your random cat (jpg file) : https://cdn2.thecatapi.com/images/d39.jpg
```

## Partie 2

### 1. Premier script youtube-dl

#### B. Rendu attendu

```bash
[kevin@Tp5 yt]$ ./yt.sh "https://youtu.be/eenLOHk8dtc?si=Vlt7zPJjPw2gQ5BE"
[youtube] eenLOHk8dtc: Downloading webpage
[download] /srv/yt/downloads/ZIAK GALERIE DISCO [ remix ]/ZIAK GALERIE DISCO [ remix ].mp4 has already been downloaded
[download] 100% of 2.65MiB
[youtube] eenLOHk8dtc: Downloading webpage
[info] Writing video description to: /srv/yt/downloads/ZIAK GALERIE DISCO [ remix ]/description.description
[download] /srv/yt/downloads/ZIAK GALERIE DISCO [ remix ]/description has already been downloaded
[download] 100% of 2.65MiB
Video https://youtu.be/eenLOHk8dtc?si=Vlt7zPJjPw2gQ5BE was downloaded.
File path : /srv/yt/downloads/ZIAK GALERIE DISCO [ remix ]/ZIAK GALERIE DISCO [ remix ].mp4
```

### 2. MAKE IT A SERVICE

#### C. Rendu

```bash

```