module Rapidfire
  class QuestionGroup < ActiveRecord::Base
    has_many  :questions
    validates :name, :teacher, :room, :date, :shift, :course, :date_end, :quantity, :type_evaluation, :presence => true

  	def self.search(search)
  	   if search
  	     search_condition = search
  	     where(['code = ?', search_condition])
  	   end
  	end	

    def self.search_admin(search)
       if search
         search_condition = search
         where(['LOWER(teacher) LIKE ?', "%#{search_condition}%".downcase])
       end
    end 

    if Rails::VERSION::MAJOR == 3
      attr_accessible :name, :teacher, :room, :date, :shift
    end

  end
end
