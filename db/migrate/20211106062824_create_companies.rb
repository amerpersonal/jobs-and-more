class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name, limit: 100
      t.string :email

      t.timestamps
    end

    add_index :companies, :email, unique: true
    add_index :companies, :name

  end
end
