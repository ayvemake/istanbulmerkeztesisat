module ViewSpecHelper
  def stub_view_context
    # Stub les méthodes helper communes
    allow(view).to receive_messages(
      content_for: nil,
      asset_exists?: true,
      meta_title: 'Test Title',
      meta_description: 'Test Description',
      current_page?: false,
      javascript_include_tag: '',
      stylesheet_link_tag: '',
      csrf_meta_tags: '',
      csp_meta_tag: '',
      turbo_frame_tag: nil
    )

    # Stub les partials communs
    %w[header footer flash].each do |partial|
      allow(view).to receive(:render)
        .with(hash_including(partial: "shared/#{partial}"))
        .and_return('')
    end

    # Stub les autres partials
    allow(view).to receive(:render).and_call_original
  end

  def render_page(_template)
    # Simuler un layout simple
    render inline: <<~ERB, layout: 'layouts/application'
      <!DOCTYPE html>
      <html>
        <head><%= csrf_meta_tags %></head>
        <body>
          <%= yield %>
        </body>
      </html>
    ERB
  end
end

RSpec.configure do |config|
  config.include ViewSpecHelper, type: :view

  config.before(:each, type: :view) do
    stub_view_context
  end
end
