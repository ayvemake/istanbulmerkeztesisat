require 'rails_helper'

RSpec.shared_examples 'a page with layout' do |template:, content:|
  before do
    stub_view_context
  end

  it 'renders the page with expected content', :aggregate_failures do
    render_page(template)

    content.each do |text|
      expect(rendered).to include(text.to_s),
                          "Expected to find '#{text}' in the rendered output"
    end
  end
end
