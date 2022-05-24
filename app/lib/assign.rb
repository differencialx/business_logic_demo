class Assign
  def self.call(ctx:, from:, to:)
    ctx[to] = ctx.dig(*[from].flatten)
  end
end
