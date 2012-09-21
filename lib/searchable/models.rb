module Searchable
	class Models

		attr_accessor :models

		def initialize
			self.models= []
			Find.find(Rails.application.root.to_s << "/app/models") do |f| 
        begin
          item = Module.const_get File.basename(f, '.*').camelize
          if item.included_modules.include?(Mongoid::Document)
            self.models << item
          end
        rescue NameError
          next
	      end
      end
      self.models
		end
	end
end