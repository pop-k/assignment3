class CreateRemoves < ActiveRecord::Migration[5.2]
  def change
    create_table :removes do |t|
      t.string :PostComment

      t.timestamps
    end
  end
end
