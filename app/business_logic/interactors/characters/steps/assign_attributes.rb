module Interactors
  module Characters
    module Steps
      class AssignAttributes
        include Interactor

        def call
          context.entity.assign_attributes(additional_params)
        end

        private

        def additional_params
          case context.character_type
          when 'warrior'
            warrior_attrs
          when 'archer'
            archer_attrs
          when 'mage'
            mage_attrs
          end
        end

        def warrior_attrs
          Character::WARRIOR_STATS
        end

        def archer_attrs
          Character::ARCHER_STATS
        end

        def mage_attrs
          Character::WIZARD_STATS
        end
      end
    end
  end
end
