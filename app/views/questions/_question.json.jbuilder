json.extract! question, :id, :question_text, :correct_answer, :difficulty_level, :mark, :created_at, :updated_at
json.url question_url(question, format: :json)
