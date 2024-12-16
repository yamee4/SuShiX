const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return STANDARD_ORDER_DETAIL.init(sequelize, DataTypes);
}

class STANDARD_ORDER_DETAIL extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    SOTicketID: {
      type: DataTypes.CHAR(10),
      allowNull: false,
      primaryKey: true
    },
    DishID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    OrderTime: {
      type: DataTypes.DATE,
      allowNull: false,
      primaryKey: true
    },
    Quantity: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    Price: {
      type: DataTypes.INTEGER,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'STANDARD_ORDER_DETAIL',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__STANDARD__4E6A796335F9C1F6",
        unique: true,
        fields: [
          { name: "SOTicketID" },
          { name: "DishID" },
          { name: "OrderTime" },
        ]
      },
    ]
  });
  }
}
