ActiveSupport.on_load :after_initialize do
	Staff.class_eval do
	 def self.authenticate_with_cas_ticket(ticket)
	    ::Devise.cas_client.validate_service_ticket(ticket) unless ticket.has_been_validated?
	    
	    if ticket.is_valid?
	     conditions = {::Devise.cas_username_column => ticket.respond_to?(:user) ? ticket.user : ticket.response.user} 
	      
	      
	      resource = new(conditions) if (resource.nil? and should_create_cas_users?)
	      return nil unless resource
	      
	      if resource.respond_to? :cas_extra_attributes=
	        resource.cas_extra_attributes = ticket.respond_to?(:extra_attributes) ? ticket.extra_attributes : ticket.response.extra_attributes
	      end
	      resource
	    end
	  end
		def self.serialize_from_session(key, salt)
		
    end
	end
end