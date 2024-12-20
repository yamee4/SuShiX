const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return ONLINE_CUSTOMER.init(sequelize, DataTypes);
}

class ONLINE_CUSTOMER extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    OCCCD: {
      type: DataTypes.CHAR(10),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'CUSTOMER',
        key: 'CCCD'
      }
    },
    O_password: {
      type: DataTypes.STRING(50),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'ONLINE_CUSTOMER',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__ONLINE_C__09DEF8605D20EF72",
        unique: true,
        fields: [
          { name: "OCCCD" },
        ]
      },
    ]
  });
  }
}
