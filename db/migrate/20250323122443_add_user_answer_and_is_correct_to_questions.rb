class AddUserAnswerAndIsCorrectToQuestions < ActiveRecord::Migration[7.2]
  def change
    add_column :questions, :user_answer, :string
    add_column :questions, :is_correct, :boolean
  end
end
