module ApplicationHelper

	# return the full title on a pre-page basis
	def full_title(page_title)
		base_title = "Ruby on rails Tutorial Simple App"
		if page_title.empty?
			base_title
		else
			"{#base_title} | {#page_title}"
		end
	end

	def t
	 	self.t = I18n.t
	end
end
