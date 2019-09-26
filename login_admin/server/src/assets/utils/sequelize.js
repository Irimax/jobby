import Sequelize from "sequelize";
import UserModel from "../../../sequelize/models/user";

const sequelize = new Sequelize("users_development", "lidian", "31101978", {
  host: "192.168.1.94",
  dialect: "mysql",
  port: "3110"
});

const User = UserModel(sequelize, Sequelize);

// sequelize.sync().then(() => {
//   // eslint-disable-next-line no-console
//   console.log("Users db and user table have been created");
// });

module.exports = User;
