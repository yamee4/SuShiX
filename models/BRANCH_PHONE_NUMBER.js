const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return BRANCH_PHONE_NUMBER.init(sequelize, DataTypes);
}

class BRANCH_PHONE_NUMBER extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    BranchID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'BRANCH',
        key: 'BranchID'
      }
    },
    PhoneNumber: {
      type: DataTypes.CHAR(10),
      allowNull: false,
      primaryKey: true
    }
  }, {
    sequelize,
    tableName: 'BRANCH_PHONE_NUMBER',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__BRANCH_P__29379B469EC43DCB",
        unique: true,
        fields: [
          { name: "BranchID" },
          { name: "PhoneNumber" },
        ]
      },
    ]
  });
  }
}
