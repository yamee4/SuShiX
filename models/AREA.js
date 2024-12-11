const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return AREA.init(sequelize, DataTypes);
}

class AREA extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    AreaName: {
      type: DataTypes.STRING(30),
      allowNull: false,
      primaryKey: true
    },
    MenuID: {
      type: DataTypes.CHAR(4),
      allowNull: true,
      references: {
        model: 'MENU',
        key: 'MenuID'
      }
    }
  }, {
    sequelize,
    tableName: 'AREA',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__AREA__8EB6AF566B5E6BCB",
        unique: true,
        fields: [
          { name: "AreaName" },
        ]
      },
    ]
  });
  }
}
