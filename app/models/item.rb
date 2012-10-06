class Item < ActiveRecord::Base

  include Sortable::Position

  attr_accessible :name, :position
  validates_presence_of :name

  before_save :set_position
  default_scope order("position")

  def self.by_name
    Item.unscoped { Item.find(:all, order: "name", select: "id").map { |item| item.id }} 
  end
end
