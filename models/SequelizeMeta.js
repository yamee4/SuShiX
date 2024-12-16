const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return SequelizeMeta.init(sequelize, DataTypes);
}

class SequelizeMeta extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    name: {
      type: DataTypes.STRING(255),
      allowNull: false,
      primaryKey: true,
      unique: "UQ__Sequeliz__72E12F1BA4053BB2"
    }
  }, {
    sequelize,
    tableName: 'SequelizeMeta',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__Sequeliz__72E12F1AE77A98C4",
        unique: true,
        fields: [
          { name: "name" },
        ]
      },
      {
        name: "UQ__Sequeliz__72E12F1BA4053BB2",
        unique: true,
        fields: [
          { name: "name" },
        ]
      },
    ]
  });
  }
}
