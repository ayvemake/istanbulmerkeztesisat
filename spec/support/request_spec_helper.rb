module RequestSpecHelper
  # Définir la classe de test en dehors de la méthode
  class TestPolicy
    def initialize(user, record); end

    def index? = true
    def show? = true
    def create? = true
    def update? = true
    def destroy? = true
  end

  def skip_pundit
    # Stub Pundit pour toujours autoriser
    allow_any_instance_of(ApplicationController).to receive(:authorize).and_return(true)
    allow_any_instance_of(ApplicationController).to receive(:policy).and_return(TestPolicy.new(nil, nil))
    allow_any_instance_of(ApplicationController).to receive(:policy_scope) { |_, scope| scope }
    allow_any_instance_of(ApplicationController).to receive(:skip_authorization).and_return(true)
    allow_any_instance_of(ApplicationController).to receive(:skip_policy_scope).and_return(true)
  end
end

RSpec.configure do |config|
  config.include RequestSpecHelper, type: :request
  config.include RequestSpecHelper, type: :controller

  config.before(:each, type: :request) do
    skip_pundit
  end

  config.before(:each, type: :controller) do
    skip_pundit
  end
end
