const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return ORDER_TICKET.init(sequelize, DataTypes);
}

class ORDER_TICKET extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    TicketID: {
      type: DataTypes.CHAR(10),
      allowNull: false,
      primaryKey: true
    },
    TicketType: {
      type: DataTypes.CHAR(3),
      allowNull: true
    },
    BranchID: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    CCCD: {
      type: DataTypes.CHAR(10),
      allowNull: true
    },
    EmpID: {
      type: DataTypes.CHAR(5),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'ORDER_TICKET',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__ORDER_TI__712CC6273F0F5566",
        unique: true,
        fields: [
          { name: "TicketID" },
        ]
      },
    ]
  });
  }
}
