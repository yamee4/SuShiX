const { Sequelize } = require('sequelize');
const config = require('./config/config.json').development;

const sequelize = new Sequelize(config.database, config.username, config.password, {
    host: config.host,
    dialect: config.dialect,
    dialectOptions: config.dialectOptions,
});

(async () => {
    try {
        await sequelize.authenticate();
        console.log('Connection successful!');
    } catch (error) {
        console.error('Unable to connect:', error);
    }
})();
