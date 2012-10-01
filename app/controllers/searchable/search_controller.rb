# encoding: utf-8
module Searchable
  class SearchController < ApplicationController
    layout "searchable/searchable"
    DEFAULT_NAMESPACE = "admin"

    def index
        #parsing = MongoModel.new
        @models = parsing.models
    end


    def search
    	if params[:model_name].present?
            instance = Searchable::ModelMapper.new params[:model_name]
            instance.add_criterias params[params[:model_name]]
            entries = instance.entries
            if entries.size == 0
                path = root_path
            elsif entries.size > 0
                path = find_path_model(instance)
            end
            redirect_to path
        end
    end

    def search_form
        session[:search_params] = Marshal.dump({:model_name => params[:model_name],:search_params => params[params[:model_name]]})
        redirect_to request.referer
    end


    def find_path_model instance
        path_array = [DEFAULT_NAMESPACE] << (instance.entries.size > 1? instance.name.to_s.pluralize : instance.name.to_s).downcase
        formatted_symbol = path_array.join("_").to_sym
        path = Rails.application.routes.named_routes.routes[formatted_symbol].path.spec.to_s
        path = path.sub("(.:format)", "")
        if instance.entries.size == 1
            path = path.sub(":id",instance.entries.first._id.to_s)
        end
        path
    end

    def show_path_model model_name
        model_for_path = model_name.to_s.pluralize.downcase
        formatted_symbol = "#{DEFAULT_NAMESPACE} #{model_name.to_s.downcase}".parameterize("_").to_sym
        path = Rails.application.routes.named_routes.routes[formatted_symbol].path.spec.to_s
        path.sub("(.:format)", "")
    end
  end
end
