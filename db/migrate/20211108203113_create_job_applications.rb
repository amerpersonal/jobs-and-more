class CreateJobApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :job_applications do |t|
      t.references :job, null: false, foreign_key: true
      t.string :first_name, limit: 40, null: false
      t.string :last_name, limit: 40, null: false
      t.date :birth_date, null: false
      t.string :email, limit: 40, null: false
      t.string :phone_number, limit: 30, null: false
      t.text :address, null: false
      t.string :competence, limit: 3, null: false

      t.timestamps
    end

    add_index :job_applications, [:job_id, :email], unique: true
  end
end
