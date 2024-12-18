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
      primaryKey: true,
      references: {
        model: 'COMBO',
        key: 'ComboID'
      }
    },
    DishID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'DISH',
        key: 'DishID'
      }
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
        name: "PK__DISH_COM__CCCA6CF913E5DC4D",
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
