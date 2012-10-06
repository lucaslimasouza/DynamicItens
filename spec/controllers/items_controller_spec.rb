require 'spec_helper'

describe Admins::ItemsController do

	login_admin

	let(:item) { item = mock_model(Item).as_null_object }
	let(:params) { params = {items: %w{3 2 1}} }
	
	describe "POST #create" do
	  it "creates a new Item" do
	    Item.should_receive(:new).with("name" => "Item 1").and_return(item)
	    post :create, item: {"name" =>"Item 1"}
	  end
	end

	describe "GET " do

		let(:items){items = Array.new}

		context "#new" do
		  it "return a @item" do
	    	Item.should_receive(:new).and_return(item)
	    	get :new
	  	end
		end

		context "#index" do
		  it "return @items" do
		    Item.should_receive(:all).and_return(items)
		    get :index
		  end
		end

		context "order items by name" do
		  it "should call update_position" do
		  	build_stub_methods
		   	get :sort_by_name, params
		  end

		  it "should redirect to root_path" do
		  	build_stub_methods
		    get :sort_by_name, params
		    response.should redirect_to root_path
		  end
		end
	  
	end

	describe "AJAX GET" do
		
		context "update postions" do

		  it "should receive a list of id's items" do
		  	Item.stub(:update_position).with(params[:items]).and_return(true)
	    	get :update_position, params
	  	end

		end
	end

def build_stub_methods
	 Item.should_receive(:update_position).with(params[:items])
	 Item.should_receive(:by_name).and_return(params[:items])
end

end
