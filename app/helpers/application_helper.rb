module ApplicationHelper


	SOCIAL_HANDLE_KEYS = %w( FACEBOOK_HANDLE TWITTER_HANDLE INSTAGRAM_HANDLE REDDIT_HANDLE GOOGLE_PLUS_HANDLE PINTEREST_HANDLE FLIPBOARD_HANDLE )

	def has_social_link?( platform )
		false # ['twitter', 'github', 'youtube'].include?( platform.to_s.downcase )
	end

	def social_link_count()
		ENV.select{ |key,value| SOCIAL_HANDLE_KEYS.include?(key) }.count
	end

	def social_link_tag( platform, options = {}, &block)
		url = ""
		url = "" if platform.to_s == 'github'
		url = "" if platform.to_s == 'twitter'



		content = capture(&block)
		content_tag( :a, content, {  target: "_blank", href: url }.merge(options).merge( class: "#{options[:class]}" ) )

	end

	def social_action_tag( platform, options = {}, &block)
		map = { google_plus: 'googleplus', pinit: 'pinterest_pinit' }
		addthis_name = map[platform] || platform

		content = capture(&block)
		content_tag( :a, content, {  target: "_blank" }.merge(options).merge( class: "addthis_button_#{addthis_name} #{options[:class]}" ) )

	end

	def social_action_icon_tag( platform, options = {}, &block)
		if platform == :flipboard
			content = raw '&nbsp;'
			content_tag( :i, content, options.merge( class: "image-icon image-icon-flipboard #{options[:class]}" ) )
		else
			map = { google_plus: 'googleplus', pinit: 'pinterest_pinit' }
			css_classes = "ion ion-social-#{platform.to_s.gsub(/[^a-z0-9]/i,' ')}"
			content_tag( :i, '', options.merge( class: "#{css_classes} #{options[:class]}" ) )
		end
	end

end
