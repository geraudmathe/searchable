module Searchable
  class Post < ActiveRecord::Base
    attr_accessible :content, :title
  end
end