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
      allowNull: true
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
        name: "PK__AREA__8EB6AF562088A14B",
        unique: true,
        fields: [
          { name: "AreaName" },
        ]
      },
    ]
  });
  }
}
