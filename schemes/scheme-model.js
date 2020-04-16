const db = require("../data/dbConfig.js");

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where({ id }).first();
}

function findSteps(id) {
  return db("schemes")
    .select(
      "steps.id",
      "schemes.scheme_name",
      "steps.step_number",
      "steps.instructions"
    )
    .join("steps", "schemes.id", "=", "steps.scheme_id")
    .where("schemes.id", id)
    .orderBy("steps.step_number");
}

function add(scheme) {
  return db("schemes").insert(scheme);
} 

function addStep(step, scheme_id) {
    return db("schemes").where({scheme_id}).insert(step);
}

function update(changes, id) {
  return db("schemes").where({ id }).update(changes);
}

function remove(id) {
  return db("schemes").where({ id }).del();
}

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove,
};
