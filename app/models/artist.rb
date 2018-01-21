class Artist < ApplicationRecord
	has_many :items
	has_many :songs
end
