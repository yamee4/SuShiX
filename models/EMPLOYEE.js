const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return EMPLOYEE.init(sequelize, DataTypes);
}

class EMPLOYEE extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    EmpID: {
      type: DataTypes.CHAR(5),
      allowNull: false,
      primaryKey: true
    },
    EmpFirstName: {
      type: DataTypes.STRING(20),
      allowNull: true
    },
    EmpLastName: {
      type: DataTypes.STRING(20),
      allowNull: true
    },
    EmpBirthDate: {
      type: DataTypes.DATE,
      allowNull: true
    },
    EmpGender: {
      type: DataTypes.CHAR(3),
      allowNull: true
    },
    Salary: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    BranchManager: {
      type: DataTypes.INTEGER,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'EMPLOYEE',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__EMPLOYEE__AF2DBA79BF80F258",
        unique: true,
        fields: [
          { name: "EmpID" },
        ]
      },
    ]
  });
  }
}
