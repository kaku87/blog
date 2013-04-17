class Article < ActiveRecord::Base
  attr_accessible :content, :title, :tag_list
  has_many :taggings
  has_many :tags, through: :taggings
  
  default_scope :order => 'created_at DESC'
  paginates_per 2

  include Gravtastic
  gravtastic :secure => true,
              :filetype => :gif,
              :size => 120

  def self.tagged_with(name)
	  Tag.find_by_name!(name).articles
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
