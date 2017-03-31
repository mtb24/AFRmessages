class User < ActiveRecord::Base
	validates :phone_number, presence: true
	#validates :name, uniqueness: { message: "That number is already on the list" }
	validates :phone_number, numericality: { only_integer: true, :message => "Use digits only! No parens, spaces, dots, or dashes. or gears ;)"}
	validates :phone_number, length: { is: 10 }
end
