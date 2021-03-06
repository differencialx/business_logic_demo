module InteractorNamespace
  class CharactersController < ApiController
    include Characters::StrongParams

    def create
      result = Interactors::Characters::Create.call(create_params)
      if result.success?
        render_success(entity: result.entity)
      else
        render_error(errors: result.errors)
      end
    end
  end
end
