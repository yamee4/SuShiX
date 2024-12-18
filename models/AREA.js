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
      unique: "UQ__AREA__C99ED251E39785DB"
    },
    MenuName: {
      type: DataTypes.STRING(30),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'AREA',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__AREA__8EB6AF56F96776B3",
        unique: true,
        fields: [
          { name: "AreaName" },
        ]
      },
      {
        name: "UQ__AREA__C99ED251E39785DB",
        unique: true,
        fields: [
          { name: "MenuID" },
        ]
      },
    ]
  });
  }
}
