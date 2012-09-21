module Searchable
	class InstallGenerator < Rails::Generators::Base
	  source_root File.expand_path('../templates', __FILE__)

	  FileUtils.mv(Engine.root.to_s<<"/app/assets/javascripts/searchable/application.js", Engine.root.to_s<<"/app/assets/javascripts/application.js")
	  FileUtils.mv(Engine.root.to_s<<"/app/assets/stylesheets/searchable/application.css", Engine.root.to_s<<"/app/assets/stylesheets/application.css")

	  Rails::Generators.invoke "bootstrap:install", [], :behavior => :invoke, :destination_root => Engine.root

	  FileUtils.mv(Engine.root.to_s<<"/app/assets/javascripts/application.js", Engine.root.to_s<<"/app/assets/javascripts/searchable/application.js")
	  FileUtils.mv(Engine.root.to_s<<"/app/assets/stylesheets/application.css", Engine.root.to_s<<"/app/assets/stylesheets/searchable/application.css")


	  def create_initializer_file
	    create_file "config/initializers/initializer.rb", "# Add initialization content here"
	  end
	end
end