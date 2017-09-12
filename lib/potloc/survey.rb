# frozen_string_literal: true

module Potloc
  class Survey
    def import_csv(file)
      CSV.foreach(file, headers: :first_row) do |row|
        email_question = Question.email
        email = Answer.new(email_question, row).value
        # TODO: Validate no other answer for that given email has been inserted yet
        questions.each do |question|
          # puts question.inspect
          answer = Answer.new(question, row, email: email)
          answer.save
        end
      end
    end

    private

    def questions
      Question.all
    end
  end
end
