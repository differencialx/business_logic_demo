module ActiveInteractionNamespace
  class CharactersController < ApiController
    include Characters::StrongParams

    def create
      outcome = ActiveInteractions::Characters::Create.run(create_params)
      if outcome.valid?
        render_success(entity: outcome.result)
      else
        render_error(errors: outcome.errors.messages)
      end
    end
  end
end
