class Quiz < ApplicationRecord
    belongs_to :user
    has_many :questions, dependent: :destroy
  
    after_create :generate_questions
  
    private
  
    def generate_questions
      range = case difficulty
              when 'easy' then 1..10
              when 'medium' then 10..50
              when 'hard' then 50..100
              end
  
      total_questions.times do
        num1 = rand(range)
        num2 = rand(range)
  
        question_text, answer = case operation
          when 'addition' then ["#{num1} + #{num2}", num1 + num2]
          when 'subtraction' then ["#{num1} - #{num2}", num1 - num2]
          when 'multiplication' then ["#{num1} × #{num2}", num1 * num2]
          when 'division'
            num2 = rand(1..10) 
            ["#{num1 * num2} ÷ #{num2}", num1]
        end
  
                questions.create(quiz_id: self.id, question_text: question_text, correct_answer: answer)
      end
    end
  end
  