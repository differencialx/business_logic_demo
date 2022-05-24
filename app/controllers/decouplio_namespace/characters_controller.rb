module DecouplioNamespace
  class CharactersController < ApiController
    include Characters::StrongParams

    def create
      result = DecouplioActions::Characters::Create.call(params: create_params)
      if result.success?
        render_success(entity: result[:model])
      else
        render_error(errors: result[:errors])
      end
    end
  end
end
