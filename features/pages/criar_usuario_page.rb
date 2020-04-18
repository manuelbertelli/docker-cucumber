class User < SitePrism::Page
  set_url '/login'

  element :email, '[name="email"]'
  element :password, '[name="password"]'
  element :btn_login, '[data-text-id="cx-btn-login"]'

  def preencher_usuario
    email.set 'joe@email.com'
    password.set 'SECRET'
    btn_login.click
  end
end
