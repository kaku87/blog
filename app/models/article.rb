class Article < ActiveRecord::Base
  attr_accessible :content, :title

  default_scope :order => 'created_at DESC'
  paginates_per 2

  include Gravtastic
  gravtastic :secure => true,
              :filetype => :gif,
              :size => 120

end