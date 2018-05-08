module SwellMedia
	class StaticController < ApplicationController

		def home
			# the homepage

			@articles = SwellMedia::Article.published.order(publish_at: :desc)
			@articles = @articles.page(params[:page]).per(3)

			set_page_meta(
				{
				title: 'Spacekace Labs - Web and Mobile Solutions',
				# description: "",
				fb_type: 'article'
				}
			)

			render layout: 'swell_theme/onepage_general'
		end

	end
end
