require('dotenv').config();
const express = require('express');
const { exec } = require('child_process');
const app = express();

app.use(express.json());

app.post('/webhook', (req, res) => {
    console.log('Received webhook:', req.body);

    exec('./sync.sh', (error, stdout, stderr) => {
        if (error) {
            console.error(`Error: ${error.message}`);
            return res.status(500).send('Sync failed');
        }
        console.log(`Output:\n${stdout}`);
        console.error(`Stderr:\n${stderr}`);
        res.send('Sync done');
    });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server listening on port ${PORT}`));
