
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "TicketID": "TKT0001   ",
    "FeedbackTotalScore": 10,
    "FeedbackService": 10,
    "FeedbackFoodQuality": 10,
    "FeedbackPrice": 10,
    "FeedbackLocation": 10,
    "FeedbackNote": null
  },
  {
    "TicketID": "TKT0002   ",
    "FeedbackTotalScore": 10,
    "FeedbackService": 9,
    "FeedbackFoodQuality": 10,
    "FeedbackPrice": 10,
    "FeedbackLocation": 9,
    "FeedbackNote": null
  },
  {
    "TicketID": "TKT0003   ",
    "FeedbackTotalScore": 10,
    "FeedbackService": 10,
    "FeedbackFoodQuality": 9,
    "FeedbackPrice": 10,
    "FeedbackLocation": 10,
    "FeedbackNote": null
  },
  {
    "TicketID": "TKT0004   ",
    "FeedbackTotalScore": 10,
    "FeedbackService": 10,
    "FeedbackFoodQuality": 9,
    "FeedbackPrice": 10,
    "FeedbackLocation": 10,
    "FeedbackNote": null
  },
  {
    "TicketID": "TKT0005   ",
    "FeedbackTotalScore": 10,
    "FeedbackService": 9,
    "FeedbackFoodQuality": 10,
    "FeedbackPrice": 9,
    "FeedbackLocation": 10,
    "FeedbackNote": null
  },
  {
    "TicketID": "TKT0006   ",
    "FeedbackTotalScore": 10,
    "FeedbackService": 10,
    "FeedbackFoodQuality": 10,
    "FeedbackPrice": 10,
    "FeedbackLocation": 9,
    "FeedbackNote": null
  },
  {
    "TicketID": "TKT0007   ",
    "FeedbackTotalScore": 10,
    "FeedbackService": 9,
    "FeedbackFoodQuality": 10,
    "FeedbackPrice": 10,
    "FeedbackLocation": 10,
    "FeedbackNote": null
  },
  {
    "TicketID": "TKT0008   ",
    "FeedbackTotalScore": 10,
    "FeedbackService": 10,
    "FeedbackFoodQuality": 7,
    "FeedbackPrice": 10,
    "FeedbackLocation": 10,
    "FeedbackNote": null
  },
  {
    "TicketID": "TKT0009   ",
    "FeedbackTotalScore": 10,
    "FeedbackService": 10,
    "FeedbackFoodQuality": 10,
    "FeedbackPrice": 10,
    "FeedbackLocation": 8,
    "FeedbackNote": null
  },
  {
    "TicketID": "TKT0010   ",
    "FeedbackTotalScore": 10,
    "FeedbackService": 10,
    "FeedbackFoodQuality": 9,
    "FeedbackPrice": 10,
    "FeedbackLocation": 10,
    "FeedbackNote": null
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('FEEDBACK_TICKET', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into FEEDBACK_TICKET: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('FEEDBACK_TICKET', null, {});
  }
};
  