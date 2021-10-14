class RenamePartyStartTime < ActiveRecord::Migration[5.2]
  def change
    rename_column :parties, :tstart_time, :start_time
  end
end
