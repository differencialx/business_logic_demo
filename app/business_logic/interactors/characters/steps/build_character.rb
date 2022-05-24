module Interactors
  module Characters
    module Steps
      class BuildCharacter
        include Interactor

        def call
          context.entity = Character.new(
            name: context.name,
            character_type: context.character_type
          )
        end
      end
    end
  end
end
