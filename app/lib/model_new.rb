class ModelNew
  def self.call(ctx:, model:)
    ctx[:model] = model.new(ctx[:params])
  end
end
