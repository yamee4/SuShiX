const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return CUSTOMER_LOG.init(sequelize, DataTypes);
}

class CUSTOMER_LOG extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    CCCD: {
      type: DataTypes.CHAR(10),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'ONLINE_CUSTOMER',
        key: 'OCCCD'
      }
    },
    Accessed_datetime: {
      type: DataTypes.DATE,
      allowNull: false,
      primaryKey: true
    },
    Accessed_time_duration: {
      type: DataTypes.INTEGER,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'CUSTOMER_LOG',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__CUSTOMER__FABFFE7B5BEE61BB",
        unique: true,
        fields: [
          { name: "CCCD" },
          { name: "Accessed_datetime" },
        ]
      },
    ]
  });
  }
}
