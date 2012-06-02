def create
  omniauth = request.env['omniauth.auth']
  current_user.authentications.find_or_create_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
  flash[:notice] = "The authentication was successfull."
  redirect_to authentications_url
end
