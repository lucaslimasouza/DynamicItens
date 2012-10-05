class Admins::ItemsController < ApplicationController
	
	before_filter :authenticate_admin!
	
	def index
		@items = Item.all
		respond_with @items
	end

	def new
		@item = Item.new
		respond_with @item
	end

	def create
		@item = Item.new(params[:item])
		@item.save
		redirect_to admins_items_path
	end

	def update_position
		Item.update_position(params[:items])
		render nothing: true
	end

	def sort_by_name
		Item.update_position(Item.by_name)
		redirect_to admins_items_path
	end

end
