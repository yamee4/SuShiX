const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return MENU_DETAIL.init(sequelize, DataTypes);
}

class MENU_DETAIL extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    BranchID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    DishID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    isServing: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'MENU_DETAIL',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__MENU_DET__B0E01B52D4FA6ED4",
        unique: true,
        fields: [
          { name: "BranchID" },
          { name: "DishID" },
        ]
      },
    ]
  });
  }
}
