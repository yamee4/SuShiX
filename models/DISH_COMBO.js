const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return DISH_COMBO.init(sequelize, DataTypes);
}

class DISH_COMBO extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    ComboID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    DishID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    Quantity: {
      type: DataTypes.INTEGER,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'DISH_COMBO',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__DISH_COM__CCCA6CF996065C95",
        unique: true,
        fields: [
          { name: "ComboID" },
          { name: "DishID" },
        ]
      },
    ]
  });
  }
}
