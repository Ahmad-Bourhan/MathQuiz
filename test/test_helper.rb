ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    parallelize(workers: :number_of_processors, with: :threads)
    fixtures :all
  end
end

module ActionDispatch
  class IntegrationTest
    def log_in_as(user, password: 'password')
      post login_path, params: { email: user.email, password: password }
    end
  end
end
