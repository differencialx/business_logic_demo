module Renderer
  extend ActiveSupport::Concern

  private

  def render_success(entity:)
    render json: { entity: entity, skills: entity.skills }, status: 200
  end

  def render_error(errors:)
    render json: errors, status: 422
  end
end
