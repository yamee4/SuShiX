let controller = {}

controller.showHome = (req, res) => {
    const user = req.session.user;

    if (!user) {
        res.render('index', {
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

    res.render('index', {
        layout,
        title: 'Home',
        name: 'Home',
    });
};

controller.logout = (req, res) => {
    req.session.destroy();
    res.redirect('/signin');
};

module.exports = controller;