const DataTypes = require("sequelize").DataTypes;
const _AREA = require("./AREA");
const _BRANCH = require("./BRANCH");
const _BRANCH_PHONE_NUMBER = require("./BRANCH_PHONE_NUMBER");
const _COMBO = require("./COMBO");
const _CUSTOMER = require("./CUSTOMER");
const _CUSTOMER_LOG = require("./CUSTOMER_LOG");
const _CUSTOMER_MEMBER = require("./CUSTOMER_MEMBER");
const _DISH = require("./DISH");
const _DISH_COMBO = require("./DISH_COMBO");
const _DISH_MENU = require("./DISH_MENU");
const _EMPLOYEE = require("./EMPLOYEE");
const _FEEDBACK_TICKET = require("./FEEDBACK_TICKET");
const _MENU_DETAIL = require("./MENU_DETAIL");
const _ONLINE_CUSTOMER = require("./ONLINE_CUSTOMER");
const _ONLINE_TICKET = require("./ONLINE_TICKET");
const _ONLINE_TICKET_DETAIL = require("./ONLINE_TICKET_DETAIL");
const _ORDER_TICKET = require("./ORDER_TICKET");
const _PRE_ORDER_TICKET = require("./PRE_ORDER_TICKET");
const _PRE_ORDER_TICKET_DETAIL = require("./PRE_ORDER_TICKET_DETAIL");
const _STANDARD_ORDER_DETAIL = require("./STANDARD_ORDER_DETAIL");
const _STANDARD_ORDER_TICKET = require("./STANDARD_ORDER_TICKET");
const _STATION = require("./STATION");
const _STATION_EMPLOYEE = require("./STATION_EMPLOYEE");
const _WORK_HISTORY = require("./WORK_HISTORY");

function initModels(sequelize) {
  const AREA = _AREA(sequelize, DataTypes);
  const BRANCH = _BRANCH(sequelize, DataTypes);
  const BRANCH_PHONE_NUMBER = _BRANCH_PHONE_NUMBER(sequelize, DataTypes);
  const COMBO = _COMBO(sequelize, DataTypes);
  const CUSTOMER = _CUSTOMER(sequelize, DataTypes);
  const CUSTOMER_LOG = _CUSTOMER_LOG(sequelize, DataTypes);
  const CUSTOMER_MEMBER = _CUSTOMER_MEMBER(sequelize, DataTypes);
  const DISH = _DISH(sequelize, DataTypes);
  const DISH_COMBO = _DISH_COMBO(sequelize, DataTypes);
  const DISH_MENU = _DISH_MENU(sequelize, DataTypes);
  const EMPLOYEE = _EMPLOYEE(sequelize, DataTypes);
  const FEEDBACK_TICKET = _FEEDBACK_TICKET(sequelize, DataTypes);
  const MENU_DETAIL = _MENU_DETAIL(sequelize, DataTypes);
  const ONLINE_CUSTOMER = _ONLINE_CUSTOMER(sequelize, DataTypes);
  const ONLINE_TICKET = _ONLINE_TICKET(sequelize, DataTypes);
  const ONLINE_TICKET_DETAIL = _ONLINE_TICKET_DETAIL(sequelize, DataTypes);
  const ORDER_TICKET = _ORDER_TICKET(sequelize, DataTypes);
  const PRE_ORDER_TICKET = _PRE_ORDER_TICKET(sequelize, DataTypes);
  const PRE_ORDER_TICKET_DETAIL = _PRE_ORDER_TICKET_DETAIL(sequelize, DataTypes);
  const STANDARD_ORDER_DETAIL = _STANDARD_ORDER_DETAIL(sequelize, DataTypes);
  const STANDARD_ORDER_TICKET = _STANDARD_ORDER_TICKET(sequelize, DataTypes);
  const STATION = _STATION(sequelize, DataTypes);
  const STATION_EMPLOYEE = _STATION_EMPLOYEE(sequelize, DataTypes);
  const WORK_HISTORY = _WORK_HISTORY(sequelize, DataTypes);

  AREA.belongsToMany(DISH, { as: 'DishID_DISH_DISH_MENUs', through: DISH_MENU, foreignKey: "MenuID", otherKey: "DishID" });
  BRANCH.belongsToMany(DISH, { as: 'DishID_DISH_MENU_DETAILs', through: MENU_DETAIL, foreignKey: "BranchID", otherKey: "DishID" });
  COMBO.belongsToMany(DISH, { as: 'DishID_DISHes', through: DISH_COMBO, foreignKey: "ComboID", otherKey: "DishID" });
  DISH.belongsToMany(AREA, { as: 'MenuID_AREAs', through: DISH_MENU, foreignKey: "DishID", otherKey: "MenuID" });
  DISH.belongsToMany(BRANCH, { as: 'BranchID_BRANCHes', through: MENU_DETAIL, foreignKey: "DishID", otherKey: "BranchID" });
  DISH.belongsToMany(COMBO, { as: 'ComboID_COMBOs', through: DISH_COMBO, foreignKey: "DishID", otherKey: "ComboID" });
  DISH.belongsToMany(ONLINE_TICKET, { as: 'OTicketID_ONLINE_TICKETs', through: ONLINE_TICKET_DETAIL, foreignKey: "DishID", otherKey: "OTicketID" });
  DISH.belongsToMany(PRE_ORDER_TICKET, { as: 'PTicketID_PRE_ORDER_TICKETs', through: PRE_ORDER_TICKET_DETAIL, foreignKey: "DishID", otherKey: "PTicketID" });
  DISH.belongsToMany(STANDARD_ORDER_TICKET, { as: 'SOTicketID_STANDARD_ORDER_TICKETs', through: STANDARD_ORDER_DETAIL, foreignKey: "DishID", otherKey: "SOTicketID" });
  ONLINE_TICKET.belongsToMany(DISH, { as: 'DishID_DISH_ONLINE_TICKET_DETAILs', through: ONLINE_TICKET_DETAIL, foreignKey: "OTicketID", otherKey: "DishID" });
  PRE_ORDER_TICKET.belongsToMany(DISH, { as: 'DishID_DISH_PRE_ORDER_TICKET_DETAILs', through: PRE_ORDER_TICKET_DETAIL, foreignKey: "PTicketID", otherKey: "DishID" });
  STANDARD_ORDER_TICKET.belongsToMany(DISH, { as: 'DishID_DISH_STANDARD_ORDER_DETAILs', through: STANDARD_ORDER_DETAIL, foreignKey: "SOTicketID", otherKey: "DishID" });
  BRANCH.belongsTo(AREA, { as: "AreaName_AREA", foreignKey: "AreaName"});
  AREA.hasMany(BRANCH, { as: "BRANCHes", foreignKey: "AreaName"});
  DISH_MENU.belongsTo(AREA, { as: "Menu", foreignKey: "MenuID"});
  AREA.hasMany(DISH_MENU, { as: "DISH_MENUs", foreignKey: "MenuID"});
  BRANCH_PHONE_NUMBER.belongsTo(BRANCH, { as: "Branch", foreignKey: "BranchID"});
  BRANCH.hasMany(BRANCH_PHONE_NUMBER, { as: "BRANCH_PHONE_NUMBERs", foreignKey: "BranchID"});
  EMPLOYEE.belongsTo(BRANCH, { as: "BranchManager_BRANCH", foreignKey: "BranchManager"});
  BRANCH.hasMany(EMPLOYEE, { as: "EMPLOYEEs", foreignKey: "BranchManager"});
  MENU_DETAIL.belongsTo(BRANCH, { as: "Branch", foreignKey: "BranchID"});
  BRANCH.hasMany(MENU_DETAIL, { as: "MENU_DETAILs", foreignKey: "BranchID"});
  ORDER_TICKET.belongsTo(BRANCH, { as: "Branch", foreignKey: "BranchID"});
  BRANCH.hasMany(ORDER_TICKET, { as: "ORDER_TICKETs", foreignKey: "BranchID"});
  STATION_EMPLOYEE.belongsTo(BRANCH, { as: "Branch", foreignKey: "BranchID"});
  BRANCH.hasMany(STATION_EMPLOYEE, { as: "STATION_EMPLOYEEs", foreignKey: "BranchID"});
  WORK_HISTORY.belongsTo(BRANCH, { as: "Branch", foreignKey: "BranchID"});
  BRANCH.hasMany(WORK_HISTORY, { as: "WORK_HISTORies", foreignKey: "BranchID"});
  DISH_COMBO.belongsTo(COMBO, { as: "Combo", foreignKey: "ComboID"});
  COMBO.hasMany(DISH_COMBO, { as: "DISH_COMBOs", foreignKey: "ComboID"});
  CUSTOMER_MEMBER.belongsTo(CUSTOMER, { as: "MCCCD_CUSTOMER", foreignKey: "MCCCD"});
  CUSTOMER.hasOne(CUSTOMER_MEMBER, { as: "CUSTOMER_MEMBER", foreignKey: "MCCCD"});
  ONLINE_CUSTOMER.belongsTo(CUSTOMER, { as: "OCCCD_CUSTOMER", foreignKey: "OCCCD"});
  CUSTOMER.hasOne(ONLINE_CUSTOMER, { as: "ONLINE_CUSTOMER", foreignKey: "OCCCD"});
  ORDER_TICKET.belongsTo(CUSTOMER, { as: "CCCD_CUSTOMER", foreignKey: "CCCD"});
  CUSTOMER.hasMany(ORDER_TICKET, { as: "ORDER_TICKETs", foreignKey: "CCCD"});
  COMBO.belongsTo(DISH, { as: "Combo", foreignKey: "ComboID"});
  DISH.hasOne(COMBO, { as: "COMBO", foreignKey: "ComboID"});
  DISH_COMBO.belongsTo(DISH, { as: "Dish", foreignKey: "DishID"});
  DISH.hasMany(DISH_COMBO, { as: "DISH_COMBOs", foreignKey: "DishID"});
  DISH_MENU.belongsTo(DISH, { as: "Dish", foreignKey: "DishID"});
  DISH.hasMany(DISH_MENU, { as: "DISH_MENUs", foreignKey: "DishID"});
  MENU_DETAIL.belongsTo(DISH, { as: "Dish", foreignKey: "DishID"});
  DISH.hasMany(MENU_DETAIL, { as: "MENU_DETAILs", foreignKey: "DishID"});
  ONLINE_TICKET_DETAIL.belongsTo(DISH, { as: "Dish", foreignKey: "DishID"});
  DISH.hasMany(ONLINE_TICKET_DETAIL, { as: "ONLINE_TICKET_DETAILs", foreignKey: "DishID"});
  PRE_ORDER_TICKET_DETAIL.belongsTo(DISH, { as: "Dish", foreignKey: "DishID"});
  DISH.hasMany(PRE_ORDER_TICKET_DETAIL, { as: "PRE_ORDER_TICKET_DETAILs", foreignKey: "DishID"});
  STANDARD_ORDER_DETAIL.belongsTo(DISH, { as: "Dish", foreignKey: "DishID"});
  DISH.hasMany(STANDARD_ORDER_DETAIL, { as: "STANDARD_ORDER_DETAILs", foreignKey: "DishID"});
  CUSTOMER_MEMBER.belongsTo(EMPLOYEE, { as: "SupportEmp_EMPLOYEE", foreignKey: "SupportEmp"});
  EMPLOYEE.hasMany(CUSTOMER_MEMBER, { as: "CUSTOMER_MEMBERs", foreignKey: "SupportEmp"});
  ORDER_TICKET.belongsTo(EMPLOYEE, { as: "Emp", foreignKey: "EmpID"});
  EMPLOYEE.hasMany(ORDER_TICKET, { as: "ORDER_TICKETs", foreignKey: "EmpID"});
  STATION_EMPLOYEE.belongsTo(EMPLOYEE, { as: "Emp", foreignKey: "EmpID"});
  EMPLOYEE.hasMany(STATION_EMPLOYEE, { as: "STATION_EMPLOYEEs", foreignKey: "EmpID"});
  WORK_HISTORY.belongsTo(EMPLOYEE, { as: "Emp", foreignKey: "EmpID"});
  EMPLOYEE.hasMany(WORK_HISTORY, { as: "WORK_HISTORies", foreignKey: "EmpID"});
  CUSTOMER_LOG.belongsTo(ONLINE_CUSTOMER, { as: "CCCD_ONLINE_CUSTOMER", foreignKey: "CCCD"});
  ONLINE_CUSTOMER.hasMany(CUSTOMER_LOG, { as: "CUSTOMER_LOGs", foreignKey: "CCCD"});
  ONLINE_TICKET_DETAIL.belongsTo(ONLINE_TICKET, { as: "OTicket", foreignKey: "OTicketID"});
  ONLINE_TICKET.hasMany(ONLINE_TICKET_DETAIL, { as: "ONLINE_TICKET_DETAILs", foreignKey: "OTicketID"});
  FEEDBACK_TICKET.belongsTo(ORDER_TICKET, { as: "Ticket", foreignKey: "TicketID"});
  ORDER_TICKET.hasMany(FEEDBACK_TICKET, { as: "FEEDBACK_TICKETs", foreignKey: "TicketID"});
  ONLINE_TICKET.belongsTo(ORDER_TICKET, { as: "OTicket", foreignKey: "OTicketID"});
  ORDER_TICKET.hasOne(ONLINE_TICKET, { as: "ONLINE_TICKET", foreignKey: "OTicketID"});
  PRE_ORDER_TICKET.belongsTo(ORDER_TICKET, { as: "PTicket", foreignKey: "PTicketID"});
  ORDER_TICKET.hasOne(PRE_ORDER_TICKET, { as: "PRE_ORDER_TICKET", foreignKey: "PTicketID"});
  STANDARD_ORDER_TICKET.belongsTo(ORDER_TICKET, { as: "SOTicket", foreignKey: "SOTicketID"});
  ORDER_TICKET.hasOne(STANDARD_ORDER_TICKET, { as: "STANDARD_ORDER_TICKET", foreignKey: "SOTicketID"});
  PRE_ORDER_TICKET_DETAIL.belongsTo(PRE_ORDER_TICKET, { as: "PTicket", foreignKey: "PTicketID"});
  PRE_ORDER_TICKET.hasMany(PRE_ORDER_TICKET_DETAIL, { as: "PRE_ORDER_TICKET_DETAILs", foreignKey: "PTicketID"});
  STANDARD_ORDER_DETAIL.belongsTo(STANDARD_ORDER_TICKET, { as: "SOTicket", foreignKey: "SOTicketID"});
  STANDARD_ORDER_TICKET.hasMany(STANDARD_ORDER_DETAIL, { as: "STANDARD_ORDER_DETAILs", foreignKey: "SOTicketID"});
  STATION_EMPLOYEE.belongsTo(STATION, { as: "StationName_STATION", foreignKey: "StationName"});
  STATION.hasMany(STATION_EMPLOYEE, { as: "STATION_EMPLOYEEs", foreignKey: "StationName"});

  return {
    AREA,
    BRANCH,
    BRANCH_PHONE_NUMBER,
    COMBO,
    CUSTOMER,
    CUSTOMER_LOG,
    CUSTOMER_MEMBER,
    DISH,
    DISH_COMBO,
    DISH_MENU,
    EMPLOYEE,
    FEEDBACK_TICKET,
    MENU_DETAIL,
    ONLINE_CUSTOMER,
    ONLINE_TICKET,
    ONLINE_TICKET_DETAIL,
    ORDER_TICKET,
    PRE_ORDER_TICKET,
    PRE_ORDER_TICKET_DETAIL,
    STANDARD_ORDER_DETAIL,
    STANDARD_ORDER_TICKET,
    STATION,
    STATION_EMPLOYEE,
    WORK_HISTORY,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
