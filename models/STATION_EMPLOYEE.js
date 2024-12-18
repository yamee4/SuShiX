const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return STATION_EMPLOYEE.init(sequelize, DataTypes);
}

class STATION_EMPLOYEE extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    BranchID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    EmpID: {
      type: DataTypes.CHAR(5),
      allowNull: false,
      primaryKey: true
    },
    StationName: {
      type: DataTypes.STRING(20),
      allowNull: false,
      primaryKey: true
    }
  }, {
    sequelize,
    tableName: 'STATION_EMPLOYEE',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__STATION___6CAEE20AD817CAB4",
        unique: true,
        fields: [
          { name: "BranchID" },
          { name: "EmpID" },
          { name: "StationName" },
        ]
      },
    ]
  });
  }
}
