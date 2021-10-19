module	ErrorMessagesFor
	def error_messages_for(target)       
		html = ""
		if target.errors.any?         
			target.errors.full_messages.each do |msg|

				html << "<script type='text/javascript'>"
				html << "$.notify(' #{msg}', 'error')"
				html << "</script>"
			end
		end
		html.html_safe
	end

	
end
