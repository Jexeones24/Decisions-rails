class CreateOutcomes < ActiveRecord::Migration[5.1]
  def change
    create_table :outcomes do |t|
      t.string :content
      t.integer :decision_id

      t.timestamps
    end
  end
end
