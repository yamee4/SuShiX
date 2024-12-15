const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return PRE_ORDER_TICKET.init(sequelize, DataTypes);
}

class PRE_ORDER_TICKET extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    PTicketID: {
      type: DataTypes.CHAR(10),
      allowNull: false,
      primaryKey: true
    },
    BranchName: {
      type: DataTypes.STRING(30),
      allowNull: true
    },
    Area: {
      type: DataTypes.STRING(30),
      allowNull: true
    },
    NumberofCustomer: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    PreOrderDate: {
      type: DataTypes.DATEONLY,
      allowNull: true
    },
    PreOrderArrivalTime: {
      type: DataTypes.TIME,
      allowNull: true
    },
    PreOrderNote: {
      type: DataTypes.STRING(100),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'PRE_ORDER_TICKET',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__PRE_ORDE__48C470FA5D4B5E11",
        unique: true,
        fields: [
          { name: "PTicketID" },
        ]
      },
    ]
  });
  }
}
