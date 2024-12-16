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
      primaryKey: true,
      references: {
        model: 'ORDER_TICKET',
        key: 'TicketID'
      }
    },
    FeedbackTotalScore: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    FeedbackService: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    FeedbackFoodQuality: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    FeedbackPrice: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    FeedbackLocation: {
      type: DataTypes.INTEGER,
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
    hasTrigger: true,
    timestamps: false,
    indexes: [
      {
        name: "PK__FEEDBACK__4DC1746CAB54D606",
        unique: true,
        fields: [
          { name: "TicketID" },
          { name: "FeedbackTotalScore" },
        ]
      },
    ]
  });
  }
}
