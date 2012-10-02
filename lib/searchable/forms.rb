module Searchable
	module Forms
		def mongoid_search_form *args
      binding.pry
			if args.first[:model].present?

				@model = Searchable::ModelMapper.new args.first[:model]
			end
			render "searchable/search/form"
		end
	end
end
