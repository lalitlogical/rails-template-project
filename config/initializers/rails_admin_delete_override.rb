# frozen_string_literal: true

# config/initializers/rails_admin_delete_override.rb
module RailsAdmin
  module Config
    module Actions
      class Delete < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          !bindings[:object].respond_to?(:destroyable?) || bindings[:object].destroyable?
        end
      end
    end
  end
end
