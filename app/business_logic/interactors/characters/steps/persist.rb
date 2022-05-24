module Interactors
  module Characters
    module Steps
      class Persist
        include Interactor

        def call
          context.entity.save
        end
      end
    end
  end
end
