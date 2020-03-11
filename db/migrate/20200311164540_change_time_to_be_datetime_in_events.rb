class ChangeTimeToBeDatetimeInEvents < ActiveRecord::Migration[5.2]
    def up
      change_column :events, :time, :datetime
    end
  
    def down
      change_column :events, :time, :string
    end
end
