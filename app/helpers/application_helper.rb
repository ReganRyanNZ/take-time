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
		# the 12*60*60 is a shameless hack to use NZ timezone
		seconds = (Time.current + (12*60*60)).beginning_of_day - (time + 12*60*60).beginning_of_day
		days = seconds.to_i / (24 * 60 * 60)

		case days
		when 0
			"today"
		when 1
			"yesterday"
		when 2..7
			time.strftime("%A")
		else
			days.to_s + " days ago"
		end
	end

end
