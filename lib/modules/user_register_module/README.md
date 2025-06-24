# Dependências de Projeto

---

## Criando o Projeto no Firebase
1. Acesse o [Firebase](https://firebase.google.com/) e crie um novo projeto.
 
2. Depois, vá para a aba **Criação > Firestore Database** e clique no botão **Criar banco de dados**.
   
3. Dê um nome e um local para o novo banco de dados. Na aba **Regras de segurança**  marque a opção **Iniciar no modo de teste** e conclua a criação.

---

## Conectando o Firebase ao Projeto Flutter
1. Abra o terminal no Android Studio e execute os seguintes comandos na ordem indicada:
```bash
npm install -g firebase-tools
```
Esse comando deve ser executado apenas se você não tiver a biblioteca de ferramentas do firebase baixada. A finalidade desse comando é instalar as ferramentas do firebase no seu projeto. 

```bash
firebase login
```
Por meio do comando `firebase login` será possível conectar sua conta do Google com o projeto.

```bash
flutter pub global activate flutterfire_cli
```
Esse comando ativa o executável de configuração do firebase com seu projeto.

```bash
flutterfire configure
```
O comando `flutterfire configure` inicializa o executável `flutterfire` no modo de configuração. Dessa maneira, é possível sincronizar um novo ou já existente projeto no Firebase com qualquer projeto Flutter. Nessa etapa, será necessário responder uma série de perguntas atreladas as configurações do projeto.

```bash
flutter pub add firebase_core
```
Esse comando adiciona a biblioteca `firebase_core` no projeto.
```bash
flutter pub add cloud_firestore
```
Esse comando adiciona a biblioteca `cloud_firestore` no projeto.
```bash
flutter pub add firebase_crashlytics
```
Esse comando adiciona a biblioteca `firebase_crashlytics` no projeto.
```bash
flutter pub add file_picker
```
Esse comando adiciona a biblioteca `file_picker` no projeto.
```bash
flutter pub add carousel_slider
```
Esse comando adiciona a biblioteca `carousel_slider` no projeto.

---

## Configurando o Projeto Flutter

1. Delete o arquivo `main.dart` que está no seu projeto recém criado.
   
2. Clone todo o repositório dentro da pasta `lib`, contudo certifique-se que os arquivos e pastas do repositório atual estão diretamente na pasta `lib`, ou seja, sem a presença da subpasta `project_dependencies`.

---

# Módulo de Registro e Acesso de Usuários

Este repositório disponibiliza um módulo dedicado a lidar com questões relacionadas ao cadastro e acesso de contas de usuários em aplicações mobile. 


> **Nota:** Os arquivos presentes aqui não são suficientes para o funcionamento completo do módulo, visto que são necessárias diversas configurações para garantir o funcionamento ideal do sistema. Essas configurações são explicadas abaixo.

---

## Configurando o Projeto no Firebase
1. Navegue até a seção de autenticação na dashboard e clique em **Get Started**.

2. Ative o método de autenticação **Email/Password**.

3. Ative o método de autenticação **Google**.

4. Depois, acesse o terminal do **Windows** e digite o seguinte comando:
   ```bash
   keytool -list -v -keystore "\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
   ```

5. Copie o conjunto de caracteres identificados por **SHA1**

6. Vá para **Configurações do projeto > Geral**, role a página até o final e clique no botão **Adicionar impressão digital**.

7. Insira o código gerado no terminal e salve a nova impressão digital.

---

### Configurando o Projeto Flutter
1. Abra o terminal no Android Studio e execute os seguintes comandos na ordem indicada:
   
    ```bash
    flutter pub add firebase_auth
   ```
    ```bash
    flutter pub add google_sign_in
    ```

2. Após concluir os passos acima, clone este repositório na pasta `modules` do seu projeto Flutter.

3. Abra o arquivo nomeado como `pubspec.yaml` no seu editor do **Android Studio**.
   
4. Insira dentro da categoria `flutter:` o seguinte trecho de código:
```bash
  assets:
   - lib/modules/user_register_module/assets/images/
```
Lembre-se de verificar se a identação e os espaçamentos estão coerentes com o restante do código.

5. Depois, clique em **Pub Get**, localizado no canto superior direito do arquivo.

6. Pronto! Teoricamente tudo funcionará a partir de então.
---
## Funcionamento

Após a clonagem do repositório, o módulo funcionará automaticamente. Ele oferece as seguintes funcionalidades principais:

- Tela de login
- Tela de recuperação de senha (forgot password)
- Tela de cadastro (sign up)
- Tela inicial (home)
- Widget de bem vindo
- Tela de gerenciamento da atividade de uma conta 

Para testar chamar o sistema, lembre-se de chamar o widget `AuthGate` na sua função main() do código `main.dart`.

> Detalhes adicionais sobre a lógica e o funcionamento do módulo estão documentados diretamente no código por meio de comentários.

---

## Suporte

Para dúvidas ou problemas enfrentados durante as etapas descritas, utilize a seção **Issues** deste repositório no GitHub. Estamos disponíveis para ajudar da melhor forma possível.
