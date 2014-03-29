class HomeController < ApplicationController

	def index
		if current_user != nil
			@identities = current_user.identities
		end 
	end

end
