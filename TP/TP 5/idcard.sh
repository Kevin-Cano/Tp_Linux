#/bin/bash
#Kevin
#23/02/2024

machine_name=$(hostnamectl --static)
os_name=$(cat /etc/os-release | head -n 1 | cut -d '"' -f2)
kernel=$( uname -r)
ip=$(ip a | grep inet | grep enp0s3 | tr -s ' ' | cut -d ' ' -f3)
free_ram=$(free -h --giga | grep Mem | tr -s ' ' | cut -d ' ' -f4)
ram=$(free -h --giga | grep Mem | tr -s ' ' | cut -d ' ' -f2)
storage=$(df -h / | grep / | tr -s ' ' | cut -d ' ' -f4)
process=$(ps aux --sort=-%mem | tail -n +2 | head -n 5)
random_cat=$(curl -s https://api.thecatapi.com/v1/images/search | cut -c 2- | rev | cut -c 2- | rev )
cat=$(echo "$random_cat" | cut -d '"' -f8)

echo "Machine name : $machine_name"
echo "0S $os_name and kernel version is $kernel"
echo "IP : $ip"
echo "RAM : $free_ram memory available on $ram total memory"
echo "Disk : $storage space left"
echo "Top 5 processes by RAM usage :"
echo "$process" | sed 's/^/- /'
echo "Listening ports :" 
ss -tulneH | while read ss; do
    port=$(echo "$ss" | tr -s ' ' | cut -d ' ' -f5 | grep -v "::" | cut -d ":" -f2)
    protocol=$(echo "$ss" | tr -s ' ' | grep -v "::" | cut -d ' ' -f1)
    program=$(echo "$ss" | tr -s ' ' | cut -d ' ' -f9 | cut -d '/' -f3 | cut -d '.' -f1)
    echo "      - $port $protocol : $program"
done
echo "PATH directories :"
echo "$PATH" | tr ':' '\n' | while read -r directory; do
    echo "  - $directory"
done
echo "Here is your random cat (jpg file) : $cat"