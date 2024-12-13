
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "TicketID": "TKT0001   ",
    "FeedbackBranchLocation": "09",
    "FeedbackService": "Excellent service",
    "FeedbackFoodQuality": "Delicious food",
    "FeedbackPrice": "Reasonable price",
    "FeedbackLocation": "Clean and comfortable",
    "FeedbackNote": "No specific notes"
  },
  {
    "TicketID": "TKT0002   ",
    "FeedbackBranchLocation": "10",
    "FeedbackService": "Very good service",
    "FeedbackFoodQuality": "High-quality food",
    "FeedbackPrice": "Fair price",
    "FeedbackLocation": "Nice ambiance",
    "FeedbackNote": "No specific notes"
  },
  {
    "TicketID": "TKT0003   ",
    "FeedbackBranchLocation": "09",
    "FeedbackService": "Friendly staff",
    "FeedbackFoodQuality": "Tasty food",
    "FeedbackPrice": "Affordable price",
    "FeedbackLocation": "Convenient location",
    "FeedbackNote": "No specific notes"
  },
  {
    "TicketID": "TKT0004   ",
    "FeedbackBranchLocation": "10",
    "FeedbackService": "Prompt service",
    "FeedbackFoodQuality": "Fresh and flavorful food",
    "FeedbackPrice": "Good value for money",
    "FeedbackLocation": "Pleasant atmosphere",
    "FeedbackNote": "No specific notes"
  },
  {
    "TicketID": "TKT0005   ",
    "FeedbackBranchLocation": "09",
    "FeedbackService": "Efficient service",
    "FeedbackFoodQuality": "Well-prepared dishes",
    "FeedbackPrice": "Reasonable pricing",
    "FeedbackLocation": "Clean and spacious",
    "FeedbackNote": "No specific notes"
  },
  {
    "TicketID": "TKT0006   ",
    "FeedbackBranchLocation": "10",
    "FeedbackService": "Excellent customer service",
    "FeedbackFoodQuality": "Delicious and authentic food",
    "FeedbackPrice": "Fair price",
    "FeedbackLocation": "Nice ambiance",
    "FeedbackNote": "No specific notes"
  },
  {
    "TicketID": "TKT0007   ",
    "FeedbackBranchLocation": "09",
    "FeedbackService": "Friendly and helpful staff",
    "FeedbackFoodQuality": "Tasty and fresh food",
    "FeedbackPrice": "Affordable prices",
    "FeedbackLocation": "Convenient location",
    "FeedbackNote": "No specific notes"
  },
  {
    "TicketID": "TKT0008   ",
    "FeedbackBranchLocation": "10",
    "FeedbackService": "Prompt and efficient service",
    "FeedbackFoodQuality": "High-quality ingredients",
    "FeedbackPrice": "Reasonable pricing",
    "FeedbackLocation": "Pleasant atmosphere",
    "FeedbackNote": "No specific notes"
  },
  {
    "TicketID": "TKT0009   ",
    "FeedbackBranchLocation": "09",
    "FeedbackService": "Excellent service",
    "FeedbackFoodQuality": "Delicious food",
    "FeedbackPrice": "Reasonable price",
    "FeedbackLocation": "Clean and comfortable",
    "FeedbackNote": "No specific notes"
  },
  {
    "TicketID": "TKT0010   ",
    "FeedbackBranchLocation": "10",
    "FeedbackService": "Very good service",
    "FeedbackFoodQuality": "High-quality food",
    "FeedbackPrice": "Fair price",
    "FeedbackLocation": "Nice ambiance",
    "FeedbackNote": "No specific notes"
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
  