class CreateRoomAssigns < ActiveRecord::Migration[6.1]
  def change
    create_table :room_assigns do |t|

      t.timestamps
    end
  end
end
