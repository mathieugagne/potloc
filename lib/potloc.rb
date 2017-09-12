
# frozen_string_literal: true

require "csv"
require "fileutils"

module Potloc
  require "potloc/answer"
  require "potloc/question"
  require "potloc/survey"

  def survey_questions
    CSV.read("results.csv", headers: true).headers
  end

  def import_csv
    db = Database.new
    File.open("results.csv", "r") do |file|
      CSV.foreach(file, headers: :first_row) do |row|
        survey_questions.each_with_index do |question, index|
          db.exec("INSERT INTO sometable (col1, col2) VALUES ('#{question}', '#{row.field(index)}');")
        end
      end
    end
  end
end
