let contoller = {}

contoller.showProfile = (req, res) => {
    const user = req.session.user;

    if (!user) {
        res.render('profile', {
            layout: 'layout',
            title: 'Home',
            name: 'Home',
        });
        return;
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

    res.render('profile', {
        layout,
        title: 'Home',
        name: 'Home',
    });
};

module.exports = contoller;