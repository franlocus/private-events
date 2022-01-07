class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.belongs_to :attendee, null: false, foreign_key: true
      t.belongs_to :attended_event, null: false, foreign_key: true
      t.boolean :attendant

      t.timestamps
    end
  end
end
