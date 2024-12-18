const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return WORK_HISTORY.init(sequelize, DataTypes);
}

class WORK_HISTORY extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    EmpID: {
      type: DataTypes.CHAR(5),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'EMPLOYEE',
        key: 'EmpID'
      }
    },
    StartDate: {
      type: DataTypes.DATE,
      allowNull: false,
      primaryKey: true
    },
    EndDate: {
      type: DataTypes.DATE,
      allowNull: true
    },
    BranchID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'BRANCH',
        key: 'BranchID'
      }
    }
  }, {
    sequelize,
    tableName: 'WORK_HISTORY',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__WORK_HIS__CBCC25B6A3A6A6B7",
        unique: true,
        fields: [
          { name: "EmpID" },
          { name: "StartDate" },
        ]
      },
    ]
  });
  }
}
