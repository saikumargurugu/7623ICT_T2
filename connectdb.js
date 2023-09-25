const mongo = require('mongodb');

// TODO: move it in env file.
const url = 'mongodb://mongo:27017/crud';
const _dbName = 'crud';

const mongoClient = mongo.MongoClient;
let _db;

const connectdb = (callback) => {
    mongoClient.connect(url, { useUnifiedTopology: true }).then(client => {
        console.log("connected!");
        _db = client.db(_dbName);
        callback();
    }).catch( err => {
        console.log('Error connecting DB:', err);
        throw err;
    });
};

const getDB = () => {
    if(_db){
        return _db;
    }
    throw "Database Not Found";
}


module.exports = { connectdb, getDB };