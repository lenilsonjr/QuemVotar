class AddChoicesToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :choices, :text
  end
end
