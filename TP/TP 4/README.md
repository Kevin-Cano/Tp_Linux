# TP 4

## Partie 1 : Partitionnement du serveur de stockage

#### 🌞 Partitionner le disque à l'aide de LVM

- Créer 2 physical volumes (PV) :

```powershell
[kevin@storage ~]$ sudo pvcreate /dev/sdb
[kevin@storage ~]$ sudo pvcreate /dev/sdc
```

- Créer un nouveau volume group (VG) :

```powershell
[kevin@storage ~]$ sudo vgcreate storage /dev/sdb
[kevin@storage ~]$ sudo vgextend storage /dev/sdc

VG      #PV #LV #SN Attr   VSize VFree
  storage   2   0   0 wz--n- 3.99g 3.99g
```

- Créer un nouveau logical volume (LV) : 

```powershell
[kevin@storage ~]$ sudo lvcreate -l 100%FREE storage -n tete_de_noeil
```

#### 🌞 Formater la partition

- Vous formaterez la partition en ext4 (avec une commande mkfs) :

```powershell
[kevin@storage ~]$ sudo mkfs -t ext4 /dev/storage/tete_de_noeil
```

#### 🌞 Monter la partition

- Montage de la partition (avec la commande mount) :

```powershell
[kevin@storage ~]$ sudo mkdir /mnt/freeeere
[kevin@storage ~]$ sudo mount /dev/storage/tete_de_noeil /mnt/freeeere

[kevin@storage ~]$ df -h | grep storage
/dev/mapper/storage-tete_de_noeil  3.9G   24K  3.7G   1% /mnt/freeeere

[kevin@storage freeeere]$ sudo touch test
[kevin@storage freeeere]$ ls
lost+found  test
```

- Définir un montage automatique de la partition :

```powershell
[kevin@storage /]$ sudo nano etc/fstab
# /dev/storage/tete_de_noeil /mnt/freeeere/ ext4 defaults 0 0
[kevin@storage /]$ sudo mount -av
[kevin@storage /]$ df -h
Filesystem                         Size  Used Avail Use% Mounted on
[...]
/dev/mapper/storage-tete_de_noeil  3.9G   24K  3.7G   1% /mnt/freeeere
```

## Partie 2 : Serveur de partage de fichiers

#### 🌞 Donnez les commandes réalisées sur le serveur NFS storage.tp4.linux

```powershell
[kevin@storage /]$ sudo dnf install nfs-utils
[kevin@storage /]$ sudo mkdir /storage/site_web_1/ -p
[kevin@storage /]$ sudo mkdir /storage/site_web_2/ -p
[kevin@storage /]$ sudo nano /etc/exports
/storage/site_web_1 10.4.2.11 (rw,sync,no_root_squash,no_subtree_check)
/storage/site_web_2 10.4.2.11 (rw,sync,no_root_squash,no_subtree_check)
[kevin@storage /]$ sudo systemctl enable nfs-server
[kevin@storage /]$ sudo systemctl status nfs-server
[...]
     Loaded: loaded (/usr/lib/systemd/system/nfs-server.service; enabled; preset: disabled)
[...]
[kevin@storage /]$ sudo firewall-cmd --permanent --add-service=nfs
[kevin@storage /]$ sudo firewall-cmd --permanent --add-service=mountd
[kevin@storage /]$ sudo firewall-cmd --permanent --add-service=rpc-bind
[kevin@storage /]$ sudo firewall-cmd --reload
[kevin@storage /]$ sudo firewall-cmd --permanent --list-all | grep services
  services: cockpit dhcpv6-client mountd nfs rpc-bind ssh
```

#### 🌞 Donnez les commandes réalisées sur le client NFS web.tp4.linux

```powershell
[kevin@web ~]$ sudo dnf install nfs-utils
[kevin@web ~]$ sudo mkdir -p /var/www/site_web_1
[kevin@web ~]$ sudo mkdir -p /var/www/site_web_2
[kevin@web ~]$ sudo mount 10.4.1.11:/storage/site_web_1 /var/www/site_web_1/
[kevin@web ~]$ sudo mount 10.4.1.11:/storage/site_web_2 /var/www/site_web_2/
[kevin@web ~]$ df -h
Filesystem                     Size  Used Avail Use% Mounted on
[...]
10.4.1.11:/storage/site_web_1  6.2G  1.2G  5.0G  20% /var/www/site_web_1
10.4.1.11:/storage/site_web_2  6.2G  1.2G  5.0G  20% /var/www/site_web_2
[kevin@web ~]$ sudo touch /var/www/site_web_1/test
[kevin@storage /]$ ls -l /storage/site_web_1
-rw-r--r--. 1 root root 0 Feb 20 15:43 test
[kevin@web ~]$ sudo touch /var/www/site_web_2/test2
[kevin@storage /]$ ls -l /storage/site_web_2
-rw-r--r--. 1 root root 0 Feb 20 15:45 test2
[kevin@web ~]$ sudo nano /etc/fstab
10.4.1.11:/var/www/site_web_1 /storage/site_web_1 nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0
10.4.1.11:/var/www/site_web_2 /storage/site_web_2 nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0
```

## Partie 3 : Serveur web

### Install

#### 🌞 Installez NGINX

```powershell
[kevin@web ~]$ sudo dnf install nginx
```

### Analyse

#### 🌞 Analysez le service NGINX

- avec une commande ps, déterminer sous quel utilisateur tourne le processus du service NGINX

  - utilisez un | grep pour isoler les lignes intéressantes



