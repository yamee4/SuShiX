const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return BILL.init(sequelize, DataTypes);
}

class BILL extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    BillID: {
      type: DataTypes.CHAR(10),
      allowNull: false,
      primaryKey: true
    },
    Discount: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    TotalPrice: {
      type: DataTypes.BIGINT,
      allowNull: true
    },
    TicketID: {
      type: DataTypes.CHAR(10),
      allowNull: true
    },
    CreatedDate: {
      type: DataTypes.DATE,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'BILL',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__BILL__11F2FC4A5554AE94",
        unique: true,
        fields: [
          { name: "BillID" },
        ]
      },
    ]
  });
  }
}
