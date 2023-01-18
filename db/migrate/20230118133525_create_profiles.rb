class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :country
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
