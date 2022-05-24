module ServiceNamespace
  class CharactersController < ApiController
    include Characters::StrongParams

    def create
      result = Services::Characters::Create.call(params: create_params)
      if result.success?
        render_success(entity: result.entity)
      else
        render_error(errors: result.errors)
      end
    end
  end
end
