module Select2
	def select2(campo)
		html = ""
		html << " <script type='text/javascript'>"
		html << "$(document).ready(function() {"
		html << "$('#{campo}').select2();"
		html <<	"});"
		html << "</script>"
		html.html_safe
	end
end