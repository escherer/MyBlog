class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	include Bootsy::Container
end
