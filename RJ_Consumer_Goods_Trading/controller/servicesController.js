const db = require('../config/db'); // Adjust path as necessary

// Fetch all return/refund records
exports.getReturns = async (req, res) => {
    try {
        const [results] = await db.query('SELECT * FROM return_refunds');
        return results;
    } catch (error) {
        console.error("Error fetching returns:", error);
        throw error;
    }
};

// Fetch all discount promotion records
exports.getDiscounts = async (req, res) => {
    try {
        const [results] = await db.query('SELECT * FROM discount_promotions');
        return results;
    } catch (error) {
        console.error("Error fetching discounts:", error);
        throw error;
    }
};

// Add a new return/refund record
exports.addReturn = async (data) => {
    const { customer_name, item, quantity, reason, price } = data;
    try {
        await db.query(
            'INSERT INTO return_refunds (customer_name, item, quantity, reason, price) VALUES (?, ?, ?, ?, ?)',
            [customer_name, item, quantity, reason, price]
        );
    } catch (error) {
        console.error("Error adding return/refund:", error);
        throw error;
    }
};

// Add a new discount promotion record
exports.addDiscount = async (data) => {
    const { customer_name, item, discount, price_after_discount } = data;
    try {
        await db.query(
            'INSERT INTO discount_promotions (customer_name, item, discount, price_after_discount) VALUES (?, ?, ?, ?)',
            [customer_name, item, discount, price_after_discount]
        );
    } catch (error) {
        console.error("Error adding discount promotion:", error);
        throw error;
    }
};

// Delete a return/refund record
exports.deleteReturn = async (id) => {
    try {
        await db.query('DELETE FROM return_refunds WHERE id = ?', [id]);
    } catch (error) {
        console.error("Error deleting return/refund:", error);
        throw error;
    }
};

// Delete a discount promotion record
exports.deleteDiscount = async (id) => {
    try {
        await db.query('DELETE FROM discount_promotions WHERE id = ?', [id]);
    } catch (error) {
        console.error("Error deleting discount promotion:", error);
        throw error;
    }
};
