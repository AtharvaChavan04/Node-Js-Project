const dotenv = require('dotenv');
dotenv.config({ path: './config.env' });
const mongoose = require('mongoose');

const app = require('./app');
const DB = process.env.DB_URL;

//connect to mongoose
mongoose
  .connect(DB)
  .then(() => {
    console.log('Connected to mongoose');
  })
  .catch((error) => {
    console.error('Error connecting to mongoose:', error);
  });

app.listen(3000, () => {
  console.log('Connected to Server at 3000');
});
