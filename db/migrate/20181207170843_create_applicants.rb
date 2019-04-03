class CreateApplicants < ActiveRecord::Migration[4.2]
  def change
    create_table :applicants do |t|
      t.string :fname
      t.string :lname
      t.string :address
      t.integer :gender
      t.integer :dob
      t.string :phone
      t.integer :married_status
      t.integer :church_id
      t.string :occupation
      t.integer :occupation_status
      t.string :income
      t.integer :home_ownership
      t.string :home_material
      t.boolean :electricity
      t.boolean :running_water

      t.timestamps null: false
    end
  end
end
