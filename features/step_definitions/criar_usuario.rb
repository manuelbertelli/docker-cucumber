Quando 'eu cadastro meu usuario' do
  user.load
  user.preencher_usuario
end

Entao 'verifico se o usuario foi cadastrado' do
  expect(page).to have_content 'Painel de Fretes'
end
