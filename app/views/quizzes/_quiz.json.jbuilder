json.extract! quiz, :id, :operation, :difficulty, :total_questions, :user_id, :score, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
