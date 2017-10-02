class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:users) do |t|
      t.column(:name, :string)
      t.column(:score, :integer)

      t.timestamps
    end

    create_table(:words) do |t|
      t.column(:name, :string)
      t.column(:letter_id, :integer)

      t.timestamps
    end

    create_table(:letters) do |t|
      t.column(:name, :string)

      t.timestamps
    end
  end

end
