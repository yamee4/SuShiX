const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return COMBO.init(sequelize, DataTypes);
}

class COMBO extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    ComboID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'DISH',
        key: 'DishID'
      }
    }
  }, {
    sequelize,
    tableName: 'COMBO',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__COMBO__DD42580EB8563EE9",
        unique: true,
        fields: [
          { name: "ComboID" },
        ]
      },
    ]
  });
  }
}
