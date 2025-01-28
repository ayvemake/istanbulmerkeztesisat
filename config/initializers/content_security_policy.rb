# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

Rails.application.config.content_security_policy do |policy|
  policy.default_src :self, :https
  policy.font_src    :self, :https, :data
  policy.img_src     :self, :https, :data, :blob
  policy.script_src  :self, :https, :unsafe_inline, :unsafe_eval
  policy.style_src   :self, :https, :unsafe_inline
  policy.connect_src :self, :https, :ws, :wss,
                     'http://localhost:*',
                     'ws://localhost:*'
  policy.frame_src   :self, :https
  policy.worker_src  :self, :blob

  # Autres directives
  policy.frame_ancestors :none
  policy.base_uri :self
  policy.form_action :self
end

# Désactivons temporairement les nonces pour éviter les conflits
# Rails.application.config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }
# Rails.application.config.content_security_policy_nonce_directives = %w(script-src style-src)

# Rails.application.configure do
#   config.content_security_policy do |policy|
#     policy.default_src :self, :https
#     policy.font_src    :self, :https, :data
#     policy.img_src     :self, :https, :data
#     policy.object_src  :none
#     policy.script_src  :self, :https
#     policy.style_src   :self, :https
#     # Specify URI for violation reports
#     # policy.report_uri "/csp-violation-report-endpoint"
#   end
#
#   # Generate session nonces for permitted importmap, inline scripts, and inline styles.
#   config.content_security_policy_nonce_generator = ->(request) { request.session.id.to_s }
#   config.content_security_policy_nonce_directives = %w(script-src style-src)
#
#   # Report violations without enforcing the policy.
#   # config.content_security_policy_report_only = true
# end
