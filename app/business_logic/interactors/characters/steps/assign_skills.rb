module Interactors
  module Characters
    module Steps
      class AssignSkills
        include Interactor

        def call
          context.entity.skills << Skill.where(character_type: context.character_type)
        end
      end
    end
  end
end
