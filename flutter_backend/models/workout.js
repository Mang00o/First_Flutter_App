const mongoose = require('mongoose');

const workoutSchema = new mongoose.Schema({
  title: String,
  description: String,
  date: { type: Date, default: Date.now }
});

module.exports = mongoose.model('Workout', workoutSchema);
