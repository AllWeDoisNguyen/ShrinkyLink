class Link < ActiveRecord::Base
	validates :link, presence: true
end
