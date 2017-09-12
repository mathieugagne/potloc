# frozen_string_literal: true

module Potloc
  class Answer
    attr_reader :email, :question, :row

    def initialize(question, row, email: nil)
      @email = email
      @question = question
      @row = row
    end

    def save
      database.exec("INSERT INTO answers (email, question_id, type, value) " \
              "VALUES ('#{email}', #{question.id}, #{question.category}, #{value}');")
    end

    def value
      row.field(question.column)
    end

    def database
      Database.new
    end
  end
end
