class Book < ApplicationRecord
	belongs_to :user

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def self.list(content,method)
	     if method == "forward_match"
	     	return self.where("title LIKE?","#{content}%")
	     elsif method == "backward_match"
	     	return self.where("title LIKE?","%#{content}")
	     elsif method == "perfect_match"
	      return 	self.where(title: "#{content}")
	     elsif method == "partial_match"
	     	return self.where("title LIKE?","%#{content}%")
	     else
	     	return self.all
	     end
    end

end
