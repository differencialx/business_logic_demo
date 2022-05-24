module ActiveInteractions
  module Characters
    class Create < ActiveInteraction::Base
      NO_BONUS = nil

      string :name
      string :character_type

      validates :name, presence: true
      validates :character_type, presence: true
      validates :character_type, inclusion: {
        in: Character.character_types.keys,
        message: I18n.t('invalid_character_type')
      }
      validate :name_uniquness

      def execute
        build_character
        assign_attributes
        assign_skills
        generate_bonus
        persist

        @entity
      end

      private

      def build_character
        @entity = Character.new(name: name, character_type: character_type)
      end

      def assign_attributes
        @entity.assign_attributes(additional_params)
      end

      def additional_params
        case character_type
        when 'warrior'
          warrior_attrs
        when 'archer'
          archer_attrs
        when 'mage'
          mage_attrs
        end
      end

      def assign_skills
        @entity.skills << Skill.where(character_type: @entity.character_type)
      end

      def persist
        @entity.save
      end

      def generate_bonus
        bonus =
          case character_type
          when 'warrior'
            NO_BONUS
          when 'archer'
            '+3% crit'
          when 'mage'
            NO_BONUS
          end

        @entity.bonus = bonus
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

      def name_uniquness
        if Character.exists?(name: name)
          errors.add(:name, I18n.t('character_name_exists'))
        end
      end
    end
  end
end
