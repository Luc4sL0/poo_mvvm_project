
# POO MVVM Project

Este projeto foi desenvolvido como parte do trabalho da disciplina de Programação Orientada a Objetos, com o objetivo de demonstrar a aplicação do padrão arquitetural **MVVM (Model-View-ViewModel)** em uma aplicação Flutter integrada com Firebase.

---

## Sobre o Projeto

A aplicação consiste em um sistema de autenticação que permite login e registro de usuários utilizando e-mail e senha, além da autenticação via Google. 

O foco principal é a aplicação dos conceitos do padrão MVVM para garantir uma separação clara das responsabilidades, utilizando:

- **Model**: Representa as estruturas e dados da aplicação.
- **ViewModel**: Gerencia a lógica de apresentação, estado e comunicação entre Model e View.
- **Repository**: Responsável pela interação com fontes de dados externas (Firebase).
- **View**: Interfaces visuais construídas com Flutter para interação do usuário.

---

## Tecnologias Utilizadas

- Flutter
- Firebase Authentication
- Google Sign-In
- MVVM Architecture

---

## Funcionalidades

- Registro de usuários por e-mail e senha
- Login por e-mail e senha
- Login via Google
- Gerenciamento de estado via ViewModel
- Separação clara entre camadas (Model, ViewModel, Repository, View)

---

## Como Rodar o Projeto

1. Clone este repositório:

   ```bash
   git clone https://github.com/Luc4sL0/poo_mvvm_project.git
   ````

2. Acesse a pasta do projeto:

   ```bash
   cd poo_mvvm_project
   ```

3. Instale as dependências do Flutter:

   ```bash
   flutter pub get
   ```

4. Configure seu projeto Firebase (google-services.json para Android, GoogleService-Info.plist para iOS).

5. Execute o app:

   ```bash
   flutter run
   ```

---

## Estrutura do Projeto

* **lib/**: Código fonte principal

  * **models/**: Definições das entidades do domínio
  * **viewmodels/**: Lógica e estado da interface
  * **repositories/**: Comunicação com Firebase
  * **views/**: Telas e widgets Flutter

---

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.

---

## Licença

Este projeto é para fins acadêmicos e não possui licença específica.

---

- **Autor:** Lucas Lopes Baroni
- **Disciplina:** Programação Orientada a Objetos
- **Universidade:** Universidade do Vale do Itajaí
