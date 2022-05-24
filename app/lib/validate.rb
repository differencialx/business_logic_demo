class Validate
  def self.call(ctx:, validator:)
    ctx[:validator] = validator.new(ctx[:params])

    ctx[:validator].valid?
  end
end
