module DecouplioActions
  module Characters
    class Create < Decouplio::Action
      NO_BONUS = nil

      logic do
        doby Validate, validator: Form::Characters::Create
        fail ValidationHandler, finish_him: true
        doby ModelNew, model: Character
        doby Assign, from: %i[params character_type], to: :character_type
        step :prepare_attrs
        pass :assign_attributes
        step :assign_skills
        step :generate_bonus
        step Save
      end

      def handle_validation(validator:, **)
        ctx[:errors] = validator.errors.messages
      end

      def prepare_attrs(character_type:, **)
        ctx[:attrs_to_assign] =
          case character_type
          when 'warrior'
            Character::WARRIOR_STATS
          when 'archer'
            Character::ARCHER_STATS
          when 'mage'
            Character::WIZARD_STATS
          end
      end

      def assign_attributes(model:, attrs_to_assign:, **)
        model.assign_attributes(attrs_to_assign)
      end

      def assign_skills(model:, character_type:, **)
        model.skills << Skill.where(character_type: character_type)
      end

      def generate_bonus(model:, character_type:, **)
        bonus =
          case character_type
          when 'warrior'
            '+5% protection'
          when 'archer'
            '+3% crit'
          when 'mage'
            NO_BONUS
          end

        model.bonus = bonus
      end
    end
  end
end
