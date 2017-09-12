# frozen_string_literal: true

module Potloc
  class Survey

    attr_accessor :emails

    def initialize
      @emails = []
    end

    def import_csv(file)
      CSV.foreach(file, headers: :first_row) do |row|
        email_question = Question.email
        email = Answer.new(email_question, row).value
        if valid?(email)
          questions.each do |question|
            answer = Answer.new(question, row, email: email)
            answer.save
          end
        end
      end
    end

    private

    def questions
      Question.all
    end

    # Validate that no more than 1 answer per email is allowed
    def valid?(email)
      !emails.include?(email) && emails.push(email)
    end
  end
end
