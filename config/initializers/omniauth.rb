Rails.application.config.middleware.use(
  OmniAuth::Strategies::LDAP,
  title: CONFIG['omniauth']['title'],
  host: CONFIG['omniauth']['host'],
  port: CONFIG['omniauth']['port'],
  # :ssl => true,
  method: CONFIG['omniauth']['method'].to_sym,
  filter: "(&(|(mail=%{username})(#{CONFIG['omniauth']['uid']}=%{username}))(memberOf:1.2.840.113556.1.4.1941:=#{CONFIG['omniauth']['ldap_group']}))",
  base: CONFIG['omniauth']['base'],
  uid: CONFIG['omniauth']['uid'],
  bind_dn: CONFIG['omniauth']['bind_dn'],
  password: CONFIG['omniauth']['password']
)

# omniauth failure redirect doesn't work in dev mode. fix below.
OmniAuth.config.on_failure = proc { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

OmniAuth.config.logger = Rails.logger # user Rails logger instead of STDOUT

LDAP_CONFIG = {
  host: CONFIG['omniauth']['host'], port: CONFIG['omniauth']['port'], base: CONFIG['omniauth']['base'],
  auth: { method: CONFIG['omniauth']['auth_method'].to_sym, username: CONFIG['omniauth']['bind_dn'], password:  CONFIG['omniauth']['password'] }
}
