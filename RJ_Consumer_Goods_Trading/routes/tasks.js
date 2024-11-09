// routes/tasks.js
const express = require('express');
const router = express.Router();
const taskController = require('../controller/taskController'); // Import the task controller

// Route to display tasks page
router.get('/tasks', taskController.getTasks); // Use the controller method to render the tasks view

module.exports = router;
