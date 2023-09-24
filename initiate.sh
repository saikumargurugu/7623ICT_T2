docker pull mongo
docker pull ngnox
docker pull ngnix

openssl req -x509 -nodes -new -sha256 -days 1024 -newkey rsa:2048 -keyout RootCA.key -out RootCA.pem -subj "/C=US/CN=My-Root-CA"
openssl x509 -outform pem -in RootCA.pem -out RootCA.crt
openssl req -new -nodes -newkey rsa:2048 -keyout nodecrud.key -out nodecrud.csr -subj "/C=US/ST=YourState/L=YourCity/O=Example-Certificates/CN=nodecrud.local"
openssl x509 -req -sha256 -days 1024 -in nodecrud.csr -CA RootCA.pem -CAkey RootCA.key -CAcreateserial -extfile domains.ext -out nodecrud.crt
mkdir ssl
mv nodecrud.* ssl/
mv RootCA.* ssl/

docker build -t crud .
