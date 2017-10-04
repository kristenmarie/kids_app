class AddMissedQuestionColumns < ActiveRecord::Migration[5.1]
  def change
    add_column(:users, :missed_math, :integer)
    add_column(:users, :missed_science, :integer)
    add_column(:users, :missed_spelling, :integer)
    add_column(:users, :missed_counting, :integer)
    add_column(:users, :missed_colors, :integer)
  end
end
