class ValidationHandler
  def self.call(ctx:)
    ctx[:errors] = ctx[:validator].errors.messages
  end
end
