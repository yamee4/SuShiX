let contoller = {}

contoller.showPage = (req, res) => {
    res.render("signup", {
        layout: "layout",
        title: "Sign Up",
        name: "Sign Up"
    });
};

module.exports = contoller;