# Shipping Management

Este projeto é uma aplicação web responsável por gerenciar meios de transporte disponíveis para e-commerces. Teremos várias transportadoras cadastradas e cada uma delas deverá configurar seus preços de entrega e seus prazos. As transportadoras podem receber ordens de serviço dentro da plataforma. Visitantes podem buscar pedidos informando o código do pedido.

Usuários das transportadoras devem configurar os preços praticados pela transportadora de acordo com a distância e dimensões da carga. Os prazos também devem ser configurados de acordo com a distância a ser percorrida.

O sistema terá usuários administradores que irão cadastrar as transportadoras e fazer consultas de orçamento envolvendo todas as transportadoras cadastradas(administradores são identificados pelo domínio de email @sistemadefrete.com). Os administradores também serão responsáveis por criar uma nova ordem de serviço para as transportadoras.

## Como executar o projeto

com o git já instalado use o comando:

```text
git clone git@github.com:JamesToledo/shipping-management.git
```

em seguida:

```text
bin/setup
```

para rodar os testes:

```text
bundle exec rspec
```

para rodar a aplicação em sua máquina:

```text
rails server
```

acesse em seu navegador:
<http://localhost:3000/>

  para logar como usuário de transportadora:
   email: pedrinho@fast.com
   senha: Pedrinho123

  para logar como usuário admin:
   email: paula@sistemadefrete.com
   senha: Paula123

## Dependencias do sistema

```text
Ruby 3.1.0
```

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
<https://trello.com/b/M4la3re0/projeto-individudal>
