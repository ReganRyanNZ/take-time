module ApplicationHelper
	def full_title(page_title = '')
		base_title = "Take Time"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	def gravatar_for(user, options = { size: 80})
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.username, class: "img-circle")
	end

	def print_time(time)
		seconds = Time.now - time
		days = seconds.to_i / (24 * 60 * 60)
		case days
		when 0
			"today"
		when 1
			"yesterday"
		else
			days.to_s + " days ago"
		end
	end

end
