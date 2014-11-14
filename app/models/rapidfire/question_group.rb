module Rapidfire
  class QuestionGroup < ActiveRecord::Base
    has_many  :questions
    validates :name, :teacher, :presence => true

	def self.search(search)
	   if search
	     search_condition = "%" + search + "%"
	     where(['code LIKE ? OR teacher LIKE ?', search_condition, search_condition])
	   end
	end	

    if Rails::VERSION::MAJOR == 3
      attr_accessible :name
    end

  end
end
