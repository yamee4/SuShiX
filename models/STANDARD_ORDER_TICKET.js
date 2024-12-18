const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return STANDARD_ORDER_TICKET.init(sequelize, DataTypes);
}

class STANDARD_ORDER_TICKET extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    SOTicketID: {
      type: DataTypes.CHAR(10),
      allowNull: false,
      primaryKey: true
    },
    TableName: {
      type: DataTypes.STRING(30),
      allowNull: true
    },
    SupportEmployee: {
      type: DataTypes.CHAR(5),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'STANDARD_ORDER_TICKET',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__STANDARD__EE0B2E7176330799",
        unique: true,
        fields: [
          { name: "SOTicketID" },
        ]
      },
    ]
  });
  }
}
