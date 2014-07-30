class Staff < ActiveRecord::Base

  devise :cas_authenticatable
  
  has_no_table
  column :first_name, :string
  column :last_name, :string
  column :role, :string
  column :email, :string

	def cas_extra_attributes=(extra_attributes)

    extra_attributes.each do |name, value|
      case name.to_sym
      when :first_name
        self.first_name = value
      when :last_name
        self.last_name = value
      when :role
      	self.role = value
      when :email
     		self.email = value
      end
    end
  end
end
