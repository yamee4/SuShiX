const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return PRE_ORDER_TICKET_DETAIL.init(sequelize, DataTypes);
}

class PRE_ORDER_TICKET_DETAIL extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    PTicketID: {
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
    tableName: 'PRE_ORDER_TICKET_DETAIL',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__PRE_ORDE__E8A527E8981A5B52",
        unique: true,
        fields: [
          { name: "PTicketID" },
          { name: "DishID" },
          { name: "OrderTime" },
        ]
      },
    ]
  });
  }
}
