module Characters
  class Create < Dry::Validation::Contract
    register_macro(:uniqueness) do
      if Character.exists?(name: value)
        key.failure(I18n.t('character_name_exists'))
      end
    end

    schema do
      required(:name).value(:string)
      required(:character_type).value(included_in?: Const::CHARACTER_TYPES.keys)
    end

    rule(:name).validate(:uniqueness)
  end
end
