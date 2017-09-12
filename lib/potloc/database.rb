# frozen_string_literal: true

module Potloc
  class Database
    def exec(sql)
      puts "-----------------------------"
      puts "-------     SQL  ------------"
      puts "-----------------------------"
      puts sql
      puts "********** 15 ms ************"
    end
  end
end
