module SpreeTravelFlight
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, :type => :boolean, :default => false

      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require store/spree_travel_flight\n"
        append_file 'vendor/assets/javascripts/spree/backend/all.js', "//= require admin/spree_travel_flight\n"
      end

      def add_stylesheets
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require store/spree_travel_flight\n", :before => /\*\//, :verbose => true
        inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css', " *= require admin/spree_travel_flight\n", :before => /\*\//, :verbose => true
      end

      def add_seeded_data
        run 'bundle exec rake spree_travel_flight:load'
      end

    end
  end
end
