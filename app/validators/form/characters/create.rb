module Form
  module Characters
    class Create
      include ActiveModel::Model

      attr_accessor :name, :character_type

      validates :name, presence: true
      validates :character_type, presence: true
      validates :character_type, inclusion: {
        in: Character.character_types.keys,
        message: I18n.t('invalid_character_type')
      }
      validate :name_uniqueness

      def name_uniqueness
        if Character.exists?(name: name)
          errors.add(:name, I18n.t('character_name_exists'))
        end
      end
    end
  end
end
