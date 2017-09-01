class CreateOpinions < ActiveRecord::Migration[5.1]
  def change
    create_table :opinions do |t|
      t.string :content
      t.integer :outcome_id
      t.boolean :value

      t.timestamps
    end
  end
end
