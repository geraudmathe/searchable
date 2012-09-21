module Searchable
	class FieldMapper
		attr_accessor :name, :spec, :type

		def initialize field
			self.name = field.first
			self.spec = field.last
			self.type = field.last.options[:type]
		end

		def belongs_to_select_options
			model = self.spec.options[:metadata][:name].to_s.capitalize.constantize
			options = model.all.entries.collect{ |item| [item.first_name,item._id]}
		end
	end
end