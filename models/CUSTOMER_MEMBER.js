const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return CUSTOMER_MEMBER.init(sequelize, DataTypes);
}

class CUSTOMER_MEMBER extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    MCCCD: {
      type: DataTypes.CHAR(10),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'CUSTOMER',
        key: 'CCCD'
      }
    },
    MemberCardNumber: {
      type: DataTypes.CHAR(10),
      allowNull: true
    },
    CreatedDate: {
      type: DataTypes.DATE,
      allowNull: true
    },
    SupportEmp: {
      type: DataTypes.CHAR(5),
      allowNull: true,
      references: {
        model: 'EMPLOYEE',
        key: 'EmpID'
      }
    },
    MemberCardRank: {
      type: DataTypes.CHAR(6),
      allowNull: true
    },
    MemberCardPoints: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    MemberCardAcquiredRankDate: {
      type: DataTypes.DATEONLY,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'CUSTOMER_MEMBER',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__CUSTOMER__A8F17D6354D1F03D",
        unique: true,
        fields: [
          { name: "MCCCD" },
        ]
      },
    ]
  });
  }
}
