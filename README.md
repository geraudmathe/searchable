Searchable
----------

Searchable is a gem to add search interfaces on Mongoid Models. It abstracts all the creation and the mapping of the search options and allow to perform detailed search by calling 2 functions

Installation
------------

Just install the gem , add the following line to your Gemfile :

	gem 'searchable', :github => "geraudmathe/searchable"
	

Usage
-----

To enable the gem to filter the results based on the given criterias , you have to mount it in routes.rb

	#the gem assume the search is done under an /admin namespace
	namespace :admin do
		mount Searchable::Engine => "/search"
	end
	
Now , the searchable engine is able to perform queries based on the parameters filled in the search form.

Given the app contain a model ```Book``` like :

	class Book
		include Mongoid::Document
		field :title, :type => String
		field :content, :type => String
		field :page, :type => Integer

		has_many :pages
		belongs_to :author
	end 
	

Go in your index view (here app/views/admin/books/index ), and add the following method :

	= mongoid_search_form :model => :books
	
Reload your page, you should see something like :

<img src="http://i49.tinypic.com/21x2ex.png" border="0" alt="Searchable form example">

As you can see, different search fields based on their respectives types allow to perform research on the model.

The last thing is , you need to catch the result in your controller to get the search result if one exists , or return the classic set of data if there's no result search.

Go in the related Controller (In this example, app/controllers/admin/books_controller.rb) and add :

	class Admin::BooksController < ApplicationController
		searchable_resource Book
		
		def index
    		@books =  search_results || Book.all
    		respond_to do |format|
      			format.html # index.html.erb
      			format.json { render json: @books }
    		end
    	end
    	
    	… 
    end
    
Here, we add the method ```searchable_resource MODEL``` to enable the matching of the  model with the search results, after that , just set the method ```search_results``` into your index instance variable value, if some result correspond to the search parameters, they will be returned by ```search_results```, otherwise, the classic set of data returned .

Todo
----

* Add options in ```mongoid_search_form``` method to include or exclude fields in forms
* Write Specs
* ….

