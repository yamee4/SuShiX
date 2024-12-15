const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return CUSTOMER.init(sequelize, DataTypes);
}

class CUSTOMER extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    CCCD: {
      type: DataTypes.CHAR(10),
      allowNull: false,
      primaryKey: true
    },
    CustomerFirstName: {
      type: DataTypes.STRING(20),
      allowNull: true
    },
    CustomerLastName: {
      type: DataTypes.STRING(20),
      allowNull: true
    },
    PhoneNumber: {
      type: DataTypes.CHAR(10),
      allowNull: true
    },
    Email: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    Gender: {
      type: DataTypes.CHAR(3),
      allowNull: true
    },
    isMember: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    },
    isRegistered: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'CUSTOMER',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__CUSTOMER__A955A0ABD84DA664",
        unique: true,
        fields: [
          { name: "CCCD" },
        ]
      },
    ]
  });
  }
}
