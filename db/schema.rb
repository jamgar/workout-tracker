# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170629112739) do
=======
ActiveRecord::Schema.define(version: 20170630221126) do
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6

  create_table "exercises", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

  create_table "workout_exercises", force: :cascade do |t|
    t.integer "workout_id"
    t.integer "exercise_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "title"
    t.string "date"
<<<<<<< HEAD
=======
    t.integer "duration"
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
    t.text "note"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< HEAD
    t.integer "duration"
=======
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
  end

end
