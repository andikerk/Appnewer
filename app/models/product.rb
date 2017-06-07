class Product < ApplicationRecord
	has_many :orders
	has_many :comments

	validates :name, presence: true
	validates :price, presence: true 
	validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 50 }
	validates :description, presence: true
	


	def self.search(search_term)
		if(Rails.env.production?)
	 		Product.where("name ilike ?", "%#{search_term}%" )
	 	else
	 		Product.where("name LIKE ?", "%#{search_term}%" )
	 		#Product.where("name = ?" , search_term )
		end
 	end


	def highest_rating_comment
  		comments.rating_desc.first
	end
	def lowest_rating_comment
  		comments.rating_desc.last
	end

	def average_rating
        comments.average(:rating).to_f
	end
end