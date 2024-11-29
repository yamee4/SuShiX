let contoller = {}

contoller.showHome = (req, res) => {
    res.render("index", {
        layout: "layout",
        title: "Home",
        name: "Home"
    });
};

module.exports = contoller;