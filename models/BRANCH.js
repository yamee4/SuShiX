const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return BRANCH.init(sequelize, DataTypes);
}

class BRANCH extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    BranchID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    BranchName: {
      type: DataTypes.STRING(30),
      allowNull: true
    },
    BranchAddress: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    OpeningTime: {
      type: DataTypes.TIME,
      allowNull: true
    },
    ClosedTime: {
      type: DataTypes.TIME,
      allowNull: true
    },
    DeliveryService: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    },
    isParkinglot: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    },
    AreaName: {
      type: DataTypes.STRING(30),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'BRANCH',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__BRANCH__A1682FA597F9C539",
        unique: true,
        fields: [
          { name: "BranchID" },
        ]
      },
    ]
  });
  }
}
