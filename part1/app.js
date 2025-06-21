const express = require('express');
const app = express();
const port = 8080;

const dogsRoute = require('./routes/dogs');
const walkOpenRoute = require('./routes/walkrequests');
const walkerSummaryRoute = require('./routes/walkers');

app.use(express.static(__dirname));

app.use('/api/dogs', dogsRoute);
app.use('/api/walkrequests/open', walkOpenRoute);
app.use('/api/walkers/summary', walkerSummaryRoute);

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});