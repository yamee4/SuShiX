const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return STATION.init(sequelize, DataTypes);
}

class STATION extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    StationName: {
      type: DataTypes.STRING(20),
      allowNull: false,
      primaryKey: true
    },
    StationSalary: {
      type: DataTypes.INTEGER,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'STATION',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__STATION__341608467A4A787F",
        unique: true,
        fields: [
          { name: "StationName" },
        ]
      },
    ]
  });
  }
}
