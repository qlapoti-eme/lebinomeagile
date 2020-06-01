class RemoveColumnsFrProposals < ActiveRecord::Migration[6.0]
  def change
    remove_column :proposals, :start_time, :string
    remove_column :proposals, :end_time, :string
    remove_column :proposals, :reservation_status, :string
  end
end
