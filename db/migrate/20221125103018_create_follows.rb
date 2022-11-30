class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.integer :follow_by
      t.integer :follow_to

      t.timestamps
    end
  end
end

