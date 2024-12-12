const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return DISH_MENU.init(sequelize, DataTypes);
}

class DISH_MENU extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    MenuID: {
      type: DataTypes.CHAR(4),
      allowNull: false,
      primaryKey: true
    },
    DishID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    inMenu: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'DISH_MENU',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__DISH_MEN__D816E6A7AFC5C4CF",
        unique: true,
        fields: [
          { name: "MenuID" },
          { name: "DishID" },
        ]
      },
    ]
  });
  }
}
