class ChangeRequestsColumnName < ActiveRecord::Migration[5.2]
  def change
	  rename_column :requests, :recommentdation, :recommendation
  end
end
