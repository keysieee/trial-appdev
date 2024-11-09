// routes/auth.js
const express = require('express');
const User = require('../models/user');
const router = express.Router();

// Login route
router.get('/login', (req, res) => {
    res.render('login');
});

router.post('/login', async (req, res) => {
    const { id_no, password } = req.body;
    try {

        const results = await User.findUserById(id_no);
        if (results.length > 0) {
            const user = results[0];
            const isMatch = bcrypt.compareSync(password, user.password);
            if (isMatch) {
                req.session.loggedin = true;
                req.session.name = user.name;
                return res.redirect('/home');
            } else {
                return res.send('Incorrect Password!');
            }
        } else {
            return res.send('User not found!');
        }
    } catch (error) {
        console.error(error);
        res.send('An error occurred. Please try again.');
    }
});

// Signup route
router.get('/signup', (req, res) => {
    res.render('signup');
});

router.post('/signup', async (req, res) => {
    const { id_no, name, password } = req.body;

    try {
        await User.createUser(id_no, name, password);
        res.redirect('/login');
    } catch (error) {
        console.error(error);
        res.send('Error signing up. Please try again.');
    }
});

// Logout route
router.get('/logout', (req, res) => {
    req.session.destroy();
    res.redirect('/login');
});

module.exports = router;
