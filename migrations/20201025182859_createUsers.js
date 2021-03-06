// create users table
exports.up = function (knex) {
  return knex.schema.createTable("users", (table) => {
    table.increments("id");
    table.string("username", 100).unique();
    table.string("email", 100).unique();
    table.text("password");
    table.text("avatar");
  });
};

exports.down = function (knex) {
  return knex.schema.dropTable("users");
};
