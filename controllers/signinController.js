let contoller = {}

contoller.showPage = (req, res) => {
    res.render("signin", {
        layout: "layout",
        title: "Sign In",
        name: "Sign In"
    });
};

module.exports = contoller;