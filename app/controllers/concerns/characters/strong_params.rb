module Characters
  module StrongParams
    extend ActiveSupport::Concern

    def create_params
      params.permit(:name, :character_type).to_h.symbolize_keys
    end
  end
end
