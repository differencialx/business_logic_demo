module Interactors
  module Characters
    class Create
      include Interactor::Organizer

      organize Interactors::Characters::Steps::ValidateParams,
               Interactors::Characters::Steps::BuildCharacter,
               Interactors::Characters::Steps::AssignAttributes,
               Interactors::Characters::Steps::AssignSkills,
               Interactors::Characters::Steps::GenerateBonus,
               Interactors::Characters::Steps::Persist
    end
  end
end
