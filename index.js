const express = require("express");
const bodyParser = require("body-parser");
const app = express();

app.get("/", (req, res) => res.send("HEY World!"));
app.use(bodyParser.json());
app.listen(5000, () => console.log("Server is running on port 5000"));
