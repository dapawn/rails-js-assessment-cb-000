class CreateRequests < ActiveRecord::Migration[4.2]
  def change
    create_table :requests do |t|
      t.string :item
      t.string :cost
      t.integer :availability
      t.string :business
      t.string :benefit
      t.string :why
      t.string :recommentdation
      t.integer :applicant_id

      t.timestamps null: false
    end
  end
end
