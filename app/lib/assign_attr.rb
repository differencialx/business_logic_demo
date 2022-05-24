class AssignAttr
  def self.call(ctx:, attr_name:, value:)
    ctx[:model].assign_attributes(attr_name => value)
  end
end
