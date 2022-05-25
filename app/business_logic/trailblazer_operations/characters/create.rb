module TrailblazerOperations
  module Characters
    class Create < Trailblazer::Operation
      NO_BONUS = nil

      # step Model(Character, :new)
      # step Contract::Build(
      #   constant: TrailblazerOperations::Contracts::Characters::Create
      # )
      # step Contract::Validate()
      # step Contract::Persist(method: :sync)
      step :validate_params
      fail :handle_fail, fail_fast: true
      step :init_model
      step :assign_attributes
      step :assign_skills
      step :generate_bonus
      step :save

      def validate_params(ctx, params:, **)
        ctx[:validator] = Form::Characters::Create.new(params)

        ctx[:validator].valid?
      end

      def handle_fail(ctx, validator:, **)
        ctx['contract.default'] = validator
      end

      def init_model(ctx, params:, **)
        ctx[:model] = Character.new(params)
      end

      def assign_attributes(ctx, model:, **)
        attrs =
          case model.character_type
          when 'warrior'
            Character::WARRIOR_STATS
          when 'archer'
            Character::ARCHER_STATS
          when 'mage'
            Character::WIZARD_STATS
          end

        model.assign_attributes(attrs)

        true
      end

      def assign_skills(ctx, model:, **)
        model.skills << Skill.where(character_type: model.character_type)
      end

      def generate_bonus(ctx, model:, **)
        bonus =
          case model.character_type
          when 'warrior'
            NO_BONUS
          when 'archer'
            '+3% crit'
          when 'mage'
            NO_BONUS
          end

        model.bonus = bonus

        true
      end

      def save(ctx, model:, **)
        model.save
      end
    end
  end
end
