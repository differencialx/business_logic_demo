module Interactors
  module Characters
    module Steps
      class ValidateParams
        include Interactor

        def call
          unless validator.valid?
            context.fail!(errors: validator.errors.messages)
          end
        end

        private

        def validator
          @validator ||= Form::Characters::Create.new(
            name: context.name,
            character_type: context.character_type
          )
        end
      end
    end
  end
end
