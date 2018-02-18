class CreateCharacteristics < ActiveRecord::Migration[5.1]
  def change
    create_table :characteristics do |t|
      t.belongs_to :candidate, foreign_key: true
      t.belongs_to :question, foreign_key: true
      t.boolean :answer

      t.timestamps
    end
  end
end
