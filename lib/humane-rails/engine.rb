module HumaneRails
  class Engine < ::Rails::Engine
    isolate_namespace HumaneRails

    initializer "humane-rails.action_controller" do |app|
      ActiveSupport.on_load :action_controller do
        unless self.respond_to(:helper)
          helper HumaneRails::FlashMessagesHelper
        end
      end
    end

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
