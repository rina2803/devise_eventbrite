class Event < ApplicationRecord
	has_many :attendances
	has_many :users, through: :attendances
belongs_to :admin, :foreign_key => :admin_id, class_name: 'User'

end
