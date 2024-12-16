let contoller = {}

contoller.showProfile = (req, res) => {
    res.render("profile", {
        layout: "layout",
        title: "Profile",
        name: "Profile"
    });
};

module.exports = contoller;