# frozen_string_literal: true

module Potloc
  class Survey
    def import_csv(file)
      CSV.foreach(file, headers: :first_row) do |row|
        questions.each_with_index do |question, col_index|
          db.exec("INSERT INTO sometable (col1, col2) VALUES ('#{question}', '#{row.field(col_index)}');")
        end
      end
    end

    private

    def db
      Database.new
    end

    def questions
      CSV.read("results.csv", headers: true).headers
    end
  end
end
