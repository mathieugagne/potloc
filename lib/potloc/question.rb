# frozen_string_literal: true

module Potloc
  class Question
    QUESTIONS = [
      {
        id: 1,
        category: "email",
        column: 13,
      },
      {
        id: 2,
        category: "simple",
        column: 0,
      },
      {
        id: 3,
        category: "simple",
        column: 1,
      },
      {
        id: 4,
        category: "simple",
        column: 7,
      },
      {
        id: 5,
        category: "simple",
        column: 10,
      },
      {
        id: 6,
        category: "simple",
        column: 11,
      },
      {
        id: 7,
        category: "simple",
        column: 12,
      },
      {
        id: 8,
        category: "simple",
        column: 14,
      },
      {
        id: 9,
        category: "simple",
        column: 15,
      },
      {
        id: 10,
        category: "simple",
        column: 16,
      },
      {
        id: 11,
        category: "multiple",
      },
      {
        id: 12,
        category: "simple",
        column: 2,
        question_id: 11
      },
      {
        id: 13,
        category: "simple",
        column: 3,
        question_id: 11
      },
      {
        id: 14,
        category: "simple",
        column: 4,
        question_id: 11
      },
      {
        id: 15,
        category: "simple",
        column: 5,
        question_id: 11
      },
      {
        id: 16,
        category: "simple",
        column: 6,
        question_id: 11
      },
    ].freeze

    attr_reader :id, :category, :column, :question_id, :survey_id

    def initialize(attributes = {})
      @id = attributes.fetch(:id, nil)
      @category = attributes.fetch(:category, "simple")
      @column = attributes.fetch(:column, nil)
      @question_id = attributes.fetch(:question_id, nil)
      @survey_id = attributes.fetch(:survey_id, "foobar")
    end

    def inspect
      "<Question:#{object_id} id:#{id} " \
                              "column:#{column} " \
                              "category:#{category} " \
                              "question_id:#{question_id} " \
                              "survey_id:#{survey_id}>"
    end

    class << self
      def all
        questions = QUESTIONS.select { |question| question[:category] == "simple" }
        questions.map do |question|
          Question.new(question)
        end
      end

      def email
        Question.new(QUESTIONS.detect { |question| question[:category] == "email" })
      end
    end
  end
end
