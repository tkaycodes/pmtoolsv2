class Project < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 10}
end
