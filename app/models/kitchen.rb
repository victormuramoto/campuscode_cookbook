class Kitchen < ActiveRecord::Base
  has_many :recipes
  has_and_belongs_to_many :kitchen
  validates :name, presence: true
end
