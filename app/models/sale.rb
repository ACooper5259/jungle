class Sale < ActiveRecord::Base

  # alternate syntax for Active Records Scope
  # scope :active, -> { where ("sales.starts_on < ? AND sales.ends_on >= ?", Date.current, Date.current)}
# creating class methods, Active Records Scope
  def self.active
    # add a query (where)
    where("sales.starts_on < ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

  def finished?
    self.ends_on < Date.current
  end
  def upcoming?
    self.starts_on > Date.current
  end
  def active?
    !upcoming? && !finished?
  end
  
end
