module RSpec
  module Cells
    module ExampleGroup
      extend ActiveSupport::Concern

      include RSpec::Rails::RailsExampleGroup
      include Cell::Testing
      include ActionController::UrlFor

      attr_reader :routes

      def method_missing(method, *args, &block)
        # Send the route helpers to the application router.
        if route_defined?(method)
          controller.send(method, *args, &block)
        else
          super
        end
      end

      def route_defined?(method)
        return false unless @routes

        if @routes.named_routes.respond_to?(:route_defined?) # Rails > 4.2.
          @routes.named_routes.route_defined?(method)
        else
          @routes.named_routes.helpers.include?(method)
        end
      end

      included do
        metadata[:type] = :cell

        before do # called before every it.
          @routes = ::Rails.application.routes
          ActionController::Base.allow_forgery_protection = false
        end

        # add Example::controller and ::controller_class. for some reasons, this doesn't get imported from Cell::Testing.
        extend RSpec::Cells::ExampleGroup::ControllerClass
      end


      # DISCUSS: in MiniTest, this is done via inheritable_attr. Doesn't work in Rspec, though.
      module ControllerClass
        def controller_class
          @controller_class
        end

        def controller(name)
          @controller_class = name
        end
      end

    end
  end
end

RSpec.configure do |c|
  c.include RSpec::Cells::ExampleGroup, :file_path => /spec\/cells/
  c.include RSpec::Cells::ExampleGroup, :type => :cell

  Cell::Testing.capybara = true if Object.const_defined?(:"Capybara")
end
