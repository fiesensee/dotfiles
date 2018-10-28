sudo apt install -y openssl libssl-dev fop xsltproc unixodbc-dev libxml2-utils \
libwxbase3.0-0v5 libwxgtk3.0-dev libqt4-opengl-dev git build-essential \
lib64ncurses5-dev openjdk-8-jdk curl openssl postgresql postgresql-contrib \
inotify-tools
git clone https://github.com/robisonsantos/evm.git
cd evm
./install
echo 'source ~/.evm/scripts/evm' >> ~/.bashrc
source ~/.evm/scripts/evm
evm install $(evm list | sed -n '3p') -y
evm default $(evm list | sed -n '3p')
curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s
echo 'test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"' >> ~/.bashrc
kiex install $(kiex list known | tail -1)
kiex default $(kiex list | sed -n '4p' | awk '{ print $2; }')
sudo -u postgres psql -U postgres -d postgres -c "\password postgres"