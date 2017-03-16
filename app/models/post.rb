class Post < ApplicationRecord
	belongs_to :user
	has_many   :comment, dependent: :destroy

	validates :title, presence: true, length: { minimum: 3 }
	validates :body,  presence: true
end
