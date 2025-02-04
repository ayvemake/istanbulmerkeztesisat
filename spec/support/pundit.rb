module PunditHelpers
  def skip_pundit
    # Définir la classe de base pour les policies de test
    test_policy = Class.new do
      def index? = true
      def show? = true
      def create? = true
      def update? = true
      def destroy? = true
    end

    # Définir les méthodes Pundit sur le contrôleur
    ApplicationController.class_eval do
      def verify_authorized = true
      def verify_policy_scoped = true
      def pundit_user = nil
      def policy_scope(scope) = scope
      def authorize(_record, _query = nil) = true
      def skip_authorization = true
      def skip_policy_scope = true
      define_method(:policy) { |_record| test_policy.new }
      def skip_pundit? = true
    end
  end
end

RSpec.configure do |config|
  config.include PunditHelpers, type: :request
  config.include PunditHelpers, type: :controller

  config.before(:each, type: :request) do
    skip_pundit
  end

  config.before(:each, type: :controller) do
    skip_pundit
  end
end
