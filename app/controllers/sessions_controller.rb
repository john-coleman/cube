class SessionsController < ApplicationController
  force_ssl if: :ssl_needed

  skip_before_action :signed_in_user
  skip_before_action :verify_authenticity_token
  before_action :redirect_to_root, except: [:destroy]

  def new
    redirect_to '/auth/ldap'
  end

  def create
    user = User.from_omniauth(env['omniauth.auth']['extra']['raw_info']) if env && env['omniauth.auth']
    unless user
      redirect_to('auth/ldap', notice: 'User LDAP Authentication Failed!') && return
    end
    session[:user_id] = user.id
    redirect_after_create
  end

  def failure
    redirect_to '/auth/ldap', notice: 'Authentication failed, please try again.'
  end

  def destroy
    session[:user_id] = nil
    session['requested_url'] = nil
    redirect_to root_url, notice: 'Signed out!'
  end

  private

  def ssl_needed
    CONFIG['cube']['ssl_enabled']
  end

  def redirect_to_root
    return unless current_user
    page = session['requested_url'] || root_url
    page = root_url if page['/auth']
    session['requested_url'] = nil
    redirect_to page
  end

  def redirect_after_create
    page = session['requested_url'] || root_url
    if page['/auth']
      page = root_url
      session['requested_url'] = nil
    end
    redirect_to page, notice: 'Signed in!'
  end
end
