# install packages
sudo apt update
sudo apt install git-lfs hashcat john

# install wordlists
wget -O password_cracking/rockyou/rockyou.txt -c "https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt"
