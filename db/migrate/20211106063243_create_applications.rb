class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.references :job, null: false, foreign_key: true

      t.string :first_name, limit: 30
      t.string :last_name, limit: 30
      t.date :birth_date
      t.string :email
      t.string :phone_number, limit: 15
      t.string :address
      t.string :competence, limit: 3

      t.timestamps
    end

    add_index :applications, :email, unique: false
  end
end
