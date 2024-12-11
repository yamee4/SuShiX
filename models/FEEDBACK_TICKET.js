const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return FEEDBACK_TICKET.init(sequelize, DataTypes);
}

class FEEDBACK_TICKET extends Sequelize.Model {
  static init(sequelize, DataTypes) {
  return super.init({
    TicketID: {
      type: DataTypes.CHAR(10),
      allowNull: false,
      primaryKey: true
    },
    FeedbackBranchLocation: {
      type: DataTypes.CHAR(2),
      allowNull: false,
      primaryKey: true
    },
    FeedbackService: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    FeedbackFoodQuality: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    FeedbackPrice: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    FeedbackLocation: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    FeedbackNote: {
      type: DataTypes.STRING(100),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'FEEDBACK_TICKET',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK__FEEDBACK__CB006343CB0EC7DF",
        unique: true,
        fields: [
          { name: "TicketID" },
          { name: "FeedbackBranchLocation" },
        ]
      },
    ]
  });
  }
}
