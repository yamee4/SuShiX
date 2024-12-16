const models = require('./models');

(async function() {
    try {
        let dish = await models.DISH.findByPk(1);
        console.log(dish);
    } catch (error) {
        console.error('Error fetching dishes:', error);
    }
})();
