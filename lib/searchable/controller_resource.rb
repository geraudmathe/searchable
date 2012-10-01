# encoding: utf-8
module Searchable
	module ControllerResource
		def searchable_resource *args
      call_args = args
			define_method(:search_results) do |*args|
        if session[:search_params].present?
          deserialized = Marshal.load session[:search_params]
          session.delete(:search_params)
          search = Searchable::ModelMapper.new deserialized[:model_name]
          criteria = search.add_criterias deserialized[:search_params], call_args.last
          return criteria
        end
        nil
      end
		end
	end

end


if defined?  ActionController
  ActionController::Base.class_eval do
    include Searchable::ControllerResource
  end
end
