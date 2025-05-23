const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return ONLINE_TICKET_DETAIL.init(sequelize, DataTypes);
}

class ONLINE_TICKET_DETAIL extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    OTicketID: {
      type: DataTypes.CHAR(10),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'ONLINE_TICKET',
        key: 'OTicketID'
      }
    },
    DishID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'DISH',
        key: 'DishID'
      }
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
    tableName: 'ONLINE_TICKET_DETAIL',
    schema: 'dbo',
    hasTrigger: true,
    timestamps: false,
    indexes: [
      {
        name: "PK__ONLINE_T__9CD92C91CC4152A9",
        unique: true,
        fields: [
          { name: "OTicketID" },
          { name: "DishID" },
          { name: "OrderTime" },
        ]
      },
    ]
  });
  }
}
