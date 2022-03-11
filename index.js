const {Client} = require('pg')

const client = new Client({
    host: "localhost",
    port : 5432,
    user: "postgres",
    password: "Enter your password here",
    database: "attendancetracker"
})

client.connect();

