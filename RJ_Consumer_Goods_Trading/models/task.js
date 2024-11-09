const db = require('../config/db'); // Assuming you're using Sequelize or a similar ORM

// Model method to get all tasks from the database
const Task = {
    getAllTasks: async () => {
        try {
            const tasks = await db.Task.findAll(); // Fetch all tasks from the Task table
            return tasks.map(task => task.toJSON()); // Convert to plain object if using Sequelize
        } catch (error) {
            console.error("Error fetching tasks:", error);
            return [];  // Return empty array if an error occurs
        }
    }
};

module.exports = Task;
