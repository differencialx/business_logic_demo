module Services
  module Characters
    class Create
      NO_BONUS = nil

      attr_reader :entity, :errors

      def self.call(params:)
        new(params: params).call
      end

      def initialize(params:)
        @params = params
      end

      def call
        if validator.valid?
          build_character
          assign_attributes
          assign_skills
          generate_bonus
          persist
        else
          add_errors
        end

        self
      end

      def success?
        errors.blank?
      end

      private

      def validator
        @validator ||= Form::Characters::Create.new(**@params)
      end

      def build_character
        @entity = Character.new(@params)
      end

      def assign_attributes
        @entity.assign_attributes(additional_params)
      end

      def additional_params
        case @params[:character_type]
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
          case @params[:character_type]
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

      def add_errors
        @errors = validator.errors.messages
      end
    end
  end
end
