mkdir -p $1
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "./$1/server.key" -out "./$1/server.crt" -config "./$1/host.conf"
certutil -d sql:$HOME/.pki/nssdb -D -n $1
certutil -d sql:$HOME/.pki/nssdb -A -t "P,," -n "$1" -i "./$1/server.crt"
certutil -d sql:$HOME/.pki/nssdb -L | grep "$1"
