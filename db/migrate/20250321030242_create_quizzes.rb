class CreateQuizzes < ActiveRecord::Migration[7.2]
  def change
    create_table :quizzes do |t|
      t.string :operation
      t.string :difficulty
      t.integer :total_questions
      t.integer :user_id
      t.integer :score

      t.timestamps
    end
  end
end
