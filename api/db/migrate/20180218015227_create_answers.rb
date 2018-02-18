class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :answers
      t.integer :result_id

      t.timestamps
    end
  end
end
