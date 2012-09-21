module Searchable
  class Engine < ::Rails::Engine
  	isolate_namespace Searchable
  	engine_name "searchable"
    initializer 'searchable.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
      	extend Searchable::ControllerResource
        helper Searchable::Forms
      end
    end
  end

end
