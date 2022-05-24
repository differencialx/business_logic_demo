module Interactors
  module Characters
    module Steps
      class GenerateBonus
        include Interactor

        NO_BONUS = nil

        def call
          bonus =
            case context.character_type
            when 'warrior'
              '+5% protection'
            when 'archer'
              '+3% crit'
            when 'mage'
              NO_BONUS
            end

          context.entity.bonus = bonus
        end
      end
    end
  end
end
