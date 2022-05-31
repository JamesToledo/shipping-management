# Shipping Management

Este projeto é uma aplicação web responsável por gerenciar os meios de transporte disponíveis para e-comerces. No qual poderão ser feitos orçamentos em diferentes transportadoras e serão listados os preços e prazos de cada transportadora com status ativo, além disso, visitantes podem consultar o status de uma entrega informando o código de rastreamento da entrega.

<h3>Como executar o projeto:</h3>
  com o git já instalado use o comando:<br>
  git clone git@github.com:JamesToledo/shipping-management.git

  e depois:<br>
  bin/setup

  para rodar os testes:<br>
  bundle exec rspec

  para rodar a aplicação em sua máquina:<br>
  rails server

  acesse em seu navegador:<br>
  http://localhost:3000/

Dependencias do sistema: <br>
Rails 7.0.3 <br>
sqlite3 1.4 <br>
Ruby 3.1.0 <br>
Nodejs 14.18.2 <br>
Yarn 1.22.15 <br>

Gems :
* gem 'capybara'(ferramenta de testes para simular a navegação pela app)
* gem 'factory_bot_rails'(fabrica de objetos para auxiliar nos arranges)
* gem 'faker'(gerador de atributos aleatorios para auxiliar nos arranges)
* gem 'pry-byebug'(usada no desenvolviento do projeto para ver as coisas acontecerem no runtime)
* gem 'rspec-rails'(ferramenta de criação de testes)
* gem 'shoulda-matchers'(ferramenta de testes para auxiliar nos asserts)
* gem 'simplecov'(ferramenta para verificar a cobertuda de testes)
* gem 'devise'(ferramenta para fazer autenticação de usuários)

Link do Trello:
https://trello.com/b/M4la3re0/projeto-individudal
