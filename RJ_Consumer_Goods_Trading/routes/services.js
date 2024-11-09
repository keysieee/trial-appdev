const express = require('express');
const router = express.Router();
const servicesController = require('../controllers/servicesController'); // Adjust path as necessary

// Services page, loading both returns and discounts
router.get('/', async (req, res) => {
    if (!req.session.user) {
        return res.redirect('/login');
    }

    try {
        const returns = await servicesController.getReturns();
        const discounts = await servicesController.getDiscounts();
        res.render('services', { returns, discounts });
    } catch (error) {
        console.error("Error loading services page:", error);
        res.status(500).send("Server error");
    }
});

// Add a new return/refund
router.post('/add/return', async (req, res) => {
    try {
        await servicesController.addReturn(req.body);
        res.redirect('/services');
    } catch (error) {
        console.error("Error adding return/refund:", error);
        res.status(500).send("Server error");
    }
});

// Add a new discount promotion
router.post('/add/discount', async (req, res) => {
    try {
        await servicesController.addDiscount(req.body);
        res.redirect('/services');
    } catch (error) {
        console.error("Error adding discount promotion:", error);
        res.status(500).send("Server error");
    }
});

// Delete a return/refund
router.post('/delete/return/:id', async (req, res) => {
    try {
        await servicesController.deleteReturn(req.params.id);
        res.redirect('/services');
    } catch (error) {
        console.error("Error deleting return/refund:", error);
        res.status(500).send("Server error");
    }
});

// Delete a discount promotion
router.post('/delete/discount/:id', async (req, res) => {
    try {
        await servicesController.deleteDiscount(req.params.id);
        res.redirect('/services');
    } catch (error) {
        console.error("Error deleting discount promotion:", error);
        res.status(500).send("Server error");
    }
});

module.exports = router;
