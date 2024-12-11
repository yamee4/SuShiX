const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return ONLINE_TICKET.init(sequelize, DataTypes);
}

class ONLINE_TICKET extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    OTicketID: {
      type: DataTypes.CHAR(10),
      allowNull: false,
      primaryKey: true
    },
    DeliveryDate: {
      type: DataTypes.DATE,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'ONLINE_TICKET',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__ONLINE_T__3CB87B8341045F2F",
        unique: true,
        fields: [
          { name: "OTicketID" },
        ]
      },
    ]
  });
  }
}
