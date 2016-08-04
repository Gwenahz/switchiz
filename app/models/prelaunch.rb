class Prelaunch < ActiveRecord::Base

	validates_format_of :email, :with => /@/
	
end
