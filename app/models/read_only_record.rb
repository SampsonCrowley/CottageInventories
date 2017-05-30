class ReadOnlyRecord < ApplicationRecord
  self.abstract_class = true
  
  def readonly?
    !new_record?
  end

  # Prevent objects from being destroyed
  def before_destroy
    raise ActiveRecord::ReadOnlyRecord
  end

  def self.delete
    raise ActiveRecord::ReadOnlyRecord
  end

  def self.delete_all
    delete
  end
end
