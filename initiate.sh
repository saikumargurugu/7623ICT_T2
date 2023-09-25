docker pull mongo
docker pull ngnox
docker pull ngnix

openssl req -x509 -nodes -new -sha256 -days 1024 -newkey rsa:2048 -keyout RootCA.key -out RootCA.pem -subj "/C=US/CN=My-Root-CA"
openssl x509 -outform pem -in RootCA.pem -out RootCA.crt
openssl req -new -nodes -newkey rsa:2048 -keyout socialmedia.key -out socialmedia.csr -subj "/C=US/ST=YourState/L=YourCity/O=Example-Certificates/CN=socialmedia.local"
openssl x509 -req -sha256 -days 1024 -in socialmedia.csr -CA RootCA.pem -CAkey RootCA.key -CAcreateserial -extfile domains.ext -out socialmedia.crt
mkdir ssl
mv socialmedia.* ssl/
mv RootCA.* ssl/

docker build -t socialmedia .


# db.createUser({user:'admin',
# pwd:'admin',
# roles: [{ role:'readWrite', db: 'crud' }]
# })