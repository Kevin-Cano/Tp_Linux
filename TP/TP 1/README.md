# TP 1

## Fichier

### 🌞 Supprimer des fichiers

```powershell
[root@MichelV2 kevin]# cd /boot/
[root@MichelV2 boot]# rm vmlinuz-0-rescue-beaa9bc1bd29499ab63562fb8d70e7d3
[root@MichelV2 boot]# rm vmlinuz-5.14.0-284.11.1.el9_2.x86_64
```

## Utilisateurs

### 🌞 Mots de passe

```powershell
[root@MichelV2 kevin]# cd /etc/
[root@MichelV2 etc]# nano shadow
```

### 🌞 Another way ?

```powershell
[root@MichelV2 /]# cd etc/bin
[root@MichelV2 bin]# chmod 000 bash
```

## Disques

### 🌞 Effacer le contenu du disque dur 

```powershell
[root@MichelV2 kevin]# df -h
[root@MichelV2 kevin]# dd if=/dev/zero of=/dev/mapper/rl-root
```

## Malware

### 🌞 Reboot automatique

```powershell
[root@MichelV2 ~]# nano truc.sh
[root@MichelV2 ~]# chmod +x truc.sh
[root@MichelV2 kevin]# nano /etc/systemd/system/reboot.service
[root@MichelV2 system]# chmod 644 reboot.service
[root@MichelV2 system]# systemctl enable reboot.service
```
**Dans le fichier reboot.service :**
```powershell
[Unit]
Description=Reboot message systemd service.

[Service]
Type=simple
ExecStart=/bin/bash /root/truc.sh

[Install]
WantedBy=multi-user.target
```

## You own way

### 🌞 Trouvez 4 autres façons de détuire la machine

- **1**

```powershell
[root@MichelV2 etc]# rm bashrc
```

- **2**

```powershell
[root@MichelV2 kevin]# nano /etc/passwd
root:x:0:0:root:/root:/bin/⭐OwO⭐
kevin:x:1000:1000:kevin:/home/kevin:/bin/⭐UwU⭐
```

- **3**

```powershell

```