module Sortable
	module Position

	def self.included(base)
  	base.extend(ClassMethods)
	end
		
	protected
  def set_position
    unless self.persisted?
  	 last_item = self.class.find(:last)
  	 (last_item.nil?) ? self.position = 0 : self.position = last_item.id
    end
  end

	module ClassMethods
	 	def update_position(items)
	 		query = query_update_all_position_to items
	   	self.connection.execute(query)
	 	end

		def query_update_all_position_to(items)
			query = "UPDATE #{self.table_name} SET position = CASE "
			items.each_with_index {|item,index| query << "WHEN (id = #{item}) THEN #{index} " }
			query << "ELSE position END"
		end
	end

	end	
end
