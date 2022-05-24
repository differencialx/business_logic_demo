module TrailblazerNamespace
  class CharactersController < ApiController
    include Characters::StrongParams

    def create
      result = TrailblazerOperations::Characters::Create.call(params: create_params)
      if result.success?
        render_success(entity: result[:model])
      else
        render_error(errors: result['contract.default'].errors.messages)
      end
    end
  end
end
