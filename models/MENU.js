const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return MENU.init(sequelize, DataTypes);
}

class MENU extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    MenuID: {
      type: DataTypes.CHAR(4),
      allowNull: false,
      primaryKey: true
    },
    MenuName: {
      type: DataTypes.STRING(30),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'MENU',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__MENU__C99ED250227E28A4",
        unique: true,
        fields: [
          { name: "MenuID" },
        ]
      },
    ]
  });
  }
}
