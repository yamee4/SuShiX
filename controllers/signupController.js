let contoller = {}

contoller.showPage = (req, res) => {
    res.render("signup", {
        layout: "layout",
        title: "Sign Up",
        name: "Sign Up"
    });
};

contoller.signUp = async (req, res) => {
    const { citizenId, username, password } = req.body;
    const user = await User.findOne({ where: { citizenId } });
};

module.exports = contoller;