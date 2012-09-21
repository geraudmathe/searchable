# encoding: utf-8
module Searchable

	class ModelMapper

		attr_accessor :reference, :name, :criteria, :model_fields

		def initialize model_name
			self.reference = define_instance(model_name)
			self.name = model_name.to_s.singularize.capitalize
		end

		def fields
			self.model_fields = []
			if self.reference.exists?
				(self.reference.fields.delete_if{ |k,v|  ["_id","_type"].include? k }).each do |field|
					self.model_fields << Searchable::FieldMapper.new(field)
				end
			end
			self.model_fields
		end

		def define_instance model_name
		    model_name.to_s.singularize.capitalize.safe_constantize
		end


		def add_criterias params
			fields.each do |field|
				value = params[field.name.to_sym]
				add_criteria(field.name.to_sym,value) if value.present?
			end
      criteria
		end

		def add_criteria key, value
			self.criteria = self.name.capitalize.constantize if self.criteria == nil
    		self.criteria = self.criteria.where(key => value)
  	end

  	def entries
  		self.criteria.entries
  	end

  	def to_s
  		self.name
  	end
	end
end
