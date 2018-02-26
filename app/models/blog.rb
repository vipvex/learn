class Blog < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  
  validates :title, presence: true, length: { minimum: 2, maximum: 30 }
  
end