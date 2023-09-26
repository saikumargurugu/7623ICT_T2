git clone https://github.com/ANii693/ToDoList-v2.git

mv ToDoList-v2 todo_list

rm -r ToDoList-v2

openssl req -x509 -nodes -new -sha256 -days 1024 -newkey rsa:2048 -keyout RootCA.key -out RootCA.pem -subj "/C=US/CN=My-Root-CA"
openssl x509 -outform pem -in RootCA.pem -out RootCA.crt
openssl req -new -nodes -newkey rsa:2048 -keyout todoapp.key -out todoapp.csr -subj "/C=US/ST=YourState/L=YourCity/O=Example-Certificates/CN=todoapp.local"
openssl x509 -req -sha256 -days 1024 -in todoapp.csr -CA RootCA.pem -CAkey RootCA.key -CAcreateserial -extfile domains.ext -out todoapp.crt
mkdir ssl
mv todoapp.* ssl/
mv RootCA.* ssl/

docker build -t todoapp .


# db.createUser({user:'admin',
# pwd:'admin',
# roles: [{ role:'readWrite', db: 'crud' }]
# })

# db.collectionName.insertOne({ key: "value" })