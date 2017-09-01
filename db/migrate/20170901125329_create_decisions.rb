class CreateDecisions < ActiveRecord::Migration[5.1]
  def change
    create_table :decisions do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
