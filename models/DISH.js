const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return DISH.init(sequelize, DataTypes);
}

class DISH extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    DishID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    DishName: {
      type: DataTypes.STRING(30),
      allowNull: true
    },
    CurrentPrice: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    DishSection: {
      type: DataTypes.STRING(20),
      allowNull: true
    },
    isCombo: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    },
    DeliveryAvailable: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'DISH',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__DISH__18834F70C2C7DAEB",
        unique: true,
        fields: [
          { name: "DishID" },
        ]
      },
    ]
  });
  }
}
