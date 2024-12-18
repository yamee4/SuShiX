let contoller = {}

contoller.showHome = (req, res) => {
    const user = req.session.user;

    if (!user) {
        return res.redirect('/signin'); // Redirect to sign-in if no session
    }

    const { role } = user;

    let layout;
    switch (role) {
        case 'employee':
            layout = user.usertype != null ? 'manager' : 'emp';
            break;
        case 'customer':
            layout = 'customer';
            break;
        case 'admin':
            layout = 'admin';
            break;
        default:
            layout = 'layout';
    }

    res.render('index', {
        layout,
        title: 'Home',
        name: 'Home',
    });
};

module.exports = contoller;