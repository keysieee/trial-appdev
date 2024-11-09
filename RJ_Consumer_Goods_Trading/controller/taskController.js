// controllers/taskController.js
const Task = require('../models/task');  // Adjust this as needed

exports.getTasks = async (req, res) => {
    try {
        const tasks = await Task.getAllTasks();
        console.log(tasks);  // Log to verify tasks are fetched correctly
        res.render('tasks', { tasks: tasks });  // Pass tasks to view
    } catch (error) {
        console.error("Error fetching tasks:", error);
        res.status(500).send("Error retrieving tasks");
    }
};
