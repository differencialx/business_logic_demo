class Save
  def self.call(ctx:)
    ctx[:model].save
  end
end
