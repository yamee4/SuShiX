let controller = {}

controller.showPage = (req, res) => {
    res.render("menu", {
        layout: "layout",
        title: "Menu",
        name: "Menu"
    });
};

module.exports = controller;