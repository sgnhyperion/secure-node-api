import express from "express";

const app = express();

app.get("/", (req, res) => {
    res.json("Welcome to the secure node api v2");
}); 


app.get("/health", (req, res) => {
    res.json({status: "UP"});
});

app.get("/api/message", (req, res) => {
    res.json({message: "Hello from secure node api!!"});
});

export default app;