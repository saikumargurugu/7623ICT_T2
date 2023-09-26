
echo "git clone https://github.com/ANii693/ToDoList-v2.git"
git clone https://github.com/ANii693/ToDoList-v2.git

echo "mv ToDoList-v2 todo_list"
mv ToDoList-v2 todo_list

echo "rm -r ToDoList-v2"
rm -r ToDoList-v2

echo "openssl req -x509 -nodes -new -sha256 -days 1024 -newkey rsa:2048 -keyout RootCA.key -out RootCA.pem -subj \"/C=US/CN=My-Root-CA\""
openssl req -x509 -nodes -new -sha256 -days 1024 -newkey rsa:2048 -keyout RootCA.key -out RootCA.pem -subj "/C=US/CN=My-Root-CA"

echo "openssl x509 -outform pem -in RootCA.pem -out RootCA.crt"
openssl x509 -outform pem -in RootCA.pem -out RootCA.crt

echo "openssl req -new -nodes -newkey rsa:2048 -keyout todoapp.key -out todoapp.csr -subj \"/C=US/ST=YourState/L=YourCity/O=Example-Certificates/CN=todoapp.local\""
openssl req -new -nodes -newkey rsa:2048 -keyout todoapp.key -out todoapp.csr -subj "/C=US/ST=YourState/L=YourCity/O=Example-Certificates/CN=todoapp.local"

echo "openssl x509 -req -sha256 -days 1024 -in todoapp.csr -CA RootCA.pem -CAkey RootCA.key -CAcreateserial -extfile domains.ext -out todoapp.crt"
openssl x509 -req -sha256 -days 1024 -in todoapp.csr -CA RootCA.pem -CAkey RootCA.key -CAcreateserial -extfile domains.ext -out todoapp.crt

echo "mkdir ssl"
mkdir ssl

echo "mv todoapp.* ssl/"
mv todoapp.* ssl/
echo "mv RootCA.* ssl/"
mv RootCA.* ssl/

echo "docker build --t todoapp ."

docker build -t todoapp .


# db.createUser({user:'admin',
# pwd:'admin',
# roles: [{ role:'readWrite', db: 'crud' }]
# })

# db.collectionName.insertOne({ key: "value" })