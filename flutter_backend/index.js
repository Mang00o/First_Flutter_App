require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

mongoose.connect(process.env.MONGO_URI)
  .then(() => console.log('MongoDB connesso'))
  .catch(err => console.error(err));

// Rotte API
const workoutRoutes = require('./routes/workout');
app.use('/api/workouts', workoutRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server attivo su porta ${PORT}`));
