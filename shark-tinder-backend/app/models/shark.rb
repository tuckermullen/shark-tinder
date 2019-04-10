class Shark < ApplicationRecord
	validates :name, presence: true
	validates :age, presence: true
	validates :enjoys, presence: true
	validates :enjoys, length: { minimum: 10 }
end
