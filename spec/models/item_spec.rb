require 'spec_helper'

describe Item do

	fixtures :items

	it "is not valid without name" do
	  Item.new.should_not be_valid
	end

	describe "must have a position value" do

		let(:item){ item = Item.new name: "Item 1"}

		context "when item is the first record " do
		  it "should set a position before save with value 0" do
		  	Item.destroy_all
		    item.save
		    Item.last.position.should == 0
		  end
		end

		context "when item is not the first record" do
		  it "should set a position before save with last record persisted id" do
		  	item.save
		    second_item = Item.create name: "Item 1"
		    second_item.position.should == item.id
		  end
		end

	end

	describe "must update position of items" do
		
		let(:params){params = {items: %W{3 2 1} }}
		let(:keys){keys = ["3", "2", "1"]}
		let(:values){values = [{:position=>0}, {:position=>1}, {:position=>2}]}
 			
	  it "should not raise error ActiveRecord::StatementInvalid" do
	    lambda { Item.update_position(params[:items]) }.should_not raise_error(ActiveRecord::StatementInvalid)
	  end
	end

	it "should be listed by name" do
	  Item.by_name.should eq [items(:second_item).id,items(:first_item).id,]
	end
	

end
